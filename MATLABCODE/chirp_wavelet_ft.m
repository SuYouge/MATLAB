clear;clc;
fs=1024;%����Ƶ��
t=0:1/fs:1;
s=chirp(t,50,1,100)+0.1*randn(1,length(t));%chirp�źż�һ������
%%%%%%%%%%%%%%%%%С��ʱƵͼ����
wavename='cmor3-3';%cmor3-3
totalscal=256;%�߶����еĳ��ȣ���scal�ĳ���
wcf=centfrq(wavename);%С��������Ƶ��
cparam=2*wcf*totalscal;%Ϊ�õ����ʵĳ߶�������Ĳ���
a=totalscal:-1:1;scal=cparam./a;%�õ������߶ȣ���ʹת���õ�Ƶ������Ϊ�Ȳ�����
coefs=cwt(s,scal,wavename);%�õ�С��ϵ��
f=scal2frq(scal,wavename,1/fs);%���߶�ת��ΪƵ��
imagesc(t,f,abs(coefs));%����ɫ��ͼ
colorbar;
xlabel('ʱ��t/s');
ylabel('Ƶ��f/Hz');
title('С��ʱƵͼ');