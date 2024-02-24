%%%%% Viranjan Bhattacharyya
%%%%% vbhatta@clemson.edu
% Starter script
function [target_point, ld] = setTarget(path, ego_state)

v_e = ego_state.v;
% speed dependent lookahead
Kd = 1;
ld_min = 1;
ld_max = 8;
ld = Kd*v_e;
if (ld<ld_min)
    ld = ld_min;
end
if (ld>ld_max)
    ld = ld_max;
end

% find point on path nearest to ld
dis_from_ego = 1000*ones(1,length(path.X));
for i=1:length(path.X)
    if (path.X(i) > ego_state.x)
        dis_from_ego(i) = sqrt((path.X(i)-ego_state.x)^2 + (path.Y(i)-ego_state.y)^2);
    end
end

check = abs(dis_from_ego - ld);
[val, idx] = min(check);

target_point.x = path.X(idx);
target_point.y = path.Y(idx);