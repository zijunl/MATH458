function u = Implicit1D(u, M, N, dt, dx)
    % Construct coefficient matrix
    A = zeros(N-2, N);
    tempDiag1 = 1 + 2*dt/dx^2;
    tempDiag2 = -dt/dx^2;
    for i = 1 : N-2
        A(i,i) = tempDiag2;
        A(i,i+1) = tempDiag1;
        A(i,i+2) = tempDiag2;
    end

    for i = 2 : M
        b = A \ (u(i-1, 2 : N-1))';
        u(i, :) = b';
    end
end