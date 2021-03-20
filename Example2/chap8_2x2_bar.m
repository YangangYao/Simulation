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
global hidden1 c1 ;
sizes = simsizes;
sizes.NumContStates  =1;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      =3;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0=3;
str=[];
ts=[-1 0];
hidden1=9;
function sys=mdlDerivatives(t,x,u)
global hidden1 a1
dx1d=0.5*cos(0.5*t)+0.5*cos(t);
x1=u(1);
x2=u(2);
kesi1=u(3);
x1d=sin(0.5*t)+0.5*sin(t);
S1=x1-x1d-kesi1;
epc=0.01;

xxx=[x1;x1d];

d1=0.5*[-4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 3.5 4;
    -4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 3.5 4
    ]

for i=1:hidden1
    kexi1(i)=exp(-((norm(xxx-0.5*d1(:,i)))^2));
end
fai1=kexi1';



eta1=1;a1=0.1;r1=10;c1=0.01;
sys=0.5*r1/(a1^2)*S1^6*(norm(fai1,2))^2-eta1*x-c1/r1*x^3;



function sys=mdlOutputs(t,x,u)
global hidden1 c1 ;
dx1d=0.5*cos(0.5*t)+0.5*cos(t);
x1=u(1);
x2=u(2);
x1d=sin(0.5*t)+0.5*sin(t);
kesi1=u(3);
S1=x1-x1d-kesi1;


epc=0.01;

xxx=[x1;x1d];

d1=0.5*[-4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 3.5 4;
    -4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 3.5 4;
    ]


for i=1:hidden1
    kexi1(i)=exp(-((norm(xxx-0.5*d1(:,i)))^2));
end
fai1=kexi1';
th1=x;

K11=6;K12=6;a1=0.1;eps1=0.001;
x2_bar1=K11*(0.25)^0.75+K12*(0.25)^2*S1^5+0.5/(a1^2)*S1^3*th1*(norm(fai1,2))^2;
x2_bar=-S1^3*x2_bar1^2/(0.5*sqrt(S1^6*x2_bar1^2+eps1^2)); 
sys(1)=x2_bar;   %x2_bar
sys(2)=th1;%to approximate th1


