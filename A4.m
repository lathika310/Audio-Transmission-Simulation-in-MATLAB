%A4:Determine the appropriate time indices for proper labelling of the time-domain plots of z(t).
    %Note, this acctually dosen't sound like a matlab part so may not need
    %this.

%% Initialization
clear
clc

%% Create rect pulse

%N = 100; %Shall see when we need it later 
%PulseWidth = 10; %Shall see when we need it later
t = [-2:1:20];    %define domain, t
x = [zeros(1,2), ones(1,10), zeros(1,11)];    %calc input waveform, x(t)
stairs(t,x); grid on; axis tight;  %plot rect pulse x(t) w/ customized 
