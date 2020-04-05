% Computes Lagrange interpolant of a given set of data points (xi, yi)
% Input -> xi: vector of interpolation nodes
%          yi: vector of data points at the interpolation nodes
%          x: vector of points at which we want to evaluate the Lagrange
%             polynomial interpolant
% Output -> y: vector representing the Lagrange polynomial interpolant evaluated at x

function [y] = Lagrange_interpolation(xi, yi, x)
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
    y = y + yi(k)*C(k, :);  % Evaluating Lagrange polynomials at x
  end
end