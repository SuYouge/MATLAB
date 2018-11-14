%chirp信号绘制并画出尺度——时间关系
fs=1024;%采样频率
t=0:1/fs:1;
%t = 0:0.001:1;            % 2 secs @ 1kHz sample rate
y = chirp(t,50,1,100)+0.1*randn(1,length(t));     % Start @ DC, 添加噪声信号
figure(1);
% plot(t,y)
% figure(2);
coefs=cwt(y,(1:0.2:10),'cmor3-3','plot');
% title('对不同的尺度小波变换系数值');
% ylabel('尺度');
% xlabel('时间');