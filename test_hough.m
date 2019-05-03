% ���Ի���任
clc
clear
close all
 
% ��ȡͼ��
I  = imread('test_1.jpg');
%rotI = imrotate(I,33,'crop'); % ��ת33�ȣ�����ԭͼƬ��С
%fig1 = imshow(I);
rotI=rgb2hsv(I);
% ��ȡ��
rotI=rotI(:,:,3);
BW = edge(rotI,'canny');
%figure, imshow(BW);
 
% ����任
[H,theta,rho] = hough(BW,'Theta',20:0.1:60); % �����ֵͼ��ı�׼����任��HΪ����任����theta,rhoΪ�������任�ĽǶȺͰ뾶ֵ
figure, imshow(imadjust(mat2gray(H)),[],'XData',theta,'YData',rho,...
    'InitialMagnification','fit');
xlabel('theta (degrees)'), ylabel('rho');
axis on, axis normal, hold on;
colormap(hot)
 
% ��ʾ����任�����еļ�ֵ��
P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:)))); % �ӻ���任����H����ȡ5����ֵ��
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'s','color','black');
 
% ��ԭͼ�е���
lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',7);
figure, imshow(rotI), hold on
max_len = 0;
for k = 1:length(lines)
    % ���Ƹ�����
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    
    % �����ߵ���㣨��ɫ�����յ㣨��ɫ��
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    
    % �����ߵĳ��ȣ�����߶�
    len = norm(lines(k).point1 - lines(k).point2);
    if ( len > max_len)
          max_len = len;
        xy_long = xy;
    end
end
 
  