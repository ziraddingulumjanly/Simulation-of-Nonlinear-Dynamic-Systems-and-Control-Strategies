clc; clear;

fprintf('Part (a): Finding Equilibrium Points\n');

syms x1 x2

% Define the system
dx1 = (x1 - 1)*(x1 + x2);
dx2 = x2 - x1^2;

% Solve for equilibrium points
eq_points = solve([dx1 == 0, dx2 == 0], [x1, x2]);

% Convert symbolic results to numeric
X_eq = double([eq_points.x1, eq_points.x2]);

% Display the equilibrium points
disp('Equilibrium points (x1, x2):');
disp(X_eq);

fprintf('\nPart (b): Stability Analysis \n');

% Compute the Jacobian matrix
J = jacobian([dx1; dx2], [x1, x2]);

% Evaluate the Jacobian at each equilibrium point
for i = 1:size(X_eq, 1)
    x1_val = X_eq(i,1);
    x2_val = X_eq(i,2);
    
    J_eval = double(subs(J, [x1, x2], [x1_val, x2_val]));
    eigenVals = eig(J_eval);
    
    fprintf('\nEquilibrium Point #%d: (%.2f, %.2f)\n', i, x1_val, x2_val);
    disp('Jacobian matrix:');
    disp(J_eval);
    disp('Eigenvalues:');
    disp(eigenVals);
    
    if all(real(eigenVals) < 0)
        fprintf('This point is STABLE.\n');
    elseif any(real(eigenVals) > 0)
        fprintf('This point is UNSTABLE.\n');
    else
        fprintf('This point is MARGINALLY STABLE or needs deeper analysis.\n');
    end
end
