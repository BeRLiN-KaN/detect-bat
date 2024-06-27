clc
close all
clear all

img = imread('SANN.jpg');
bw = im2bw(img, graythresh(img));
bw = medfilt2(bw, [1,245]);
BW = edge(bw);
figure(1),imshow(BW)
[H,T,R] = hough(BW);
P = houghpeaks(H, 7,'NHoodSize',[1 1],'threshold',ceil(0.01*max(H(:))));
lines = houghlines(BW, T, R, P, 'FillGap', 5, 'MinLength', 7);
x = T(P(:,2)); y = R(P(:,1));
figure(2);
    imagesc(I);hold on;colormap gray;
    axis image; 
    max_len = 0;
    for k = 1:length(lines)
       xy = [lines(k).point1; lines(k).point2];
       plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','g');
       plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','y');
       plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','r');
       len = norm(lines(k).point1 - lines(k).point2);
       if ( len > max_len)
          max_len = len;
          xy_long = xy;
       end
    end
figure(),imshow(k)
