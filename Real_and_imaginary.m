clc;
clear;

% Complex number
z = 3 + 4j;

% Real and imaginary parts
x = real(z);
y = imag(z);

% Magnitude and phase
R = abs(z);
theta = angle(z);

% Verify polar and rectangular forms
err = abs(z - R*exp(1j*theta)) + abs(z - (x + 1j*y));

% Display results
fprintf('Real Part = %.4f\n', x);
fprintf('Imaginary Part = %.4f\n', y);
fprintf('Magnitude = %.4f\n', R);
fprintf('Phase Angle = %.4f rad\n', theta);
fprintf('Error = %.4e\n', err);