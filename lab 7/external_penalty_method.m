function [result, iteration] = external_penalty_method(fun, x0, c, g1, g2, epsilon)
    i = 0;
    x = x0;
    x_prev = -Inf; 
    
    while norm(x - x_prev) > epsilon
        i = i + 1;
        x_prev = x;
        S = @(t) max(0, g1(t)).^2 + max(0, g2(t)).^2;
        F = @(t) fun(t) + c * S(t);
        x = fminsearch(F, x);
        c = 2 * c;
    end

    result = x;
    iteration = i;
end