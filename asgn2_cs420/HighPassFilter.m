close all
clc
f = imread( 'Fig0319(a).tif'); 

subplot(2,2,1)
imshow(f)

%Figure  shows the result of filtering with a Butterworth highpass filter of order 2 and 
% D0 equal to 5% of the vertical dimension of the padded image, followed by scaling the intensity values:
PQ=paddedsize(size(f));

% Do as the cutofffrequency of the filter transfer function;
D0=round(0.05*PQ(1));
% Ideal lowpass transfer function.
H = hpfilter('btw', PQ(1), PQ(2), D0,2); % 'ideal' 'butterworth' 'gaussian' 


%filter the image 

gLPI = dftfilt(f,HLPG,'original'); % Please open the function to see the description
gemps= intensityScaling(gLPI);

%display the result
subplot(2,2,2)

imshow(gemps)

Hemp=0.5+2.0*H;
gemp=dftfilt(f,Hemp,'original');
gemps= intensityScaling(gemp);

subplot(2,2,3)
imshow(gemps)

geq = histeq(gemp,256); 
subplot(2,2,4)
imshow(geq)