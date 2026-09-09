%% Gaussian Analysis Na-22

x = Gaussian_950_Volts(:,3);
mu = mean(x);
sg = std(x);
sg1 = sqrt(mean(x));
t = linspace((mu-4*sg),(mu+4*sg));
n = hist(x,t);
y = (1/(sqrt(2*pi)*sg))*exp(-((t-mu).^2)/(2*sg^2));
y1 = (1/(sqrt(2*pi)*sg1))*exp(-((t-mu).^2)/(2*sg1^2));
y = y.*(92/max(y));
y1 = y1.*(92/max(y1));

figure
hold on
histogram(x,35);
plot(t,y,'b-','LineWidth',1);
plot(t,y1,'r.','LineWidth',1);
legend('Data','Gaussian fit','Gaussian Approximation');
xlabel('Counts');
ylabel('Density of Counts');
set(gca,'fontsize',17);
