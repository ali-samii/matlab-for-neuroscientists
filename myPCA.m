clc
clear
%% dataset loading
load('Chap17_SpikeSorting.mat')
wf1=double(session(1).wf);
wf2=double(session(2).wf);
stamps1=session(1).stamps;
stamps2=session(2).stamps;
%plot(1:48 ,wf1(1:100,1:48));
%% first day pca
[coeff,score,latent]=pca(wf1');
%% percent of variation calculation
pca1_2=coeff(:,1:2);
percent_of_variation=(latent(1)+latent(2))/sum(latent)
%% select one spike point and nearby spikes 
%% select center point(can be arbitrary)
[clusters,centers]=kmeans(pca1_2,2);

% scatter(pca1_2(:,1),pca1_2(:,2),'b.')
% hold on
% scatter(centers(1,:),centers(2,:),'r*')


%% finding of nearby points
for i= 1:size(pca1_2,1)
    euclidean_dist(:,i)= sqrt((pca1_2(i,1)-centers(1,1))^2 + ...
        (pca1_2(i,2)-centers(1,2))^2 );
end
 sp_find=find (euclidean_dist <   sqrt((centers(2,1)-centers(1,1))^2 + ...
        ((centers(2,2)-centers(1,2))^2 )) /10) ;
%% calculation of avarage waveform
 template_waveform=mean(wf1(sp_find,1:48));  
    
%  plot(1:48 ,wf1(sp_find,1:48))
%  hold on
%   plot(1:48 ,template_waveform,'k*') 
%% interspike interval histogram  
%   histogram(diff(stamps1(sp_find)))
  
%% project second day data to first day pca
  second_day_on_first=wf2*score;
  scatter(second_day_on_first(:,1),second_day_on_first(:,2),'.')
figure
%% second day data pca
  [coeff2,score2,latent2]=pca(wf2');
  scatter(coeff2(1:end,1),coeff2(1:end,2),'r.')
  
  







