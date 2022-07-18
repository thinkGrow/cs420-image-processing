clc
clear all

g = imread('asgn2_cs420/saturn_ring.png');
g = rgb2gray(g);

figure, imshow(g);
[M,N] = size(g);
g = tofloat(g);
F = fft2(g);
S = intensityScaling(log(1+abs(fftshift(F))));
figure, imshow(S);
H = recnotch('reject','vertical',M,N);
[A,B] = size(H);
g = imresize(g,[A B])
figure, imshow(fftshift(H));
f = dftfilt(g,H);
figure, imshow(f);