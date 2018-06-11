close all
clear
clc
%% Load the data
% load('FAKE_DATA')
FAKE_DATA = dlmread('D:\\记录\\标定记录1000ms.txt');
%% Prepare for fitting
x_ccd = FAKE_DATA(:,3); % x
y_ccd = FAKE_DATA(:,4); % y
x_psd = FAKE_DATA(:,5); % x
y_psd = FAKE_DATA(:,6); % y
phi = FAKE_DATA(:,1); % phi
theta = FAKE_DATA(:,2); % theta
%% Fitting CCD
[fitresult_ccd, gof_ccd] = createFits(x_ccd, y_ccd, phi, theta);
a_ccd = fitresult_ccd{1}.a;
b_ccd = fitresult_ccd{1}.b;
c_ccd = fitresult_ccd{1}.c;
d_ccd = fitresult_ccd{2}.d;
e_ccd = fitresult_ccd{2}.e;
f_ccd = fitresult_ccd{2}.f;
disp(gof_ccd(1))
disp(gof_ccd(2))
%% Fitting PSD
[fitresult_psd, gof_psd] = createFits(x_psd, y_psd, phi, theta);
a_psd = fitresult_psd{1}.a;
b_psd = fitresult_psd{1}.b;
c_psd = fitresult_psd{1}.c;
d_psd = fitresult_psd{2}.d;
e_psd = fitresult_psd{2}.e;
f_psd = fitresult_psd{2}.f;
disp(gof_psd(1))
disp(gof_psd(2))

%%
fileID = fopen('D:\\parameters\\parameters.txt','w');
fprintf(fileID,'%10.20f\r\n',a_ccd);
fprintf(fileID,'%10.20f\r\n',b_ccd);
fprintf(fileID,'%10.20f\r\n',c_ccd);
fprintf(fileID,'%10.20f\r\n',d_ccd);
fprintf(fileID,'%10.20f\r\n',e_ccd);
fprintf(fileID,'%10.20f\r\n',f_ccd);
% fprintf(fileID,'%10.20f\r\n',a_psd);
% fprintf(fileID,'%10.20f\r\n',b_psd);
% fprintf(fileID,'%10.20f\r\n',c_psd);
% fprintf(fileID,'%10.20f\r\n',d_psd);
% fprintf(fileID,'%10.20f\r\n',e_psd);
% fprintf(fileID,'%10.20f\r\n',f_psd);
fprintf(fileID,'%10.20f\r\n',0);
fprintf(fileID,'%10.20f\r\n',0);
fprintf(fileID,'%10.20f\r\n',0);
fprintf(fileID,'%10.20f\r\n',0);
fprintf(fileID,'%10.20f\r\n',0);
fprintf(fileID,'%10.20f\r\n',0);
fclose(fileID);
parameter_check = dlmread('D:\\parameters\\parameters.txt');