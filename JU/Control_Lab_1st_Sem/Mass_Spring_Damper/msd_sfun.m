function [sys,x0,str,ts] = msd_sfun(t,x,u,flag)

switch flag,

    case 0, %Initialization
        str = [];
        ts = [0 0];
        s = simsizes;
        s.NumContStates = 2 ;
        s.NumDiscStates = 0 ;
        s.NumOutputs = 1 ;
        s.NumInputs = 1 ;
        s.DirFeedthrough = 0 ;
        s.NumSampleTimes = 1 ;
        sys = simsizes(s);
        x0 = [0 0];
    case 1, %State Derivatives
        sys = [x(2) -2.3*x(1)-0.4*x(2)+u];
    case 3, %Output
        sys = x(1);
    case {2 4 9},
        sys=[];
    otherwise
        error(['unhandled exeption =',num2str(flag)]);
end
