close all
clear
clc
%% Read rocords
data_array = dlmread('results.txt');
table_size = size(data_array);
data_array = data_array(1:table_size(1)-1-500,:);
%% Calculate time
data_array(:,1) = data_array(:,1)-min(data_array(:,1));
%% Plot the data
figure('Name','X_real_Y_real','NumberTitle','off')
X = data_array(:,1);
Y = data_array(:,2);
Z = data_array(:,3);
plot3(X,Y,Z,'-b.')
xlabel('time')
ylabel('X')
zlabel('Y')
%axis equal
grid on