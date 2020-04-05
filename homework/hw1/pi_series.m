% The number pi can be defined as a limit of various
% converging series of numbers. This function returns
% the first 15 partial sums of a converging series
% Input -> None. Call the function
% Output -> row vector with components defined by
% the first 15 partial sums in the series

function [P, n, p] = pi_series()
  format long;
  a = 15; % Number of partial sum calculations
  P = zeros(1, a);  % Row vector of zeros, length a
  
  % Manually set P(k=0) & P(k=1)
  P0 = 1.2; % Can't index vector at 0
  P(1) = P0 - 18/77;  % Next sum at k=1
  
  % Converging series
  for k = 2: a  % Summation starts at P(2)
    x = 1 / (6*k+1);
    y = 1 / (6*k+5);
    P(k) = P(k-1) + (-1)^(k) * (x+y);
  end
  
  P = P * 3;  % Constant outside of the summation
  n = 0;
  p = 0;
end
