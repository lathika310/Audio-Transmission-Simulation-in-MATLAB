%% Initialization
clear
clc
close all

%create rect pulse 
N = 100; PulseWidth = 10;   %*See (1) in OneNote>Notes.
t = [0:1:(N-1)];    %creates 100 element array with values ranging from 0 to 99 inclusive, which repersent time.
x = [ones(1,PulseWidth), zeros(1,N-PulseWidth)];    %define a rect pulse which is shifted to have the rising edge on t=0

%define the complex function Xf's domain.
f = [-(N/2):1:(N/2)-1]*(1/N);       
w = 2*pi*f; %convert to rad/s

%% A.1: compute z(t) = x(t) ∗ x(t) using Matlab
%See Lab report figure__ for the analytical caculation required for this question.

%Note that matlab also has a convolution function, and we will need to
%compare it w/ covolution on MATLAB using Fourier Properites in A.4

% Will plot in the comparison figure for A.4
    % figure('Name', 'Covolution w/ MATLAB time-domain op');
    % plot(t,z); grid on; axis([-1,30,-0.1,1.1]);  %plot z w/ same axis ranges as x for easy comparison.

%% A.2: compute Z(w) = X(w)X(w) 
Xf = fft(x); %% Perform fourier transform on x
Zf = Xf .* Xf; % Use fourier property to obtain covolution equivalent.   

%% A.3 Plot magnitude and phase spectra of z(t)

figure('Name', 'Magnitude and Phase Spectra for z(t)');

%plot amplitude (magnitude) spectra
subplot(211); plot(w,fftshift( abs(Zf))); grid on;  
xlabel('\omega'); ylabel('|Z(\omega)|');
title('Magnitude Spectra of z(t)');

%plot phase spectra
subplot(212); plot(w,fftshift(angle(Zf))); grid on; 
xlabel('\omega'); ylabel('\angle Z(\omega)');
title('Phase Spectra of z(t)');

%% A.4 Comparing time vs. phasor domain MATLAB operations to find z(t) 
figure('Name', 'z(t) found using time vs. fourier domain ops');

z = conv(x,x); 
z = z(1:100); %remove the *irrelavant parts vector z.(2)

% Subplot graph of z(t) found using time domain operation
subplot(211); plot(t,z); grid on; axis([-10,110,-0.1,1.1]);
axis tight;
xlabel('t'); ylabel('z(t)');
title('z(t) found using MATLAB conv func');

%Perform the inverse fourier transform to Z(w)
zhat = ifft(Zf);

% Subplot graph of z(t) found using Fourier property (from A.2)
subplot(212); plot(t,zhat); grid on; axis([-10,110,-0.1,1.1]);
axis tight;
xlabel('t'); ylabel('z(t)');
title('z(t) found using Fourier Property');