function [position,isterminal,direction] = contact(t,y,ground)
    position = y(1) - ground;
    direction = -1;
    isterminal = 1;
end

