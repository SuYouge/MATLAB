% 油箱1.jpg
% 油箱2.png
A = imread('油箱2.png');
I = imresize(A,[512,NaN]);
imshow(I);
% 取灰度
h = rgb2gray(I);
% figure;
imshow(h);%灰度图像

% 取反
h = imcomplement(h);
% figure;
imshow(h);%取反图像

% 滤波、二值化
h = wiener2(h,[4,4]);%维纳滤波
bw = im2bw(h,graythresh(h));%二值化

bw = bwmorph(bw,'open');%形态学滤波
bw = bwmorph(bw,'thicken');%加粗轮廓
% figure;
imshow(bw);

% %消除噪点
% se = strel('disk',2);
% bw = imclose(bw,se);
% figure;imshow(bw);
% 找圆
Rmin = 10; Rmax = 20;
[centersBright, radiiBright] = imfindcircles(bw,[Rmin Rmax],'ObjectPolarity','bright');
%[centersDark, radiiDark] = imfindcircles(bw,[Rmin Rmax],'ObjectPolarity','dark');
viscircles(centersBright, radiiBright,'EdgeColor','b');
hold on;
% 标记坐标
plot(centersBright(:,1),centersBright(:,2),'.','MarkerEdgeColor','r','MarkerSize',20);

% 将数据保存为.mat格式
x = centersBright(:,1);
y = centersBright(:,2);
save('border_1.mat','centersBright','x','y');
% 调用蚂蚁算法
% ACATSP(centersBright,100,75,1,5,0.2,10);


