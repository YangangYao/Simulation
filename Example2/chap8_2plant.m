%Example2 in ''Event-Triggered Fixed-Time Adaptive Neural Dynamic Surface
%Control for Stochastic Non-Triangular Structure Nonlinear Systems''. Courtesy of Yangang Yao
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
sizes.NumContStates  = 3;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [0;0;2];
str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)

ut=u(1);
sys(1)=x(2)+(1-cos(x(1)*pi/180))*randn;
sys(2)=1/1.823*x(3)-0.8402/1.823*sin(x(1)*pi/180)-0.0181/1.823*x(2)+(1-sin(x(1)*pi/180))*randn;%system
sys(3)=-0.9/0.025*x(2)-0.5/0.025*x(3)+1/0.025*ut+x(1)*sin(x(2)*pi/180)*randn;


function sys=mdlOutputs(t,x,u)
sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);
