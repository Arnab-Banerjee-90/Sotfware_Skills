close all

% System Dynamics
A = [0 1 0 0; 
     0 -0.1818 2.673 0
     0 0 0 1;
     0 -0.4545 31.18 0];
B = [0; 
     1.818
     0
     4.545];
C = [1 0 0 0;
    0 0 1 0];
D = 0;

% Control Law
Q = C'*C;
Q(1,1) = 5000; % Penalize 1st state
Q(3,3) = 100;  %Penalize 3rd state
R = 1;    % Penalize actuator effort/input
K = lqr(A,B,Q,R);
K = [-8.9814  -12.8985   52.9171   10.3999];
% Closed loop system
sys = ss((A - B*K), B, C, D);

% Run response to step input
t = 0:0.01:5;
r =ones(size(t));
[y,t,x]=lsim(sys,r,t);
plot(t,y(:,1)); %plot the cart position
grid on;
hold on;
plot(t,y(:,end)); %plot the pendulum position (angle)


