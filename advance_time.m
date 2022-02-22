function u = advance_time(u, rhs, dt)
Globals;
u(2:end-1) = 0.5*(u(1:end-2) + u(3:end)) + rhs(2:end-1)*dt;
u(1) = u(1) + rhs(1)*dt;
%u(end) = u(end) + rhs(end)*dt;

return
