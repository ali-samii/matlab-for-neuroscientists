clc
clear
%% some normal data generating
n=500
a=normrnd(0,1,[n,2]);
b=normrnd(0,1,[n,1]);
b(:,2)=b*0.5 + 0.5*normrnd(0,1,[n,1]);
plot(b(:,1),b(:,2),'r.')
hold on
plot(a(:,1),a(:,2),'k.')
%% variance calculating
c1=var(a(:,1));
c2=a(:,1)-mean(a(:,1));
c2=c2' * c2 / (n-1);
%% covariance caculating
co1=cov(a);
co2= a - repmat(mean(a),[n 1]);
co2= co2' * co2 /(n-1);
%% generate data by specific covariance matrix
sigma=cov(b);
b1=mvnrnd([0 0],sigma,n);
% hold
% plot(b1(:,1),b1(:,2),'b.')
%% eigenvalues and vectors
[V,d]=eig(sigma);
[~,indx]=sort(diag(d),'descend');
% plot(b(:,1),b(:,2),'b.')
hold on
plot([-V(1,1) V(1,1)],[-V(1,2) V(1,2)],'k')
plot([-V(2,1) V(2,1)],[-V(2,2) V(2,2)],'k')
V2(:,1)=V(:,2);
V2(:,2)=V(:,1);
B=b*V2;
% plot(B(:,1),B(:,2),'r.')
hold
plot(b(:,1),b(:,2),'.b')
%% built in pca function
[coeff,score,latent]=pca(b);


%% exercises
a_cov= cov(a);
b_cov= cov(b);


plot(score(:,1),score(:,2),'r.')
hold on
plot(-B(:,1),-B(:,2),'b.')


[coeffa,scorea,latenta]=pca(a);



