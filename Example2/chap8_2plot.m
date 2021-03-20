close all;

figure(1);
plot(t,y(:,2),t,y(:,1),'linewidth',2);
xlabel('time (sec)');ylabel('{\ity} and {\ity}_r');
axis([0 80 -5 5])
legend('yr', 'y');


figure(2);
plot(t,y(:,2)-y(:,1),'r');
xlabel('Time (sec)');ylabel('{\itz}_1');
legend('{\itz}_1');
axis([0 80 -0.5 0.5])

figure(3);
subplot(211);
plot(t,x2(:,1));
xlabel('Time (sec)');ylabel('{\itx}_2');
axis([0 80 -5 5])
legend('{\itx}_2');
subplot(212);
plot(t,x3(:,1),'r','linewidth',2);
xlabel('Time (sec)');ylabel('{\itx}_3 ');
axis([0 80 -50 80])
legend('{\itx}_3'); 

figure(4);
plot(t,th1_b(:,1),t,th2_b(:,1),t,th3_b(:,1));
xlabel('Time (sec)');ylabel('$\hat{\theta}_1,\hat{\theta}_2,\hat{\theta}_3$','Interpreter','latex');
h=legend('$\hat{\theta}_1$', '$\hat{\theta}_2$', '$\hat{\theta}_3$');
set(h,'Interpreter','latex')
axis([0 80 -2 40]) 

figure(5);
plot(t,ut(:,1),'linewidth',2);
xlabel('Time (sec)');ylabel('u');
legend('u');
axis([0 80 -100 100]);












