function x = hooke_jeeves(fun, x0, s, alpha, epsi)
    x = x0;
    
    while s > epsi
        x_b = x;
        x = trial_phase(fun, x, s);
        if fun(x) < fun(x_b)
            while fun(x) < fun(x_b)
                x_bb = x_b;
                x_b = x;
                x = 2*x_b - x_bb;
                x = trial_phase(fun, x, s);
            end
            x = x_b;
        else
            s = alpha*s;
        end
    end
end