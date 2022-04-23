function [tsim,qsim,q0next,foot_anchor] = one_step(tstart,deltat,q0,pdw,foot_anchor_hook)
    tsim = []; qsim = []; foot_anchor = [];
    options = odeset('Abstol',1e-13,'Reltol',1e-13,'Events',@contact);
    [t,q] = ode113(@pdw_stance_dynamics,[tstart tstart+deltat],q0,options,pdw);
    tq = linspace(t(1),t(end),pdw.fps)';
    qq(:,1) = interp1(t,q(:,1),tq);
    qq(:,2) = interp1(t,q(:,2),tq);
    qq(:,3) = interp1(t,q(:,3),tq);
    qq(:,4) = interp1(t,q(:,4),tq);
    tsim = [tsim; tq(1:end-1,:)];
    qsim = [qsim; qq(1:end-1,:)];
    foot_anchor = [foot_anchor repmat(foot_anchor_hook,1,length(tq)-1)];
    tb = t(end,:);
    qb = q(end,:);
    
    th1 = q(end,1); th2 = q(end,2);    
    new_foot_anchor = [foot_anchor_hook(1) - pdw.l1*(cos(pdw.gamma)*sin(th1) - cos(th1)*sin(pdw.gamma)) + pdw.l2*(cos(th2)*(cos(pdw.gamma)*sin(th1) - cos(th1)*sin(pdw.gamma)) + sin(th2)*(cos(pdw.gamma)*cos(th1) + sin(pdw.gamma)*sin(th1))); ... 
        foot_anchor_hook(2) + pdw.l1*(cos(pdw.gamma)*cos(th1) + sin(pdw.gamma)*sin(th1)) - pdw.l2*(cos(th2)*(cos(pdw.gamma)*cos(th1) + sin(pdw.gamma)*sin(th1)) - sin(th2)*(cos(pdw.gamma)*sin(th1) - cos(th1)*sin(pdw.gamma))); -foot_anchor_hook(3)];
    
    q0 = pdw_foot_strike_dynamics(qb,pdw);
    options = odeset('Abstol',1e-13,'Reltol',1e-13,'Events',@apex);
    [t,q] = ode113(@pdw_stance_dynamics,[tb tb+deltat],q0,options,pdw);
    tq = linspace(t(1),t(end),pdw.fps/2)'; qq = [];
    qq(:,1) = interp1(t,q(:,1),tq);
    qq(:,2) = interp1(t,q(:,2),tq);
    qq(:,3) = interp1(t,q(:,3),tq);
    qq(:,4) = interp1(t,q(:,4),tq);
    tsim = [tsim; tq(1:end,:)];
    qsim = [qsim; qq(1:end,:)];
    foot_anchor = [foot_anchor repmat(new_foot_anchor,1,length(tq))];
    q0next = q(end,:);
end
