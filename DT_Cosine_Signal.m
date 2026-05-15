clc;
close all;
clear all;
t=0:1/30:1;
y=cos(2*pi*t);
stem(t,y);
xlabel('a(n)');
ylabel('Amplitude');
title('Cosinusoidal signal');