clear;
i = imread('��״ʶ��.png');
C = im2bw(i,0.52); %��ֵ
imshow(C);

y = C; 
[D,num] = bwlabel(y,8); %�����ͨ���� 4��ͨ��8��ͨ �հ����򱻱��Ϊ0
a = max(max(D)); %��ͨ������� Ϊ 7 

[m,n] = size(y); %��ȡͼ��ߴ�
d = zeros(1,a); %1��8�е�������
%e(1) = 0;

% �������ͨ�������� ��һ��Ԫ��Ϊ���������
% for i = 1:m
%     for j = i:n
%         d(D(i,j)+1) = d(D(i,j)+1) + 1;
%     end
% end
STATS=regionprops(D, 'all');
for i=1 : num
d(i)=STATS(i).Area; %���������������
end

f = zeros(1,a); %1��8�е�������

%������ͨ����
for i = 1:num
    f(i) = d(i)>0.001*m*n; %�˲�
end

%��Ǵ����������
f2 = find(f==1);
g = length(f2);
f1 = f2;
figure(2);

for i = 1:g
    [r1,c1] = find(D==f1(i));
    BW1 = bwselect(D,c1,r1,8); %�ڶ�����ͼ����ѡ��ָ����������ڵĶ���
    SE = ones(2,4);
    E1 = imdilate(BW1,SE); %����
    F1 = bwarea(E1); %������������
    G1 = bwperim(E1,4); %���ұ�Ե
    H1 = bwarea(G1); %�ܳ�
    e(i) = 4*pi*F1/H1^2; %HEYWOODϵ�� �����ܳ�/�����Բ���ܳ� ƽ����ȡ������Ϊe
        if (0.8927<e(i) && e(i)<1.1073)
            subplot(4,3,i)
            imshow(~E1);
            title('Բ��');
        else if (0.73<e(i) && e(i)<=0.8927)
            subplot(4,3,i)
            imshow(~E1);
            title('����');
        else if (e(i)<=0.73)
            subplot(4,3,i)
            imshow(~E1);
            title('������');
            end;
            end;
        end;
end
   
