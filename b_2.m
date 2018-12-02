M = 6;
N = 6;
u = zeros(M,N);
linsysa = zeros(M-2,N);
linsystemp = zeros(M,N-2);
dx = 1/(M-1);
dt = 1/(M-1);
%write bottom line
for i = 1:(M-1)
    for j = 1:N
        u(M,j) = sin(1/5 * pi*(j-1));
    end
end
%write linearsystems
for i = 1:(M-2)
    linsysa(i,i) = -dt/dx^2 ;
    linsysa(i,i+1) = 2*dt/dx^2 +1 ;
    linsysa(i,i+2) = -dt/dx^2 ;
end
%creat temp system
for i = 1:M
    for j =1 :(N-2)
        linsystemp(i,j) = u(i,j+1);
    end
end
%calculate
for j = 1:(N-1)
    u(M-j,:) = linsysa\(linsystemp(M-j+1,:))';
    for i = 1:M
        for j =1 :(N-2)
            linsystemp(i,j) = u(i,j+1);
        end
    end
end

disp(u)
