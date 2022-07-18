close all
clc
f = imread( 'Fig0303(a).tif'); 
subplot(2,3,1)
imshow(f, [])

%Fourier Transform

F = fft2(f);

%magnitude
S = abs(F); 
subplot(2,3,2)
imshow(F, [])

%Centered
Fc = fftshift(F);
subplot(2,3,3)
imshow(abs(Fc),[])

%log enhancement
S2 = log(1 + abs(Fc));
subplot(2,3,4)
imshow(S2,[])

%Phase

phi = angle(F) ;
F3 = S.*exp(1i*phi);
S3 = log(1 + abs(F3));
subplot(2,3,5)
imshow(S3,[])

