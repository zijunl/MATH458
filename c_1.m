k = 0.13;
phi = 7.8;
c = 0.11;
M = 9;
N = 9;
Q = 9;
linsysa = zeros(M-2,N);
linsysb = zeros(M,2*N);
linsystemp = zeros(4)';
u = zeros(M,N,Q);
dx = 15/(M-1);
dt = 1;
dy = 15/(M-1);
for i = 1:(M)
    linsysa(i,i) = -dt/dx^2 ;
    linsysa(i,i+1) = c*phi/k - 2*dt/dx^2 -2*dt/dy^2 ;
    linsysa(i,i+2) = -dt/dx^2 ;
end
for i = 1:(M)
      linsysb(i,2*i-1) = dt/dy^2 ;
      linsysb(i,2*i) = dt/dy^2;
end
for i = 1:(M)
    for j = 1:N
        for k = 1:Q
            u(1,j,k) = 100;
            u(i,1,k) = 100;
        end
    end
end

disp(linsysa)

