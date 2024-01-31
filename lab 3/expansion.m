function [left, right, iteration] = expansion(fun, x0, r, alpha, Nmax) 
    i = 0;
    x1 = x0 + r;
    offset = x0;
    iteration = 1;

    x0 = x0 - offset;
    x1 = x1 - offset;

    if fun(x1 + offset) == fun(x0 + offset)
        left = x0 + offset; right = x1 + offset;
        return
    end
    
    if fun(x1 + offset) > fun(x0 + offset)
        x1 = -x1;
        if fun(x1 + offset) >= fun(x0 + offset)
            left = x1 + offset; right = -x1 + offset;
            return
        end
    end
    
    x = [x0, x1];

    while true
        if i > Nmax
            disp("Failed to determine the interval in N steps");
            break
        end
        
        i = i + 1;
        
        x = [x, alpha^i * x(2)];
        
        if fun(x(i+1) + offset) <= fun(x(i+2) + offset)
            break;
        end
    end

    iteration = i;
    
    if x(i) < x(i+2)
        left = x(i) + offset;
        right = x(i+2) + offset;
        return
    else
        left = x(i+2) + offset;
        right = x(i) + offset;
        return
    end
end