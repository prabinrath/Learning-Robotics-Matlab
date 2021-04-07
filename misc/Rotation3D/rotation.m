clear;clc;
%Sequence ZYX means first yaw about Z then pitch about Y and then roll
%about X. Default convention of rotation used in this code is ZYX a.k.a
%3-2-1 sequence. Sequence of rotation is important when Euler angles are
%considered. Due to singularity multiple (Euler angles, sequence) pair
%exist for the same orientation in space. Thus conversion to Eular angle
%from rotation matrix or quaternion is tricky. All inputs to the functions
%are in degrees. Default input and output format for euler angles is
%[y,p,r].

syms r p y;
rx = [1 0 0;
    0 cos(r) -sin(r);
    0 sin(r) cos(r)];
ry = [cos(p) 0 sin(p); 
    0 1 0; 
    -sin(p) 0 cos(p)];
rz = [cos(y) -sin(y) 0;
    sin(y) cos(y) 0;
    0 0 1;];
rotx = @(val) double(subs(rx,r,val*pi/180));
roty = @(val) double(subs(ry,p,val*pi/180));
rotz = @(val) double(subs(rz,y,val*pi/180));

ROTfe = @(yaw,pitch,roll) rotz(yaw)*roty(pitch)*rotx(roll);
%Frame rotation matrix for sequence ZYX with Euler angles (y,p,r). Frame 
%rotation multiplication sequence left to right.
%Equivalent matlab inbuilt: eul2rotm(deg2rad([y p r]),'ZYX') %Here 'ZYX'
%argument is the sequence of matrix multiplication from left to right.

ROTpe = @(yaw,pitch,roll) rotx(roll)*roty(pitch)*rotz(yaw);
%Point rotation matrix for sequence ZYX with Euler angles (y,p,r). Point
%rotation multplication sequence right to left. 
%Equivalent matlab inbuilt: eul2rotm(deg2rad([r p y]),'XYZ') %Here 'XYZ'
%argument is the sequence of matrix multiplication from left to right.

%q = (ROTfe(30,60,45)*ROTfe(45,90,30))'*p %q is the coordinates of point p
%in the new frame after rotation.
%p = (ROTpe(-45,-90,-30)*ROTpe(-30,-60,-45))'*q %The inverse of rotation
%matrix used is such that it changes the coordinates of q in the new frame 
%in such a way that it becomes equal to the the initial coordinates.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms r p y;
qfe = [sin(y/2)*sin(p/2)*sin(r/2) + cos(y/2)*cos(p/2)*cos(r/2);
      -sin(y/2)*sin(p/2)*cos(r/2) + sin(r/2)*cos(y/2)*cos(p/2);
       sin(y/2)*sin(r/2)*cos(p/2) + sin(p/2)*cos(y/2)*cos(r/2);
       sin(y/2)*cos(p/2)*cos(r/2) - sin(p/2)*sin(r/2)*cos(y/2)];
QUAfe = @(yaw,pitch,roll) quaternion(double(subs(qfe,{y,p,r},[yaw*pi/180,pitch*pi/180,roll*pi/180])'));
%Frame rotation quaternion for sequence ZYX with Euler angles (y,p,r)
%Equivalent matlab inbuilt: eul2quat(deg2rad([y p r]),'ZYX') %Here 'ZYX'
%argument is the sequence of matrix multiplication from left to right.

qpe = [-sin(r/2)*sin(p/2)*sin(y/2) + cos(r/2)*cos(p/2)*cos(y/2);
        sin(r/2)*cos(p/2)*cos(y/2) + sin(p/2)*sin(y/2)*cos(r/2);
       -sin(r/2)*sin(y/2)*cos(p/2) + sin(p/2)*cos(r/2)*cos(y/2);
        sin(r/2)*sin(p/2)*cos(y/2) + sin(y/2)*cos(r/2)*cos(p/2)];
QUApe = @(yaw,pitch,roll) quaternion(double(subs(qpe,{y,p,r},[yaw*pi/180,pitch*pi/180,roll*pi/180])'));
%Point rotation quaternion for sequence ZYX with Euler angles (y,p,r)
%Equivalent matlab inbuilt: eul2quat(deg2rad([r p y]),'XYZ') %Here 'XYZ'
%argument is the sequence of matrix multiplication from left to right.

qrot = @(qua,p) compact(qua*quaternion([0 p])*conj(qua));
%Rotation using quaternion
%Equivalent matlab inbuilt: rotateframe(qua,p)

%q = qrot(conj(QUAfe(30,60,45)*QUAfe(45,90,30)),p)
%p = qrot(conj(QUApe(-45,-90,-30)*QUApe(-30,-60,-45)),q(2:4))
%Similar example as shown for rotation matrix. Quaternion multiplication
%for frame and point rotation follow the same sequence as that of the
%rotation matrices.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms x y z w;
rq = [w^2+x^2-y^2-z^2, 2*(x*y-w*z), 2*(x*z+w*y);
      2*(x*y+w*z), w^2-x^2+y^2-z^2, 2*(y*z-w*x);
      2*(x*z-w*y), 2*(y*z+w*x), w^2-x^2-y^2+z^2];
rq_temp = @(q) double(subs(rq,{w,x,y,z},[q(1),q(2),q(3),q(4)]));
ROTq = @(q) rq_temp(compact(q));
%Rotation matrix from quaternion
%Equivalent matlab inbuilt: quat2rotm(q)

m = sym('m%d%d', [3 3]);
qr = [sqrt(1 + m(1,1) + m(2,2) + m(3,3))/2;
      (m(3,2) - m(2,3)) / (2*sqrt(1 + m(1,1) + m(2,2) + m(3,3)));
      (m(1,3) - m(3,1)) / (2*sqrt(1 + m(1,1) + m(2,2) + m(3,3)));
      (m(2,1) - m(1,2)) / (2*sqrt(1 + m(1,1) + m(2,2) + m(3,3)))];
QUAr = @(rm) quaternion(double(subs(qr,m,rm)'));
%Quaternion from rotation matrix. This is not stable when 
%1 + m(1,1) + m(2,2) + m(3,3) <= 0
%Division by 0 error, squareroot of number less than 0
%Equivalent matlab inbuilt: rotm2quat(rm)

%A potential algorithm for handling the errors of QUAr are
%{
float tr = m00 + m11 + m22
if (tr > 0) { 
  float S = sqrt(tr+1.0) * 2; // S=4*qw 
  qw = 0.25 * S;
  qx = (m21 - m12) / S;
  qy = (m02 - m20) / S; 
  qz = (m10 - m01) / S; 
} else if ((m00 > m11)&(m00 > m22)) { 
  float S = sqrt(1.0 + m00 - m11 - m22) * 2; // S=4*qx 
  qw = (m21 - m12) / S;
  qx = 0.25 * S;
  qy = (m01 + m10) / S; 
  qz = (m02 + m20) / S; 
} else if (m11 > m22) { 
  float S = sqrt(1.0 + m11 - m00 - m22) * 2; // S=4*qy
  qw = (m02 - m20) / S;
  qx = (m01 + m10) / S; 
  qy = 0.25 * S;
  qz = (m12 + m21) / S; 
} else { 
  float S = sqrt(1.0 + m22 - m00 - m11) * 2; // S=4*qz
  qw = (m10 - m01) / S;
  qx = (m02 + m20) / S;
  qy = (m12 + m21) / S;
  qz = 0.25 * S;
}
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Eular from frame rotation matrix, suffers  from gimbal lock
EULfr = @(rm) rad2deg(rotm2eul(rm,'ZYX')); %Here 'ZYX' is
%the sequence of assumed matrix multiplication from left to right
%{
if rm(3,1)<1
    if rm(3,1)>-1
        y = atan2(rm(2,1),rm(1,1));
        p = asin(-rm(3,1));
        r = atan2(rm(3,2),rm(3,3));
    else
        y = 0;
        p = pi/2;
        r = atan2(-rm(2,3),rm(2,2));
        %y = -atan2(-rm(2,3),rm(2,2));
        %p = pi/2;
        %r = 0;
else
    y = 0;
    p = -pi/2;
    r = atan2(-rm(2,3),rm(2,2));
    %y = atan2(-rm(2,3),rm(2,2));
    %p = -pi/2;
    %r = 0;
%}

%Eule from point rotation matrix, suffers  from gimbal lock
EULpr = @(rm) flip(rad2deg(rotm2eul(rm,'XYZ'))); %Here 'XYZ' is
%the sequence of assumed matrix multiplication from left to right
%{
if rm(1,3)<1
    if rm(1,3)>-1
        y = atan2(-rm(1,2),rm(1,1));
        p = asin(rm(1,3));
        r = atan2(-rm(2,3),rm(3,3));
    else
        y = atan2(rm(2,1),rm(2,2));
        p = -pi/2;
        r = 0;
        %y = 0;
        %p = -pi/2;
        %r = -atan2(rm(2,1),rm(2,2));
else
    y = atan2(rm(2,1),rm(2,2));
    p = pi/2;
    r = 0;
    %y = 0;
    %p = pi/2;
    %r = atan2(rm(2,1),rm(2,2));
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Eular from frame rotation quaternion, suffers  from gimbal lock
EULfq = @(q) rad2deg(efq(compact(q)));
%Same logic as that of euler from rotation matrix

%Eular from point rotation quaternion, suffers  from gimbal lock
EULpq = @(q) rad2deg(epq(compact(q)));
%Same logic as that of euler from rotation matrix

%Matlab inbuilt functions quat2eul(q,seq) for this conversion is ambigious 
%and doesn't handle gimbal lock. Hence, the functions efq and epq use were 
%manually designed for the task.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%