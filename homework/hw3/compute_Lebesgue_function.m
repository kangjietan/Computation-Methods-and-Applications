% Given the vector of interpolation nodes xi = [xi(1) ... x(N+1)] return the
% Lebesgue function and constant
% Input -> xi: vector of interpolation nodes xi = [xi(1) ... x(N+1)]
%          x: vector of points at which we want to evaluate the Lebesgue function
% Output -> lamda: Lebesgue function evaluated at x
%           L: Lebesgue constant, computed by taking the maximum of lambda

function [lambda, L] = compute_Lebesgue_function(xi, x)
  n = length(xi); % Number of interpolation nodes
  m = length(x);  % Number of vector points
  C = ones(n, m); % n by m matrix of ones
  y = 0;  % For storing evaluated interpolant
  
  for k = 1: n  % Lk(x) -> Lagrange interpolating polynomials
    for j = 1: n
      if j~=k % Only one value for each argument
        C(k, :) = C(k, :).*(x-xi(j))/(xi(k)-xi(j)); % Lagrange basis
      end
    end
    y = y + abs(C(k, :)); % Evaluating Lebesgue function at x
  end
  lambda = y;
  L = max(lambda);  % Lebesgue constant -> maximum of the function lambda
end