function xdot = vanderpol_(~,x,eps)
    xdot = [x(2,:,:);
            -eps*(x(1,:,:).^2-1).*x(2,:,:)-x(1,:,:)];
end