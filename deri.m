function p = deri(u)
Globals;
p = zeros(1, size(u)(2));
p(2:end-1) = (u(3:end) - u(1:end-2))./(2*dx);
p(1) = (u(2) - u(1))/dx;
p(end) = (u(end) - u(end - 1))/dx;

return

