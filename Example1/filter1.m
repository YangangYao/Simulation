%Fixed-time filter
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
x0  = [0.1;0];
str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)

alpha1=u(1);

k1=5;k2=10;k3=5;k4=10;h=1/2;h1=1.2;L=10;M=10;
sys(1)=x(2)-k1*sqrt(L)*(abs(x(1)-alpha1))^h*sign(x(1)-alpha1)-k2*sqrt(M)*(abs(x(1)-alpha1))^h1*sign(x(1)-alpha1);
sys(2)=-k3*L*abs(x(2)-sys(1))*sign(x(2)-sys(1))-k4*M*(abs(x(1)-alpha1))^(2*h1-1)*sign(x(1)-alpha1);


function sys=mdlOutputs(t,x,u)
sys(1)=x(1);
sys(2)=x(2);

