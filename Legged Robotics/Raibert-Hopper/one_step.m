function [tsim,qsim,q0next] = one_step(tstart,deltat,q0,slip,control,xd_des)
    tsim = []; qsim = [];
    
    options = odeset('Abstol',1e-13,'Reltol',1e-13,'Events',@touchdown);    
    [t,q] = ode113(@slip_flight_dynamics,[tstart tstart+deltat],q0,options,slip);
    tsim = [tsim; t(1:end-1,:)];
    qsim = [qsim; q(1:end-1,:) q(1:end-1,1)+slip.l0*sin(slip.th) q(1:end-1,2)-slip.l0*cos(slip.th)];
    tb = t(end,:);
    qb = q(end,:);
    x_rem = qb(1);
    qb(1) = 0;
    
    slip.th = control(qb(3),xd_des);
    options = odeset('Abstol',1e-13,'Reltol',1e-13,'Events',@liftoff); 
    [t,q] = ode113(@slip_stance_dynamics,[tb tb+deltat],qb,options,slip);
    q(:,1) = q(:,1) + x_rem;
    tsim = [tsim; t(1:end-1,:)];
    qsim = [qsim; q(1:end-1,:) repmat(x_rem+slip.l0*sin(slip.th),length(t)-1,1) zeros(length(t)-1,1)];
    tb = t(end,:);
    qb = q(end,:);
    
    th_liftoff = atan((qb(1)-(x_rem+slip.l0*sin(slip.th)))/qb(2));
    options = odeset('Abstol',1e-13,'Reltol',1e-13,'Events',@apex);    
    [t,q] = ode113(@slip_flight_dynamics,[tb tb+deltat],qb,options,slip);
    tsim = [tsim; t];
    qsim = [qsim; q q(1:end,1)-slip.l0*sin(th_liftoff) q(1:end,2)-slip.l0*cos(th_liftoff)];
    
    q0next = [q(end,:) slip.th];
end