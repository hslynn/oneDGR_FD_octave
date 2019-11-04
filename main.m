GlobalsGR;

xl=0; xr=1;          %x domain [xl,xr]
N = 40;              %J: number of division for
dx = (xr-xl) / N;    %dx: mesh size
dt = 0.9*dx;

% Evaluate the initial conditions
x = xl : dx : xr;        % generate the grid point
init_schwarzschild_kerr_schild;

% Find the approximate solution at each time step
t_now = 0.0;
t_end = 10000.0
time_seq = [];
rhs_g11_seq = [];
rhs_Pi11_seq = [];
rhs_Phi11_seq = [];
C0_seq = [];
C1_seq = [];
Cr11_seq = [];

for t_now < t_end
    advance_time(dt, dx);

    time = time+dt;                                                                                  
    time_seq = [time_seq, time];
    rhs_g11_seq = [rhs_g11_seq, max(max(abs(rhs_g11)))];
    rhs_Pi11_seq = [rhs_Pi11_seq, max(max(abs(rhs_Pi11)))];
    rhs_Phi11_seq = [rhs_Phi11_seq, max(max(abs(rhs_Phi11)))];

    C0_seq = [C0_seq, max(max(abs(C0)))];
    C1_seq = [C1_seq, max(max(abs(C1)))];
    Cr11_seq = [Cr11_seq, max(max(abs(Cr11)))];
    if (mod(tstep, 1000) == 0)
        %figure(1); plot(x, g00-g00_exact); title(['Error of g00, t = ', num2str(time)]); drawnow; pause(.1);
        %figure(2); plot(x, g01-g01_exact); title(['Error of g01, t = ', num2str(time)]); drawnow; pause(.1);
        figure(3); plot(x, g11-g11_exact); title(['Errof of g11, t = ', num2str(time)]); drawnow; pause(.1);
        %figure(4); plot(x, Pi00-Pi00_exact); title(['t = ', num2str(time)]); drawnow; pause(.1);
        %figure(5); plot(x, Pi01-Pi01_exact); title(['t = ', num2str(time)]); drawnow; pause(.1);
        figure(6); plot(x, Pi11-Pi11_exact); title(['Error of Pi11, t = ', num2str(time)]); drawnow; pause(.1);
        %figure(7); plot(x, Phi00-Phi00_exact); title(['t = ', num2str(time)]); drawnow; pause(.1);
        %figure(8); plot(x, Phi01-Phi01_exact); title(['t = ', num2str(time)]); drawnow; pause(.1);
        figure(9); plot(x, Phi11-Phi11_exact); title(['Error of Phi11, t = ', num2str(time)]); drawnow; pause(.1);
        figure(22); plot(x, g11.*g00 - g01.*g01); title(['Det(g), t = ', num2str(time)]); drawnow; pause(.1);

        %figure(10); plot(x, rhs_g11); title(['rhs\_g11, t = ', num2str(time)]); drawnow; pause(.1);
        %figure(11); plot(x, rhs_Pi11); title(['rhs\_Pi11, t = ', num2str(time)]); drawnow; pause(.1);
        %figure(12); plot(x, rhs_Phi11); title(['rhs\_Phi11, t = ', num2str(time)]); drawnow; pause(.1);

        figure(13); semilogy(time_seq, C0_seq); title(['max of C0 with time']); drawnow; pause(.1);
        figure(14); semilogy(time_seq, C1_seq); title(['max of C1 with time']); drawnow; pause(.1);
        figure(15); semilogy(time_seq, Cr11_seq); title(['max of Cr11 with time']); drawnow; pause(.1);

        figure(16); semilogy(time_seq, rhs_g11_seq); title(['max of rhs\_g11 with time']); drawnow; pause(.1);
        figure(17); semilogy(time_seq, rhs_Pi11_seq); title(['max of rhs\_Pi11 with time']); drawnow; pause(.1);
        figure(18); semilogy(time_seq, rhs_Phi11_seq); title(['max of rhs\_Phi11 with time']); drawnow; pause(.1);

    end;

end
for n = 1:Nt
    t = n*dt;
    gr = exp(-c*(xr-t-0.2)^2); % BC at right side
    if n==1 % first time step
        for j=2:J % interior nodes
            u(j,n) = f(j) - 0.5*mu*(f(j+1)-f(j-1)) + ...
                    0.5*mu^2*(f(j+1)-2*f(j)+f(j-1));
        end
    u(1,n) = gl;   % the left-end point
    u(J+1,n) = gr; % the right-end point
    else
        for j=2:J % interior nodes
            u(j,n) = u(j,n-1) - 0.5*mu*(u(j+1,n-1)-u(j-1,n-1)) + ...
                    0.5*mu^2*(u(j+1,n-1)-2*u(j,n-1)+u(j-1,n-1));
        end
        u(1,n) = gl; % the left-end point
        u(J+1,n) = gr; % the right-end point
    end

    % calculate the analytic solution
    for j=1:J+1
    xj = xl + (j-1)*dx;
    u_ex(j,n)=exp(-c*(xj-t-0.2)^2);
    end
end

% plot the analytic and numerical solution at different times
figure;
hold on;
n=10;
plot(x,u(:,n),'r.',x,u_ex(:,n),'r-');
% r for red
n=30;
plot(x,u(:,n),'g.',x,u_ex(:,n),'g-');
n=50;
plot(x,u(:,n),'b.',x,u_ex(:,n),'b-');
legend('Numerical t=0.1','Analytic t=0.1',...
'Numerical t=0.3','Analytic t=0.3',...
'Numerical t=0.5','Analytic t=0.5');
title('Numerical and Analytic Solutions at t=0.1, 0.3, 0.5');
