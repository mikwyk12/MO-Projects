function [x, iteration] = golden_ratio(fun, left, right, epsilon, Nmax)
    i = 1;
    alpha = (sqrt(5)-1)/2;

    a = [left];
    b = [right];
    c = [b(i) - alpha*(b(i) - a(i))];
    d = [a(i) + alpha*(b(i) - a(i))];
    
    while true
        if fun(c(i)) < fun(d(i))
            a(i+1) = a(i);
            b(i+1) = d(i);
            d(i+1) = c(i);
            c(i+1) = b(i+1) - alpha*(b(i+1) - a(i+1));
        else
            a(i+1) = c(i);
            b(i+1) = b(i);
            d(i+1) = a(i+1) + alpha*(b(i+1) - a(i+1));
            c(i+1) = d(i);
        end

        if b(i) - a(i) < epsilon
            break
        end
        
        i = i + 1;

        if i > Nmax
            disp("Failed to find a solution in N steps")
            return
        end
    end
    iteration = i;
    x = (a(i) + b(i))/2;
end
