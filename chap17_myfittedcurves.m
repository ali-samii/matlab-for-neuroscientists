clc
clear
load('Chap17_Data.mat');
% select single neouron(arbitrary) 
select_neuron_num= 129;
spike_time=unit(select_neuron_num).times;
% open empty figure
figure
hold
% determine bin edges 
bin_edges=[-1:0.01:1];
% build loop for every subplot(every direction) 
for i=1:length(unique(direction))
%find trials of selected direction
selected_trials=find(direction==i);
% zeros matrix for histogram which is base of exact curve
the_histogram=zeros(length(selected_trials),length(bin_edges));
for j=1:length(selected_trials);
% extract spikes based on (go or instruction) parameter
go_time=spike_time - go(selected_trials(j));
selected_time= go_time((go_time <= 1) & (go_time>=-1));
the_histogram(j,:)=histc(selected_time,bin_edges);
end
% nonlinear fitting by nlinfit
sum_hist=sum(the_histogram)
func=@(coef,x)(coef(1)+coef(2)*cos(coef(3)-x))
coefs=nlinfit(bin_edges,sum_hist,func,[1 1 1])
fitted_curve=func(coefs,bin_edges)
% plot exact curve and fitted curve 
subplot(3,3,i)
plot(bin_edges,sum_hist,'r') %plot exact curve
hold
plot(bin_edges,fitted_curve,'k') %plot fitted curve
title(['neuron no. ',num2str(select_neuron_num),' response to direction ',num2str(i)])
ylim([0 30]) 

end