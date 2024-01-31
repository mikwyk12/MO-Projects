function [minimum, iter, matrix] = steepest_descent_method(fun, grad, x0, h0, epsilon, max_iterations)
    h = h0;
    i = 0;
    matrix = x0;

    while i < max_iterations
        direction = -grad(x0)';
        g  = @(a) fun(x0 + a * direction);
        h = fminsearch(g, 0);
        x = x0 + h * direction;
        matrix = [matrix; x];

        if norm(x - x0) < epsilon
            break;
        end
        
        i = i + 1;
        x0 = x;
    end

    minimum = x;
    iter = i;
end