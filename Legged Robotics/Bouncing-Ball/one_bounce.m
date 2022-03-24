function [tsim,ysim] = one_bounce(tstart,deltat,y0,ground)
    options = odeset('Events',@(t,y) contact(t,y,ground));
    [tsim,ysim] = ode45(@ball_dynamics,[tstart tstart+deltat],y0,options);    
end

