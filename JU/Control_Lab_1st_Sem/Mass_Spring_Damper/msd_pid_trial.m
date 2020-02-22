s=tf('s');
usys = 1/(s^2+0.4*s+2.3);
comp = ((s+10)*(s+0.01))/s;
rlocus(usys*comp)
sgrid(0.4559,0)
step(feedback(16*usys*comp,1))
