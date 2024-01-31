function [x, iteration] = lagrange(fun, left, right, epsilon, gamma, Nmax)
    i = 1;
    a = [left];
    b = [right];
    c = [(left+right)/2];
    d = [];

    while true
        num = (fun(a(i))*(c(i)^2 - b(i)^2) + fun(c(i))*(b(i)^2 - a(i)^2) + fun(b(i))*(a(i)^2 - c(i)^2));
        den = (fun(a(i))*(c(i) - b(i)) + fun(c(i))*(b(i) - a(i)) + fun(b(i))*(a(i) - c(i)));
        d(i) = 0.5 * num/den; 
        
        if (a(i) < d(i)) && (d(i) < c(i))
            if fun(d(i)) < fun(c(i))
                a(i+1) = a(i);
                c(i+1) = d(i);
                b(i+1) = c(i);
            else
                a(i+1) = d(i);
                c(i+1) = c(i);
                b(i+1) = b(i);
            end
        else
            if (c(i) < d(i)) && (d(i) < b(i))
                if fun(d(i)) < fun(c(i))
                    a(i+1) = c(i);
                    c(i+1) = d(i);
                    b(i+1) = b(i);
                else
                    a(i+1) = a(i);
                    c(i+1) = c(i);
                    b(i+1) = d(i);
                end
            else
                disp("The algorithm does not converge");
                return
            end
        end
        
        if i > Nmax
            disp("Epsilon convergence failed");
            return
        end
        if (i > 2) && ((b(i) - a(i) < epsilon) || (abs(d(i-1) - d(i-2)) <= gamma))
            break
        end
        i = i + 1;
    end
    
    iteration = i;
    x = d(i-1);
    return
end
