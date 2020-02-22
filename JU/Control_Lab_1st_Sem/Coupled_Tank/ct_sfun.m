function [sys,x0,str,ts] = ct_sfun(t,x,u,flag)

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
        sys = [-0.1*x(1)+0.1*x(2)+u 0.1*x(1)-0.3*x(2)];
    case 3, %Output
        sys = x(2);
    case {2 4 9},
        sys=[];
    otherwise
        error(['unhandled exeption =',num2str(flag)]);
end
