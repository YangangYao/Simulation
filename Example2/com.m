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
sizes.NumInputs      = 4;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [0;0;0];
str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)

a1=25;a2=0.1;a5=12;a6=0.1;a3=20;a4=0.1;
alpha1=u(1);
balpha1=u(2);
alpha2=u(3);
balpha2=u(4);
sys(1)=-a1*x(1)^3+x(2)+(balpha1-alpha1)-a2*sign(x(1));
sys(2)=-a3*x(2)^3+1/1.823*x(3)-x(1)+1/1.823*(balpha2-alpha2)-a4*sign(x(2));
sys(3)=-a5*x(3)^3-1/1.823*x(2)-a6*sign(x(3));

function sys=mdlOutputs(t,x,u)

sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);
