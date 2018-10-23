clc;clear all
I = imread('sp.jpg');
u = size(I,1);
v = size(I,2);
I = rgb2gray(I);
H = [0.075 0.125 0.075;0.125 0.2 0.125 ;0.075 0.125 0.075];
%% box filter using convolution
H = [0.075 0.125 0.075;0.125 0.2 0.125 ;0.075 0.125 0.075];
I_b = conv2(I,H);
I_b = uint8(I_b);  %convert from double to uint8

subplot(211)
imshow(I);
title('Original image')
subplot(212)
imshow(I_b);
title('Blurred image')
figure;
%% gaussian filter
s = 10; %radius
I_g = imgaussfilt(I,s);

subplot(211)
imshow(I);
title('Original image')
subplot(212)
imshow(I_g);
title('Gaussian filtered image')
%% L = (s*2.5*2)+1;
for x = 1:L
    for y = 1:L
        Hg(x,y) = exp((-(x^2)+(y^2))/(2*(s^2)));
    end
end
I_g = conv2(I,Hg);
I_g = uint8(I_g);