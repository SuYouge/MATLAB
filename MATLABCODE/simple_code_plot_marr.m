d=-6;h=6;n=100;
[g1,x]=mexihat(d,h,n);
subplot(2,1,1);
plot(x,g1,'LineWidth',2);
xlabel('t');
title('Mexihat ʱ��');
g2=fft(g1);
g3=(abs(g2));
subplot(2,1,2);
plot(g3,'LineWidth',2);
xlabel('f');
title('Mexihat Ƶ��');
%%��ɢ����Ҷ�任����Ҫ������ͨ����ܿ�������Ĳ���