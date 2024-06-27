clc
clear all
close all
I = imread('SANN.jpg');

K = rgb2gray(I);
 [m2 n2 p2] = size(K);
%  subplot(1,3,1)
figure(2),imshow(K)

% rotI = imrotate(I,0,'crop');

% BW = edge(rotI,'canny');

gray = rgb2gray(I);
bw = imbinarize(gray);
bw = edge(bw);
%  subplot(1,3,2)
figure(1),imshow(bw)





% [H,T,R] = hough(BW);
% imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
% xlabel('\theta'),ylabel('\rho');
% axis on,axis normal ,hold on;
% 
% 
%  [H,T,R] = hough(bw,'Theta',90:7:255,'RhoResolution',1);
%  P = hounghpesks(H,7,'threshold',1,'NHoodSize',[7 9]);
%  lines = houghlines(bw,T,R,P,'FillGap',5,'MinLength',9);
% 
% imshow(bw)
% hold on
% for ii = 1:length(line)
%     xy = [lines(ii).point1;lines(ii).point2];
% plot(xy(:,1), xy(:,2), 'LineWidth',2, 'Color', 'g')
% figure(2), imshow(ii)
% end
%segmentImage(bw)
%detections = detectline(img, 'numLines',10)
