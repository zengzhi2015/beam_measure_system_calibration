close all
clear
clc
%% Set the truth values for coefficients
alpha_truth = 0.001553411; % rad
x_scale_truth = 35714.541454645;
y_scale_truth = 31453.441256551;
x_shift_truth = 235; % pixels
y_shift_truth = 332; % pixels
%% Set the range of phi/theta
phi = 0:100e-6:1200e-6; % 0urad:100urad:1200urad
theta = 0:100e-6:1200e-6; % 0urad:100urad:1200urad
[PHI,THETA] = meshgrid(phi,theta);
%% Add noise to phi/theta
PHI_real = PHI + randn(size(PHI))*5e-6; % Gaussian random noise with a sigma of 5urad
THETA_real = THETA + randn(size(THETA))*5e-6; % Gaussian random noise with a sigma of 5urad
%% Calculate x/y
rotation_matrix = [cos(alpha_truth),-sin(alpha_truth);sin(alpha_truth),cos(alpha_truth)];
scaling_matrix = [x_scale_truth,0;0,y_scale_truth];
shift_vector = [x_shift_truth;y_shift_truth];
X = zeros(size(PHI_real));
Y = zeros(size(THETA_real));
for index_phi = 1:length(phi)
    for index_theta = 1:length(theta)
        x_y = scaling_matrix*rotation_matrix*[PHI_real(index_phi,index_theta);THETA_real(index_phi,index_theta)] + shift_vector;
        X(index_phi,index_theta) = x_y(1);
        Y(index_phi,index_theta) = x_y(2);
    end
end
%% Add noise to the measurement
X_real = X + randn(size(X))*10e-6; % Gaussian random noise with a sigma of 10urad
Y_real = Y + randn(size(Y))*10e-6; % Gaussian random noise with a sigma of 10urad
%% Visualize the PHI_real_THETA_real
figure('Name','PHI_real_THETA_real','NumberTitle','off')
scatter(reshape(PHI_real,[length(phi)*length(theta),1]),reshape(THETA_real,[length(phi)*length(theta),1]))
xlabel('PHI\_real')
ylabel('THETA\_real')
axis equal
grid on
%% Visualize the X_real_Y_real
figure('Name','X_real_Y_real','NumberTitle','off')
scatter(reshape(X_real,[length(phi)*length(theta),1]),reshape(Y_real,[length(phi)*length(theta),1]))
xlabel('X\_real')
ylabel('Y\_real')
axis equal
grid on
%% Save the measurement
FAKE_DATA = [reshape(PHI_real,[length(phi)*length(theta),1]),reshape(THETA_real,[length(phi)*length(theta),1]),reshape(X_real,[length(phi)*length(theta),1]),reshape(Y_real,[length(phi)*length(theta),1])];
save('FAKE_DATA','FAKE_DATA')