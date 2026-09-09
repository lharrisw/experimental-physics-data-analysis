%% Voltage Determination

v = GC_Ba_133_Slot_1(:,2); % Voltage
x1 = GC_Ba_133_Slot_1(:,3);
err1 = sqrt(x1); % slot 1 ba-133 error
x2 = GC_Ba_133_slot_5(:,3); 
err2 = sqrt(x2); % slot 5 ba-133 error
x3 = GC_Ba_133_slot_9_redo(:,3);
err3 = sqrt(x3); % slot 9 ba-133 error
x4 = GC_Na_22_slot_1(:,3);
err4 = sqrt(x4); % slot 1 na-22 error
x5 = GC_Na_22_slot_5(:,3);
err5 = sqrt(x5); % slot 5 na-22 error
x6 = GC_Na_22_slot_9(:,3);
err6 = sqrt(x6); % slot 9 na-22 error

figure
hold on
errorbar(v,x1,err1,'v');
errorbar(v,x2,err2,'d');
errorbar(v,x3,err3,'s');
xlim([650 1050]);
legend('Ba-133 Slot 1','Ba-133 slot 5','Ba-133 slot 9');
xlabel('Voltage (V)');
ylabel('Counts');
title('^{133}Ba Counts');
set(gca,'FontSize', 18)

figure
hold on
errorbar(v,x4,err4,'^');
errorbar(v,x5,err5,'o');
errorbar(v,x6,err6,'p');
xlim([650 1050]);
legend('Na-22 slot 1','Na-22 slot 5','Na-22 slot 9');
xlabel('Voltage (V)');
ylabel('Counts');
title('^{22}Na Counts');
set(gca,'FontSize', 18);

figure
hold on
errorbar(v,x1/max(x1),err1/max(x1),'v');
errorbar(v,x2/max(x2),err2/max(x2),'d');
errorbar(v,x3/max(x3),err3/max(x3),'s');
errorbar(v,x4/max(x4),err4/max(x4),'^');
errorbar(v,x5/max(x5),err5/max(x5),'o');
errorbar(v,x6/max(x6),err6/max(x6),'p');
xlim([650 1050]);
legend('Ba-133 Slot 1','Ba-133 slot 5','Ba-133 slot 9','Na-22 slot 1','Na-22 slot 5','Na-22 slot 9');
xlabel('Voltage (V)');
ylabel('Counts');
title('Normalized Results of ^{133}Ba and ^{22}Ba');
set(gca,'FontSize', 18);

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
plot(t,y1,'r--','LineWidth',1);
legend('Data','Gaussian fit','Gaussian Aproximation');
xlabel('Counts');
ylabel('Density of Counts');
set(gca,'fontsize',17);

%% Inverse Square Law 

x = linspace(0,10,1000);
xx = [0 4 8];
x1 = mean(GC_Ba_133_Slot_1(:,3));
x2 = mean(GC_Ba_133_slot_5(:,3)); 
x3 = mean(GC_Ba_133_slot_9_redo(:,3));
x4 = mean(GC_Na_22_slot_1(:,3));
x5 = mean(GC_Na_22_slot_5(:,3));
x6 = mean(GC_Na_22_slot_9(:,3));
yba133 = [x1 x2 x3]./(10^3);
yna22 = [x4 x5 x6]./(10^3);
errba133 = sqrt(yba133);
errna22 = sqrt(yna22);
y = 1./x.^2;
y1 = 1./x;

figure
hold on
errorbar(xx,yba133,errba133,'.','markers',15);
errorbar(xx,yna22,errna22,'.','markers',15);
plot(x,y,'b-');
plot(x,y1,'r-');
ylim([0 5]);
xlim([-1 8]);
xlabel('Distance (slot position)');
ylabel('Average Number of Counts');
title('Distance Dependence');
legend('^{133}Ba','^{22}Na','1/r^{2}','1/r');
set(gca,'fontsize',18);
