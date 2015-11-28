function [ V, Winv, B, ERROR] = magcalibrate10(magdata)
%MAGCALIBRATE10  calibrate magnetometer using Ten-Parameter Model.
%   MAGCALIBRATE10 extends the seven-parameter model with the addition of 
%   three off-diagonal soft-iron matrix terms to W to give a total of  
%   ten magnetic calibration parameters. This model gives an improvement 
%   over the seven-element model when the PCB's magnetic impedances steer 
%   the geomagnetic field in directions that are not aligned with the PCB's
%   Cartesian axes giving a rotated magnetic ellipsoid.
%   More: AN5019 Magnetic Calibration by FreeScale.
%
%   Input:
%         magdata: M X 3 matrix, include the x y z axis magnetic data
%   Output:
%         V:     hard-iron offset vector
%         Winv:  soft-iron matrix ( the 3 X 3 matrix)
%         B:     geomagetic field strength
%         ERROR: fit error
%
%   Example
%   -------
%   [ V, Winv, B, ERROR] = magcalibrate10(magdata);
%
%   See also MAGCALIBRATE4, MAGCALIBRATE7.
%   
%   Author: Baoxian Zhang
%   Email:  baoxianzhit@gmail.com
%   Copyright 2015-2015 The MOLMC, Inc.
%   $Revision:                 $
%   $Date: 2015/11/28 18:40:44 $


%%
if ( size(magdata,2) ~= 3)
    error(message('The column of input matrix column must be 3.'));
end

% Tem Parameter Calibration
M = size(magdata,1);
% Equation 117
X = [magdata(:,1).*magdata(:,1) 2*magdata(:,1).*magdata(:,2) ...
     2*magdata(:,1).*magdata(:,3) magdata(:,2).*magdata(:,2) ...
     2*magdata(:,2).*magdata(:,3) magdata(:,3).*magdata(:,3) ...
     magdata(:,1) magdata(:,2) magdata(:,3) ones(M,1)];

% Equation 119
XTX = X' * X;

% Equation 33, XTX * Beta = Lamda * Beta;
% Equation 26, E = Beta'*X'*X*Beta;
% Equation 34, Ei = Betai' * XTX * Betai = Lamdai * Betai' * Betai 
%                 = Lamdai
% The error function Ei for the ith eigenvector solution equals the
% eigenvalue Lamdai of XTX and the minimum error function is equal to the
% smallest eigenvalue Lamdamin. The required solution Beta is then the
% eigenvector associated with the smallest eigenvalue Lamdamin.
[ eigenVector, eigenDiagonal ] = eig( XTX );

% Find the smallest eigenvalue
eigenValue          = diag(eigenDiagonal);
eigenValueSmallest  = min(eigenValue);
eigenVectorSmallest = eigenVector(:, eigenValue == min(eigenValue));

E    = eigenValueSmallest;
Beta = eigenVectorSmallest;

% According to equation 113 and equation 120
% The ellipsoid fit matrix A 
A = [ Beta(1,1) Beta(2,1) Beta(3,1);
      Beta(2,1) Beta(4,1) Beta(5,1);
      Beta(3,1) Beta(5,1) Beta(6,1)];

% Equation 122, the hard-iron offset vector
V = A \ Beta(7:9,1) * (-0.5);

detA = det(A);
if (detA < 0)
    detA = -detA;
    A = -A;
    Beta(7,1)  = -Beta(7,1);
    Beta(8,1)  = -Beta(8,1);
    Beta(9,1)  = -Beta(9,1);
    Beta(10,1) = -Beta(10,1);
end

% Equation 129, calcualte the trial normalized fit error as a percenttage
tmp = abs( A(1,1)*V(1,1)^2 + 2*A(1,2)*V(1,1)*V(2,1) + ...
           2*A(1,3)*V(1,1)*V(3,1) + A(2,2)*V(2,1)^2 + ...
           2*A(2,3)*V(2,1)*V(3,1) + A(3,3)*V(3,1)^2 - ...
           Beta(10,1) );
       
ERROR = sqrt(E/M) / tmp * 50;

% Equation 128
B = sqrt( tmp ) * detA^(-1/6);

% Normalize the ellipsoid matrix A to unit determinant
A = A * detA^(-1/3);

% Compute inverse soft-iron matrix, equation 123 ~ equation 126
[ eigenVectorA, eigenDiagonalA ] = eig( A );
doubleSqrtEigenDiagonalA = sqrt( sqrt( eigenDiagonalA ) );
tmpMatrix = eigenVectorA * doubleSqrtEigenDiagonalA;
Winv = tmpMatrix * tmpMatrix';


