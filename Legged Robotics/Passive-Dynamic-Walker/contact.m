function [position,isterminal,direction] = contact(t,q,pdw)
    position = q(2)+2*q(1);
    if q(1) < -0.05
        isterminal = 1;
    else
        isterminal = 0;
    end
    direction = 0;    
end
