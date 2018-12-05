tests = 10;
Ma = linspace(100, 1000, tests);  %number of nodes on time
Na = linspace(10, 55, tests);  %number of nodes on space
explicitSSE = zeros(tests);
implicitSSE = zeros(tests);
CNSSE = zeros(tests);
for m = 1 : tests
    for n = 1 : tests

    %initialize matrix with initial and boundary values
    M = Ma(m);
    N = Na(n);
    u = zeros(M, N);
    dx = 1 / (N-1);
    dt = 1 / (M-1);

    x = 0 : dx : 1;
    t = 0 : dt : 1;
    uExact = zeros(M, N);
    for i = 1 : M
        for j = 1 : N
            uExact(i, j) = sin(pi * x(j)) * exp(-pi^2*t(i));
        end
    end

    %initial values
    for i = 0 : N-1
        u(1, i+1) = sin(pi * i * dx);
    end

    uExplicit = Explicit1D(u, M, N, dt, dx); %Note the problem with r <= 1/2
    explicitSSE(m, n) = SSE(uExplicit, uExact);
    
    uImplicit = Implicit1D(u, M, N, dt, dx);
    implicitSSE(m, n) = SSE(uImplicit, uExact);

    uCN = CN1D(u, M, N, dt, dx);
    CNSSE(m, n) = SSE(uCN, uExact);
    end
end

figure('Position', [300 100 900 600])
suptitle('SSE Values of 100 Tests with Different Step Sizes')
subplot(1,3,1)
surf(Na, Ma, explicitSSE)
title('Explicit Method')
xlabel('x Nodes')
ylabel('t Nodes')
subplot(1,3,2)
surf(Na, Ma, implicitSSE)
title('Implicit Method')
xlabel('x Nodes')
ylabel('t Nodes')
subplot(1,3,3)
surf(Na, Ma, CNSSE)
title('Crank-Nicolson')
xlabel('x Nodes')
ylabel('t Nodes')