function x = manipulator_kinematics(l1,l2,theta)
    x = [l1*cos(theta(1))+l2*cos(theta(1)+theta(2)); l1*sin(theta(1))+l2*sin(theta(1)+theta(2))];
end

