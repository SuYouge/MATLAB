%%cwt
t=0:0.01:1;
f=3*sin(100*pi*t)+2*sin(68*pi*t)+5*cos(72*pi*t)+randn(1,length(t));
coefs=cwt(f,[1:0.2:3],'db3','plot');
title('�Բ�ͬ�ĳ߶�С���任ϵ��ֵ');
ylabel('�߶�');
xlabel('ʱ��');