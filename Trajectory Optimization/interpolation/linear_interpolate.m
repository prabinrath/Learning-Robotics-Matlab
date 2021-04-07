function val = linear_interpolate(times, data, t)
    ind = search_index(times, t);    
    dt = times(ind+1)-times(ind);
    tau = t-times(ind);
    
    val = data(ind) + (tau/dt)*(data(ind+1)-data(ind));
end

