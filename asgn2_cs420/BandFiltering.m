close all
clc
f = imread( 'zoneplate.png'); 

subplot(2,2,1)
imshow(f)

%lowpass filter the image

%Figure  shows the result of filtering with a Butterworth highpass filter of order 2 and 
% D0 equal to 5% of the vertical dimension of the padded image, followed by scaling the intensity values:
PQ=paddedsize(size(f));

% Do as the cutofffrequency of the filter transfer function;
D0=15;
% Ideal lowpass transfer function.

[M,N] = size(f);
%Lowpass filter the image.
HLP = lpfilter('btw',M,N,D0,3);
gLP = dftfilt(f,HLP,'original');
figure,
imshow(gLP) 


%Bandreject filter

HBR = bandfilter('btw','reject',M,N,38,8,3); 
gBR=intensityScaling(dftfilt(f,HBR, 'original'));
figure, imshow(gBR) % Fig. 4.21(d).



%Bandpassfilter

HBR = bandfilter('btw','pass',M,N,38,8,3); 
gBR=intensityScaling(dftfilt(f,HBR, 'original'));
figure, imshow(gBR) % Fig. 4.21(d).




%highpass filter
HLP= lpfilter('btw', PQ(1), PQ(2), D0,2); % 'ideal' 'butterworth' 'gaussian' 


%filter the image 

gLPI = dftfilt(f,HLP,'original'); % Please open the function to see the description
gemps= intensityScaling(gLPI);


figure, imshow(gemps)

