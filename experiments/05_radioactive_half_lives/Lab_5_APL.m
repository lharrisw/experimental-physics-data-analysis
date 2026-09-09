%% Trial 1 Silver

% LOAD AND EXTRACT DATA POINTS
load Trial_1_Ag.dat
chan=Trial_1_Ag(:,1)*4;
data=Trial_1_Ag(:,3);
errordata = sqrt(data);

y = @(b,x) b(1).*exp(-b(2).*x) + b(3).*exp(-b(4).*x) + b(5);
x  = chan;
yx = data;
OLS = @(b) sum((y(b,x) - yx).^2);           % Ordinary Least Squares cost function
opts = optimset('MaxFunEvals',50000, 'MaxIter',10000);
B = fminsearch(OLS,[365; 0.028; 98; 0.0047; 4], opts);       % Use ‘fminsearch’ to minimise the ‘OLS’ function
fcnfit = y(B,x);   % Calculate function with estimated parameters

figure
hold on
errorbar(x,yx,errordata,errordata,'vertical','b.','markersize',5)
plot(x, fcnfit,'-r','linewidth',2)
title('Trial 1 Silver');
legend('Data','Fit');
xlabel('Time (s)');
ylabel('Counts');

%% Trial 2 Silver 

% LOAD AND EXTRACT DATA POINTS
load Trial_2_Ag.dat
chan=Trial_2_Ag(:,1)*4;
data=Trial_2_Ag(:,3);
errordata = sqrt(data);

y = @(b,x) b(1).*exp(-b(2).*x) + b(3).*exp(-b(4).*x) + b(5);
x  = chan;
yx = data;
OLS = @(b) sum((y(b,x) - yx).^2);           % Ordinary Least Squares cost function
opts = optimset('MaxFunEvals',50000, 'MaxIter',10000);
B = fminsearch(OLS,[450; 0.028; 100; 0.0047; 15], opts);       % Use ‘fminsearch’ to minimise the ‘OLS’ function
fcnfit = y(B,x);  % Calculate function with estimated parameters

figure
hold on
errorbar(x,yx,errordata,errordata,'vertical','b.','markersize',5);
plot(x, fcnfit,'-r','linewidth',2);
title('Trial 2 Silver');
legend('Data','Fit');
xlabel('Time (s)');
ylabel('Counts');


%% Trial 3 Silver 

% LOAD AND EXTRACT DATA POINTS
load Trial_3_Ag.dat
chan=Trial_3_Ag(:,1)*4;
data=Trial_3_Ag(:,3);

y = @(b,x) b(1).*exp(-b(2).*x) + b(3).*exp(-b(4).*x) + b(5);
x  = chan;
yx = data;
OLS = @(b) sum((y(b,x) - yx).^2);           % Ordinary Least Squares cost function
opts = optimset('MaxFunEvals',50000, 'MaxIter',10000);
B = fminsearch(OLS,[100; 0.028; 15; 0.0047; 5], opts);       % Use ‘fminsearch’ to minimise the ‘OLS’ function
fcnfit = y(B,x);                      % Calculate function with estimated parameters

figure
hold on
errorbar(x,yx,errordata,errordata,'vertical','b.','markersize',5);
plot(x, fcnfit,'-r','linewidth',2);
title('Trial 3 Silver');
legend('Fit','Data');
xlabel('Time (s)');
ylabel('Counts');


%% Trial 4 Silver 

% LOAD AND EXTRACT DATA POINTS
load Trial_4_Ag.dat
chan=Trial_4_Ag(:,1)*4;
data=Trial_4_Ag(:,3);

y = @(b,x) b(1).*exp(-b(2).*x) + b(3).*exp(-b(4).*x) + b(5);
x  = chan;
yx = data;
OLS = @(b) sum((y(b,x) - yx).^2);           % Ordinary Least Squares cost function
opts = optimset('MaxFunEvals',50000, 'MaxIter',10000);
B = fminsearch(OLS,[80; 0.01; 10; 0.004; 5], opts);       % Use ‘fminsearch’ to minimise the ‘OLS’ function
fcnfit = y(B,x);                            % Calculate function with estimated parameters
figure(1)
plot(x, yx,'b.','markersize',10)
hold on
plot(x, fcnfit,'-r','linewidth',2)
hold off

%% Trial 1 Indium

% LOAD AND EXTRACT DATA POINTS
load Indium1.dat
chan=Indium1(:,1)*4;
data=Indium1(:,3);
errordata = sqrt(data);

y = @(b,x) b(1).*exp(-b(2).*x) + b(3);
x  = chan;
yx = data;
OLS = @(b) sum((y(b,x) - yx).^2);           % Ordinary Least Squares cost function
opts = optimset('MaxFunEvals',50000, 'MaxIter',10000);
B = fminsearch(OLS,[320; 0.0002;10], opts);       % Use ‘fminsearch’ to minimise the ‘OLS’ function
fcnfit = y(B,x);                      % Calculate function with estimated parameters

figure
hold on
errorbar(x,yx,errordata,errordata,'vertical','b.','markersize',5);
plot(x, fcnfit,'-r','linewidth',2);
title('Trial 1 Indium');
legend('Data','Fit');
xlabel('Time (s)');
ylabel('Counts');
xlim([-500 17000]);

%% Trial 2 Indium

% LOAD AND EXTRACT DATA POINTS
load Indium2.dat
chan=Indium2(:,1)*4;
data=Indium2(:,3);
errordata = sqrt(data);

y = @(b,x) b(1).*exp(-b(2).*x) + b(3);
x  = chan;
yx = data;
OLS = @(b) sum((y(b,x) - yx).^2);           % Ordinary Least Squares cost function
opts = optimset('MaxFunEvals',50000, 'MaxIter',10000);
B = fminsearch(OLS,[320; 0.0002;10], opts);       % Use ‘fminsearch’ to minimise the ‘OLS’ function
fcnfit = y(B,x);                      % Calculate function with estimated parameters

figure
hold on
errorbar(x,yx,errordata,errordata,'vertical','b.','markersize',5);
plot(x, fcnfit,'-r','linewidth',2);
title('Trial 1 Indium');
legend('Data','Fit');
xlabel('Time (s)');
ylabel('Counts');
xlim([-500 17000]);

%% Indium Stuffs

% LOAD AND EXTRACT DATA POINTS
load Indium1.dat
chan=Indium1(:,1)*4;
data=Indium1(:,3);
errordata = sqrt(data);
logdata = log(data);
chan1 = linspace(0,20000,1000000);

A = randn(100,4241);
A = A.*errordata' + logdata';

p = zeros(100,2);

for i = 1:length(A);
    p(i,:) = polyfit(chan',A(i,:),1);
    hold on
    plot(chan1,polyval(p(i,:),chan1),'-');
    errorbar(chan,logdata,errordata,errordata,'vertical','o')
end
