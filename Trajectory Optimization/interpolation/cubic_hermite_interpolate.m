function val = cubic_hermite_interpolate(times, data, data_d, t)
    ind = search_index(times, t);    
    dt = times(ind+1)-times(ind);
    tau = t-times(ind);
    kc = 2*ind-1;
    kn = 2*ind+1;
    
    del = tau/dt;
    val = (2*del^3-3*del^2+1)*data(kc) + ...
        dt*(del^3-2*del^2+del)*data_d(kc) + ...
        (-2*del^3+3*del^2)*data(kn) + ...
        dt*(del^3-del^2)*data_d(kn);
end

