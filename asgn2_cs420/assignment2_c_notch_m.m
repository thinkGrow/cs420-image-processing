clc
clear all

g = imread('asgn2_cs420/book.png');
g = rgb2gray(g);
[M,N] = size(g);
figure, imshow(g); %fig 1

g = tofloat(g);
F = fft2(g);
S = intensityScaling(log(1+abs(fftshift(F))));
figure, imshow(S);

C1 = [99 154; 128 163];

H1 = cnotch1('gaussian', 'reject', M, N, C1, 5);

S1 = intensityScaling((fftshift(H1)));

figure, imshow(S1);

f1 = dftfilt(g,H1);
figure, imshow(f1)


C2 = [99 154;128 163; 49 160; 133 233; 55 132; 108 225; 112 74];
H2 = cnotch('gaussian', 'reject', M, N, C2, 5);

P2 = intensityScaling(fftshift(H2).*(tofloat(S)));
%figure, imshow(P2)

f2 = dftfilt(g,H2);
figure, imshow(f2)


f1R = imresize(f1,1.5);
f2R = imresize(f2,1.5);
figure, imshow(f1R)
figure, imshow(f2R)










 

