% 测试霍夫变换
clc
clear
close all
 
% 读取图像
I  = imread('test_1.jpg');
%rotI = imrotate(I,33,'crop'); % 旋转33度，保持原图片大小
%fig1 = imshow(I);
rotI=rgb2hsv(I);
% 提取边
rotI=rotI(:,:,3);
BW = edge(rotI,'canny');
%figure, imshow(BW);
 
% 霍夫变换
[H,theta,rho] = hough(BW,'Theta',20:0.1:60); % 计算二值图像的标准霍夫变换，H为霍夫变换矩阵，theta,rho为计算霍夫变换的角度和半径值
figure, imshow(imadjust(mat2gray(H)),[],'XData',theta,'YData',rho,...
    'InitialMagnification','fit');
xlabel('theta (degrees)'), ylabel('rho');
axis on, axis normal, hold on;
colormap(hot)
 
% 显示霍夫变换矩阵中的极值点
P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:)))); % 从霍夫变换矩阵H中提取5个极值点
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'s','color','black');
 
% 找原图中的线
lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',7);
figure, imshow(rotI), hold on
max_len = 0;
for k = 1:length(lines)
    % 绘制各条线
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    
    % 绘制线的起点（黄色）、终点（红色）
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    
    % 计算线的长度，找最长线段
    len = norm(lines(k).point1 - lines(k).point2);
    if ( len > max_len)
          max_len = len;
        xy_long = xy;
    end
end
 
  