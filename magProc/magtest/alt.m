clear;
clc;
baro1 = load('BARO1.txt');
M1 = size(baro1, 1);
altitude1 = [];
for i = 1:M1
    tmp = 44330.0 * (1 - (baro1(i,2)/101325)^(1/5.255));
    altitude1 = [altitude1; tmp];
end
alt1 = mean(altitude1,1)

baro2 = load('BARO3.txt');
M2 = size(baro2, 1);
altitude2 = [];
for i = 1:M2
    tmp = 44330.0 * (1 - (baro2(i,2)/101325)^(1/5.255));
    altitude2 = [altitude2; tmp];
end
alt2 = mean(altitude2,1)

diff = alt2 - alt1