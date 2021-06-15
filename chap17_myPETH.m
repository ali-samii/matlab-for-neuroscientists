clc
clear
load('Chap17_Data.mat');
% select single neuron(arbitrary) 
select_neuron_num= 129;
spike_time=unit(select_neuron_num).times;
% open empty figure
figure
hold
% build bin edges 
bin_edges=[-1:0.01:1];
% build loop for every subplot(every direction) 
for i=1:length(unique(direction))
%find trials of selected direction
selected_trials=find(direction==i);
% zeros matrix for histogram
the_histogram=zeros(length(selected_trials),length(bin_edges));
for j=1:length(selected_trials);
% extract spikes based on (go or instruction) parameter
go_time=spike_time - go(selected_trials(j));
selected_time= go_time((go_time <= 1) & (go_time>=-1));
the_histogram(j,:)=histc(selected_time,bin_edges);
end
% make histogram with bins
subplot(3,3,i)
bar(bin_edges,mean(the_histogram)) %mean for normalization 
title(['neuron no. ',num2str(select_neuron_num),' response to direction ',num2str(i)])
ylim([0 1]) 
end