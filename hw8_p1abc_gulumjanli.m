syms x1 x2 real

% Define the Lyapunov function
V = log(1 + x1^2) + x2^2;

% Define the system dynamics
dx1 = x1*(x2 - 1);
dx2 = -x1^2/(1 + x1^2);

% Compute the gradient of V
gradV = gradient(V, [x1, x2]);

% Compute V_dot = gradV * f(x)
Vdot = gradV(1)*dx1 + gradV(2)*dx2;
Vdot = simplify(Vdot);

disp('Lyapunov function V(x1, x2):');
disp(V);
disp('Time derivative of V (Vdot):');
disp(Vdot);
% ----------------------------------------------------------------
% syms x1 x2 a real
% 
% % Define Lyapunov function
% V = a - a*cos(x1) + (1/2)*x2^2;
% 
% % Define system dynamics
% dx1 = x2;
% dx2 = -a*sin(x1);
% 
% % Gradient of V
% gradV = gradient(V, [x1, x2]);
% 
% % Compute V̇ = gradV * f(x)
% Vdot = gradV(1)*dx1 + gradV(2)*dx2;
% Vdot = simplify(Vdot);
% 
% disp('Lyapunov function V(x1, x2):');
% disp(V);
% disp('Time derivative of V (Vdot):');
% disp(Vdot);

%--------------------------------------------------------------
% syms x1 x2 real
% 
% % Define the Lyapunov function
% V = 2*x1^2 - 4*x1*x2 + x2^2;
% 
% % Define the system dynamics
% dx1 = -x2;
% dx2 = x1 + (x1^2 - 1)*x2;
% 
% % Compute the gradient of V
% gradV = gradient(V, [x1, x2]);
% 
% % Compute V̇ = gradV * f(x)
% Vdot = gradV(1)*dx1 + gradV(2)*dx2;
% Vdot = simplify(Vdot);
% 
% disp('Lyapunov function V(x1, x2):');
% disp(V);
% disp('Time derivative of V (Vdot):');
% disp(Vdot);
% 
