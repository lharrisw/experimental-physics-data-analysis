%% Dead Time Determination

xx = linspace(0,20,1000);
x1 = Deadtime_1(:,3);
x2 = Deadtime_2(:,3);
x3 = Deadtime_1_2(:,3);
x = [x1 x2 x3];
dx = sqrt(x);

t = 1./(2.*x(:,1)) + 1./(2.*x(:,2)) - x(:,3)./(2.*x(:,1).*x(:,2));

dtdx1 = -1./(2.*(x(:,1).^2)) + x(:,3)./(2.*(x(:,1).^2).*x(:,2));
dtdx2 = -1./(2.*(x(:,2).^2)) + x(:,3)./(2.*(x(:,2).^2).*x(:,1));
dtdx3 = -1./(2.*x(:,2).*x(:,1));

x4 = ones(1000,1);
x4(:,1) = mean(t);

dt = sqrt((dtdx1.*dx(:,1)).^2 + (dtdx2.*dx(:,2)).^2 + (dtdx3.*dx(:,3)).^2);

y1 = Deadtime_1_5(:,3);
y2 = Deadtime_2_5(:,3);
y3 = Deatime_1_2_5(:,3); 
y = [y1 y2 y3];
dy = sqrt(y);

t1 = 1./(2.*y(:,1)) + 1./(2.*y(:,2)) - y(:,3)./(2.*y(:,1).*y(:,2));
%t1 = t1(t1>=0);

dtdy1 = -1./(2.*(y(:,1).^2)) + y(:,3)./(2.*(y(:,1).^2).*y(:,2));
dtdy2 = -1./(2.*(y(:,2).^2)) + y(:,3)./(2.*(y(:,2).^2).*y(:,1));
dtdy3 = -1./(2.*y(:,2).*y(:,1));

y4 = ones(1000,1);
y4(:,1) = mean(t1);

dt1 = sqrt((dtdy1.*dy(:,1)).^2 + (dtdy2.*dy(:,2)).^2 + (dtdy3.*dy(:,3)).^2);
dt1 = [dt1(1) dt1(4) dt1(5) dt1(6) dt1(10) dt1(16)];

figure
hold on
%errorbar(t,dt,'.');
plot(xx,x4,'--');
xlabel('Trial Number');
ylabel('Dead Time (s)');
legend('Data','Mean Dead Time');
title('Dead Time for Slot 1');
set(gca,'fontsize',20);

figure
hold on
errorbar(t1,dt1,'.')
plot(xx,y4,'--');
xlabel('Trial Number');
ylabel('Dead Time (s)');
legend('Data','Mean Dead Time');
title('Dead Time for Slot 5');
set(gca,'fontsize',20);
xlim([0 7]);
