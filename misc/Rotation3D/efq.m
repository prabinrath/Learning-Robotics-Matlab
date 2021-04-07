function eulerangles = efq(q)
    w = q(1); x = q(2); y = q(3); z = q(4);
    if  2*(x*z-w*y)<1
        if 2*(x*z-w*y)>-1
            eulerangles(1) = atan2(2*(x*y+w*z),w^2+x^2-y^2-z^2);
            eulerangles(2) = asin(-2*(x*z-w*y));
            eulerangles(3) = atan2(2*(y*z+w*x),w^2-x^2-y^2+z^2);
        else
            eulerangles(1) = 0;
            eulerangles(2) = pi/2;
            eulerangles(3) = atan2(-2*(y*z-w*x),w^2-x^2+y^2-z^2);
            %eulerangles(1) = -atan2(-2*(y*z-w*x),w^2-x^2+y^2-z^2);
            %eulerangles(2) = pi/2;
            %eulerangles(3) = 0;
        end
    else
        eulerangles(1) = 0;
        eulerangles(2) = -pi/2;
        eulerangles(3) = atan2(-2*(y*z-w*x),w^2-x^2+y^2-z^2);
        %eulerangles(1) = atan2(-2*(y*z-w*x),w^2-x^2+y^2-z^2);
        %eulerangles(2) = -pi/2;
        %eulerangles(3) = 0;
    end
end