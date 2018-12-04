function u = Explicit1D(u, M, N, dt, dx)
    % Construct coefficient matrix
    B = zeros(N-2, N);
    tempDiag1 = 1 - 2*dt/dx^2;
    tempDiag2 = dt/dx^2;
    for i = 1 : N-2
        B(i,i) = tempDiag2;
        B(i,i+1) = tempDiag1;
        B(i,i+2) = tempDiag2;
    end

    for i = 2 : M
        a = B * (u(i-1,:))';
        u(i, 2:N-1) = a';
    end
end