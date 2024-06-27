clc
clear all
close all
I = imread('SANN.jpg');
figure(1),imshow(I)
% [m1 n1 p1] = size(I);
K = rgb2gray(I);
% [m2 n2 p2] = size(K);
figure(2),imshow(K)
% [m3 n3 p3] = size(G);
% figure(3),imshow(G)
%  K = conner(I);
imshow(I);
hold on
%  plot(I(3,12), '*', 'Color', 'r')
%  plot( I(70,3), '*', 'Color', 'r')
%  plot(I(:,2), I(:,1), '*', 'Color', 'r')
%  plot(I(2,:), I(1,:), '*', 'Color', 'r')
figure(3),imshow(I)
hold off
rectangle('Position',[25 112 367 193])
rectangle('Position',[52 112 313 193])
rectangle('Position',[160 112 97 193])
rectangle('Position',[25 128 367 161])
axis([10 10 10 10])
I = rectangle('SANN.jpg','*','Color','r');
X = zero(m2,n2);

for i = 1;m
   for j = 1;n
%         X(i+1,j+1) = P(i,j);
%         X(i+125,j+125) && (175,175)
         if K(i,j) <=175 && K(i,j) <= 220
             X(i,j) = 255;
             %{
          
  
elseif i>5
               BW = edge(CH, 'sobel');
               se = strel('disk', 2);
               BW = imdilate(BW,se);
               BW = imerode(BW,se);
               BW = imfill(BW, 'holes');
               K = bwboundaries(BW, 8, 'holes');
               K = K{1};
               objB = bsxfun(@minus, K, mean(K))
               [theta, rho] = cart2pol(objB(:,2), objB(:,1));
          end
             %}  
       end
   end
end
