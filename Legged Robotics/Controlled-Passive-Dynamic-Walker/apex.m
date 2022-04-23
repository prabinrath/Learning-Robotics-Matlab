function [position,isterminal,direction] = apex(t,q,pdw)
    position = q(1);
    if q(2) < 0
        isterminal = 1;
    else
        isterminal = 0;
    end
    direction = 0;    
end
