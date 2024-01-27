%% Initialization
clear
clc
close all

%% Create and plot rect pulse

N = 100;    %N = the number of samples for the signal 
PulseWidth = 10;
t = [0:1:(N-1)];    %creates 100 element array w/ from 0 to 99 inclusive
x = [ones(1,PulseWidth), zeros(1,N-PulseWidth)];    

figure('Name', 'Graph of Rect Pulse');
stairs(t,x); grid on; axis([-1,30,-0.1,1.1]); 

%% Obtain Fourier transformed function and plot fourier spectra

Xf = fft(x); %Perform fourier transform on rectangular pulse x.

%define the complex func's domain, w
f = [-(N/2):1:(N/2)-1]*(1/N);       
w = 2*pi*f; %convert radial freq (rad/s)

figure('Name', 'Fourier Spectra for Pulse');
subplot(211); plot(w,fftshift( abs(Xf))); grid on;  %plot amplitude spectra
subplot(212); plot(w,fftshift(angle(Xf))); grid on; %plot phase spectra

%% Perform inverse fourier transform and compare to orginal function x

xhat = ifft(Xf);    %perform the inverse fourier transform on Xf

%compare the vectors
result = areVectorsNearIdentical(x, xhat, 1e-5);
if result
    disp('Vectors are near identical.');
else
    disp('Vectors are not near identical.');
end

figure('Name', 'Showing F^-1{X(w)} ~ x(t)');
stairs(t,xhat); grid on; axis([-1,30,-0.1,1.1]);  
