clear;
i = imread('形状识别.png');
C = im2bw(i,0.52); %阈值
imshow(C);

y = C; 
[D,num] = bwlabel(y,8); %标记连通区域 4连通或8连通 空白区域被标记为0
a = max(max(D)); %连通区域个数 为 7 

[m,n] = size(y); %获取图像尺寸
d = zeros(1,a); %1行8列的零向量
%e(1) = 0;

% 求各个连通区域的面积 第一个元素为背景的面积
% for i = 1:m
%     for j = i:n
%         d(D(i,j)+1) = d(D(i,j)+1) + 1;
%     end
% end
STATS=regionprops(D, 'all');
for i=1 : num
d(i)=STATS(i).Area; %计算各区域的面积。
end

f = zeros(1,a); %1行8列的零向量

%过滤连通区域
for i = 1:num
    f(i) = d(i)>0.001*m*n; %滤波
end

%标记待处理的区域
f2 = find(f==1);
g = length(f2);
f1 = f2;
figure(2);

for i = 1:g
    [r1,c1] = find(D==f1(i));
    BW1 = bwselect(D,c1,r1,8); %在二进制图像中选择指定坐标点所在的对象
    SE = ones(2,4);
    E1 = imdilate(BW1,SE); %膨胀
    F1 = bwarea(E1); %计算对象总面积
    G1 = bwperim(E1,4); %查找边缘
    H1 = bwarea(G1); %周长
    e(i) = 4*pi*F1/H1^2; %HEYWOOD系数 粒子周长/等面积圆的周长 平方后取倒数即为e
        if (0.8927<e(i) && e(i)<1.1073)
            subplot(4,3,i)
            imshow(~E1);
            title('圆形');
        else if (0.73<e(i) && e(i)<=0.8927)
            subplot(4,3,i)
            imshow(~E1);
            title('方形');
        else if (e(i)<=0.73)
            subplot(4,3,i)
            imshow(~E1);
            title('三角形');
            end;
            end;
        end;
end
   
