d=-6;h=6;n=100;
[g1,x]=mexihat(d,h,n);
subplot(2,1,1);
plot(x,g1,'LineWidth',2);
xlabel('t');
title('Mexihat 时域');
g2=fft(g1);
g3=(abs(g2));
subplot(2,1,2);
plot(g3,'LineWidth',2);
xlabel('f');
title('Mexihat 频域');
%%离散傅里叶变换后需要经过低通后才能看到理想的波形