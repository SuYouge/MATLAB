function I_r = HSV_test(I)
    %clc;
    %I=imread('test_1.jpg');%读入图片
    I_h = rgb2hsv(I);
    Mask = get_mask (I);
    %figure,imshow(I);
    [height,width,~]=size(I);
    for i=1:height
        for j=1:width
            flag = Mask(i,j);
            %通过将h通道颜色值特定范围内饱和度设为0，保留范围外颜色值
            if  flag == 1
                %I_h(i,j,1)=0;
                I_h(i,j,2)=0;
                I_h(i,j,3)=0;
            end
        end
    end
    I_r=hsv2rgb(I_h);
    h = size(I_r,1); 
%     h = size(I_r,1);
    I_r = I_r(0.5*h:0.9*h, :, :);
    %figure, imshow(I_r);
end
% figure, imshow(I_r);
% for i=1:height
%     for j=1:width
%         h=I_h(i,j,1);
%         s=I_h(i,j,2);
%         v=I_h(i,j,3);
%         %通过将h通道颜色值特定范围内饱和度设为0，保留范围外颜色值
%         if  h>0.16 && h<0.66
%             %I_h(i,j,1)=0;
%             I_h(i,j,2)=0;
%             I_h(i,j,3)=0;
%         end
%     end
% end
% I_r=hsv2rgb(I_h);
% figure, imshow(I_r);