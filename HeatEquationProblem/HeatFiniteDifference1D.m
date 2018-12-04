
%initialize matrix with initial and boundary values
M = 135;  %number of nodes on time
N = 10;  %number of nodes on space
u = zeros(M, N);
dx = 1 / (N-1);
dt = 1 / (M-1);

%analytic solution
x = 0 : dx : 1;
t = 0 : dt : 1;
uExact = zeros(M, N);
for i = 1 : M
    for j = 1 : N
        uExact(i, j) = sin(pi * x(j)) * exp(-pi^2*t(i));
    end
end
figure('Position', [300 100 900 600])
subplot(2,2,1)
surf(x, t, uExact)
title('Analytic Solution')
xlabel('x')
ylabel('t')

%initial values
for i = 0 : N-1
    u(1, i+1) = sin(pi * i * dx);
end

%calculate with all 3 methods and plot
uExplicit = Explicit1D(u, M, N, dt, dx); %Note the problem with r <= 1/2
subplot(2,2,2)
surf(x, t, uExplicit)
title('Explicit Method')
xlabel('x')
ylabel('t')

uImplicit = Implicit1D(u, M, N, dt, dx);
subplot(2,2,3)
surf(x, t, uImplicit)
title('Implicit Method')
xlabel('x')
ylabel('t')

uCN = CN1D(u, M, N, dt, dx);
subplot(2,2,4)
surf(x, t, uCN)
title('Crank-Nicolson')
xlabel('x')
ylabel('t')