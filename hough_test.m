clc;
clear;
peaks_num = 5;
bias_all = 700;
bias = 0;
I=imread('test_1.jpg');
Ihsv=rgb2hsv(I); %色调、饱和度、明度提取法
Iv=Ihsv(:,:,2);                    %提取饱和度空间
Ivl = Iv(:, :, :);
Iedge=edge(Ivl,'Canny');    %边沿检测
% Iedge = imdilate(Iedge,ones(5)); %膨胀
% %形态学 滤波 填孔 开操作过滤颗粒
% Iedge = imfilter(Iedge, fspecial('gaussian',10,15), 'replicate', 'conv');
% Iedge = bwfill(Iedge, 'holes');
% SE = strel('square', 40);
% Iedge = imopen(Iedge, SE);
%新建窗口，绘图用
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
%左方直线检测与绘制
%得到霍夫空间
[H1,T1,R1] = hough(Iedge,'Theta',20:0.1:60);
% 输入二值图像BW，角度范围与步进（最大，[-90, 90)）,返回 H-霍夫空间，T-theta，R-p
% 求极值点 输入霍夫空间和极值数量，返回极值的坐标
Peaks1=houghpeaks(H1,peaks_num,'threshold',ceil(0.3*max(H1(:))));
%得到线段信息 返回lines是一个包含图像中线段首末点、p、theta的结构体
lines=houghlines(Iedge,T1,R1,Peaks1,'FillGap',50,'MinLength',7);
%绘制线段
 for k=1:length(lines)
    xy=[lines(k).point1;lines(k).point2];
    plot(xy(:,1),xy(:,2)+bias,'LineWidth',2,'Color','r');
 end
 %右方直线检测与绘制
[H2,T2,R2] = hough(Iedge,'Theta',-60:0.1:-20);
Peaks2=houghpeaks(H2,peaks_num,'threshold',ceil(0.3*max(H2(:))));
lines2=houghlines(Iedge,T2,R2,Peaks2,'FillGap',50,'MinLength',7);
for k=1:length(lines2)
    xy1=[lines2(k).point1;lines2(k).point2];   
    plot(xy1(:,1),xy1(:,2)+bias,'LineWidth',2,'Color','b');
end
hold off