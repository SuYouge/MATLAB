clc
clear
% ���ģ������ɫ�Ĳ����ֱ��ǣ�ɫ����H�������Ͷȣ�S�������ȣ�V��
%04161008_2471.MP4 ���
%04161056_2486.MP4 ������
%04161105_2489.MP4 ���
N = 5000;
aviobj = VideoWriter('output_1.avi');%����
aviobj.Quality = 100;
%aviobj.Fps = 6;%֡����
%aviobj.compression='None';
videoObj = VideoReader('04161008_2471.MP4');%����Ƶ�ļ�
open(aviobj);
%nframes = get(videoObj, 'NumberOfFrames');%��ȡ��Ƶ�ļ�֡����
%filt = fspecial('gaussian',5,5);
for k = 1 : 5 : N
    currentFrame = read(videoObj, k);%��ȡ��i֡
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

aviobj = VideoWriter('output_2.avi');%����
aviobj.Quality = 100;
%aviobj.Fps = 6;%֡����
%aviobj.compression='None';
videoObj = VideoReader('04161056_2486.MP4');%����Ƶ�ļ�
open(aviobj);
%nframes = get(videoObj, 'NumberOfFrames');%��ȡ��Ƶ�ļ�֡����
%filt = fspecial('gaussian',5,5);
for k = 1 : N
    currentFrame = read(videoObj, k);%��ȡ��i֡
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

aviobj = VideoWriter('output_3.avi');%����
aviobj.Quality = 100;
%aviobj.Fps = 6;%֡����
%aviobj.compression='None';
videoObj = VideoReader('04161105_2489.MP4');%����Ƶ�ļ�
open(aviobj);
%nframes = get(videoObj, 'NumberOfFrames');%��ȡ��Ƶ�ļ�֡����
%filt = fspecial('gaussian',5,5);
for k = 1 : N
    currentFrame = read(videoObj, k);%��ȡ��i֡
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
