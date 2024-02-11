function [result, iteration] = internal_penalty_method(fun, x0, c, epsilon, g1, g2)
    i = 0;
    x_prev = -Inf;
    x = x0;

    while norm(x-x_prev) > epsilon && c*norm(-(log(-g1(x)) + log(-g2(x)))) >= epsilon
        i = i + 1;
        x_prev = x;
        S = @(t) -(log(-g1(t)) + log(-g2(t))); 
        F = @(t) fun(t) + c * S(t); 
        x = fminsearch(F, x); 
        c = 0.5 *c;
    end

    result = x;
    iteration = i;
end