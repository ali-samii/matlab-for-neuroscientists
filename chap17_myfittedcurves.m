clc
clear
load('Chap17_Data.mat');
% select single neouron(arbitrary) 
select_neuron_num= 118;
spike_time=unit(select_neuron_num).times;
% open empty figure
figure
hold
% determine bin edges based on directions 
bin_edges=[0:45:45*7];
% build loop for spike counting of each direction 
direction_spike_counter=[];
for i=1:length(unique(direction))
%find trials of selected direction
selected_trials=find(direction==i);
% determine counter for spikes of direction (i)
trial_spike_counter=0;
for j=1:length(selected_trials);
% extract number of spikes based on (go or instruction) parameter
go_time=spike_time - instruction(selected_trials(j));
selected_time= go_time((go_time <= 1) & (go_time>=-1));
trial_spike_counter=trial_spike_counter+length(selected_time);
end
% calculate mean of spikes per trial 
direction_spike_counter(i)=trial_spike_counter/j;

end
% nonlinear fitting by nlinfit
sum_hist=direction_spike_counter;
func=@(coef,x)(coef(1)+coef(2)*cos(coef(3)-((x/180)*pi)));
coefs=nlinfit(bin_edges,sum_hist,func,[1 1 0]);
fitted_curve=func(coefs,[0:1:360]);
% plot exact curve and fitted curve 
plot(bin_edges,sum_hist,'r') %plot exact curve
hold on
plot([0:1:360],fitted_curve,'k') %plot fitted curve
title(['neuron no. ',num2str(select_neuron_num),' curve fit '])


