function sse = SSE(u, uExact)
    sse = 0;
    for i = 1 : size(u, 1)
        for j = 1 : size(u ,2)
            sse = sse + (u(i,j) - uExact(i,j))^2;
        end
    end
end