function u = Explicit2D(u, c, M, N, dt, dx, dy)
    % Construct coefficient matrix
    B1 = zeros(N-2, N);
    tempDiag11 = 1 - c * (2*dt/dx^2 + 2*dt/dy^2);
    tempDiag12 = c * dt/dx^2;
    for i = 1 : N-2
        B1(i,i) = tempDiag12;
        B1(i,i+1) = tempDiag11;
        B1(i,i+2) = tempDiag12;
    end
    
    B2 = zeros(N-2, 2*N-4);
    tempDiag21 = c * dt/dy^2;
    for i = 1 : N-2
        B2(i, 2*i-1) = tempDiag21;
        B2(i, 2*i) = tempDiag21;
    end

    for i = 1 : M - 1
        for j = 1 : N - 2
            b1 = (u(:, j+1, i));
            b2 = zeros(2*N-4, 1);
            for k = 1 : N - 2
                b2(2*k-1) = u(k+1, j, i);
                b2(2*k) = u(k+1, j+2, i);
            end
            a = B1 * b1 + B2 * b2;
            u(2:N-1, j+1, i+1) = a;
        end
    end
end