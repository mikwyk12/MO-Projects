function [left, right, x_app, y_app, i] = contraction(fun, x0, x1, beta, Nmax)
    i = 1;
    
    if fun(x0) > fun(x1)
        left = x0;
        right = x1;
        x_app = (x0 + x1)/2;
        y_app = fun(x_app);
        return
    end

    x = [x0, x1];

    for i = 2:Nmax
        x = [x, x0 + (beta)^(i-1)*(x1 - x0)];
        if fun(x(i+1)) < fun(x0)
            if x0 < x(i)
                left = x0;
                right = x(i);
            else
                left = x(i);
                right = x0;
            end
            x_app = x(i+1);
            y_app = fun(x_app);
            return
        end
    end
end
