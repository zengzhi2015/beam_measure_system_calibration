close all
clear
clc
%% Load the data
% load('FAKE_DATA')
FAKE_DATA = dlmread('FAKE_DATA.txt');
%% Prepare for fitting
x = FAKE_DATA(:,3); % x
y = FAKE_DATA(:,4); % y
phi = FAKE_DATA(:,1); % phi
theta = FAKE_DATA(:,2); % theta
%% Fitting
% (phi,theta -> x,y)
% z1 = x_scale*(cos(alpha)*x - sin(alpha)*y) + x_shift
% z2 = y_scale*(sin(alpha)*x + cos(alpha)*y) + y_shift
% (x,y -> phi,theta)
% phi = phi_scale*cos(alpha)*x + theta_scale*sin(alpha)*y + phi_shift =
% ax+by+c
% theta = -phi_scale*cos(alpha)*x + theta_scale*cos(alpha)*y + theta_shift
% = ex+dy+f
% cftool
[fitresult, gof] = createFits(x, y, phi, theta);
%%
a = fitresult{1}.a;
b = fitresult{1}.b;
c = fitresult{1}.c;
d = fitresult{2}.d;
e = fitresult{2}.e;
f = fitresult{2}.f;
disp(gof(1))
disp(gof(2))