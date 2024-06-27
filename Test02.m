I  = imread('SANN.jpg');
%rotI = imrotate(I,33,'crop');
rotI=I;
fig1 = imshow(rotI);
se = strel('line',12,90);
BW = imdilate(BW,se);
BW = bwmorph(I,'thicken');
BW = edge(BW,'canny');
BW1 = imrotate(BW,90,'crop');
figure, imshow(BW);
%BW=rotI;
[H,theta,rho] = hough(BW,'Theta',-90:0.5:89.5);
figure, imshow(imadjust(mat2gray(H)),[],'XData',theta,'YData',rho,...
        'InitialMagnification','fit');
xlabel('\theta (degrees)'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(hot)
P = houghpeaks(H,8,'threshold',ceil(0.3*max(H(:))));
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'s','color','w');
lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',5);
figure, imshow(BW), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
  plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
     % Determine the endpoints of the longest line segment
  end
% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');