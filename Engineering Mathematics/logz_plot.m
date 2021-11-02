[r, th] = meshgrid(0:0.1:10, 0:0.1:20);
x = r.*cos(th);
y = r.*sin(th);

Z = log(r) + 1i*th;

surf(x, y, imag(Z));