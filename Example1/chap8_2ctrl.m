%alpha2  and adaptive law theta2
function [sys,x0,str,ts]=s_function(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 1;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      =4;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0=4;
str=[];
ts=[-1 0];
function sys=mdlDerivatives(t,x,u)
x2_bar=u(2);
x1=u(3);
x2=u(1);
yr=sin(0.5*t);
kesi2=u(4);
epc=0.01;
S2=x2-x2_bar-kesi2;


xx=[x1;x2;yr];
hidden2=9;
d2=0.5*[-4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 3.5 4;
    -4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 3.5 4;
    -4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 3.5 4]

b2=1;
for i=1:hidden2
    kesi2(i)=exp(-((norm(xx-d2(:,i)))^2)/(b2^2));
end
fai2=kesi2';

eta2=1;a2=0.1;r2=30;c2=0.01;
sys=0.5*r2/(a2^2)*S2^6*(norm(fai2,2))^2-eta2*x-c2/r2*x^3;%adaptive law theta2



function sys=mdlOutputs(t,x,u)
x2_bar=u(2);
x1=u(3);
x2=u(1);
kesi2=u(4);
yr=sin(0.5*t);
epc=0.01;
S2=x2-x2_bar-kesi2;


xx=[x1;x2;yr];
hidden2=9;
d2=0.5*[-4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 3.5 4;
    -4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 3.5 4;
    -4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 3.5 4]

b2=1;
for i=1:hidden2
    kesi2(i)=exp(-((norm(xx-d2(:,i)))^2)/(b2^2));
end
fai2=kesi2';

th2=x;

K21=2;K22=2;a2=0.1;eps2=0.001;
x2_bar2=K21*(0.25)^0.75+K22*(0.25)^2*S2^5+0.5/(a2^2)*S2^3*th2*(norm(fai2,2))^2;
x2_bar=-S2^3*x2_bar2^2/sqrt(S2^6*x2_bar2^2+eps2^2); 
 %Control law alpha2

      


sys(1)=x2_bar; 
sys(2)=th2; 