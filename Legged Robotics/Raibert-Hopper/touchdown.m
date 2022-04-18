function [position,isterminal,direction] = touchdown(t,q,slip)
    position = q(2)-slip.l0*cos(slip.th);
    isterminal = 1;
    direction = 0;    
end
