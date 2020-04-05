% Plots the Lebesgue function for the aforementioned four cases in exercise 2.
% The function should also return the value of the Lebesgue constants L1, L2, 
% L3, L4 and the maximum point-wise errors e1, e2, e3, e4.
% Input -> None
% Output -> L1, L2, L3, L4: Lebesgue constant of each case
%           e1, e2, e3, e4: Maximum point-wise errors

function [L1, L2, L3, L4, e1, e2, e3, e4] = Lebesgue_constant_and_errors()
  a = @(x) 1./(1+sin(2*pi.*x).^2);  % Function
  x = linspace(-1, 1, 1000);
  N = 14; % Case 1
  N2 = 40;  % Case 2
  f = a(x); % Function evaluated at x points
  
  %ESeqn = -1+2.*(j/N);  % Evenly spaced equation (2)
  %UESeqn = cos(pi.*(i/N2)); % Unevenly-spaced equation (3)
  
  % Evenly-spaced grid with N+1 points -> ES
  % Unevenly-spaced grid with N+1 points (Chebyshev-Gauss-Lobatto points) -> UES
  % ES14 = Evenly-spaced points with N = 14
  % ES40 = Evenly-spaced points with N = 40
  % UES14 = Unevenly-spaced points with N = 14
  % UES40 = Unevenly-spaced points with N = 40
  
  ES14 = linspace(-1, 1, 15); % Equation 2 x-points [0:14] = 15 points
  ES40 = linspace(-1, 1, 41); % Equation 2 x-points [0:40] = 41 points
  
  % N = 14, Unevenly-spaced grid points
  for j = 0: N
    UES14(j+1) = cos(pi.*(j/N));
  end
  
  % N = 40, Unevenly-spaced grid points
  for i = 0: N2
    UES40(i+1) = cos(pi.*(i/N2));
  end
  
  % Plotting the Lebesgue function
  
  % #1-a: N = 14
  xi = ES14;  % Evenly-spaced x points
  yi = a(ES14); % Function evaluated at Evenly-spaced x points
  % Lebesgue function evaluated at x and constant
  [lambda, L1] = compute_Lebesgue_function(xi, x);
  [p] = Lagrange_interpolation(xi, yi, x);
  p1 = max(p); % Max value of interpolant
  y = lambda; % Constant
  e1 = max(abs(a(x)-p1)); % Maximum point-wise errors
  
  % #1-b
  figure(1)
  clf
  plot(x, y, 'r') % Lebesgue
  
  % #2-a: N = 40
  xi = ES40;  % Evenly-spaced x points
  yi = a(ES40); % Function evaluated at Evenly-spaced x points
  % Lebesgue function evaluated at x and constant
  [lambda, L2] = compute_Lebesgue_function(xi, x);
  [p] = Lagrange_interpolation(xi, yi, x);
  p2 = max(p);  % Max value of interpolant
  y = lambda; % Constant 
  e2 = max(abs(a(x)-p2)); % Maximum point-wise errors
  
  % #2-b
  figure(2)
  clf
  plot(x, y, 'r') % Lebesgue
  
  % #3-a: N = 14
  xi = UES14;  % Unevenly-spaced x points
  yi = a(UES14); % Function evaluated at Evenly-spaced x points
  % Lebesgue function evaluated at x and constant
  [lambda, L3] = compute_Lebesgue_function(xi, x);
  [p] = Lagrange_interpolation(xi, yi, x);
  p3 = max(p);  % Max value of interpolant
  y = lambda; % Constant
  e3 = max(abs(a(x)-p3)); % Maximum point-wise errors
  
  % #3-b
  figure(3)
  clf
  plot(x, y, 'r') % Lebesgue
  
  % #4-a: N = 40
  xi = UES40;  % Unevenly-spaced x points
  yi = a(UES40); % Function evaluated at Evenly-spaced x points
  % Lebesgue function evaluated at x and constant
  [lambda, L4] = compute_Lebesgue_function(xi, x);
  [p] = Lagrange_interpolation(xi, yi, x);
  p4 = max(p); % Max value of interpolant
  y = lambda; % Constant
  e4 = max(abs(a(x)-p4)); % Maximum point-wise errors
  
  % #4-b
  figure(4)
  clf
  plot(x, y, 'r') % Lebesgue
end