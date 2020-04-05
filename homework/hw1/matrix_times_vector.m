% Computes the product between n-dimensonal matrix
% and n-dimensional (column) vector
% Input -> A: n x n matrix / x: n x 1 vector
% Output -> x: n x 1 vector

function [y] = matrix_times_vector(A, x)
  n = size(A);
  m = length(x);
  
  for i = 1: m  % Index for the row
    sum = 0;  % Reset to zero for next row
    for j = 1: n  % Index for column
      y(i,1) = sum + A(i,j) * x(j); 
      % (row i, j elements of the row) of the matrix * 
      % (j elements) of the vector
      % Store product + sum (previous calculations) in row i of output
      sum = y(i); % Store product of matrix element i * vector element i
    end
  end
end