% Testing the cord method to find the approximation of the smallest
% zero of the fifth-order Chebyshev polynomial
% Inputs -> None. Call the function
% Outputs -> zc: numerical approximation of the zero obtained with the
% chord method
%            ec: error vector with components |x^k - z0| (k = 0,1,...),
% where z0 = cos(9pi/10) is the exact zero of the polynomial in the 
% interval [-1, -0.9], while x^k is the sequence convering to z0 generated 
% by the chord method
%             x: row vector of 1000 evenly spaced nodes in [-1,1]
%             f: row vector representing the function evaluated at x.
% Also plots the graph of f(x) as figure(1), the convergence history using 
% semi-log scale as figure(2) and the plot of e[k+1] on the y-axis and e[k] 
% on the a-xis using log-log scale as figure(3).

function [zc, ec, x, f] = test_zero ()
  
% Parameters for the chord function
    func = @(x) 16 * x.^5 - 20 * x.^3 + 5 * x; % function handle 
    tol = 1e-15;    % res tolerance 
    Nmax = 20000; % max iterations = 20000
    a = -0.99;      % first guess
    b = -0.9;       % second guess
    x0 = cos(9*pi/10);     % actual answer
    
% Call chord method and set output to variables z0, iter, res, his
    [z0, iter, res, his] = chord_method(func, a, b, tol, Nmax);
    
    zc = z0;    % Computation the zero from chord method stored in zc
    ec = abs(his-x0);   % error vector = |x_k - x_iter(last)| for all k
    
    x = linspace(-1, 1, 1000);  % set of x values [-1, 1]
    f = func(x);                % f(x)
    
% Plot function f(x) as figure(1)
    figure(1)
    plot(x, f)
    title('f(x)');
    
% Plot convergence history using semi-log scale as figure(2)
    figure(2)
    semilogy(1:iter, ec)  % 1 to iteration, ec values
    title('Semilog plot of error');

% Plot e[k+1] (y-axis) vs e[k] (x-axis) using log-log scale as figure (3)
    figure(3)
    loglog(ec(1:iter-1), ec(2:iter) ); % (e[k], e[k+1])
    title('Loglog plot of Rate of Convergence (RoC) of error');
end
    
    
    
