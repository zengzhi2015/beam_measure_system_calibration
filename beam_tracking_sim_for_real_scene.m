close all
clear
clc
%% Initial settings
% Light source
source_init_pos_x = 10*cos(45*pi/180); % Position of light source
source_init_pos_y = 10*sin(45*pi/180); % m
source_init_dir_x = cos(225*pi/180); % Direction of light source
source_init_dir_y = sin(225*pi/180); % m
disp('Light source position (m):')
disp(source_init_pos_x);
disp(source_init_pos_y);
% CCD
CCD_init_pos_x = 0.5*cos(135*pi/180); % Position of light source
CCD_init_pos_y = 0.5*sin(135*pi/180); % m
CCD_init_dir_x = cos(-45*pi/180); % Direction of light source
CCD_init_dir_y = sin(-45*pi/180); % m
disp('CCD position (m):')
disp(CCD_init_pos_x);
disp(CCD_init_pos_y);
% Calculate the beam
spot_init_mirror_x = source_init_pos_x-source_init_pos_y/source_init_dir_y*source_init_dir_x;
spot_init_mirror_y = 0;
k_init = (CCD_init_dir_x*(spot_init_mirror_x-CCD_init_pos_x)+CCD_init_dir_y*(spot_init_mirror_y-CCD_init_pos_y))/(CCD_init_dir_y*source_init_dir_y-CCD_init_dir_x*source_init_dir_x);
spot_init_CCD_x = spot_init_mirror_x + k_init*source_init_dir_x;
spot_init_CCD_y = -k_init*source_init_dir_y;
%% Plot intial settings
figure('Name','Scene','NumberTitle','off')
axis equal
%daspect([1,1,1])
grid on
hold on
% Plot the mirror
mirror_init_block_x = [-0.01,0.01];
mirror_init_block_y = [0,0];
plot(mirror_init_block_x,mirror_init_block_y,'k','LineWidth',3)
% Plot the normal direction of the mirror
mirror_init_normal_x = [0,0];
mirror_init_normal_y = [0,0.2];
plot(mirror_init_normal_x,mirror_init_normal_y,'Color',[0.5,0.5,0.5],'LineWidth',1)
% Plot the tangent direction of the mirror
mirror_init_tangent_x = [-0.5,0.5];
mirror_init_tangent_y = [0,0];
plot(mirror_init_tangent_x,mirror_init_tangent_y,'--','Color',[0.5,0.5,0.5],'LineWidth',1)
% Plot light source
source_init_block_x = [source_init_pos_x,source_init_pos_x-source_init_dir_x*0.1];
source_init_block_y = [source_init_pos_y,source_init_pos_y-source_init_dir_y*0.1];
plot(source_init_block_x,source_init_block_y,'Color',[0.75,0.75,0.75],'LineWidth',10)
% Plot the CCD
CCD_init_block_x = [CCD_init_pos_x-CCD_init_dir_y*0.005,CCD_init_pos_x+CCD_init_dir_y*0.005];
CCD_init_block_y = [CCD_init_pos_y+CCD_init_dir_x*0.005,CCD_init_pos_y-CCD_init_dir_x*0.005];
plot(CCD_init_block_x,CCD_init_block_y,'k','LineWidth',7)
% Plot the normal direction of CCD
CCD_init_normal_x = [CCD_init_pos_x,CCD_init_pos_x+CCD_init_dir_x*0.2];
CCD_init_normal_y = [CCD_init_pos_y,CCD_init_pos_y+CCD_init_dir_y*0.2];
plot(CCD_init_normal_x,CCD_init_normal_y,'Color',[0.5,0.5,0.5],'LineWidth',1)
% Plot the tangent direction of CCD
CCD_init_tangent_x = [CCD_init_pos_x-CCD_init_dir_y*0.5,CCD_init_pos_x+CCD_init_dir_y*0.5];
CCD_init_tangent_y = [CCD_init_pos_y+CCD_init_dir_x*0.5,CCD_init_pos_y-CCD_init_dir_x*0.5];
plot(CCD_init_tangent_x,CCD_init_tangent_y,'--','Color',[0.5,0.5,0.5],'LineWidth',1)
% Plot the beam
beam_init_line_x = [source_init_pos_x,spot_init_mirror_x,spot_init_CCD_x];
beam_init_line_y = [source_init_pos_y,spot_init_mirror_y,spot_init_CCD_y];
plot(beam_init_line_x,beam_init_line_y,'Color',[1.0,0.7,0.7],'LineWidth',1)
hold off
%% Rotate the light source
% Rotated light source
source_rotation_angle = 0.0006; %1mrad
disp('Light source ratation angle (mrad):')
disp(source_rotation_angle*1000);
source_rotated_dir_x = cos(source_rotation_angle)*source_init_dir_x - sin(source_rotation_angle)*source_init_dir_y; % Direction of light source
source_rotated_dir_y = sin(source_rotation_angle)*source_init_dir_x + cos(source_rotation_angle)*source_init_dir_y; % 
% Calculate the beam
spot_rotated_source_mirror_x = source_init_pos_x-source_init_pos_y/source_rotated_dir_y*source_rotated_dir_x;
spot_rotated_source_mirror_y = 0;
k_rotated_source = (CCD_init_dir_x*(spot_rotated_source_mirror_x-CCD_init_pos_x)+CCD_init_dir_y*(spot_rotated_source_mirror_y-CCD_init_pos_y))/(CCD_init_dir_y*source_rotated_dir_y-CCD_init_dir_x*source_rotated_dir_x);
spot_rotated_source_CCD_x = spot_rotated_source_mirror_x + k_rotated_source*source_rotated_dir_x;
spot_rotated_source_CCD_y = -k_rotated_source*source_rotated_dir_y;
%% Plot scene for ratated source
hold on
% Plot light source
source_rotated_block_x = [source_init_pos_x,source_init_pos_x-source_rotated_dir_x*0.1];
source_rotated_block_y = [source_init_pos_y,source_init_pos_y-source_rotated_dir_y*0.1];
plot(source_rotated_block_x,source_rotated_block_y,'Color',[0.5,0.5,0.5],'LineWidth',8)
% Plot the beam
beam_rotated_source_line_x = [source_init_pos_x,spot_rotated_source_mirror_x,spot_rotated_source_CCD_x];
beam_rotated_source_line_y = [source_init_pos_y,spot_rotated_source_mirror_y,spot_rotated_source_CCD_y];
plot(beam_rotated_source_line_x,beam_rotated_source_line_y,'Color',[1.0,0.5,0.5],'LineWidth',1)
hold off
%% Calculate the rotation angle of the mirror
delta_x_init = spot_init_CCD_x;
delta_y_init = spot_init_CCD_y;
complex_direction_init = (delta_x_init+1i*delta_y_init)/sqrt(delta_x_init^2+delta_y_init^2);
angle_init = angle(complex_direction_init);
delta_x_rotated = spot_rotated_source_CCD_x;
delta_y_rotated = spot_rotated_source_CCD_y;
complex_direction_rotated = (delta_x_rotated+1i*delta_y_rotated)/sqrt(delta_x_rotated^2+delta_y_rotated^2);
angle_rotated = angle(complex_direction_rotated);
reference_angle = angle_rotated-angle_init;
mirror_rotation_angle = reference_angle/2;
%% Plot the reference angle
% hold on
% reference_angle_start_x = [0,2*cos(angle_init)];
% reference_angle_start_y = [0,2*sin(angle_init)];
% plot(reference_angle_start_x,reference_angle_start_y,'--','Color',[0.9,1.0,0.7],'LineWidth',1)
% reference_angle_end_x = [0,2*cos(angle_rotated)];
% reference_angle_end_y = [0,2*sin(angle_rotated)];
% plot(reference_angle_end_x,reference_angle_end_y,'--','Color',[0.85,0.95,0.7],'LineWidth',1)
% hold off
%% Rotate the mirror
% Rotate the source
source_mirror_rotated_pos_x = source_init_pos_x*cos(mirror_rotation_angle) - source_init_pos_y*sin(mirror_rotation_angle); % Position of light source
source_mirror_rotated_pos_y = source_init_pos_x*sin(mirror_rotation_angle) + source_init_pos_y*cos(mirror_rotation_angle);
source_mirror_rotated_dir_x = cos(mirror_rotation_angle)*source_rotated_dir_x - sin(mirror_rotation_angle)*source_rotated_dir_y; % Direction of light source
source_mirror_rotated_dir_y = sin(mirror_rotation_angle)*source_rotated_dir_x + cos(mirror_rotation_angle)*source_rotated_dir_y; % 
% Rotate the CCD
CCD_mirror_rotated_pos_x = CCD_init_pos_x*cos(mirror_rotation_angle) - CCD_init_pos_y*sin(mirror_rotation_angle); % Position of light source
CCD_mirror_rotated_pos_y = CCD_init_pos_x*sin(mirror_rotation_angle) + CCD_init_pos_y*cos(mirror_rotation_angle);
CCD_mirror_rotated_dir_x = cos(mirror_rotation_angle)*CCD_init_dir_x - sin(mirror_rotation_angle)*CCD_init_dir_y; % Direction of light source
CCD_mirror_rotated_dir_y = sin(mirror_rotation_angle)*CCD_init_dir_x + cos(mirror_rotation_angle)*CCD_init_dir_y; % 
% Calculate the beam
spot_mirror_rotated_mirror_x = source_mirror_rotated_pos_x-source_mirror_rotated_pos_y/source_mirror_rotated_dir_y*source_mirror_rotated_dir_x;
spot_mirror_rotated_mirror_y = 0;
k_mirror_rotated = (CCD_mirror_rotated_dir_x*(spot_mirror_rotated_mirror_x-CCD_mirror_rotated_pos_x)+CCD_mirror_rotated_dir_y*(spot_mirror_rotated_mirror_y-CCD_mirror_rotated_pos_y))/(CCD_mirror_rotated_dir_y*source_mirror_rotated_dir_y-CCD_mirror_rotated_dir_x*source_mirror_rotated_dir_x);
spot_mirror_rotated_CCD_x = spot_mirror_rotated_mirror_x + k_mirror_rotated*source_mirror_rotated_dir_x;
spot_mirror_rotated_CCD_y = -k_mirror_rotated*source_mirror_rotated_dir_y;
%% Plot the mirror rotated scene
hold on
% Plot light source
source_mirror_rotated_block_x = [source_mirror_rotated_pos_x,source_mirror_rotated_pos_x-source_mirror_rotated_dir_x*0.1];
source_mirror_rotated_block_y = [source_mirror_rotated_pos_y,source_mirror_rotated_pos_y-source_mirror_rotated_dir_y*0.1];
plot(source_mirror_rotated_block_x,source_mirror_rotated_block_y,'Color',[0.0,0.0,1.0],'LineWidth',6)
% Plot the CCD
CCD_mirror_rotated_block_x = [CCD_mirror_rotated_pos_x-CCD_mirror_rotated_dir_y*0.005,CCD_mirror_rotated_pos_x+CCD_mirror_rotated_dir_y*0.005];
CCD_mirror_rotated_block_y = [CCD_mirror_rotated_pos_y+CCD_mirror_rotated_dir_x*0.005,CCD_mirror_rotated_pos_y-CCD_mirror_rotated_dir_x*0.005];
plot(CCD_mirror_rotated_block_x,CCD_mirror_rotated_block_y,'Color',[0.0,0.0,1.0],'LineWidth',5)
% Plot the normal direction of CCD
CCD_mirror_rotated_normal_x = [CCD_mirror_rotated_pos_x,CCD_mirror_rotated_pos_x+CCD_mirror_rotated_dir_x*0.2];
CCD_mirror_rotated_normal_y = [CCD_mirror_rotated_pos_y,CCD_mirror_rotated_pos_y+CCD_mirror_rotated_dir_y*0.2];
plot(CCD_mirror_rotated_normal_x,CCD_mirror_rotated_normal_y,'Color',[0.5,0.5,0.5],'LineWidth',1)
% Plot the tangent direction of CCD
CCD_mirror_rotated_tangent_x = [CCD_mirror_rotated_pos_x-CCD_mirror_rotated_dir_y*0.5,CCD_mirror_rotated_pos_x+CCD_mirror_rotated_dir_y*0.5];
CCD_mirror_rotated_tangent_y = [CCD_mirror_rotated_pos_y+CCD_mirror_rotated_dir_x*0.5,CCD_mirror_rotated_pos_y-CCD_mirror_rotated_dir_x*0.5];
plot(CCD_mirror_rotated_tangent_x,CCD_mirror_rotated_tangent_y,'--','Color',[0.5,0.5,0.5],'LineWidth',1)
% Plot the beam
beam_mirror_rotated_line_x = [source_mirror_rotated_pos_x,spot_mirror_rotated_mirror_x,spot_mirror_rotated_CCD_x];
beam_mirror_rotated_line_y = [source_mirror_rotated_pos_y,spot_mirror_rotated_mirror_y,spot_mirror_rotated_CCD_y];
plot(beam_mirror_rotated_line_x,beam_mirror_rotated_line_y,'Color',[1.0,0.0,0.0],'LineWidth',1)
hold off
%% Calculate the tracking error
CCD_spot_shift_init_x = spot_init_CCD_x-CCD_init_pos_x;
CCD_spot_shift_init_y = spot_init_CCD_y-CCD_init_pos_y;
CCD_spot_shift_init = sqrt(CCD_spot_shift_init_x^2+CCD_spot_shift_init_y^2);
CCD_spot_shift_mirror_rotated_x = spot_mirror_rotated_CCD_x-CCD_mirror_rotated_pos_x;
CCD_spot_shift_mirror_rotated_y = spot_mirror_rotated_CCD_y-CCD_mirror_rotated_pos_y;
CCD_spot_shift_mirror_rotated = sqrt(CCD_spot_shift_mirror_rotated_x^2+CCD_spot_shift_mirror_rotated_y^2);
disp('Tracking Error (urad):')
disp(abs(CCD_spot_shift_mirror_rotated-CCD_spot_shift_init)/0.5*1000000)