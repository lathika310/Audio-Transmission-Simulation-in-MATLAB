%B1 | Lathika Sooriyapperuma | 500904706 | Lab 4 Part B
% Transmitting radio broadcast through communications channel

%% Initialization
clear
clc
close all
load('Lab4_Data.mat');

%% Define constants
N = 80000;   %80k samples at 32 kHz sample rate = 2.5 second audio clip   

%% Convolve orginal signal with low pass filter
y1 = conv(xspeech,hLPF2000);
y1 = y1(1:80000);   %remove irreleavant parts (1)

%% Create Carrier Signal w/fundamental frequency=4khz
c1 = osc(4000,N); 

%% Modulate signal
y2 = y1 .* c1;

%% Transmit through tramission band
y3 = conv(y2, hChannel);
y3 = y3(1:80000);

%% De-modulation
y4 = y3 .* c1;
y4 = y4(1:80000);

%% Remove high frequencies by using Low-Pass filter
y = conv(y4,hLPF2500);
y = y(1:80000);

%% Debug recovered Sound
sound(y,32000);


