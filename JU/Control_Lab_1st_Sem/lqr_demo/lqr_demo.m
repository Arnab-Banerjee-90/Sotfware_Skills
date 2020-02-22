close all
% Initial Conditions
x0 = [0;  
      0];

% System Dynamics
A = [0    1; 
     -2.3 -0.4];
B = [0; 
     1];
C = [1 0];
D = 0;

% Control Law
Q = [10 0;  % Penalize first state
     0 1]; % Penalize second state
R = 10;    % Penalize actuator effort/input
K = lqr(A,B,Q,R);

% Closed loop system
sys = ss((A - B*K), B, C, D);

% Run response to step input
t = 0:0.01:20;
r =ones(size(t));
[y]=lsim(sys,r,t);
c = size(t);
input_scale_factor = 1/y(c(2)); % scale the input to eliminate steady state error
r =input_scale_factor*ones(size(t));
[y,t,x]=lsim(sys,r,t);
plot(t,y);
grid on;


