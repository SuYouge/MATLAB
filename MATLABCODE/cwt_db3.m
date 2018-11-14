%%cwt
t=0:0.01:1;
f=3*sin(100*pi*t)+2*sin(68*pi*t)+5*cos(72*pi*t)+randn(1,length(t));
coefs=cwt(f,[1:0.2:3],'db3','plot');
title('对不同的尺度小波变换系数值');
ylabel('尺度');
xlabel('时间');