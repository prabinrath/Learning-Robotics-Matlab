function xk = dft_slow(x)
    N = length(x);
    Wn = exp(-2*pi*1i/N);

    [I,J] = meshgrid(1:N,1:N);
    DFT = Wn.^(I-1).^(J-1);

    xk = DFT*x;
end