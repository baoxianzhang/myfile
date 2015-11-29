function [ V, Winv, B, ERROR] = magcalibrate7(magdata)
%MAGCALIBRATE7  calibrate magnetometer using Seven-Parameter Model.
%   MAGCALIBRATE7 extends the four-parameter model with the addition of 
%   three gain terms of the diagonal of the soft-iron matrix W giveing a 
%   total of seven magnetic calibration parameters. This model gives a 
%   significant improvement when either the magnetometer sensor has 
%   differing gains in its three channels or when the PCB has differing
%   magnetic impedances along its three Cartesian axes. The diagonal form 
%   of W means that the magnetic distribution ellipsoid is modeled as 
%   having its principal axes aligned with the PCB's Cartesian axes.
%   More: AN5019 Magnetic Calibration by FreeScale.
%
%   Input:
%         magdata: M X 3 matrix, include the x y z axis magnetic data
%   Output:
%         V:     hard-iron offset vector
%         Winv:  soft-iron matrix ( the 3 X 3 diagonal matrix in this case)
%         B:     geomagetic field strength
%         ERROR: fit error
%
%   Example
%   -------
%   [ V, Winv, B, ERROR] = magcalibrate7(magdata);
%
%   See also MAGCALIBRATE4, MAGCALIBRATE10.
%   
%   Author: Baoxian Zhang
%   Email:  baoxianzhit@gmail.com
%   Copyright 2015-2015 The MOLMC, Inc.
%   $Revision:                 $
%   $Date: 2015/11/28 12:42:44 $


%%
if ( size(magdata,2) ~= 3)
    error(message('The column of input matrix column must be 3.'));
end

% Seven Parameter Calibration
M = size(magdata,1);

% Equation 86
X = [magdata(:,1) .* magdata(:,1) magdata(:,2) .* magdata(:,2) ...
    magdata(:,3) .* magdata(:,3) magdata(:,1) magdata(:,2) magdata(:,3) ...
    ones(M,1)];

% Equation 89
XTX = X' * X;

% Equation 33, XTX * Beta = Lamda * Beta;
% Equation 26, E = Beta'*X'*X*Beta;
% Equation 34, Ei = Betai' * XTX * Betai = Lamdai * Betai' * Betai 
%                 = Lamdai
% The error function Ei for the ith eigenvector solution equals the
% eigenvalue Lamdai of XTX and the minimum error function is equal to the
% smallest eigenvalue Lamdamin. The required solution Beta is then the
% eigenvector associated with the smallest eigenvalue Lamdamin.
[ eigenVector, eigenDiagonal] = eig( XTX);

% Find the smallest eigenvalue
eigenValue          = diag(eigenDiagonal);
eigenValueSmallest  = min(eigenValue);
eigenVectorSmallest = eigenVector(:, eigenValue == min(eigenValue));

E    = eigenValueSmallest;
Beta = eigenVectorSmallest;

% According to equation 83 and equation 90
% The ellipsoid fit matrix A 
A = diag(Beta(1:3, 1));

% Equation 92, the hard-iron offset vector
V = Beta(4:6,1) ./ diag(A) * (-0.5);

detA = det(A);
if (detA < 0)
    detA = -detA;
    A = -A;
    Beta(7,1) = -Beta(7,1);
end

% Equation 97, calcualte the trial normalized fit error as a percenttage
tmp = abs(A(1,1)*V(1,1)^2 + A(2,2)*V(2,1)^2 + A(3,3)*V(3,1)^2 - Beta(7,1));
ERROR = sqrt(E/M) / tmp * 50;

% Equation 96
B = sqrt( tmp ) * detA^(-1/6);

% Normalize the ellipsoid matrix A to unit determinant
A = A * detA^(-1/3);
           
% Equation 93
Winv = sqrt(A);

