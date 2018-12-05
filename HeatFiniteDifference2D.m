
%initialize matrix with initial and boundary values
M = 200;  %number of nodes on time
N = 20;  %number of nodes on space
u = zeros(N, N, M);
dx = 15 / (N-1);
dy = 15 / (N-1);
dt = 20 / (M-1);

x = 0 : dx : 15;
y = 0 : dy : 15;
t = 0 : dt : 20;
[gridx,gridy,gridt] = meshgrid(x,y,t);

c = 0.13 / (7.8 * 0.11);

%initial values
for i = 0 : M-1
    for j = 0: N-1
        u(1, j+1, i+1) = 100;
        u(j+1, 1, i+1) = 100;
    end
end

%calculate with all 3 methods and plot
uExplicit = Explicit2D(u,c, M, N, dt, dx, dy); %Note the problem with r <= 1/2
figure(1)
scatter3(gridx(:), gridy(:), gridt(:), 15, uExplicit(:))
title('Explicit Method')
xlabel('x')
ylabel('y')
zlabel('t')