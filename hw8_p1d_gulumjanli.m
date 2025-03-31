clear; clc; close all;

% Time span
tspan = [0 100];

% Initial condition
x0 = [1; 0.5];

% (a) System
f_a = @(t, x) [
    x(1)*(x(2) - 1);
    -x(1)^2 / (1 + x(1)^2)
];
[t_a, xa] = ode45(f_a, tspan, x0);

% (b) System
a = 1;
f_b = @(t, x) [
    x(2);
    -a*sin(x(1))
];
[t_b, xb] = ode45(f_b, tspan, x0);

% (c) System
f_c = @(t, x) [
    -x(2);
    x(1) + (x(1)^2 - 1)*x(2)
];
[t_c, xc] = ode45(f_c, tspan, x0);

% Plotting

hf = figure;
hf.Color = 'w';

% (a) Time Plot
subplot(3,2,1);
plot(t_a, xa(:,1), 'b', 'LineWidth', 1.5); hold on;
plot(t_a, xa(:,2), 'r', 'LineWidth', 1.5);
title('(a) States vs Time', 'Interpreter', 'latex', 'FontSize', 16);
xlabel('$t$ [s]', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x_1$, $x_2$', 'Interpreter', 'latex', 'FontSize', 14);
legend({'$x_1$', '$x_2$'}, 'Interpreter', 'latex', 'FontSize', 12);
set(gca, 'FontSize', 12, 'LineWidth', 1, 'XColor', 'k', 'YColor', 'k');
grid off;

% (a) Phase Plot
subplot(3,2,2);
plot(xa(:,1), xa(:,2), 'k-', 'LineWidth', 1.5);
title('(a) Phase Plot', 'Interpreter', 'latex', 'FontSize', 16);
xlabel('$x_1$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x_2$', 'Interpreter', 'latex', 'FontSize', 14);
set(gca, 'FontSize', 12, 'LineWidth', 1, 'XColor', 'k', 'YColor', 'k');
grid off;

% (b) Time Plot
subplot(3,2,3);
plot(t_b, xb(:,1), 'b', 'LineWidth', 1.5); hold on;
plot(t_b, xb(:,2), 'r', 'LineWidth', 1.5);
title('(b) States vs Time', 'Interpreter', 'latex', 'FontSize', 16);
xlabel('$t$ [s]', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x_1$, $x_2$', 'Interpreter', 'latex', 'FontSize', 14);
legend({'$x_1$', '$x_2$'}, 'Interpreter', 'latex', 'FontSize', 12);
set(gca, 'FontSize', 12, 'LineWidth', 1, 'XColor', 'k', 'YColor', 'k');
grid off;

% (b) Phase Plot
subplot(3,2,4);
plot(xb(:,1), xb(:,2), 'k-', 'LineWidth', 1.5);
title('(b) Phase Plot', 'Interpreter', 'latex', 'FontSize', 16);
xlabel('$x_1$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x_2$', 'Interpreter', 'latex', 'FontSize', 14);
set(gca, 'FontSize', 12, 'LineWidth', 1, 'XColor', 'k', 'YColor', 'k');
grid off;

% (c) Time Plot
subplot(3,2,5);
plot(t_c, xc(:,1), 'b', 'LineWidth', 1.5); hold on;
plot(t_c, xc(:,2), 'r', 'LineWidth', 1.5);
title('(c) States vs Time', 'Interpreter', 'latex', 'FontSize', 16);
xlabel('$t$ [s]', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x_1$, $x_2$', 'Interpreter', 'latex', 'FontSize', 14);
legend({'$x_1$', '$x_2$'}, 'Interpreter', 'latex', 'FontSize', 12);
set(gca, 'FontSize', 12, 'LineWidth', 1, 'XColor', 'k', 'YColor', 'k');
grid off;

% (c) Phase Plot
subplot(3,2,6);
plot(xc(:,1), xc(:,2), 'k-', 'LineWidth', 1.5);
title('(c) Phase Plot', 'Interpreter', 'latex', 'FontSize', 16);
xlabel('$x_1$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x_2$', 'Interpreter', 'latex', 'FontSize', 14);
set(gca, 'FontSize', 12, 'LineWidth', 1, 'XColor', 'k', 'YColor', 'k');
grid off;
% Export figure as PDF
exportgraphics(hf, 'hw8p1d.pdf', 'ContentType', 'vector');
