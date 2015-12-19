close all;
xData = load('y6.txt');
yData = load('x6.txt');
zData = load('z6.txt');
%%
smallPCB = 1;
if (smallPCB == 1)
   if (exist('smallPcbResult','dir') == 0)
       mkdir('smallPcbResult');
   end
   PCBdir = 'smallPcbResult';
else
   if (exist('bigPcbResult','dir') == 0)
       mkdir('bigPcbResult');
   end
   PCBdir = 'bigPcbResult';
end    

magdir = PCBdir;
if (exist(magdir,'dir') == 0)
    mkdir(magdir);
end

%%
% x axis rotation data process
handle1 = figure(1);
hold on;
plot(xData(:,2), xData(:,3),'y*');
axis equal;axis([-250 250 -250 250]);
[xc1,yc1,R,a] = circfit(xData(:,2), xData(:,3));
circle(R,xc1,yc1);
xlabel('magY'); ylabel('magZ');
title('X axis rotation');
saveas(handle1,[magdir,'/xRotation.fig']);

% evaluate the data
[xcx, ycx, semimajorx, semiminorx, eccex, percentx] = getEllipseParam(xData(:,2), xData(:,3));
% Save the data
fid = fopen([magdir '/magEvaluateParam.txt' ], 'wt');
fprintf(fid, 'The result of x axis rotation:\n');
fprintf(fid, 'xCenter:      %.5g\n', xcx);
fprintf(fid, 'yCenter:      %.5g\n', ycx);
fprintf(fid, 'semimajor:    %.5g\n', semimajorx);
fprintf(fid, 'semiminor:    %.5g\n', semiminorx);
fprintf(fid, 'eccentricity: %.5g\n', eccex);
fprintf(fid, 'percentage:   %.5g\n\n', percentx);


%%
% y axis rotation data process
handle2 = figure(2); 
hold on;
plot(yData(:,1)-33.2442, yData(:,3)-43.1492,'y*');
axis equal;axis([-250 250 -250 250]);
[xc2,yc2,R,a] = circfit(yData(:,1)-33.2442, yData(:,3)-43.1492);

circle(R,xc1,yc1);
xlabel('magZ'); ylabel('magX');
title('Y axis rotation');
saveas(handle2,[magdir,'/yRotation.fig']);

% evaluate the data
[xcy, ycy, semimajory, semiminory, eccey, percenty] = getEllipseParam(yData(:,1), yData(:,3));
% Save the data
fprintf(fid, 'The result of y axis rotation:\n');
fprintf(fid, 'xCenter:      %.5g\n', xcy);
fprintf(fid, 'yCenter:      %.5g\n', ycy);
fprintf(fid, 'semimajor:    %.5g\n', semimajory);
fprintf(fid, 'semiminor:    %.5g\n', semiminory);
fprintf(fid, 'eccentricity: %.5g\n', eccey);
fprintf(fid, 'percentage:   %.5g\n\n', percenty);


%%
% z axis data process
handle3 = figure(3);
hold on;
plot(zData(:,1)-36.3541, zData(:,2)+12.1757,'y*');
axis equal;axis([-250 250 -250 250]);
[xc3,yc3,R,a] = circfit(zData(:,1)-36.3541, zData(:,2)+12.1757);
circle(R,xc3,yc3);
xlabel('magX'); ylabel('magY');
title('Z axis rotation');
saveas(handle3,[magdir,'/zRotation.fig']);

% evaluate the data
[xcz, ycz, semimajorz, semiminorz, eccez, percentz] = getEllipseParam(zData(:,1), zData(:,2));
% Save the data
fprintf(fid, 'The result of z axis rotation:\n');
fprintf(fid, 'xCenter:      %.5g\n', xcz);
fprintf(fid, 'yCenter:      %.5g\n', ycz);
fprintf(fid, 'semimajor:    %.5g\n', semimajorz);
fprintf(fid, 'semiminor:    %.5g\n', semiminorz);
fprintf(fid, 'eccentricity: %.5g\n', eccez);
fprintf(fid, 'percentage:   %.5g', percentz);
fclose(fid);
