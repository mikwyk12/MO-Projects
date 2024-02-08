function [result, iteration] = powell(fun, x0, d, epsilon, Nmax)
    i = 1;
    n = size(d);
    x = x0;
    
    while i < Nmax
        p = x;
        
        for j = 1:n
            g = @(a) fun(p + a*d(:,j));
            alpha = fminsearch(g, 0);
            p = p + alpha*d(:,j);
            if abs(fun(p) - fun(x)) < epsilon
                result = p;
                iteration = i;
                return
            end
        end
        
        for k = 1:n-1
            d(:, k) = d(:, k+1);
        end
        
        d(:, end) = p - x;
        g = @(a) fun(p + a*d(:,end));
        alpha = fminsearch(g, 0);
        p = p + alpha*d(:, end);

        if abs(fun(p) - fun(x)) < epsilon
            result = p;
            iteration = i;
            return
        end

        x = p;
        i = i + 1;
    end

    disp("Failed to find a solution in Nmax steps");
end