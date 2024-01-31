function [minimum, iter, matrix] = newton_method(fun, grad, hes, x0, h0, epsilon, max_iterations)
    h = h0;
    i = 0;
    matrix = x0;

    while i < max_iterations
        if cond(hes(x0)) > 1/epsilon
            disp('Hessian is irreversible')
            break;
        end
        
        if norm(grad(x0)) < 0
            disp('Gradient of the function is zero')
            break;
        end
        
        direction = (-inv(hes(x0)) * grad(x0))';
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

    minimum = x0;
    iter = i;
end