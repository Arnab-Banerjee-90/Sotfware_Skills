function [sys,x0,str,ts] = inv_cart_pend_sfun(t,x,u,flag)

switch flag,

    case 0, %Initialization
        str = [];
        ts = [0 0];
        s = simsizes;
        s.NumContStates = 4 ;
        s.NumDiscStates = 0 ;
        s.NumOutputs = 2 ;
        s.NumInputs = 1 ;
        s.DirFeedthrough = 0 ;
        s.NumSampleTimes = 1 ;
        sys = simsizes(s);
        x0 = [0 0 0.8 0];
    case 1, %State Derivatives
        sys = [x(2) -0.1818*x(2)+2.673*x(3)+1.818*u x(4) -0.4545*x(2)+31.18*x(3)+4.545*u];
    case 3, %Output
        sys = [x(1) x(3)];
    case {2 4 9},
        sys=[];
    otherwise
        error(['unhandled exeption =',num2str(flag)]);
end
