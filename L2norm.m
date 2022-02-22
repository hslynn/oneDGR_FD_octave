function l2 = L2norm(u)
Globals;
l2 = sqrt(sum(u(10:end-10).*u(10:end-10)*dx));
return
