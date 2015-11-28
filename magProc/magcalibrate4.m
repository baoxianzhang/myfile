function [ V, Winv, B, ERROR] = magcalibrate4(magdata)
%MAGCALIBRATE4  calibrate magnetometer using Four-Parameter Model.
%   MAGCALIBRATE4 calibrate magnetometer using Four-Parameter Magnetic 
%   Calibration Model. This simplest magnetic calibration algorithm calculates 
%   the for parameters comprising the hard-iron offset vector V and
%   geomagnetic field strength B. The soft-iron matrix W is assumed to be
%   the identity matrix I.
%   More:  AN5019 Magnetic Calibration by FreeScale.
%
%   Input:
%         magdata: M X 3 matrix, include the x y z axis magnetic data
%   Output:
%         V:     hard-iron offset vector
%         Winv:  soft-iron matrix ( the 3 X 3 identity matrix I in this case)
%         B:     geomagetic field strength
%         ERROR: fit error
%
%   Example
%   -------
%   [ V, Winv, B, ERROR] = magcalibrate4(magdata);
%
%   See also MAGCALIBRATE7, MAGCALIBRATE10.
%   
%   Author: Baoxian Zhang
%   Email:  baoxianzhit@gmail.com
%   Copyright 2015-2015 The MOLMC, Inc.
%   $Revision:                 $
%   $Date: 2015/11/28 10:42:44 $


%%
if ( size(magdata,2) ~= 3)
    error(message('The column of input matrix column must be 3.'));
end

M = size(magdata,1);

% Four Parameter Calibration
% The soft-iron matrix is assumed to be the identity matrix I
Winv = eye(3);

% Equation 62 
Y = magdata(:,1).*magdata(:,1) + magdata(:,2).*magdata(:,2) + ...
    magdata(:,3).*magdata(:,3);

% Equation 63
X = [magdata ones( M, 1)];

% Equation 66
XTX = X' * X;

% Equation 68
XTY = X' * Y;

% Equation 70
YTY = Y' * Y;

% Equation 17
Beta = XTX \ XTY;

% Equation 22, error function
Efun = YTY - Y'*X * (inv(XTX))' * XTY;

% Equation 72, hard-iron offset vector
V = 0.5 * Beta(1:3,1);

% Equation 73, geomagnetic field strength
B = sqrt(Beta(4,1) + V' * V);

% Equation 74, calcualte the trial normalized fit error as a percenttage
ERROR = sqrt(Efun/M) / B / B * 50;
