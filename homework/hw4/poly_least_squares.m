% Implements the least squares method to approximate a data set in terms of a
% polynomial model of degree M.
% Input -> xi: vector of nodes xi=[xi(1) ... xi(N)]
%          yi: vector of data points yi=[yi(1) ... yi(N)] corresponding to xi
%          M: degree of polynomial model
% Output -> a: vector of coefficients representing the polynomial of degree M
%           err: error between the model and the data in the 2-norm

function [a,err] = poly_least_squares(xi,yi,M)
  n = length(xi);
  B = zeros(n, M+1); % n by M+1 matrix for xi values
  
  for i = 1: M+1
    B(:, i) = xi.^(i-1);  % Matrix B containing xi raised to power i-1
  end
  
  % Solving for a -> coefficients for polynomial
  a = inv(B'*B) * B'*yi;
  
  % Evaluated xi values for coefficients polynomial [nxm * mx1]
  p = B*a;
  
  % Summation of the error between the model and data in the 2-norm
  err = sum((yi-p).^2);
end