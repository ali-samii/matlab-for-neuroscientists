% phi : 100 x steps (100 nm), 40 y steps (40 nm)
% 100 t steps (1 t = 10 us)
clear all
close all
phi = zeros(100, 40, 2);
dt = 1e-10; % time in steps of 10 ns
dx = 1e-9; % space from 0 to 50
D=4e-6 * (1/100)^2;
phi0=5000/(dx^2);
phi(50,1,1) = phi0; % initial condition
F = [0 1 0; 1 -4 1; 0 1 0]/dx^2;
for  i=1:110
phi(:,:,1+1) = phi(:,:,1) +...
D*dt*conv2(phi(:,:,1),F,'same');
i

surf(phi(:, :, 1))
% imagesc(phi(:,:,t), [0 phi0])
pause(0.05)
phi(:,:,1)=phi(:,:,1+1);
end
