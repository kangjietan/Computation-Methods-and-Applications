function [I]=int_Simpson_rule(fun,a,b,n)

h = (b-a)/(n-1);
xj(1) = 0;
xk(1) = 0;
f(1) = 0;

for j=1:n
  xj(j) = a + (j-1)*h;
end

for k=1:n-1
  xk(k) = (xj(k+1) + xj(k))/2;
end

for i=2:n
  f(i) = f(i-1) + h*(fun(xj(i-1))+4*fun(xk(i-1))+fun(xj(i)))/6;
end

I = f(n);

end