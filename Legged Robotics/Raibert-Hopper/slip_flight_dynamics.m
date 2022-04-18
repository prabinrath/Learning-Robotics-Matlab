function qd = slip_flight_dynamics(t,q,slip)
qd = [q(3); q(4); 0; -9.81];
end