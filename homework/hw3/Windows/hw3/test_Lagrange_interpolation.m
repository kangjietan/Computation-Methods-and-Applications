% f(x) = 1./(1+sin(2*pi.*x).^2) -> (1)
% Using function in Exercise 1, determine the Lagrange interpolant of f
% i.e. the polynomial that interpolates the set of data {xi, f(xi)} in the
% following cases:
% Evenly-spaced grid with N+1 points -> xj = -1+2.*(j/N). j = 0,...,N -> (2)
% Unevenly-spaced grid with N+1 points -> xj = cos(pi.*(i/N2)). j = 0,1,...,N -> (3)
% Input -> None
% Output -> x: vector of 1000 evenly-spaced nodes in [-1, 1]
%           f: vector representing (1) at x
%           P1: Lagrangian interpolant of (1) built on the grid (2) with N = 14,
%               and evaluated at x
%           P2: Lagrangian interpolant of (1) built on the grid (2) with N = 40,
%               and evaluated at x
%           P3: Lagrangian interpolant of (1) built on the grid (3) with N = 14,
%               and evaluated at x
%           P4: Lagrangian interpolant of (1) built on the grid (3) with N = 40,
%               and evaluated at x
% The function should also plot (1) in blue and the Lagrangian interpolants
% in red obtained by using the evenly-spaced and unevenly-spaced grids for the
% cases N = 14 and N = 40 (4 different figures). Each figure includes the graphs
% of f(x), the data points of the grids, and the interpolant through those points

function [x, f, P1, P2, P3, P4] = test_Lagrange_interpolation()
  a = @(x) 1./(1+sin(2*pi.*x).^2);  % Function
  x = linspace(-1,1,1000);
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
  
  ES14 = linspace(-1, 1, 15);  % Equation 2 x-points [0:14] = 15 points
  ES40 = linspace(-1, 1, 41); % Equation 2 x-points [0:40] = 41 points
  
  % N = 14
  for j = 0: N
    UES14(j+1) = cos(pi.*(j/N));  % Equation 3-x points
  end
  
  % N = 40
  for i = 0: N2
    UES40(i+1) = cos(pi.*(i/N2)); % Equation 3-x points
  end
  
  % Plotting f(x), data points of interpolant, and interpolant through points
  
  % #1-a: N = 14
  xi = ES14;  % Evenly-spaced x points
  yi = a(ES14); % Function evaluated at Evenly-spaced x points
  [P1] = Lagrange_interpolation(xi, yi, x); % Interpolant y-points for ES14
  y = P1;
  
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
  [P2] = Lagrange_interpolation(xi, yi, x);  % Interpolant y-points for ES40
  y = P2;
  
  % #2-b:
  figure(2)
  clf
  plot(x, f, 'b') % F(x)
  hold
  plot(xi, yi, 'ro')  % Evenly-spaced grid points {xi, yi} -> red circles
  plot(x, y, 'r') % Interpolant
  
  % #3-a: N = 14
  xi = UES14;  % Unevenly-spaced x points
  yi = a(UES14);  % Function evaluated at Unevenly-spaced x points
  [P3] = Lagrange_interpolation(xi, yi, x); % Interpolant y-points for UES14
  y = P3;
  
  % #3-b
  figure(3)
  clf
  plot(x, f, 'b') % F(x)
  hold
  plot(xi, yi, 'ro')  % Unevenly-spaced grid points {xi, yi} -> red circles
  plot(x, y, 'r') % Interpolant
  
  % #4-a: N = 40
  xi = UES40;  % Unevenly-spaced x points
  yi = a(UES40);  % Function evaluated at Unevenly-spaced x points
  [P4] = Lagrange_interpolation(xi, yi, x); % Interpolant y-points for UES40
  y = P4;
  
  % #4-b
  figure(4)
  clf
  plot(x, f, 'b') % F(x)
  hold
  plot(xi, yi, 'ro')  % Unevenly-spaced grid points {xi, yi} -> red circles
  plot(x, y, 'r') % Interpolant
end
