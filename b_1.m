M = 6;
N = 6;
linsysa = zeros(M-2,N);
tempu = zeros(M,N-2);
u = zeros(M,N);
dx = 1/(M-1);
dt = 1/(M-1);
for i = 1:(M-1)
    for j = 1:N
        u(M,j) = 1/5 * pi*(j-1);
    end
end
for i = 1:(M-2)
    linsysa(i,i) = dt/dx^2 ;
    linsysa(i,i+1) = 1-2*dt/dx^2 ;
    linsysa(i,i+2) = dt/dx^2 ;
end
for i = 1:M
        for j =1 :(N-2)
            tempu(i,j) = u(i,j+1);
        end
end
for j = 1:(N-1)
    tempu(M-j,:) = linsysa*(u(M-j+1,:))';
    for i = 1:M
        for j =1 :(N-2)
            u(i,j+1) = tempu(i,j);
        end
    end
end
disp(u)
