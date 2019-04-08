%https://www.cnblogs.com/Ponys/p/3146753.html
clc;
clear;
I=imread('road2.jpg');
subplot(2,2,1);
imshow(I);
Ihsv=rgb2hsv(I); %色调、饱和度、明度提取法
subplot(2,2,2);
imshow(Ihsv);
Ivl=Ihsv(:,:,3);                    %提取v空间
% Ivl=Iv(100:end,:);              %截取下半部
subplot(2,2,3);
imshow(Ivl);

Iedge=edge(Ivl,'sobel');    %边沿检测
subplot(2,2,4);
imshow(Iedge);
% Iedge = imdilate(Iedge,ones(3));%图像膨胀

%新建窗口，绘图用
figure (1)
imshow(Iedge);
hold on

%左方直线检测与绘制
%得到霍夫空间
[H1,T1,R1] = hough(Iedge,'Theta',20:0.1:75);
% 输入二值图像BW，角度范围与步进（最大，[-90, 90)）,返回 H-霍夫空间，T-theta，R-p

% 求极值点 输入霍夫空间和极值数量，返回极值的坐标
Peaks=houghpeaks(H1,5);

%得到线段信息 返回lines是一个包含图像中线段首末点、p、theta的结构体
lines=houghlines(Iedge,T1,R1,Peaks);

%绘制线段
 for k=1:length(lines)
    xy=[lines(k).point1;lines(k).point2];   
    plot(xy(:,1),xy(:,2),'LineWidth',4);
 end

 
 %右方直线检测与绘制
[H2,T2,R2] = hough(Iedge,'Theta',-75:0.1:-20);

Peaks1=houghpeaks(H2,5);

lines1=houghlines(Iedge,T2,R2,Peaks1);

for k=1:length(lines1)
    xy1=[lines1(k).point1;lines1(k).point2];   
    plot(xy1(:,1),xy1(:,2),'LineWidth',4);
end

hold off