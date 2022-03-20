function joint_pos = double_pendulum_kinematics(th1,th2,l1,l2)
    H01 = [ sin(th1), cos(th1), 0;...
            -cos(th1), sin(th1), 0;...
            0, 0, 1];
    H02 = [cos(th1)*sin(th2) + cos(th2)*sin(th1), cos(th1)*cos(th2) - sin(th1)*sin(th2),  5*sin(th1);...
           sin(th1)*sin(th2) - cos(th1)*cos(th2), cos(th1)*sin(th2) + cos(th2)*sin(th1), -5*cos(th1);...
           0, 0, 1];
    joint_pos = zeros(2);
    J01 = H01*[l1;0;1];
    J02 = H02*[l2;0;1];
    joint_pos(:,1) = J01(1:2);
    joint_pos(:,2) = J02(1:2);
end

