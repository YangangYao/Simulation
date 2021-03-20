close all;

figure(1);
plot(t,y(:,2),t,y(:,1),'linewidth',2);
xlabel('time (sec)');ylabel('{\ity} and {\ity}_r');
axis([0 80 -5 5])
legend('yr','y');

figure(2);
plot(t,y(:,2)-y(:,1));
xlabel('Time (sec)');ylabel('{\itz}_1');
legend('{\itz}_1');
axis([0 80 -0.5 0.5])

figure(3);
plot(t,x2(:,1));
xlabel('Time (sec)');ylabel('{\itx}_2');
axis([0 80 -5 5])
legend('{\itx}_2');

figure(4);
plot(t,th1_b(:,1),'r',t,th2_b(:,1),'b');
xlabel('Time (sec)');ylabel('$\hat{\theta}_1,\hat{\theta}_2$','Interpreter','latex');
h=legend('$\hat{\theta}_1$', '$\hat{\theta}_2$');
set(h,'Interpreter','latex')
axis([0 80 -2 40])   

figure(5);
plot(t,wt(:,1),'r',t,ut(:,1),'b','linewidth',2);
xlabel('Time (sec)');ylabel('$u(t),\beta(t)$','Interpreter','latex');
legend('u','\beta(t)');
axis([0 80 -60 80]);






