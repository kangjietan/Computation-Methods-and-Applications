% Using the functions computed in exercise 1 to compute the numerical
% approximation of the integral of
% (1./(1+x^2))*cos((3/2)*exp(-x^2)) - x^3/30 from -3 to 1 -> (2)
% Also computes the absolute values of the integration errors of each rule
% Plots the equation (2) as figure(1) and errors as figure(2)
% Input -> None. Call the function
% Output -> en,et,es: row vectors with components the absolute values of the
%                     integration errors

function [em, et, es] = test_integration()
  % Integral of function from a to b
  f = @(x) (1./(1+x.^2)).*cos((3/2).*exp(-x.^2)) - x.^3./30; % Integral
  a = -3;
  b = 1;
  
  n = 100; % # of nodes
  I = 1.6851344770476;  % Reference value of the integral
  
  % Evaluating integrand function
  x = linspace(a,b,n);
  y = f(x);
  
  % Row vector for integration errors of each rule
  Im = zeros(n-1,1);  % Mid-point
  It = zeros(n-1,1);  % Trapezoidal
  Is = zeros(n-1,1);  % Simpson
  
  % Calculating n-number numerical approximation of integral
  for i = 2: n
    Im(i-1) = int_midpoint_rule(f,a,b,i);
    It(i-1) = int_trapezoidal_rule(f,a,b,i);
    Is(i-1) = int_Simpson_rule(f,a,b,i);
  end
  
  % Absolute value of integration errors for each rule. Reference I - rule I
  errM = abs(I-Im); % Mid-point
  errT = abs(I-It); % Trapezoidal
  errS = abs(I-Is); % Simpson
  
  % integrand function plotted
  figure(1)
  clf
  plot(x, y)
  
  xe = [2:n]; % x-values to plot errors. Starting at 2, increment by 1 to n
  
  % Errors plotted
  figure(2)
  clf
  loglog(xe, errM)  % Mid-point integration errors
  hold on
  loglog(xe, errT)  % Trapezoidal integration errors
  loglog(xe, errS)  % Simpson's rule integration errors
  legend('Mid-point','Trapezoidal','Simpson')
end
