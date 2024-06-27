    clear all;
  I  = rgb2gray(imread('Batt01.jpg'));
  BW = edge(I,'sobel');
  figure, imshow(BW);
  [H,theta,rho] = hough(BW,'RhoResolution',1,'ThetaResolution',1);
  figure, imshow(imadjust(mat2gray(H)),[],'XData',theta,'YData',rho,...
          'InitialMagnification','fit');
  xlabel('\theta (degrees)'), ylabel('\rho');
  axis on, axis normal, hold on;
  colormap(hot)
  P = houghpeaks(H,12,'threshold',ceil(0.2*max(H(:))));
  x = theta(P(:,2));
  y = rho(P(:,1));
  plot(x,y,'s','color','black');
  lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',5);
  figure, imshow(I), hold on
  max_len = 0;
  totlen = 0;
  for k = 1:length(lines)
     xy = [lines(k).point1; lines(k).point2];
     plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','green');
     % Plot beginnings and ends of lines
     plot(xy(1,1),xy(1,2),'x','LineWidth',1,'Color','yellow');
     plot(xy(2,1),xy(2,2),'x','LineWidth',1,'Color','red');
     % Determine the endpoints of the longest line segment
     len = norm(lines(k).point1 - lines(k).point2);
     totlen = totlen + len; % total length of lines
  end