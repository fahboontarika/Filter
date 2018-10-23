clc;clear all
I = imread('watarun.jpg');
I = imnoise(I,'salt & pepper',0.02);
u = size(I,1);
v = size(I,2);
I = rgb2gray(I);
%% Min Max Med
Imin = ordfilt2(I,1,ones(3,3));
Imed = ordfilt2(I,5,ones(3,3));
Imax = ordfilt2(I,9,ones(3,3));

subplot(411)
imshow(I);
title('Original image')
subplot(412)
imshow(Imin);
title('Min filtered image')
subplot(413)
imshow(Imax);
title('Max filtered image')
subplot(414)
imshow(Imed);
title('Median filtered image')
figure;
%% Weighted median
W = [1 2 1;2 3 2;1 2 1];
L = sum(W(:));
I_wmed = medfilt2(I);

subplot(211)
imshow(I);
title('Original image')
subplot(212)
imshow(I_wmed);
title('Weighted med filtered image')

