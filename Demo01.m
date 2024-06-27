clc
clear all
close all
  I  = imread('Batt03.jpg');%อ่านภาพ
  im = rgb2gray(I);%ปรับภาพเป็นภาพระดับเทา
  BW = edge(im,'sobel');
  figure(1), imshow(BW);

  distR = double(I(:, :, 3)) - 1;%คำสั่ง Matrix สีฟ้า
  d2 = (distR .^2); 
  thres = 13000;%กำหนดค่าThresholdให้เป็นระดับที่สามารถแยกวัตถุได้อย่างชัดเจน
  results = d2 >= thres; %ทำค่าPixelสูงกว่าThreshold
  results = bwmorph(results, 'close', 2);
  stats = regionprops(results, 'BoundingBox'); 
  figure(3), imshow(results);
  hold on
    
  for i = 1 : length(stats)
      dimensions = stats(i).BoundingBox;
      inserted_text = sprintf(int2str(i)); %ให้ค่าตัวแปรวนเก็บความยาวไว้ในString
    
      rectangle('Position', stats(i).BoundingBox, 'EdgeColor', 'g', 'LineWidth', 1);%สร้างสี่เหลี่ยมจับวัตถุ  
  end

  [H,theta,rho] = hough(BW,'RhoResolution',1,'ThetaResolution',1);
  P = houghpeaks(H,12,'threshold',ceil(0.2*max(H(:))));%หลังแปลงเป็นภาพระดับเทาแล้วให้ระบุตำแหน่งที่แยกThreshold 12ตำแหน่ง
  x = theta(P(:,2));
  y = rho(P(:,1));
  plot(x,y,'s','color','black');%Plotเส้นแกน X และ y เป็นสีดำ
  lines = houghlines(BW,theta,rho,P,'FillGap',11,'MinLength',4);%สร้างเส้น
  figure(2), imshow(I);

  hold on
  totlen = 0;%กำหนดตัวแปรค่ารวม
  for k = 1:length(lines)
     xy = [lines(k).point1; lines(k).point2];
     plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','red');%Plotเส้นสีแดงของสนาม
     
     plot(xy(1,1),xy(1,2),'x','LineWidth',1,'Color','yellow');%กำหนดจุดสีเหลือง
     plot(xy(2,1),xy(2,2),'x','LineWidth',1,'Color','red');%กำหนดจุดสีแดง
     
     len = norm(lines(k).point1 - lines(k).point2);
     totlen = totlen + len; %ความยาวของเส้น
  end





