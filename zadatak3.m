
w=-100:0.1:100;
T=0.1;
OMEGA=-4*pi:0.01:4*pi;
X_jw=1./(j*w-log(0.1))
X_ejw=1./(1-(0.1)^T*(exp(j*OMEGA)));

subplot(2,1,1)
plot(w,abs(X_jw))
title('Amplitudski spektar kontinualnog sig','FontWeight','bold')
subplot(2,1,2)
plot(OMEGA,abs(X_ejw))
title('Amplitudski spektar diskretnog sig')
