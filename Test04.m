clc
clear all
close all
im =imread("SANN.jpg");

figure(1),imshow(im);
[im,map]=rgb2ind(im,2);
figure(2),imshow(im,map);

gray = rgb2gray(map);
 [m1 n1 p1] = size(gray);
bw = imbinarize(gray);
bw = edge(bw);
% r=map(:,:,1);
figure(3),imshow(bw)
% figure(4),imshow(r>250);
imtool(bw);