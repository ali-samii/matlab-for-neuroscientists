% phi : 100 x steps (100 nm), 40 y steps (40 nm)
% 100 t steps (1 t = 10 us)
clear all
close all

%%%%%%%%%%%%%
t=0:999;
t_slices=length(t);
p=ones(t_slices,1)*0.001;
x=rand(10,1)*t_slices;
p(floor(x)+1)=150;
%plot(p)
rn=binornd(1000,p./150);
%rn=1:10
find(rn>1)
%plot(rn)
%%%%%%%%%%%%%%
phi = zeros(100, 40, 2);
dt = 1e-10; % time in steps of 10 ns
D=4e-6 * (1/100)^2;
dx = 1e-9; % space from 0 to 50
phi0=5000/(dx^2);
phi(50,1,1) = phi0; % initial condition
F = [0 1 0; 1 -4 1; 0 1 0]/dx^2;
for  t=1:1000

    if rn(t)==0
    phi(:,:,1+1) = phi(:,:,1) +...
    D*dt*conv2(phi(:,:,1),F,'same');
    phi(:,:,1)=phi(:,:,1+1);
    else
    etha=ceil(randi(100,[150,1]));
    phit = zeros(100, 40, 1);
    phit(etha,1,1) = phit(etha,1,1)+ phi0 ;
    phi(:,:,1+1) = phi(:,:,1) +...
    D*dt*conv2(phi(:,:,1),F,'same');
    phi(:,:,1)=phi(:,:,1+1)+phit ;
    end

surf(phi(:, :, 2))
zlim([0,10 * 1e21])
colorbar; 
caxis([0 1e21]);
% imagesc(phi(:,:,t), [0 phi0])
pause(0.05)

t
end
