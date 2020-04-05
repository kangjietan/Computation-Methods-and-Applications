% Returns the numerical solution to the upper triangular system of equations
% by using the backward substitution algorithm.
% (1) [Upper triangular matrix]*[x1 to xn]^T = [b1 to bn]^T
% Input -> U: upper triangular matrix
%          b: column vector representing the right hand side of (1).
% Output -> x: solution to the linear system (1) (column vector)

function [x] = backward_sub(U,b)
  [n,m] = size(U);  % Size of the triangular matrix. Should be squared
  x = zeros(n,1); % column vector for solutions
  
  % Backward Substitution
  % x(k) = 1/U(k,k) * (d(k) - summation at j = k+1 to n of U(k,j)*x(j))
  for i = n:-1:1  % n to 1 by -1
    t = 0;
    for j = i+1: n
      t = t+U(i,j)*x(j);  % Summation from j = k+1 to n of U(k,j)*x(j))
    end
    x(i) = (b(i)-t)/U(i,i); % 1/U(k,k) * (d(k) - the summation above)
  end
end