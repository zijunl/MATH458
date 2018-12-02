M = 6;
N = 6;
linsysa = zeros(M-2,N);
linsysb = zeros(M-2,N);
linsystemp = zeros(4)';
u = zeros(M,N);
dx = 1/(M-1);
dt = 1/(M-1);
%write linear systems
for i = 1:(M-2)
    linsysa(i,i) = -dt/dx^2 ;
    linsysa(i,i+1) = 2 + 2*dt/dx^2 ;
    linsysa(i,i+2) = -dt/dx^2 ;
    linsysb(i,i) = dt/dx^2 ;
    linsysb(i,i+1) = 2 - 2*dt/dx^2 ;
    linsysb(i,i+2) = dt/dx^2 ;
end
%write u bottom line
for i = 1:(M-1)
    for j = 1:N
        u(M,j) = sin(1/5 * pi*(j-1));
    end
end
%calculate
for j = 1:(N-1)
    linsystemp = linsysb*(u(M-j+1,:))';
    u(M-j,:) = linsysa\linsystemp;
end

disp(u)
