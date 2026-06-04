clc;
clear;
close all;

n = 1:10;

x1 = sin(n);
x2 = cos(n);

alpha = 2;
beta = 3;

% Linear combination
x = alpha*x1 + beta*x2;

N = length(x);

% DFTs
f1 = fftshift(fft(x1, N));
f2 = fftshift(fft(x2, N));
f  = fftshift(fft(x, N));

% Frequency axis
w = linspace(-pi, pi, N);

% Plot DFT of linear combination
subplot(2,1,1);
stem(w, abs(f), 'filled');
grid on;
title('DFT of \alpha x_1(n) + \beta x_2(n)');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');

% Plot alpha*F1 + beta*F2
subplot(2,1,2);
stem(w, abs(alpha*f1 + beta*f2), 'filled');
grid on;
title('\alpha X_1(k) + \beta X_2(k)');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');

% Verify linearity property
error = max(abs(f - (alpha*f1 + beta*f2)));
fprintf('Maximum Error = %e\n', error);