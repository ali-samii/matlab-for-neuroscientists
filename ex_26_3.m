clc
clear
close all
t=0:999;
t_slices=length(t);
p=ones(t_slices,1)*0.001;
x=rand(10,1)*t_slices;
p(floor(x)+1)=150;
%plot(p)
rn=binornd(1000,p./150);
find(rn>1)
plot(rn)
