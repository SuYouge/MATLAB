%https://www.cnblogs.com/Ponys/p/3146753.html
clc;
clear;
I=imread('road2.jpg');
subplot(2,2,1);
imshow(I);
Ihsv=rgb2hsv(I); %ɫ�������Ͷȡ�������ȡ��
subplot(2,2,2);
imshow(Ihsv);
Ivl=Ihsv(:,:,3);                    %��ȡv�ռ�
% Ivl=Iv(100:end,:);              %��ȡ�°벿
subplot(2,2,3);
imshow(Ivl);

Iedge=edge(Ivl,'sobel');    %���ؼ��
subplot(2,2,4);
imshow(Iedge);
% Iedge = imdilate(Iedge,ones(3));%ͼ������

%�½����ڣ���ͼ��
figure (1)
imshow(Iedge);
hold on

%��ֱ�߼�������
%�õ�����ռ�
[H1,T1,R1] = hough(Iedge,'Theta',20:0.1:75);
% �����ֵͼ��BW���Ƕȷ�Χ�벽�������[-90, 90)��,���� H-����ռ䣬T-theta��R-p

% ��ֵ�� �������ռ�ͼ�ֵ���������ؼ�ֵ������
Peaks=houghpeaks(H1,5);

%�õ��߶���Ϣ ����lines��һ������ͼ�����߶���ĩ�㡢p��theta�Ľṹ��
lines=houghlines(Iedge,T1,R1,Peaks);

%�����߶�
 for k=1:length(lines)
    xy=[lines(k).point1;lines(k).point2];   
    plot(xy(:,1),xy(:,2),'LineWidth',4);
 end

 
 %�ҷ�ֱ�߼�������
[H2,T2,R2] = hough(Iedge,'Theta',-75:0.1:-20);

Peaks1=houghpeaks(H2,5);

lines1=houghlines(Iedge,T2,R2,Peaks1);

for k=1:length(lines1)
    xy1=[lines1(k).point1;lines1(k).point2];   
    plot(xy1(:,1),xy1(:,2),'LineWidth',4);
end

hold off