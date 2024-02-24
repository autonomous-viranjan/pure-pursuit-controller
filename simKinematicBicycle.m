%%%%% Viranjan Bhattacharyya
%%%%% vbhatta@clemson.edu

function X_next = simKinematicBicycle(X, U)
% Rear wheel centered kinematic bicycle model
% ZoH discretization
% x(k+1) = x(k) + v(k)cos(psi(k))dt
% y(k+1) = y(k) + v(k)sin(psi(k))dt
% v(k+1) = v(k) + a(k)dt
% psi(k+1) = psi(k) + (v(k)/L)tan(delta(k))dt
L = 4;
dt = 0.1;

x = X.x;
y = X.y;
v = X.v;
psi = X.psi;

a = U.a;
delta = U.delta;

x_ = x + v*cos(psi)*dt;
y_ = y + v*sin(psi)*dt;
v_ = v + a*dt;
psi_ = psi + (v/L)*tan(delta)*dt;

X_next.x = x_;
X_next.y = y_;
X_next.v = v_;
X_next.psi = psi_;