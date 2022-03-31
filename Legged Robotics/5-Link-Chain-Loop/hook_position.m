function pos = hook_position(q)
    P = chain_pendulum_kinematics(q);
    pos = P(1:2,5);
end