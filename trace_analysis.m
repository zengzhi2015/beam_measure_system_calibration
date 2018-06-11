close all
clear
clc
%% Read rocords
data_in_table = readtable('trace.txt','Delimiter','\t');
data_in_cell = table2cell(data_in_table);
table_size = size(data_in_cell);
data_in_cell_cared = data_in_cell(50:table_size(1)-120,:);
table_cared_size = size(data_in_cell_cared);
%% Calculate time
data_array = zeros(table_cared_size);
for row = 1:table_cared_size(1)
    time_string_array = split(data_in_cell_cared{row,1},':');
    time_array = str2double(time_string_array);
    time_in_double = ((time_array(1)*60+time_array(2))*60+time_array(3))*1000+time_array(4);
    data_array(row,1) = time_in_double;
    data_array(row,2) = data_in_cell_cared{row,2};
    data_array(row,3) = data_in_cell_cared{row,3};
end
data_array(:,1) = data_array(:,1)-min(data_array(:,1));
%% Plot the data
figure('Name','X_real_Y_real','NumberTitle','off')
X = data_array(:,1);
Y = data_array(:,2);
Z = data_array(:,3);
plot3(X,Y,Z,'-o')
xlabel('time')
ylabel('X')
zlabel('Y')
%axis equal
grid on