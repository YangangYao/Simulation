      function [sys,x0,str,ts] = sfuntmpl(t,x,u,flag)


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

sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;  
sys = simsizes(sizes);

x0=[ ];

str = [];

ts  = [0 0];


 function sys=mdlDerivatives(t,x,u)

sys=0;


function sys=mdlOutputs(t,x,u)

  
wt=u(2);
ut=u(1);
   
     if  t>=0 && abs(ut-wt)>=0.5*ut+0.5
         sys(1)=2;
     else
         sys(1)=0;
     end
     
     
  











 

  




















