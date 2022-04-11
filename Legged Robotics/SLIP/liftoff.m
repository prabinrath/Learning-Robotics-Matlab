function [position,isterminal,direction] = liftoff(t,q,slip)
    xc = slip.l0*sin(slip.th);
    l = ((q(1)-xc)^2+q(2)^2)^0.5;
    position = l-slip.l0;
    if q(1) > xc
       isterminal = 1;
    else
       isterminal = 0;
    end
    direction = 0;    
end