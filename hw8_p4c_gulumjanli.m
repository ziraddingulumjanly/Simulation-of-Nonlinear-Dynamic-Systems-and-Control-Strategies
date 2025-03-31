clear; clc; close all

% Parameters
am = -1; bm = 1;
ap1 = 1; bp = 2;
ap2 = 2;
gamma = 2;

% Reference function 
r = @(t) (t <= 50) .* (sin(3*t) + 1) + (t > 50) * 0.5;

% Time settings
t_total = 150;
tspan = [0 t_total];
x0 = [1; 0; 0; 0];  

% Simulate system
[t, x] = ode45(@(t,x) mrac_dynamics_func(t, x, ap1, ap2, bp, am, bm, r, gamma), tspan, x0);

% Extract states
yp = x(:,1);
ym = x(:,2);
theta1_hat = x(:,3);
theta2_hat = x(:,4);
rt = arrayfun(r, t);

% Ideal gains
theta1_ideal = 0.5;
theta2_before = -1;
theta2_after  = -1.5;

% Plot: Outputs
hf1 = figure;
hf1.Color = 'w';
plot(t, yp, 'Color', [0.75 0 0], 'LineWidth', 1.5); hold on;
plot(t, ym, 'Color', [0 0 0.5], 'LineWidth', 1.5);
plot(t, rt, 'Color', [0.2 0.2 0.2], 'LineWidth', 1.5);
xlabel('$t$ [s]', 'Interpreter','latex', 'FontSize', 14);
ylabel('Output', 'Interpreter','latex', 'FontSize', 14);
legend({'$y_p$', '$y_m$', '$r(t)$'}, ...
    'Interpreter','latex', 'FontSize', 12, 'Location','best');
title('Plant and Reference Outputs (Part c)', 'Interpreter','latex', 'FontSize', 16);
set(gca, 'FontSize', 12, 'LineWidth', 1, 'XColor', 'k', 'YColor', 'k');
grid off;
exportgraphics(hf1, 'hw8p3c_outputs.pdf', 'ContentType', 'vector');

% Plot: Gains
hf2 = figure;
hf2.Color = 'w';
hold on;
plot(t, theta1_hat, 'Color', [0.4 0 0.6], 'LineWidth', 1.5);
plot(t, theta2_hat, 'Color', [0 0.5 0], 'LineWidth', 1.5);
plot(t, theta1_ideal * ones(size(t)), 'Color', [0.1 0.1 0.1], 'LineWidth', 1.5);
plot(t, yline_piecewise(t, theta2_before, theta2_after), ...
     'Color', [0 0.4 0.4], 'LineWidth', 1.5);
xlabel('$t$ [s]', 'Interpreter','latex', 'FontSize', 14);
ylabel('Gain Values', 'Interpreter','latex', 'FontSize', 14);
legend({'$\hat{\theta}_1(t)$', '$\hat{\theta}_2(t)$', '$\theta_1$', '$\theta_2$'}, ...
    'Interpreter','latex', 'FontSize', 12, 'Location','best');
title('Adaptive Controller Gains (Part c)', 'Interpreter','latex', 'FontSize', 16);
set(gca, 'FontSize', 12, 'LineWidth', 1, 'XColor', 'k', 'YColor', 'k');
grid off;
exportgraphics(hf2, 'hw8p3c_gains.pdf', 'ContentType', 'vector');

disp('Figures saved as hw8p3c_outputs.pdf and hw8p3c_gains.pdf');

% Dynamics function
function dx = mrac_dynamics_func(t, x, ap1, ap2, bp, am, bm, r_func, gamma)
    yp = x(1);
    ym = x(2);
    theta1 = x(3);
    theta2 = x(4);

    ap = ap1 * (t < 100) + ap2 * (t >= 100);
    rt = r_func(t);
    u = theta1 * rt + theta2 * yp;

    dyp = ap * yp + bp * u;
    dym = am * ym + bm * rt;

    e = yp - ym;
    dtheta1 = -gamma * e * rt;
    dtheta2 = -gamma * e * yp;

    dx = [dyp; dym; dtheta1; dtheta2];
end

% Piecewise theta2 ideal for plotting
function y = yline_piecewise(t, val1, val2)
    y = (t < 100) * val1 + (t >= 100) * val2;
end
