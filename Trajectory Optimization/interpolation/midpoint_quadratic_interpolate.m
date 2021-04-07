function val = midpoint_quadratic_interpolate(times, data, t)
    ind = search_index(times, t);    
    dt = times(ind+1)-times(ind);
    tau = t-times(ind);
    
    val = (2/dt^2)*(tau-dt/2)*(tau-dt)*data(2*ind-1) - ...
        (4/dt^2)*tau*(tau-dt)*data(2*ind) + ...
        (2/dt^2)*tau*(tau-dt/2)*data(2*ind+1);
end

