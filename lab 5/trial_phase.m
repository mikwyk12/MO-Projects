function x = trial_phase(fun, x, s)
    n = length(x);
    e = eye(n);
    
    for i=1:n
        if fun(x + s*e(i, :)) < fun(x)
            x = x + s*e(i, :);
        else
            if fun(x - s*e(i, :)) < fun(x)
                x = x - s*e(i, :);
            end
        end
    end
end