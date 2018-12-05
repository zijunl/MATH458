function u = CN1D(u, M, N, dt, dx)
    % Construct coefficient matrix
    A = zeros(N-2, N);
    B = zeros(N-2, N);
    
    tempDiagA1 = 2 + 2*dt/dx^2;
    tempDiagA2 = -dt/dx^2;
    for i = 1 : N-2
        A(i,i) = tempDiagA2;
        A(i,i+1) = tempDiagA1;
        A(i,i+2) = tempDiagA2;
    end
    
    tempDiagB1 = 2 - 2*dt/dx^2;
    tempDiagB2 = dt/dx^2;
    for i = 1 : N-2
        B(i,i) = tempDiagB2;
        B(i,i+1) = tempDiagB1;
        B(i,i+2) = tempDiagB2;
    end
 
    for i = 2 : M
        b = A \ (B * (u(i-1, :))');
        u(i, :) = b';
    end
end