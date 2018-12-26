clc; clear all;
I = imread('c4.png');
u = size(I,1);
v = size(I,2);
I = rgb2gray(I);
%% Prewitt
Hp_x = 5*[-1 0 1;-1 0 1;-1 0 1];
Hp_y = 5*[-1 -1 -1; 0 0 0;1 1 1];
Ip_x = uint8(conv2(I,Hp_x));
Ip_y = uint8(conv2(I,Hp_y));

subplot(131)
imshow(I);
title('Original Image')
subplot(132)
imshow(Ip_x);
title('Horizontal Gradient Prewitt Filtered Image (w=5)')
subplot(133)
imshow(Ip_y);
title('Vertical Gradient Prewitt Filtered Image (w=5)')
figure;
%% Sorbel 
Hs_x = 5*[-1 0 1;-2 0 2;-1 0 1];
Hs_y = 5*[-1 -2 -1; 0 0 0;1 2 1];
%Hs_x = [-3 0 3;-10 0 10;-3 0 3]/32;
%Hs_y = [-3 -10 -3;0 0 0;3 10 3]/32;
Is_x = uint8(conv2(I,Hs_x));
Is_y = uint8(conv2(I,Hs_y));
subplot(131)
imshow(I);
title('Original Image')
subplot(132)
imshow(Is_x);
title('Horizontal Gradient Sorbel Filtered Image')
subplot(133)
imshow(Is_y);
title('Vertical Gradient Sorbel Filtered Image')
figure;
%% Edge strength and orientation
Dx1 = Ip_x;
Dy1 = Ip_y;
Dx2 = Is_x;
Dy2 = Is_y;

%imshow(E1)
%% Roberts operation
Hr1 =50*[0 1;-1 0];
Hr2 =50*[-1 0;0 1];
Ir1 = uint8(conv2(I,Hr1));
Ir2 = uint8(conv2(I,Hr2));
subplot(131)
imshow(I);
title('Original Image')
subplot(132)
imshow(Ir1);
title('Diangonal Gradient_1 Robert Filtered Image with c=50')
subplot(133)
imshow(Ir2);
title('Diangonal Gradient_2 Robert Filtered Image with c=50')
