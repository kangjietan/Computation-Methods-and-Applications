% Simpson's rule [h/6*summation of f(xk-1)+4(midpoint-x)+f(xk)] 
% Composite numerical approximation of I(f).
% (1) I(f) = integral of f(x)dx from a to b
% Input -> fun: function handle representing f(x)
%          a,b: endpoints of the inegration interval
%          n: number of evenly-spaced points in [a,b] (including endpoints)
% Output -> I: numerical approximation of integral (1)

function [I] = int_Simpson_rule(fun,a,b,n)
  h = (b-a)/(n-1);  % Height
  x = linspace(a,b,n);  % Evenly-spaced x-values between [a,b] including a,b
  I = 0;  % Clear value of I
  
  % Simpson's formula
  for i = 2: n
    x1 = fun(x(i-1)); % f(xk-1)
    x2 = 0.5 * (x(i-1) + x(i)); % x(k) for f-bar -> midpoint
    x2 = fun(x2); % f-bar(k)
    x3 = fun(x(i)); % f(xk)
    I = I + x1 + 4*x2 + x3; % Summation of evaluated x-values for formula
  end
  
  I = (h/6)*I;  % Constant h outside the summation to be multiplied
end