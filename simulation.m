%%%%% Viranjan Bhattacharyya
%%%%% vbhatta@clemson.edu

% Starter script for Pure-pursuit controller simulation
clear, clc, close all
% load ref path
load('path.mat');

Tsim = 8;
dt = 0.1;
Tsteps = Tsim/dt;

goal.x = path.X(end);
goal.y = path.Y(end);
eps = 4; % target region radius
% initial conditions
X.x = 0;
X.y = 1.7;
X.v = 0;
X.psi = 0;

ego_traj = cell(100, 1);
ego_traj{1} = X;
[target, ld] = setTarget(path, X);
ld = 5;
targets.x = [target.x, zeros(1,3)];
targets.y = [target.y, zeros(1,3)];
j=2;
for t=1:Tsteps
    a = 1;
    delta = purePursuitController(target,X,ld);
    U.a = a;
    U.delta = delta;
    X_ = simKinematicBicycle(X,U);
    ego_traj{t+1} = X_;

    X = X_;

    if (distance(target, X) <= eps)
        [target, ld] = setTarget(path, X);
        targets.x(j) = target.x;
        targets.y(j) = target.y;
        j=j+1;
    end
%     [target, ld] = setTarget(path, X);
    if (distance(goal, X) <= eps)
        break
    end
end

% Extract ego coordinates
i = 1;
tf = 1;
while (~isempty(ego_traj{i}) && i<Tsteps+1)
    Xe(i) = ego_traj{i}.x;
    Ye(i) = ego_traj{i}.y;
    i=i+1;
end
% plot
lane_width = 3.7;
plot([0 12], [lane_width lane_width], '--', 'Color', [0.5 0.5 0.5], 'LineWidth',2)
set(gca,'DataAspectRatio',[1 2 1],...
        'PlotBoxAspectRatio',[1 1 1],...
        'XLim',[0 12],...
        'YLim',[0 lane_width*2])
hold on
% plot(path.X, path.Y, '--r')
plot(targets.x, targets.y, 'x')
plot(Xe, Ye)
plot(target.x, target.y, 'x', 'LineWidth',2)
grid on
legend('','targets', 'ego rear-axle center')
xlabel('X [m]')
ylabel('Y [m]')
title('Pure pursuit')

function dis = distance(p1, p2)
dis = sqrt((p1.x-p2.x)^2 + (p1.y-p2.y)^2);
end