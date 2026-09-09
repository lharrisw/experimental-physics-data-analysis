%% Silver ID

load SilverSpectrum.dat;
load background.dat;

Silver_counts=SilverSpectrum(:,2) - background(:,2);
Silver_channels=SilverSpectrum(:,1);
errSilvcounts=sqrt(Silver_counts);

f1 = fit(Silver_channels(63:85),Silver_counts(Silver_channels(63:85)),'gauss1');

f2 = fit(Silver_channels(460:520),Silver_counts(Silver_channels(460:520)),'gauss1');

f3 = fit(Silver_channels(600:650),Silver_counts(Silver_channels(600:650)),'gauss1');

% % Montecarlo Gaussian Fit
 
n=1000;
 
A = randn(n,length(Silver_counts(Silver_channels(63:85))));
A = A.*errSilvcounts(Silver_channels(63:85))' + Silver_counts(Silver_channels(63:85))';
 
A1 = randn(n,length(Silver_counts(Silver_channels(460:520))));
A1 = A1.*errSilvcounts(Silver_channels(460:520))' + Silver_counts(Silver_channels(460:520))';

A2 = randn(n,length(Silver_counts(Silver_channels(600:650))));
A2 = A2.*errSilvcounts(Silver_channels(600:650))' + Silver_counts(Silver_channels(600:650))';

for ii = 1:n
    ff{ii} = fit(Silver_channels(63:85),A(ii,:)','gauss1');
    ff1{ii} = fit(Silver_channels(460:520),A1(ii,:)','gauss1');
    ff2{ii} = fit(Silver_channels(600:650),A2(ii,:)','gauss1');
end

for j = 1:n
    b(j) = ff{j}.b1;
    c(j) = ff1{j}.b1;
    d(j) = ff2{j}.b1;
end

figure
hold on
errorbar(Silver_channels,Silver_counts,errSilvcounts,errSilvcounts,'vertical','r.');
plot(f1(Silver_channels),'b-','LineWidth',2);
plot(f2(Silver_channels),'k-','LineWidth',2);
plot(f3(Silver_channels),'g-','LineWidth',2);
xlim([0 1000]);
xlabel('Channel Number');
ylabel('Counts');
legend('Data','Peak 1','Peak 2','Peak 3');
title('Gaussian Fits of Silver Photopeaks');

% %% Mystery Disk
% 
% load background.dat;
% load MysteryDisk.dat;
% 
% Disk_counts=MysteryDisk(:,2) - background(:,2);
% Disk_channels=MysteryDisk(:,1);
% errDiskcounts=sqrt(Disk_counts);
% 
% f1 = fit(Disk_channels(490:540),Disk_counts(Disk_channels(490:540)),'gauss1');
% 
% % n=1000;
% %  
% % A = randn(n,length(Disk_counts(Disk_channels(490:540))));
% % A = A.*errDiskcounts(Disk_channels(490:540))' + Disk_counts(Disk_channels(490:540))';
% % 
% % for ii = 1:n
% %     ff{ii} = fit(Disk_channels(490:540),A(ii,:)','gauss1');
% % end
% % 
% % for j = 1:n
% %     b(j) = ff{j}.b1;
% % end
% 
% figure
% hold on
% errorbar(Disk_channels,Disk_counts,errDiskcounts,errDiskcounts,'vertical','r.');
% plot(f1(Disk_channels),'b-','LineWidth',2);
% xlim([0 1000]);
% xlabel('Channel Number');
% ylabel('Counts');
% legend('Data','Peak 1');
% title('Mystery Disk');

%% Mystery Stick

load background.dat;
load MysteryStick.dat;

Stick_counts=MysteryStick(:,2) - background(:,2);
Stick_channels=MysteryStick(:,1);
errStickcounts=sqrt(Stick_counts);

f1 = fit(Stick_channels(490:566),Stick_counts(Stick_channels(490:566)),'gauss1');

n=5000;
  
A = randn(n,length(Stick_counts(Stick_channels(490:566))));
A = A.*errStickcounts(Stick_channels(490:566))' + Stick_counts(Stick_channels(490:566))';
 
for ii = 1:n
    ff{ii} = fit(Stick_channels(490:566),A(ii,:)','gauss1');
end

for j = 1:n
    b(j) = ff{j}.b1;
end

figure
hold on
errorbar(Stick_channels,Stick_counts,errStickcounts,errStickcounts,'vertical','r.');
plot(f1(Stick_channels),'b-','LineWidth',2);
xlim([0 1000]);
xlabel('Channel Number');
ylabel('Counts');
legend('Data','Peak 1');
title('Mystery Stick');

%% Banana Data

load bananabck.dat;
load banana.dat;

banana_counts=banana(:,2)-bananabck(:,2);
banana_channels=banana(:,1);
errbananacounts=sqrt(banana_counts);

f1 = fit(banana_channels(3560:4060),banana_counts(banana_channels(3560:4060)),'gauss1');

n=5000;
  
A = randn(n,length(banana_counts(banana_channels(3560:4060))));
A = A.*errbananacounts(banana_channels(3560:4060))' + banana_counts(banana_channels(3560:4060))';
 
for ii = 1:n
    ff{ii} = fit(banana_channels(3560:4060),A(ii,:)','gauss1');
end

for j = 1:n
    b(j) = ff{j}.b1;
end

figure
hold on
errorbar(banana_channels,banana_counts,errbananacounts,errbananacounts,'vertical','r.');
plot(f1(banana_channels),'b-','LineWidth',2);
xlim([1000 4300]);
ylim([0 1000]);
xlabel('Channel Number');
ylabel('Counts');
legend('Data');
title('Banana Data');
set(gca,'fontsize',30);
