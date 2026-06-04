clc;
clear all;
close all;

fo = 5;          % Frequency of the sine wave (Hz)
Fs = 500;        % Sampling rate (Hz)
Ts = 1/Fs;       % Sampling interval (s)

t = 0:Ts:1-Ts;  % Time vector
n = length(t);   % Number of samples

y = 2*sin(2*pi*fo*t);  % Sine wave

% Plot the sine wave in the time domain
figure;
plot(t, y, 'LineWidth', 1.5);
grid on;

title('Sine Wave in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');