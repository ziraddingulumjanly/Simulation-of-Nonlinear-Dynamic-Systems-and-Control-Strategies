close all; clear; clc

%  state derivative functions 
Dx1 = @(x1,x2) (x1 - 1).*(x1 + x2);
Dx2 = @(x1,x2) x2 - x1.^2;

%  grid of points 
N = 50;
x1 = linspace(-1.5, 1.5, N);
x2 = linspace(-0.5, 1.5, N);
[X1, X2] = meshgrid(x1, x2);

%  state derivative values 
U = Dx1(X1, X2);
V = Dx2(X1, X2);

%  normalize for direction only 
W = sqrt(U.^2 + V.^2);
U = U ./ W;
V = V ./ W;

%  plot vector field 
hf = figure; 
hf.Color = 'w'; 
hold on
quiver(X1, X2, U, V, 'AutoScaleFactor', 0.7, 'Color', [0.3 0.3 0.3]);

xlim([min(x1) max(x1)])
ylim([min(x2) max(x2)])
xlabel('$x_1$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x_2$', 'Interpreter', 'latex', 'FontSize', 14);
title('Phase Portrait of the Nonlinear System', 'Interpreter', 'latex', 'FontSize', 16);
set(gca, 'FontSize', 12, 'LineWidth', 1, 'XColor', 'k', 'YColor', 'k');
grid off;

%  mark equilibrium points 
plot(1, 1, 'ro', 'MarkerSize', 8, 'LineWidth', 2);        % unstable
plot(0, 0, 'go', 'MarkerSize', 8, 'LineWidth', 2);        % saddle
plot(-1, 1, 'bo', 'MarkerSize', 8, 'LineWidth', 2);       % stable

%  legend 
legend({'Vector Field', ...
        'Equilibrium (1,1)', ...
        'Equilibrium (0,0)', ...
        'Equilibrium (-1,1)'}, ...
        'Interpreter', 'latex', 'FontSize', 12, 'Location', 'northeast');

%  export to PDF 
exportgraphics(hf, 'hw8p2.pdf', 'ContentType', 'vector');
