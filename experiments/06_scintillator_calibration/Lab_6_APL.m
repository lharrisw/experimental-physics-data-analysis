%% Na-22 Fits

addpath('MATLAB Drive/Advanced Physics Lab');

load background.dat
load Co60.dat
load Na22.dat
load Cs137.dat

Na22_counts=Na22(:,2) - background(:,2);
Na22_channels=Na22(:,1);
errNacounts=sqrt(Na22_counts);

f1 = fit(Na22_channels,Na22_counts,'gauss1');

f2 = fit(Na22_channels,Na22_counts,'gauss1','start',[8000,80,20]);

% Montecarlo Gaussian Fit

n=5000;

A = randn(n,length(Na22_counts));
A = A.*errNacounts' + Na22_counts';

for ii = 1:n
    ff{ii} = fit(Na22_channels,A(ii,:)','gauss1');
    ff1{ii} = fit(Na22_channels,A(ii,:)','gauss1','start',[8000,870,20]);
end

for j = 1:n
    b(j) = ff{j}.b1;
    c(j) = ff1{j}.b1;
end

% figure
% hold on
% errorbar(Na22_channels,Na22_counts,errNacounts,errNacounts,'vertical','r.');
% plot(f1(Na22_channels),'b-','LineWidth',2);
% plot(f2(Na22_channels),'k-','LineWidth',2);
% xlim([0 1000]);
% xlabel('Channel Number');
% ylabel('Counts');
% legend('Data','Peak 1','Peak 2');
% title('Gaussian Fits of Na-22 Photopeaks');

%% Co-60 Fits

load background.dat
load Co60.dat

Co60_counts=Co60(:,2) - background(:,2);
Co60_channels=Co60(:,1);
errCocounts=sqrt(Co60_counts);

f1 = fit(Co60_channels(800:850),Co60_counts(Co60_channels(800:850)),'gauss1');

f2 = fit(Co60_channels(870:960),Co60_counts(Co60_channels(870:960)),'gauss1');

% Montecarlo Gaussian Fit

n=1000;

A = randn(n,length(Co60_counts(Co60_channels(800:850))));
A = A.*errCocounts(Co60_channels(800:850))' + Co60_counts(Co60_channels(800:850))';

A1 = randn(n,length(Co60_counts(Co60_channels(870:960))));
A1 = A1.*errCocounts(Co60_channels(870:960))' + Co60_counts(Co60_channels(870:960))';

for ii = 1:n
    ff{ii} = fit(Co60_channels(800:850),A(ii,:)','gauss1');
    ff1{ii} = fit(Co60_channels(870:960),A1(ii,:)','gauss1');
end

for j = 1:n
    b(j) = ff{j}.b1;
    c(j) = ff1{j}.b1;
end

% figure
% hold on
% errorbar(Co60_channels,Co60_counts,errCocounts,errCocounts,'vertical','r.');
% plot(f1(Co60_channels),'b-','LineWidth',2);
% plot(f2(Co60_channels),'k-','LineWidth',2);
% xlim([500 1200]);
% xlabel('Channel Number');
% ylabel('Counts');
% legend('Data','Peak 1','Peak 2');
% title('Gaussian Fits of Co-60 Photopeaks');

%% Cs-137 Fit

load background.dat
load Cs137.dat

Cs137_counts=Cs137(:,2) - background(:,2);
Cs137_channels=Cs137(:,1);
errCscounts=sqrt(Cs137_counts);

f1 = fit(Cs137_channels(490:540),Cs137_counts(Cs137_channels(490:540)),'gauss1');

% Montecarlo Gaussian Fit

n=1000;

A = randn(n,length(Cs137_counts(Cs137_channels(490:540))));
A = A.*errCscounts(Cs137_channels(490:540))' + Cs137_counts(Cs137_channels(490:540))';

for ii = 1:n
    ff{ii} = fit(Cs137_channels(490:540),A(ii,:)','gauss1');
end

for j = 1:n
    b(j) = ff{j}.b1;
end

% figure
% hold on
% errorbar(Cs137_channels,Cs137_counts,errCscounts,errCscounts,'vertical','r.');
% plot(f1(Cs137_channels),'b-','LineWidth',2);
% xlim([0 600]);
% xlabel('Channel Number');
% ylabel('Counts');
% legend('Data','Photopeak');
% title('Gaussian Fits of Cs-137 Photopeak');

%% Linear Fit

h = [.511000 .661657 1.173237 1.274530 1.332501];
v = [415.27 511.23 829.76 866.52 917.46];
errv = [0.01 0.03 0.04 0.04 0.03];
h1 = linspace(0,1.5);

p=polyfit(h,v,1);
y=polyval(p,h1);

[f,gof] = fit(h',v','poly1');

% Montecarlo Line Fit 
n=1000;
 
A = randn(n,5);
A = A.*errv + v;
 
p = zeros(n,2);
 
for ii = 1:n;
     p(ii,:) = polyfit(h,A(ii,:),1);
     hold on
     plot(h1,polyval(p(ii,:),h1),'-');
     errorbar(h,v,errv,errv,'vertical','o')
end


figure
hold on
plot(h1,y,'k-','linewidth',1.25);
errorbar(h(1),v(1),errv(1),errv(1),'vertical','bo','markerfacecolor','b','markeredgecolor','k','markersize',15);
errorbar(h(2),v(2),errv(2),errv(2),'vertical','r^','markerfacecolor','r','markeredgecolor','k','markersize',15);
errorbar(h(3),v(3),errv(3),errv(3),'vertical','kd','markerfacecolor','k','markeredgecolor','k','markersize',15);
errorbar(h(4),v(4),errv(4),errv(4),'vertical','bo','markerfacecolor','b','markeredgecolor','k','markersize',15);
errorbar(h(5),v(5),errv(5),errv(5),'vertical','kd','markerfacecolor','k','markeredgecolor','k','markersize',15); 
xlabel('Energy (MeV)');
ylabel('Channel Number');
legend('Line of Best Fit','Na^{22}','Cs^{137}','Co^{60}');
title('Scintillator Calibration Factor');
caption1 = sprintf('y = %fx + %f',mean(p(:,1)),mean(p(:,2)));
caption2 = sprintf('R^{2} = 0.9985');
text(0.1,980, caption1,'FontSize',16,'Color','k');
text(0.1,950, caption2,'fontsize',16,'color','k');
