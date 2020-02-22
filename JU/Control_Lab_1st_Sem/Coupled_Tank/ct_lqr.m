close all
% Initial Conditions
x0 = [0;  
      0];

% System Dynamics
A = [-0.1    0.1; 
     0.1 -0.3];
B = [1; 
     0];
C = [0 1];
D = 0;

% Control Law
Q = [1 0;  % Penalize first state
     0 1]; % Penalize second state
R = 0.01;    % Penalize actuator effort/input
K = lqr(A,B,Q,R);

% Closed loop system
sys = ss((A - B*K), B, C, D);
sys_uncmp = ss(A,B,C,D);
% Run response to step input
t = 0:0.01:70;
r =ones(size(t));
[y]=lsim(sys_uncmp,r,t);
plot(t,y);
hold on;
[y]=lsim(sys,r,t);
c = size(t);
input_scale_factor = 1/y(c(2)); % scale the input to eliminate steady state error
r =input_scale_factor*ones(size(t));
[y,t,x]=lsim(sys,r,t);
plot(t,y);
grid on;


