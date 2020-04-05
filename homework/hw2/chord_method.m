% Chord method to find the zeros of a nonlinear equation. Function should return
% the numerical approximation of the zero when the increment at iteration k+1
% is |x^(k+1) - x^k| or when the iteration number reaches the maximum value.

% Input -> fun: function handle representing f(x)
%          a,b: interval [a,b] in which we believe there is a zero
%          tol: maximum tolerance allowed for the increment |x^(k+1) - x^k
%          Nmax: maximum number of iterations allowed

% Output -> z0: approximation of the zero
%           iter: number of iterations to achieve tolerance tol on the increment
%           res: residual at z0 (i.e., |f(z0)|)
%           his: vector collecting all the elements of the sequence

function [z0, iter, res, his] = chord_method(fun, a, b, tol, Nmax)
  x0 = (a+b)/2; % Midpoint of [a,b]
  q = (fun(b) - fun(a)) / (b-a);  % Slope of the chord that points through a & b
  his = [x0]; % Store initial computation
  iter = 1; % After first computation
  e = 1; % 
  
  while (e >= tol && iter < Nmax) % 
    xn = x0 - (1/q)*fun(x0);  % Chord method
    his = [his, xn];  % Convergence history
    e = abs(xn - x0); % |x^(k+1) - x^k|
    x0 = xn;  % x^k for next computation
    iter = iter + 1;  % Increment iteration after computation
  end
  
  res = abs(fun(xn)); % |f(z0)|
  z0 = xn;  % The zero
end