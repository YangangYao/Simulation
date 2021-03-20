%This code is derived from ¡°Event-Triggered Fixed-Time Adaptive Neural
%Dynamic Surface Control for Stochastic Non-Triangular Structure Nonlinear
%Systems¡±£¬written by Yangang Yao.
%Example1
function [sys,x0,str,ts] = spacemodel(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 2;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [0.2;0.1];
str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)

ut=u(1);
sys(1)=sin(x(2))*exp(-0.5*x(1))+(1+x(1)^2)*(x(2))^3+(1-cos(x(1)*pi/180))*randn;%systems
sys(2)=x(1)*x(2)^2+(3-cos(x(1)*x(2)*pi/180))*ut+x(1)*sin(x(2)*pi/180)*randn;



function sys=mdlOutputs(t,x,u)
sys(1)=x(1);
sys(2)=x(2);
