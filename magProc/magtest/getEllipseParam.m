function [xc,yc, semimajor, semiminor, eccentricity, percentage] = getEllipseParam(x, y)
% getEllipseParam fit data to an ellipse and get the ellipse parameters.
% The parameters include the center, semimajor, semiminor, eccentricity
% and the percentage.
% 
% Input: 
%       x: n X 1 vector data 
%       y: n X 1 vector data
%
% Ouput: 
%       xc: center x coordination
%       yc: center y coordination
%       semimajor: the length of semi-major axes
%       semiminor: the length of semi-minor axes
%       eccentricity: the eccentricity of the ellipse
%       percentage: semiminor / semimajor * 100.
% Example
% -------
% [xc,yc, semimajor, semiminor, eccentricity, percentage] = getEllipseParam(x, y)
%
% Author: Baoxian Zhang
% Email:  baoxianzhit@gmail.com
% Copyright 2015-2015 The MOLMC, Inc.
% $Revision:                 $
% $Date: 2015/12/19 11:03:44 $


xydata = [x y];
A = ellipseDirectFit(xydata);
A = A / A(6,1);          % let f equal to 1
% The ellipse center
a = A(1,1); b = A(2,1); c = A(3,1); d = A(4,1);  e = A(5,1); 
xc = (b*e - 2*c*d) / (4*a*c - b*b);
yc = (b*d - 2*a*e) / (4*a*c - b*b);
% The semi-major and semi minor axes
semimajor = sqrt( 2*(a*xc^2 + c*yc^2 + b*xc*yc -1) / (a + c + sqrt((a -c)^2 + b^2)) ); 
semiminor = sqrt( 2*(a*xc^2 + c*yc^2 + b*xc*yc -1) / (a + c - sqrt((a -c)^2 + b^2)) ); 
% Evaluate the ellipse
if ((semimajor - semiminor) < 0)
    tmp = semimajor;
    semimajor = semiminor;
    semiminor = tmp;
end
% eccentricity
eccentricity = sqrt(semimajor^2 - semiminor^2) / semimajor;
% semiminor / semimajor
percentage = semiminor / semimajor * 100;