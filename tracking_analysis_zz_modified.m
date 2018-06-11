close all
clear
clc
%% Read rocords
data_array = dlmread('D:\\¼ÇÂ¼\\²âÊÔ10ms.txt');
table_size = size(data_array);
data_array = data_array(1:table_size(1)-1,:);
table_size = size(data_array);
%% Calculate time
time_array = data_array(:,1);
%% Plot the data
figure('Name','Moving Commands and Measurement','NumberTitle','off')
hold on
Y_command = data_array(1:table_size(1)-1,2);
Z_command = data_array(1:table_size(1)-1,3);
Y_measure = data_array(2:table_size(1),4);
Z_measure = data_array(2:table_size(1),5);
X = time_array(1:table_size(1)-1)';
plot3(X, Y_command,Z_command,'-b.',X, Y_measure,Z_measure,'-r.')
legend('command','measure')
xlabel('time (ms)')
ylabel('\phi (mrad)')
zlabel('\theta (mrad)')
%axis equal
grid on
%%
disp('mean error: ')
disp(mean(sqrt((Y_command-Y_measure).^2+(Z_command-Z_measure).^2)))
disp(trimmean(sqrt((Y_command-Y_measure).^2+(Z_command-Z_measure).^2),10))