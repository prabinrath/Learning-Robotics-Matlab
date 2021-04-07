function cost = objective(x)
    % cost = sin(x(1)) + 0.1*x(2)^2 + 0.05*x(1)^2;
    
    cost = -(x(2)-2)^2;
end

