function draw_T_handle(init_Handle, init_Shaft)
%% Fetch inital values

R_handle = init_Handle(1);
L_handle = init_Handle(2);
c_handle = [init_Handle(3) init_Handle(4) init_Handle(5)];

R_shaft = init_Shaft(1);
L_shaft = init_Shaft(2);
c_shaft = [init_Shaft(3) init_Shaft(4) init_Shaft(5)];

%% Set drawing specifications

color_handle = [255, 1, 29]/255;
color_shaft = [1, 29, 255]/255;
color_connection = [46 52 58]/255;
numberOfEdges = 1000;

%% Draw T-handle in correct position

HANDLE = draw_Sylinder(R_handle, ...
	                   L_handle, ...
	                   c_handle, ...
	                   color_handle, ...
	                   numberOfEdges);
hold on 
rotate(HANDLE, [1 0 0], 90)  

SHAFT = draw_Sylinder(R_shaft, ...
	                  L_shaft, ...
					  c_shaft, ...
					  color_shaft, ... 
					  numberOfEdges);
rotate(SHAFT, [0 1 0], 90, [c_shaft(1) L_shaft/2 0])

center_connection = [c_shaft(1), ...
	                 c_shaft(2), ...
					 c_shaft(3)-L_shaft/2-R_handle/2];
CONNECTION = draw_Sylinder(R_shaft, ...
	                       R_handle, ...
						   center_connection, ...
					       color_connection, ...
						   numberOfEdges);
rotate(CONNECTION, [0 1 0], 90, [c_shaft(1) L_shaft/2 0])

% close end of the sylinders
draw_Circle([c_handle(1), c_handle(2)+L_handle/2, c_handle(3)], ...
	        [0 1 0], R_handle, color_handle);
draw_Circle([c_handle(1), c_handle(2)-L_handle/2, c_handle(3)], ...
	        [0 1 0], R_handle, color_handle);
draw_Circle([c_shaft(1)+L_shaft/2, c_shaft(2), c_shaft(3)], ...
	        [1 0 0], R_handle, color_shaft);
hold off

%% Camera and plot specifications

light('position', [5 -5 5])
lighting gouraud
view([35 25])
axis equal

legend({'Handtak','Skaft'},'fontsize',14)
xlabel('X','fontweight','bold','fontsize',14);
ylabel('Y','fontweight','bold','fontsize',14);
zlabel('Z','fontweight','bold','fontsize',14);
end

%% Sub-Functions
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
points=repmat(center',1,...
	          size(theta,2))+radius*(v(:,1)*cos(theta)+v(:,2)*sin(theta));
circle = fill3(points(1,:), ...
               points(2,:), ...
			   points(3,:), ...
			   color, 'edgecolor', 'none');
end