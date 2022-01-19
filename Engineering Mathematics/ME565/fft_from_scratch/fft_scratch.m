function xk = fft_scratch(x)
    N = length(x);
    if bitand(N,N-1) ~= 0
        disp("Length must be a power of 2");
        xk = [];
    elseif N < 32
        xk = dft_slow(x);
    else
        x_even = fft_scratch(x(1:2:end));
        x_odd = fft_scratch(x(2:2:end));
        xk = [ x_even+transpose(exp(-1i*2*pi*(0:N/2-1)/N)).*x_odd; ...
            x_even+transpose(exp(-1i*2*pi*(N/2:N-1)/N)).*x_odd ];        
    end
end