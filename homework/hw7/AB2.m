% (1) dy(t)/dt = f(y(t),t)
%     y(0) = y0
% Computes the numerial solution of (1) by using the two-step Adams-Bashforth
% (AB2) scheme
% Input -> fun: function handle representing f(y,t)
%          y0 = column vector representing the initial condition y0
%          NSTEPS: total number of steps
%          DT: time step
%          IOSTEP: Input/output step. The numerical solution is saved in the 
%                  output matrix y every IOSTEP steps.
% Output -> y: n x S matrix collecting the time snapshots of the solution to (1) 
%              Note that the total number of snapshots S (including the initial 
%              condition) is floor(NSTEPS/IOSTEP)+1.
%           t: vector collecting the time instants at which the solution is 
%              saved in the output matrix y.

function [y,t] = AB2(fun,y0,NSTEPS,DT,IOSTEP)
  S = floor(NSTEPS/IOSTEP)+1;
  n = length(y0); % # of initial conditions
  y = zeros(n,S); % nxS matrix to store solutions
  y = y0; % Initial conditions
  ts = 0; % time step
  t = 0;  % vector saving the time steps for solutions
  
  % Starting AB2 using the Heun method
  % u1 = u0 + delta(t)/2 * [f(u0,t0) + f(u0+delta(t)*f(u0,t0), t1)]
  y1 = y0 + 0.5 * DT * (fun(y0+DT*fun(y0,ts),ts+DT) + fun(y0,ts));
  ts = DT;
  y2 = y1 + 0.5 * DT * (fun(y1+DT*fun(y1,ts),ts+DT) + fun(y1,ts));
  ts = DT*2;
  
  % AB2 scheme
  % un+1 = un + delta(t)/2 * [3f(un,tn) - f(un-1,tn-1)]
  for i = 3: NSTEPS
    y3 = y2 + 0.5 * DT * (3 * fun(y2,ts-DT) - fun(y1,ts-2*DT));
    ts = i*DT;
    
    % Storing the solution at every IOSTEP
    if mod(i, IOSTEP) == 0  % If i == iostep
      y = [y y3]; % Append solution to vector
      t = [t ts]; % Append time of solution
    end
    
    % Next computation needs current and previous
    y1 = y2;  % Previous
    y2 = y3;  % Current
  end
end