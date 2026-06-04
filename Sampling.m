clc;
clear;
close all;

% Original signal
t = 0:0.1:20;
F1 = 0.1;
F2 = 0.2;

x = sin(2*pi*F1*t);
% x = sin(2*pi*F1*t) + sin(2*pi*F2*t);

% Plot original and sampled signals
figure(1);

subplot(2,1,1);
plot(t,x,'LineWidth',1.5);
title('Original Signal');
xlabel('t');
ylabel('x(t)');
grid on;

% Sampling every 5th sample
x_samples = x(1:5:end);
n = 0:length(x_samples)-1;

subplot(2,1,2);
stem(n,x_samples,'filled');
title('Sampled Signal');
xlabel('n');
ylabel('x_s(n)');
grid on;

% Reconstruction
figure(2);

subplot(2,1,2);
plot(t,x,'k','LineWidth',1.5);
xlabel('t');
ylabel('x(t)');
title('Original Signal');
grid on;

Ts = 0.5;          % Sampling interval (5 × 0.1)
x_recon = zeros(size(t));

subplot(2,1,1);

for k = 0:length(x_samples)-1

    % Display samples
    stem(n,x_samples,'filled');
    grid on;
    axis([0 length(x_samples)-1 -2 2]);

    if k == length(x_samples)-1
        title('Reconstruction Finished');
    else
        title('Sample-by-Sample Reconstruction');
    end

    % Sinc interpolation
    x_recon = x_recon + ...
        x_samples(k+1)*sinc((t - k*Ts)/Ts);

    hold off;
    plot(t,x_recon,'b','LineWidth',1.5);
    hold on;

    pause(0.2);
end

% Final reconstructed signal
figure(3);
plot(t,x,'k','LineWidth',1.5);
hold on;
plot(t,x_recon,'r--','LineWidth',1.5);
grid on;
legend('Original Signal','Reconstructed Signal');
title('Signal Reconstruction using Sinc Interpolation');
xlabel('t');
ylabel('Amplitude');