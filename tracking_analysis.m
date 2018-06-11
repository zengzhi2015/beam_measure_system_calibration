close all
clear
clc
%% Read rocords
data_array = dlmread('≤‚ ‘10ms.txt');
table_size = size(data_array);
data_array = data_array(1:table_size(1)-1,:);
table_size = size(data_array);
%% Calculate time
delta_t = 10; % 10ms
time_array = 0:delta_t:delta_t*(table_size(1)-1);
%% Plot the data
figure('Name','Moving Commands and Measurement','NumberTitle','off')
hold on
Y_command = data_array(:,1);
Z_command = data_array(:,2);
Y_measure = data_array(:,3);
Z_measure = data_array(:,4);
X = time_array';
plot3(X, Y_command,Z_command,'-ob',X, Y_measure,Z_measure,'-*r')
legend('command','measure')
xlabel('time (ms)')
ylabel('\phi (mrad)')
zlabel('\theta (mrad)')
%axis equal
grid on