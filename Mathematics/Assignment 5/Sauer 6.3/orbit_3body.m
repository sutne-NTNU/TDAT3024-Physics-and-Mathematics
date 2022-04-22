%Plotting program for three-body problem
function orbit_3body(time_interval, initial_positions, initial_velocities, masses , number_of_steps, p )
% calculate step-size
h = (time_interval(2) - time_interval(1)) / number_of_steps;

% create window
grid_size = 5;
set(gca,'XLim',[-grid_size grid_size],...
	    'YLim',[-grid_size grid_size],...
		'XTick',[-grid_size 0 grid_size],...
		'YTick',[-grid_size 0 grid_size],...
		'SortMethod','depth','Visible','on');
cla;
drawnow;

% create objects
for j = 1:3
	head(j) = animatedline('Color', 'red', 'Marker', '.', 'markersize', 15);
	tail(j) = animatedline('Color', 'blue', 'Linestyle', '-');
end

% set initial conditions
Y(1,1,:,:) = initial_positions;
Y(1,2,:,:) = initial_velocities;

%
M = [[0 masses(3) -masses(2)];
	[-masses(3) 0 masses(1)];
	[masses(2) -masses(1) 0]];

%
A = [[0 1 -1];
	[-1 0 1];
	[1 -1 0]];

%
F = @(R,A,M)(([1 1]' * (sqrt([1 1] * ((R * A).^2)).^(-3))).* (R * A)) * M;

%
for k = 1:(number_of_steps/p)
	%
	for i = 1:p
		R = reshape(Y(i,1,:,:),[2,3]);
		V = reshape(Y(i,2,:,:),[2,3]);
		P = V;
		Q = F(R,A,M);
		Y(i+1,1,:,:) = R + h * P;
		Y(i+1,2,:,:) = V + h * Q;
	end
	
	%
	Y(1,1,:,:) = Y(p+1,1,:,:);
	Y(1,2,:,:) = Y(p+1,2,:,:);
	
	%
	for j=1:3
		clearpoints(head(j));
		addpoints(head(j), Y(1,1,1,j), Y(1,1,2,j));
		addpoints(tail(j), Y(2:p,1,1,j), Y(2:p,1,2,j));
	end
	drawnow;
end
end
