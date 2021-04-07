function val = quadratic_interpolate(times, data, data_d, t)
    ind = search_index(times, t);    
    dt = times(ind+1)-times(ind);
    tau = t-times(ind);
    
    val = data(ind) + data_d(ind)*tau + ...
        (tau^2/(2*dt))*(data_d(ind+1)-data_d(ind));
end

