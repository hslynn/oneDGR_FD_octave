Globals;

xl=1.5; xr=1.9;          %x domain [xl,xr]
N = 1000;              
dx = (xr-xl) / N;    %dx: mesh size
dt = 0.9*dx;

% Evaluate the initial conditions
x = xl : dx : xr;        % generate the grid point
init_schwarzschild_kerr_schild;

% Find the approximate solution at each time step
time = 0.0;
totalTime = 10000.0;
Nsteps = totalTime/dt;
time_seq = [];
rhs_g11_seq = [];
rhs_Pi11_seq = [];
rhs_Phi11_seq = [];
C0_seq = [];
C1_seq = [];
Cr11_seq = [];
Cr01_seq = [];
Cr00_seq = [];

for tstep=1:Nsteps                                                                                 
    time_seq = [time_seq, time];
    compute_RHS;
    
    rhs_g11_seq = [rhs_g11_seq, L2norm(rhs_g11)];
    rhs_Pi11_seq = [rhs_Pi11_seq, L2norm(rhs_Pi11)];
    rhs_Phi11_seq = [rhs_Phi11_seq, L2norm(rhs_Phi11)];
    C0_seq = [C0_seq, L2norm(C0)];
    C1_seq = [C1_seq, L2norm(C1)];
    Cr11_seq = [Cr11_seq, L2norm(Cr11)];
    %g00 = advance_time(g00, rhs_g00, dt);
    %g01 = advance_time(g01, rhs_g01, dt);
    g11 = advance_time(g11, rhs_g11, dt);
    %Pi00 = advance_time(Pi00, rhs_Pi00, dt);
    %Pi01 = advance_time(Pi01, rhs_Pi01, dt);
    Pi11 = advance_time(Pi11, rhs_Pi11, dt);
    %Phi00 = advance_time(Phi00, rhs_Phi00, dt);
    %Phi01 = advance_time(Phi01, rhs_Phi01, dt);
    Phi11 = advance_time(Phi11, rhs_Phi11, dt);
    time = time+dt;                                                                                  
    if (mod(tstep, 10000) == 0)
        %figure(1); plot(x, g00-g00_exact); title(['Error of g00, t = ', num2str(time)]); drawnow; pause(.1);
        %figure(2); plot(x, g01-g01_exact); title(['Error of g01, t = ', num2str(time)]); drawnow; pause(.1);
        %figure(3); plot(x, g11-g11_exact); title(['Errof of g11, t = ', num2str(time)]); drawnow; pause(.1);
        %figure(4); plot(x, Pi00-Pi00_exact); title(['t = ', num2str(time)]); drawnow; pause(.1);
        %figure(5); plot(x, Pi01-Pi01_exact); title(['t = ', num2str(time)]); drawnow; pause(.1);
        figure(6); plot(x, Pi11-Pi11_exact); title(['Error of Pi11, t = ', num2str(time)]); drawnow; pause(.1);
        %figure(7); plot(x, Phi00-Phi00_exact); title(['t = ', num2str(time)]); drawnow; pause(.1);
        %figure(8); plot(x, Phi01-Phi01_exact); title(['t = ', num2str(time)]); drawnow; pause(.1);
        figure(9); plot(x, Phi11-Phi11_exact); title(['Error of Phi11, t = ', num2str(time)]); drawnow; pause(.1);
        %figure(22); plot(x, g11.*g00 - g01.*g01); title(['Det(g), t = ', num2str(time)]); drawnow; pause(.1);

        %figure(10); plot(x, rhs_g11); title(['rhs\_g11, t = ', num2str(time)]); drawnow; pause(.1);
        figure(11); plot(x, rhs_Pi11); title(['rhs\_Pi11, t = ', num2str(time)]); drawnow; pause(.1);
        figure(12); plot(x, rhs_Phi11); title(['rhs\_Phi11, t = ', num2str(time)]); drawnow; pause(.1);

        %figure(13); semilogy(time_seq, C0_seq); title(['L2 norm of C0 with time']); drawnow; pause(.1);
        figure(14); semilogy(time_seq, C1_seq); title(['L2 norm of C1 with time']); drawnow; pause(.1);
        %figure(15); semilogy(time_seq, Cr11_seq); title(['L2 norm of Cr11 with time']); drawnow; pause(.1);

        %figure(16); semilogy(time_seq, rhs_g11_seq); title(['L2 norm of rhs\_g11 with time']); drawnow; pause(.1);
        figure(17); semilogy(time_seq, rhs_Pi11_seq); title(['L2 norm of rhs\_Pi11 with time']); drawnow; pause(.1);
        figure(18); semilogy(time_seq, rhs_Phi11_seq); title(['L2 norm of rhs\_Phi11 with time']); drawnow; pause(.1);

    end;
end
