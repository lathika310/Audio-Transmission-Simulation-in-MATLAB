%A.5: Compute/plot Fourier Transform/Spectra of narrower and wider pulses

%% Initialization
clear; clc; close all;

%% Create narrower rect pulse (pulse width = 5)

%create rect pulse 
N = 100; PulseWidth = 5;
t = [0:1:(N-1)];
x1 = [ones(1,PulseWidth), zeros(1,N-PulseWidth)];    

%Plot narrow pulse w/ same axis as wide pulse for easy comparison   
figure('Name', 'Graph of Narrow Rect Pulse');
stairs(t,x1); grid on; axis([-1,30,-0.1,1.1])  

%% Obtain Fourier transformed function and plot fourier spectra

Xf1 = fft(x1); %to get the freq domain func

%define the complex func's domain, w
f = [-(N/2):1:(N/2)-1]*(1/N);   
w = 2*pi*f; %conver to rad/s

figure('Name', 'Fourier Spectra for Narrow Pulse');
subplot(211); plot(w,fftshift(abs(Xf1))); grid on;  %plot amplitude spectra
subplot(212); plot(w,fftshift(angle(Xf1))); grid on; %plot phase spectra

%% Create wider rect pulse (pulse width = 25)

%create rect pulse 
N = 100; PulseWidth = 25;
t = [0:1:(N-1)];
x2 = [ones(1,PulseWidth), zeros(1,N-PulseWidth)];    

%Plot wide pulse w/ same axis as narrow pulse for easy comparison
figure('Name', 'Graph of Wide Rect Pulse');
stairs(t,x2); grid on; axis([-1,30,-0.1,1.1])  
%% Obtain Fourier transformed function and plot fourier spectra

Xf2 = fft(x2); %to get the freq domain func

%define the complex func's domain, w
f = [-(N/2):1:(N/2)-1]*(1/N);   
w = 2*pi*f; %conver to rad/s

figure('Name', 'Fourier Spectra for Wide Pulse');
subplot(211); plot(w,fftshift(abs(Xf2))); grid on;  %plot amplitude spectra
subplot(212); plot(w,fftshift(angle(Xf2))); grid on; %plot phase spectra 

