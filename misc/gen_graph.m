x=0:360;
y = zeros([1,361]);
y(1:181) = x(1:181);
y(182:361) = -360+x(182:361);
x = 0:720;
y = [y,y(2:361)];
plot(x,y,'LineWidth',1.5);axis([0 720 -180 180]);grid on;xlabel('IMU rotation angle (degrees)');ylabel('IMU feedback (degrees)');