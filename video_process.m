clc
clear
% 这个模型中颜色的参数分别是：色调（H），饱和度（S），明度（V）
%04161008_2471.MP4 最好
%04161056_2486.MP4 还可以
%04161105_2489.MP4 最差
N = 5000;
aviobj = VideoWriter('output_1.avi');%名字
aviobj.Quality = 100;
%aviobj.Fps = 6;%帧速率
%aviobj.compression='None';
videoObj = VideoReader('04161008_2471.MP4');%读视频文件
open(aviobj);
%nframes = get(videoObj, 'NumberOfFrames');%获取视频文件帧个数
%filt = fspecial('gaussian',5,5);
for k = 1 : 5 : N
    currentFrame = read(videoObj, k);%读取第i帧
    Frame1=read(videoObj, k);
    imageDeel = imresize(Frame1,[480 720]);
    %Frame1 = imfilter(Frame1, filt, 'replicate', 'conv');
    %Frame2=read(videoObj, k+2);   
    %imshow(currentFrame);
    Iedge = HSV_test(imageDeel);
    figure(1);
    imshow(Iedge);
    writeVideo(aviobj,Iedge);
end
close(aviobj);

aviobj = VideoWriter('output_2.avi');%名字
aviobj.Quality = 100;
%aviobj.Fps = 6;%帧速率
%aviobj.compression='None';
videoObj = VideoReader('04161056_2486.MP4');%读视频文件
open(aviobj);
%nframes = get(videoObj, 'NumberOfFrames');%获取视频文件帧个数
%filt = fspecial('gaussian',5,5);
for k = 1 : N
    currentFrame = read(videoObj, k);%读取第i帧
    Frame1=read(videoObj, k);
    imageDeel = imresize(Frame1,[480 720]);
    %Frame1 = imfilter(Frame1, filt, 'replicate', 'conv');
    %Frame2=read(videoObj, k+2);   
    %imshow(currentFrame);
    Iedge = HSV_test(imageDeel);
    figure(1);
    imshow(Iedge);
    writeVideo(aviobj,Iedge);
end
close(aviobj);

aviobj = VideoWriter('output_3.avi');%名字
aviobj.Quality = 100;
%aviobj.Fps = 6;%帧速率
%aviobj.compression='None';
videoObj = VideoReader('04161105_2489.MP4');%读视频文件
open(aviobj);
%nframes = get(videoObj, 'NumberOfFrames');%获取视频文件帧个数
%filt = fspecial('gaussian',5,5);
for k = 1 : N
    currentFrame = read(videoObj, k);%读取第i帧
    Frame1=read(videoObj, k);
    imageDeel = imresize(Frame1,[480 720]);
    %Frame1 = imfilter(Frame1, filt, 'replicate', 'conv');
    %Frame2=read(videoObj, k+2);   
    %imshow(currentFrame);
    Iedge = HSV_test(imageDeel);
    figure(1);
    imshow(Iedge);
    writeVideo(aviobj,Iedge);
end
close(aviobj);
