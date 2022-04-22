function draw_T_handle_animated(init_Handle, init_Shaft, X)
%% Fetch inital values

R_handle = init_Handle(1);
L_handle = init_Handle(2);
center_handle = [init_Handle(3) init_Handle(4) init_Handle(5)];

R_shaft = init_Shaft(1);
L_shaft = init_Shaft(2);
center_shaft = [init_Shaft(3) init_Shaft(4) init_Shaft(5)];

%% Set drawing specifications

color_handle = [255, 1, 29]/255;
color_shaft = [1, 29, 255]/255;
color_connection = [46 52 58]/255;
numberOfEdges = 1000;

%% Draw T-handle in inital position

HANDLE = draw_Sylinder(R_handle, L_handle, center_handle, color_handle, numberOfEdges);
hold on 
rotate(HANDLE, [1 0 0], 90)  

SHAFT = draw_Sylinder(R_shaft, L_shaft, center_shaft, color_shaft, numberOfEdges);
rotate(SHAFT, [0 1 0], 90, [center_shaft(1) L_shaft/2 0])

center_connection = [center_shaft(1) center_shaft(2) center_shaft(3)-L_shaft/2-R_handle/2];
CONNECTION = draw_Sylinder(R_shaft, R_handle, center_connection, color_connection, numberOfEdges);
rotate(CONNECTION, [0 1 0], 90, [center_shaft(1) L_shaft/2 0])

% close end of the sylinders
handle_c1 = draw_Circle([center_handle(1), center_handle(2)+L_handle/2, center_handle(3)], [0 1 0], R_handle, color_handle);
handle_c2 = draw_Circle([center_handle(1), center_handle(2)-L_handle/2, center_handle(3)], [0 1 0], R_handle, color_handle);
shaft_c   = draw_Circle([center_shaft(1)+L_shaft/2, center_shaft(2), center_shaft(3)], [1 0 0], R_handle, color_shaft);

% Adding directional axis-lines for the t-handle
lim = [-5 5];
lx = line([0 lim(2)], [0,0], [0,0], 'LineWidth', 2, 'Color', color_shaft);
ly = line([0,0], [0 lim(2)], [0,0], 'LineWidth', 2, 'Color', color_handle);
lz = line([0,0], [0 0], [0 lim(2)], 'LineWidth', 2, 'Color', 'g');

hold off

%% Calculate center of mass to rotate around it

m_h = pi * R_handle^2 * L_handle;
m_s = pi * R_shaft^2 *L_shaft;
center_body = [ (m_h*center_handle(1)+m_s*center_shaft(1))/(m_h*m_s),...
	            (m_h*center_handle(2)+m_s*center_shaft(2))/(m_h*m_s),...
				(m_h*center_handle(3)+m_s*center_shaft(3))/(m_h*m_s)];

%% Rotate according to X values TODO
Id = eye(3); % current position

% directional unit vectors of end position
x_unit = X(:,1)/norm(X(:,1));
y_unit = X(:,2)/norm(X(:,2));

pitch = 90 - rad2deg(acos(dot(Id(:,3), x_unit)));
% text(3, 0 ,4.0, ['Pitch: ' num2str(round(pitch, 2))]);

yaw_direction = [x_unit(1) x_unit(2) 0]/norm([x_unit(1) x_unit(2) 0]);
yaw = rad2deg(acos(dot(Id(:,1), yaw_direction)));
cross_vector_yaw = cross(Id(:,1), yaw_direction);
if cross_vector_yaw(3) < 0; yaw = - yaw; end 
% text(3, 0 ,4.3, ['Yaw: ' num2str(round(yaw, 2))]);

roll = 90 - rad2deg(acos(dot(Id(:,3), y_unit)));
cross_vector_roll = cross(Id(:,3), y_unit);
if cross_vector_roll(1) > 0; roll = 180 - roll; end
% text(3, 0 ,4.6, ['Roll: ' num2str(round(roll, 2))]);

rotate_all([1 0 0], roll);
rotate_all([0 1 0], pitch);
rotate_all([0 0 1], yaw);

%% Camera and plot specifications

light('position', [5 -5 5])
lighting gouraud
view([35 25])
axis equal

xlim(lim);ylim(lim);zlim(lim);
camzoom(1.8)
% adding axis lines
line([0 lim(2)], [0,0], [0,0], 'LineWidth', 1, 'Color', color_shaft);
line([0,0], [0 lim(2)], [0,0], 'LineWidth', 1, 'Color', color_handle);
line([0,0], [0,0], [0 lim(2)], 'LineWidth', 1, 'Color', 'g');
axis off

%% Sub-Functions

function rotate_all(axis, degrees)
rotate(HANDLE    , axis, degrees, center_body);
rotate(SHAFT     , axis, degrees, center_body);
rotate(CONNECTION, axis, degrees, center_body);

rotate(handle_c1 , axis, degrees, center_body);
rotate(handle_c2 , axis, degrees, center_body);
rotate(shaft_c   , axis, degrees, center_body);

rotate(lx        , axis, degrees, center_body);
rotate(ly        , axis, degrees, center_body);
rotate(lz        , axis, degrees, center_body);
end

function sylinder = draw_Sylinder(radius, length, center, color, n)
[x, y, z] = cylinder(radius, n);
x = center(1) + x;
y = center(2) + y;
z = center(3) + z * length - length/2;
sylinder = surf(x,y,z, 'facecolor', color,'edgecolor','none');
end

function circle = draw_Circle(center, normal, radius, color)
theta=0:0.01:2*pi;
v=null(normal);
points=repmat(center',1,size(theta,2))+radius*(v(:,1)*cos(theta)+v(:,2)*sin(theta));
circle = fill3(points(1,:),points(2,:),points(3,:),color, 'edgecolor', 'none');
end
end
