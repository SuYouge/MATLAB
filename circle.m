% ����1.jpg
% ����2.png
A = imread('����2.png');
I = imresize(A,[512,NaN]);
imshow(I);
% ȡ�Ҷ�
h = rgb2gray(I);
% figure;
imshow(h);%�Ҷ�ͼ��

% ȡ��
h = imcomplement(h);
% figure;
imshow(h);%ȡ��ͼ��

% �˲�����ֵ��
h = wiener2(h,[4,4]);%ά���˲�
bw = im2bw(h,graythresh(h));%��ֵ��

bw = bwmorph(bw,'open');%��̬ѧ�˲�
bw = bwmorph(bw,'thicken');%�Ӵ�����
% figure;
imshow(bw);

% %�������
% se = strel('disk',2);
% bw = imclose(bw,se);
% figure;imshow(bw);
% ��Բ
Rmin = 10; Rmax = 20;
[centersBright, radiiBright] = imfindcircles(bw,[Rmin Rmax],'ObjectPolarity','bright');
%[centersDark, radiiDark] = imfindcircles(bw,[Rmin Rmax],'ObjectPolarity','dark');
viscircles(centersBright, radiiBright,'EdgeColor','b');
hold on;
% �������
plot(centersBright(:,1),centersBright(:,2),'.','MarkerEdgeColor','r','MarkerSize',20);

% �����ݱ���Ϊ.mat��ʽ
x = centersBright(:,1);
y = centersBright(:,2);
save('border_1.mat','centersBright','x','y');
% ���������㷨
% ACATSP(centersBright,100,75,1,5,0.2,10);


