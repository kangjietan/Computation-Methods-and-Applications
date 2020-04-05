% Compute the norm of the vector by find the sum of
% each element squared and then taking the square root
% Input -> n-dimensional vector (row or columun vector)
% Output -> Norm of the vector

function [z] = compute_Euclidean_norm(x)  n = length(x);  % Number of elements inside the vector x
  z = 0;	% Keeps track of sum
  
  for i = 1 : n	% Index for input number
    z = z + x(i).^2;  % Take all elements in the vector 1 by 1 and square them
  end
  z = sqrt(z);	% Take the sqrt of the sum of all elements squared
end