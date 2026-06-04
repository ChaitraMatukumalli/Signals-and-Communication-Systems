clc; clear;

inpSig = [1 1 1];
outSig = [1 4 8 10 8 4 1];

comLength = 1024;

inpSigPad = [inpSig zeros(1,comLength-length(inpSig))];
outSigPad = [outSig zeros(1,comLength-length(outSig))];

X = fft(inpSigPad);
Y = fft(outSigPad);

H = Y ./ X;

f = (-comLength/2:comLength/2-1)/comLength;

figure;
plot(f,mag2db(abs(fftshift(H))));
grid on;
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');
title('Transfer Function using FFT');