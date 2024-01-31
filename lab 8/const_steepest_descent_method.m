function [minimum, iter, matrix]= const_steepest_descent_method(fun, grad, x0, h0, epsilon, max_iterations)
    h = h0;
    i = 0;
    matrix = x0;
    while i < max_iterations
        direction = -grad(x0)';
        
        x = x0 + h * direction;
        matrix = [matrix; x];

        if norm(x - x0) < epsilon
            break;
        end
        x0 = x;
        i = i + 1;
    end

    minimum = x;
    iter = i;
end