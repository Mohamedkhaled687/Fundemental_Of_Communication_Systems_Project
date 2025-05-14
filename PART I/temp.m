% clear the command window, workspace, and close all figures
clc;
clear;
close all;

% 1) Define a time axis
t = linspace(-6, 6, 2001);
%   linspace(a, b, N) returns an N-point row vector of values 
%   linearly spaced between a and b. Here we go from t=–6 to t=+6
%   in 2001 steps (so Δt≈0.006).

% 2) Pre-allocate the output signal x(t) as all zeros
x = zeros(size(t));
%   zeros(M, N) makes an M×N array of zeros.  Here we use
%   zeros(size(t)) to get a vector the same length as t.

% 3) Fill in the “left” ramp: for –4 ≤ t ≤ 0, x = t + 5
idx1 = (t >= -4) & (t <= 0);
x(idx1) = t(idx1) + 5;
%   (t >= -4) & (t <= 0) is a logical vector selecting just
%   those t-values.  We then assign x = t+5 on that region.

% 4) Fill in the “right” ramp: for 0 < t ≤ 4, x = 5 – t
idx2 = (t > 0) & (t <= 4);
x(idx2) = 5 - t(idx2);

% 5) Everything else stays zero (since x was initialized to zeros)

% 6) Plot the result
figure;                   % opens a new figure window
plot(t, x, 'b', 'LineWidth', 2);
%   plot(X, Y, S, ...) plots Y versus X.  Here 'b' means blue line,
%   and 'LineWidth',2 makes the line thicker.

xlabel('t');              % label the horizontal axis
ylabel('x(t)');           % label the vertical axis
title('Plot of x(t)');    % give the plot a title
grid on;                  % turn on the background grid

% 7) enforce nice vertical drop at t=±4 by explicitly drawing
hold on;
plot([-4 -4], [0 1], 'k', 'LineWidth', 2);
plot([ 4  4], [0 1], 'k', 'LineWidth', 2);
hold off;

axis([-6 6 -1 6]);        % [xmin xmax ymin ymax] to frame the plot neatly
