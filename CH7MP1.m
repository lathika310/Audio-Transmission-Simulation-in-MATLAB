function [y] = CH7MP1(x) 
% CH7MP1.m : Chapter 7, MATLAB Program 1 
% Function M-file computes the sinc function, y = sin(x)/x.

y(x==0) = 1;
y(x~=0) = sin(x(x~=0))./x(x~=0);

