function qdd = eular_lagrange2(L,q,qd,F)
    syms acc [1 length(q)];
    dL_dqd = gradient(L,qd);
    dL_dqd_dt = jacobian(dL_dqd,[q qd])*transpose([qd acc]);
    dL_dq = gradient(L,q);
    eom = dL_dqd_dt - dL_dq - transpose(F);
    qdd = cell2sym(struct2cell(solve(eom,acc)));
end