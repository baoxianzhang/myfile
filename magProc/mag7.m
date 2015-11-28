%%
clc;
clear;
close all;
% load the data for calibration
file = importdata('message.log');
magdata = file.data;

[ V, Winv, B, ERROR] = magcalibrate7(magdata);
save('calibrateparam7.mat', 'V', 'Winv', 'B', 'ERROR');


%%
% plot the original data
x = magdata(:,1);
y = magdata(:,2);
z = magdata(:,3);
% draw data
figure;
plot3( x, y, z, '.r');
xlabel('magX');
ylabel('magY');
zlabel('magZ');
title('The origin one');
hold on;

% do the fitting
[ center, radii, evecs, v, chi2 ] = ellipsoid_fit( [ x y z ], '' );

disp('The original one:');
fprintf( 'Ellipsoid center: %.5g %.5g %.5g\n', center );
fprintf( 'Ellipsoid radii: %.5g %.5g %.5g\n', radii );
fprintf( 'Ellipsoid evecs:\n' );
fprintf( '%.5g %.5g %.5g\n%.5g %.5g %.5g\n%.5g %.5g %.5g\n', ...
    evecs(1), evecs(2), evecs(3), evecs(4), evecs(5), ...
    evecs(6), evecs(7), evecs(8), evecs(9) );
fprintf( 'Algebraic form:\n' );
fprintf( '%.5g ', v );
fprintf( '\nAverage deviation of the fit: %.5f\n',...
    sqrt( chi2 / size( x, 1 ) ) );
fprintf( '\n' );

% draw fit
mind = min( [ x y z ] );
maxd = max( [ x y z ] );
nsteps = 50;
step = ( maxd - mind ) / nsteps;
[ x, y, z ] = meshgrid( linspace( mind(1) - step(1), maxd(1) + step(1), nsteps ), linspace( mind(2) - step(2), maxd(2) + step(2), nsteps ), linspace( mind(3) - step(3), maxd(3) + step(3), nsteps ) );

Ellipsoid = v(1) *x.*x +   v(2) * y.*y + v(3) * z.*z + ...
          2*v(4) *x.*y + 2*v(5)*x.*z + 2*v(6) * y.*z + ...
          2*v(7) *x    + 2*v(8)*y    + 2*v(9) * z;
p = patch( isosurface( x, y, z, Ellipsoid, -v(10) ) );
hold off;
set( p, 'FaceColor', 'c', 'EdgeColor', 'none' );
view( -70, 40 );
axis vis3d equal;
% camlight;
% lighting phong;


%%
% calculate the calibrated data
M = size(magdata,1);
magdataCalibrated = ( Winv * (magdata -  repmat(V', M, 1))')';
% magdataCalibrated = magdata - repmat(V', M, 1);

clear x y z
x = magdataCalibrated(:,1);
y = magdataCalibrated(:,2);
z = magdataCalibrated(:,3);


%%
% plot the calibrated data
% draw data
figure;
plot3( x, y, z, '.k');
xlabel('magX');
ylabel('magY');
zlabel('magZ');
title('The calibrated one');
hold on;

% do the fitting
clear center radii evecs v chi2
[ center, radii, evecs, v, chi2 ] = ellipsoid_fit( [ x y z ], '' );

disp('The calibrated one:');
fprintf( 'Ellipsoid center: %.5g %.5g %.5g\n', center );
fprintf( 'Ellipsoid radii: %.5g %.5g %.5g\n', radii );
fprintf( 'Ellipsoid evecs:\n' );
fprintf( '%.5g %.5g %.5g\n%.5g %.5g %.5g\n%.5g %.5g %.5g\n', ...
    evecs(1), evecs(2), evecs(3), evecs(4), evecs(5), evecs(6), evecs(7), evecs(8), evecs(9) );
fprintf( 'Algebraic form:\n' );
fprintf( '%.5g ', v );
fprintf( '\nAverage deviation of the fit: %.5f\n', sqrt( chi2 / size( x, 1 ) ) );
fprintf( '\n' );


% draw fit
mind = min( [ x y z ] );
maxd = max( [ x y z ] );
nsteps = 50;
step = ( maxd - mind ) / nsteps;
[ x, y, z ] = meshgrid( linspace( mind(1) - step(1), maxd(1) + step(1), nsteps ), linspace( mind(2) - step(2), maxd(2) + step(2), nsteps ), linspace( mind(3) - step(3), maxd(3) + step(3), nsteps ) );

Ellipsoid = v(1) *x.*x +   v(2) * y.*y + v(3) * z.*z + ...
          2*v(4) *x.*y + 2*v(5)*x.*z + 2*v(6) * y.*z + ...
          2*v(7) *x    + 2*v(8)*y    + 2*v(9) * z;
p = patch( isosurface( x, y, z, Ellipsoid, -v(10) ) );
hold off;
set( p, 'FaceColor', 'r', 'EdgeColor', 'none' );
view( -70, 40 );
axis vis3d equal;
% camlight;
% lighting phong;
