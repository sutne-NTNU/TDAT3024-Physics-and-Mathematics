%Plotting program for one-body problem
%Inputs: 
%   time_interval = time interval
%   initial_conditions = [x position, x velocity, y pos, y velocity]
%   n = number of steps 
%   p = steps per point plotted 
% Example usage: orbit([0 100],[0 1 2 0],10000,5)
function orbit_Lorenz(time_interval, initial_conditions, n, p)
% plot n points
h = (time_interval(2) - time_interval(1)) / n;

% grab initial conditions
x0 = initial_conditions(1);
vx0 = initial_conditions(2);
y0 = initial_conditions(3);
vy0 = initial_conditions(4);

% build y vector
y(1,:) = [x0 vx0 y0 vy0];
t(1) = time_interval(1);

set(gca, 'XLim', [-5 5], 'YLim', [-5 5], 'XTick', [-5 0 5], 'YTick', [-5 0 5], 'Drawmode', 'fast', 'Visible', 'on');
cla;

% draw center
line('color', 'r', 'Marker', '.', 'markersize', 25, 'xdata', 0, 'ydata', 0);
drawnow;

% settings for object
head = line('color', 'b', 'Marker', '.', 'markersize', 25, 'erase', 'xor', 'xdata', [], 'ydata', []);
tail = line('color', 'b', 'LineStyle', '-', 'erase', 'none', 'xdata', [], 'ydata', []);

for k = 1:(n/p)
	for i = 1:p
		t(i+1) = t(i) + h;
		y(i+1,:) = eulerstep(t(i), y(i,:), h);
	end
	y(1,:) = y(p+1,:);
	t(1) = t(p+1);
	set(head, 'xdata', y(1,1), 'ydata', y(1,3));
	set(tail, 'xdata', y(2:p,1), 'ydata', y(2:p,3));
	drawnow;
end
end





