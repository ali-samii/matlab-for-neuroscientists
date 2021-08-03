xbounds = [0 10];
ybounds = [0 4];
xdata = rand(100,1)* max(xbounds) ;
ydata = rand(100,1)* max(ybounds);
xgrid = 0.01;
ygrid = 0.01;
figure
handle = scatter(xdata, ydata, 'filled');
xlim(xbounds);
ylim(ybounds);
for t = 1:10000
p = 0.5;
for i = 1:100
dx(i) = ((rand > p) - 0.5) * 2;
dy(i) = ((rand > p) - 0.5) * 2;

xdata(i) = xdata (i)+ dx(i)*xgrid;
% these two lines assure the molecule stays in x bounds
xdata(find(xdata < xbounds(1))) = xbounds(1);
xdata(find(xdata > xbounds(2))) = xbounds(2);
ydata(i) = ydata(i) + dy(i)*ygrid;
% these two lines assure the molecule stays within y bounds
ydata(find(ydata < ybounds(1))) = ybounds(1);
ydata(find(ydata > ybounds(2))) = ybounds(2);
end
set(handle, 'xdata', xdata, 'ydata', ydata);
drawnow;
pause(0.1)
end