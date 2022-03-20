function qdd = eular_lagrange(L,q,qd,F)
    syms acc [1 length(q)];
    for k=1:length(q)
        dL_dqd = diff(L,qd(k));
        dL_dqd_dt = 0;
        for m=1:length(q)
            dL_dqd_dt = dL_dqd_dt + diff(dL_dqd,q(m))*qd(m);
        end
        for m=1:length(qd)
            dL_dqd_dt = dL_dqd_dt + diff(dL_dqd,qd(m))*acc(m);
        end
        dL_dq = diff(L,q(k));
        qdd(k) = solve(dL_dqd_dt - dL_dq - F(k), acc(k));
    end       
end
