clc
close all
clear all
i = imread ("BTest.jpg");
subplot(1,3,1)
imshow(i)

% Convert RGB image to chosen color space
I = rgb2hsv(i);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.951;
channel1Max = 0.034;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.090;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.586;
channel3Max = 1.000;

% Create mask based on chosen histogram thresholds
sliderBW = ( (I(:,:,1) >= channel1Min) | (I(:,:,1) <= channel1Max) ) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

 subplot(1,3,2)
 imshow(BW)

diskElem = strel('disk',3 );
Ibwopen = imopen(BW,diskElem);
subplot(1,3,3)
imshow(Ibwopen)

% hBlobAnalysis = vistion.BlobAnalysis('MinimuBlobArea',200, ...
%     'MaximumBlobArea',5000);

% [objArea,objCentroid,bboxOut] = step(hBlobAnalysis.Ibwopen);
% 
%  Ishape = insertShape(i,'rectangle',bboxOut,'Linewidth',4);
Ishape = insertShape(i,'rectangle',[0,1],LineWidth=5);
figure
subplot(1,2,1)
imshow(Ishape)