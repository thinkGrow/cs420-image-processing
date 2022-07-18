close all
clc
f = imread( 'Fig0313(a).tif'); 
PQ=paddedsize(size(f));

% Do as the cutofffrequency of the filter transfer function;
D0=10;
% Ideal lowpass transfer function.
HLPI = lpfilter('ideal', PQ(1), PQ(2), D0); % 'ideal' 'butterworth' 'gaussian' 



%filter the image 

gLPI = dftfilt(f,HLPI,'original'); % Please open the function to see the description

%display the result

figure, imshow(gLPI)