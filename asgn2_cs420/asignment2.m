clc
clear all

g = imread('test2.png');
[M,N] = size(g);
figure, imshow(g); %fig 1


g = im2double(g);
F = fft2(g);
S = intensityScaling(log(1+abs(fftshift(F))));
figure, imshow(S);

C1 = [99 154; 128 163];

H1 = cnotch1('gaussian', 'reject', M, N, C1, 5);

S1 = intensityScaling((fftshift(H1)));
figure, imshow(S1);

f1 = dftfilt(g,H1);
figure, imshow(f1)





 

