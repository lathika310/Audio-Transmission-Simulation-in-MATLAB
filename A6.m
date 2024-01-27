%A.6: Compute Fourier Transform of narrower pulse

%% Initialization
clear; clc; close all;

%create rect pulse 
N = 100; PulseWidth = 10;
t = [0:1:(N-1)];    
x = [ones(1,PulseWidth), zeros(1,N-PulseWidth)];   

% Perform fourier transform on x
Xf = fft(x); %to get the freq domain func

%define the complex function Xf's domain.
f = [-(N/2):1:(N/2)-1]*(1/N);       
w = 2*pi*f; %convert to rad/s

%% Compute w_+(t) = x(t)e^(j(pi/3)t and it's Fourier Transform
w_plus = x .* exp(  ( (1i*(pi/3)).*t )  );
W_plus = fft(w_plus);

%% Compute w_-(t) = x(t)e^(-j(pi/3)t and its fourier Transform
w_minus = x .* exp(  ( (-1*1i*(pi/3)).*t )  );
W_minus = fft(w_minus);

%% Compute w_c(t) = x(t)cos(pi/3)t and its fourier Transform
w_c = x .* cos(pi/3) .* t;
W_c = fft(w_c);

%% Plot and compare the magnitude and phase Spectra

figure('Name', 'Magnitude and Phase Spectra for w_+(t)');
%plot amplitude (magnitude) spectra
subplot(211); plot(w,fftshift( abs(W_plus))); grid on;  
xlabel('\omega'); ylabel('|W_{-}(\omega)|');
title('Magnitude Spectra of w_{+}(t)');
%plot phase spectra
subplot(212); plot(w,fftshift(angle(W_plus))); grid on; 
xlabel('\omega'); ylabel('\angle W_{+}(\omega)');
title('Phase Spectra of w_{+}(t)');

figure('Name', 'Magnitude and Phase Spectra for w_-(t)');
%plot amplitude (magnitude) spectra
subplot(211); plot(w,fftshift( abs(W_minus))); grid on;  
xlabel('\omega'); ylabel('|W_{-}(\omega)|');
title('Magnitude Spectra of w_{-}(t)');
%plot phase spectra
subplot(212); plot(w,fftshift(angle(W_minus))); grid on; 
xlabel('\omega'); ylabel('\angle W_{-}(\omega)');
title('Phase Spectra of w_{-}(t)');

figure('Name', 'Magnitude and Phase Spectra for w_c(t)');
%plot amplitude (magnitude) spectra
subplot(211); plot(w,fftshift( abs(W_c))); grid on;  
xlabel('\omega'); ylabel('|W_{c}(\omega)|');
title('Magnitude Spectra of w_{c}(t)');
%plot phase spectra
subplot(212); plot(w,fftshift(angle(W_c))); grid on; 
xlabel('\omega'); ylabel('\angle W_{c}(\omega)');
title('Phase Spectra of w_{c}(t)');