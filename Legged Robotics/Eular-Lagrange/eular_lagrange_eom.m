function eom = eular_lagrange_eom(L,q,qd,qdd,F)
    dL_dqd = gradient(L,qd);
    dL_dqd_dt = jacobian(dL_dqd,[q qd])*transpose([qd qdd]);
    dL_dq = gradient(L,q);
    eom = dL_dqd_dt - dL_dq - transpose(F);
end