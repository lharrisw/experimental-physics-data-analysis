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
ylim([-1 40]);
xlim([-1 9]);
xlabel('Distance (slot position)');
ylabel('Average Number of Counts');
title('Distance Dependence');
legend('^{133}Ba','^{22}Na','1/r^{2}','1/r');
set(gca,'fontsize',18);
