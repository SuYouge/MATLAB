%chirp�źŻ��Ʋ������߶ȡ���ʱ���ϵ
fs=1024;%����Ƶ��
t=0:1/fs:1;
%t = 0:0.001:1;            % 2 secs @ 1kHz sample rate
y = chirp(t,50,1,100)+0.1*randn(1,length(t));     % Start @ DC, ��������ź�
figure(1);
% plot(t,y)
% figure(2);
coefs=cwt(y,(1:0.2:10),'cmor3-3','plot');
% title('�Բ�ͬ�ĳ߶�С���任ϵ��ֵ');
% ylabel('�߶�');
% xlabel('ʱ��');