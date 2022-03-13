function ut = burger_dynamics(t,u,L)
    u = transpose(u);
    N = length(u);
    w = (2*pi/L)*(-N/2:N/2-1); % Range of frequencies considered by matlab fft function
    w = fftshift(w); % This makes the order aligned with that of matlab
    
    uk = fft(u);
    uxk = 1i*w.*uk;
    uxxk = 1i*w.*uxk;
    
    ux = ifft(uxk);
    uxx = ifft(uxxk);
    
    ut = transpose(-u.*ux + 0.01*uxx); %viscid
%     ut = transpose(-u.*ux); %inviscid
%     ut = transpose(-ux); %simple
end

