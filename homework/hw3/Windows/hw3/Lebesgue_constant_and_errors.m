% 

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
  
  % N = 14
  for j = 0: N
    UES14(j+1) = cos(pi.*(j/N));
  end
  
  % N = 40
  for i = 0: N2
    UES40(i+1) = cos(pi.*(i/N2));
  end
  
  % Plotting f(x), data points of interpolant, and interpolant through points
  
  % #1-a: N = 14
  xi = ES14;  % Evenly-spaced x points
  yi = a(ES14); % Function evaluated at Evenly-spaced x points
  % Lebesgue function evaluated at x and constant
  [lambda, L1] = compute_Lebesgue_function(xi, x);
  y = lambda; % Constant
  fm = max(f);  % Max of of f(x) 
  e1 = abs(fm-L1) % Maximum point-wise errors
  
  % #1-b
  figure(1)
  clf
  plot(x, f, 'b') % F(x)
  hold 
  plot(xi, yi, 'ro')  % Evenly-spaced grid points {xi, yi} -> red circles
  plot(x, y, 'r') % Interpolant
  
  % #2-a: N = 40
  xi = ES40;  % Evenly-spaced x points
  yi = a(ES40); % Function evaluated at Evenly-spaced x points
  % Lebesgue function evaluated at x and constant
  [lambda, L2] = compute_Lebesgue_function(xi, x);
  y = lambda; % Constant 
  e2 = abs(fm-L2) % Maximum point-wise errors
  
  % #2-b
  figure(2)
  clf
  plot(x, f, 'b') % F(x)
  hold 
  plot(xi, yi, 'ro')  % Evenly-spaced grid points {xi, yi} -> red circles
  plot(x, y, 'r') % Interpolant
  
  % #3-a: N = 14
  xi = UES14;  % Unevenly-spaced x points
  yi = a(UES14); % Function evaluated at Evenly-spaced x points
  % Lebesgue function evaluated at x and constant
  [lambda, L3] = compute_Lebesgue_function(xi, x);
  y = lambda; % Constant
  e3 = abs(fm-L3) % Maximum point-wise errors
  
  % #3-b
  figure(3)
  clf
  plot(x, f, 'b') % F(x)
  hold 
  plot(xi, yi, 'ro')  % Unevenly-spaced grid points {xi, yi} -> red circles
  plot(x, y, 'r') % Interpolant
  
  % #4-a: N = 40
  xi = UES40;  % Unevenly-spaced x points
  yi = a(UES40); % Function evaluated at Evenly-spaced x points
  % Lebesgue function evaluated at x and constant
  [lambda, L4] = compute_Lebesgue_function(xi, x);
  y = lambda; % Constant
  e4 = abs(fm-L4) % Maximum point-wise errors
  
  % #4-b
  figure(4)
  clf
  plot(x, f, 'b') % F(x)
  hold 
  plot(xi, yi, 'ro')  % Unevenly-spaced grid points {xi, yi} -> red circles
  plot(x, y, 'r') % Interpolant
end