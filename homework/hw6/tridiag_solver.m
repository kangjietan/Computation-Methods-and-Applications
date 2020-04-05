% Implements the Thomas algorithm to solve tridiagonal linear systems of equations
% of the form (2) [tridiagonal matrix]*[x1 to xn] = [b1 to bn]
% Input -> e = [e1 e2 ... en-1]
%          a = [a1 a2 ... an]
%          c = [c1 c2 ... cn-1]
%          b = [b1 b2 ... bn]^T
% Ouput -> x: solution to the linear system (2) (column vector)

function [x] = tridiag_solver(e,a,c,b)
  n = length(a);  % for length of solutions
  alpha(1) = a(1);  % initial calculation of alpha
  x = zeros(n,1);   % Column vector for y. Used to calculate x
  y = zeros(n,1);   % Column vector for solutions x
  
  % Computing the coeffiecents of L and U
  for i = 2: n
    B(i-1) = e(i-1)/alpha(i-1); % L coeffiecents
    alpha(i) = a(i)-(B(i-1)*c(i-1));  % U coeffiecents
  end
  
  %L = eye(n)+diag(B,-1);
  %U = diag(alpha)+diag(c,1);
  
  % Forward substitution in lecture notes ignoring zeros in the matrix L
  % y(1) = b(1) -> Initial
  % y(i) = b(i) - B(i)*y(i-1) -> algorithm
  y(1) = b(1);
  for i = 2: n
    y(i) = b(i)-(B(i-1)*y(i-1));
  end
  
  % Backward substitution in lecture notes ignoring zeros in the matrix U
  % x(n) = y(n)/alpha(n) -> Initial
  % x(i) = 1/alpha(n) * (y(i)-c(i)*x(i+1)) -> i = n-1,...,1 -> algorithm
  x(n) = y(n)/alpha(n);
  for i = n-1:-1:1
    x(i) = (1/alpha(i)) * (y(i)-c(i)*x(i+1));
  end
end