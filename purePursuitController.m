%%%%% Viranjan Bhattacharyya
%%%%% vbhatta@clemson.edu

function delta = purePursuitController(target_point, ego_states, ld)
% Input: target point (struct), ego states x,y,v (struct), lookahead
% Output: bicycle model steering angle

L = 5; % Kinematic Bicycle param - wheelbase [m]

x_t = target_point.x;
y_t = target_point.y;

x_e = ego_states.x;
y_e = ego_states.y;
v_e = ego_states.v;

alpha = atan2((y_t - y_e),(x_t - x_e));

delta = atan2((2*L*sin(alpha)),ld);