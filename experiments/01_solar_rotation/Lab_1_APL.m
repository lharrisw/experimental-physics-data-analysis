%% Data

format long
A = [-58 -45 -32 -19 -10 8 24 35 44 61 74];
Aerr = [4 4 2 1 1 1 1 2 2 4 4];
B = [-62 -49 -36 -27 -9 6 17 26 44 57 70];
Berr = [3 2 1 1 1 1 1 1 1 2 3];
C = [-59 -46 -34 -21 -12 5 20 31 39 56 69];
Cerr = [2 2 1 1 1 1 1 1 1 2 3];

A1 = diff(A) + 1; % All differences have units of degrees per day
B1 = diff(B) + 1; % There is one less element for these three
C1 = diff(C) + 1; % Add one to each element; As Earth moves with the same motion of the sun, it appears as if the sun rotates slower

Aerr1 = [4*sqrt(2) 2*sqrt(5) sqrt(5) sqrt(2) sqrt(2) sqrt(2) sqrt(5) 2*sqrt(2) 2*sqrt(5) 4*sqrt(2)]; % The best approx. of true errors of the differences in days
Berr1 = [sqrt(13) sqrt(5) sqrt(2) sqrt(2) sqrt(2) sqrt(2) sqrt(2) sqrt(2) sqrt(5) sqrt(13)];
Cerr1 = [2*sqrt(2) sqrt(5) sqrt(2) sqrt(2) sqrt(2) sqrt(2) sqrt(2) sqrt(2) sqrt(5) sqrt(13)];

w1 = 1./((Aerr1).^2); % weights for weighted average
w2 = 1./((Berr1).^2);
w3 = 1./((Cerr1).^2);

A_avg = (A1*w1')/sum(w1); % weighted average of degrees/day
B_avg = (B1*w2')/sum(w2);
C_avg = (C1*w3')/sum(w3);

Asigma = 1/sqrt(sum(w1)); % the best approx. of true uncertainty of the average
Bsigma = 1/sqrt(sum(w2));
Csigma = 1/sqrt(sum(w3));

x = 360./[(A_avg - Asigma) A_avg (A_avg + Asigma)]; % The best measure including the uncertainty bounds
y = 360./[(B_avg - Bsigma) B_avg (B_avg + Bsigma)];
z = 360./[(C_avg - Csigma) C_avg (C_avg + Csigma)];

e1 = max(abs(diff(x))); % Compute difference between the best value and the upper bound
e2 = max(abs(diff(y))); % Then the difference between the best value and the lower bound
e3 = max(abs(diff(z))); % The maximum of the two will be taken as the uncertainty 
