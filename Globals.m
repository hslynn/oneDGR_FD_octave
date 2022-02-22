% Purpose: declare global variables

global N x dx

% Low storage Runge-Kutta coefficients
rk4a = [            0.0 ...
        -567301805773.0/1357537059087.0 ...
        -2404267990393.0/2016746695238.0 ...
        -3550918686646.0/2091501179385.0  ...
        -1275806237668.0/842570457699.0];
rk4b = [ 1432997174477.0/9575080441755.0 ...
         5161836677717.0/13612068292357.0 ...
         1720146321549.0/2090206949498.0  ...
         3134564353537.0/4481467310338.0  ...
         2277821191437.0/14882151754819.0];
rk4c = [             0.0  ...
         1432997174477.0/9575080441755.0 ...
         2526269341429.0/6820363962896.0 ...
         2006345519317.0/3224310063776.0 ...
         2802321613138.0/2924317926251.0];

%GR 
global g00 g01 g11 Pi00 Pi01 Pi11 Phi00 Phi01 Phi11
global rhs_g00 rhs_g01 rhs_g11 rhs_Pi00 rhs_Pi01 rhs_Pi11 rhs_Phi00 rhs_Phi01 rhs_Phi11 
global g00_exact g01_exact g11_exact Pi00_exact Pi01_exact Pi11_exact Phi00_exact Phi01_exact Phi11_exact
global H0 H1 deriH00 deriH01 deriH10 deriH11
global DIRICHLET FREEZING bdry_type
global C0 C1 Cr00 Cr01 Cr11

M = 1.0;

%usual parameter
%paragamma0 = 3.*exp(-power(x./8, 2)./2)+0.1;
%paragamma1 = -1;
%paragamma2 = exp(-power(x./8, 2)./2)+0.1;
%paragamma4 = 0.5;
%paragamma5 = 0.5;

%testing paramater
paragamma0 = 1;
paragamma1 = -1;
paragamma2 = 1;
paragamma4 = 0;
paragamma5 = 0;

