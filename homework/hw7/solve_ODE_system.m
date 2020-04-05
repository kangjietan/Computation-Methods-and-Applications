% (4) dy(1)/dt = -y(1) + y(2)*y(3)
%     dy(2)/dt = -y(2)+(y(3)-2)*y(1)
%     dy(3)/dt = 1-y(1)*y(2)
% Using the function AB2.m to comptue the numerical solution to (4).
% Also plots the graph of y(1), y(2), y(3) versus time.
% And a 3D plot of the curve y(1)t, y(2)t, y(3)t

function [y,t] = solve_ODE_system()
  % Given
  fun = @(y,t) [-y(1) + y(2)*y(3); -y(2)+(y(3)-2)*y(1); 1-y(1)*y(2)];
  NSTEPS = 1e5;
  DT = 1e-3;
  IOSTEP = 50;
  y0 = [1;2;3];
  
  [y,t] = AB2(fun,y0,NSTEPS,DT,IOSTEP)
  
  % Graphs of y(1), y(2), y(3) versus time
  figure(1)
  clf
  plot(t,y(1,:))
  hold on
  plot(t,y(2,:))
  plot(t,y(3,:))
  
  % 3D plot of the curve y(1)t, y(2)t, y(3)t
  figure(2)
  clf
  plot3(y(1,:),y(2,:),y(3,:))
end