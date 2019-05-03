clc;
clear;
peaks_num = 5;
bias_all = 700;
bias = 0;
I=imread('test_1.jpg');
Ihsv=rgb2hsv(I); %ɫ�������Ͷȡ�������ȡ��
Iv=Ihsv(:,:,2);                    %��ȡ���Ͷȿռ�
Ivl = Iv(:, :, :);
Iedge=edge(Ivl,'Canny');    %���ؼ��
% Iedge = imdilate(Iedge,ones(5)); %����
% %��̬ѧ �˲� ��� ���������˿���
% Iedge = imfilter(Iedge, fspecial('gaussian',10,15), 'replicate', 'conv');
% Iedge = bwfill(Iedge, 'holes');
% SE = strel('square', 40);
% Iedge = imopen(Iedge, SE);
%�½����ڣ���ͼ��
figure (1)
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imshow(Ihsv);
subplot(2,2,3);
imshow(Ivl);
subplot(2,2,4);
imshow(Iedge);    
figure (2)
imshow(Iedge);
hold on
%��ֱ�߼�������
%�õ�����ռ�
[H1,T1,R1] = hough(Iedge,'Theta',20:0.1:60);
% �����ֵͼ��BW���Ƕȷ�Χ�벽�������[-90, 90)��,���� H-����ռ䣬T-theta��R-p
% ��ֵ�� �������ռ�ͼ�ֵ���������ؼ�ֵ������
Peaks1=houghpeaks(H1,peaks_num,'threshold',ceil(0.3*max(H1(:))));
%�õ��߶���Ϣ ����lines��һ������ͼ�����߶���ĩ�㡢p��theta�Ľṹ��
lines=houghlines(Iedge,T1,R1,Peaks1,'FillGap',50,'MinLength',7);
%�����߶�
 for k=1:length(lines)
    xy=[lines(k).point1;lines(k).point2];
    plot(xy(:,1),xy(:,2)+bias,'LineWidth',2,'Color','r');
 end
 %�ҷ�ֱ�߼�������
[H2,T2,R2] = hough(Iedge,'Theta',-60:0.1:-20);
Peaks2=houghpeaks(H2,peaks_num,'threshold',ceil(0.3*max(H2(:))));
lines2=houghlines(Iedge,T2,R2,Peaks2,'FillGap',50,'MinLength',7);
for k=1:length(lines2)
    xy1=[lines2(k).point1;lines2(k).point2];   
    plot(xy1(:,1),xy1(:,2)+bias,'LineWidth',2,'Color','b');
end
hold off