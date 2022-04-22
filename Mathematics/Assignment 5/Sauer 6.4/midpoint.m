%Euler’s Method for Solving Initial Value Problems
function midpoint(interval, initialY, n, f, g)
% calculating step size
h = (interval(2) - interval(1)) / n;

% Setting inital conditons
t(1) = interval(1);
exact(1) = g(t(1));
approximation(1) = initialY;

% Iterating, calculating new values and error at each step
for i = 1:n
	t(i+1) = t(i) + h;
	approximation(i+1) = eulerstep(t(i), approximation(i), h, f);
	exact(i+1) = g(t(i+1));
	error(i+1) = abs(approximation(i+1) - exact(i+1));
end

% show results
table(t', approximation', exact', error')

	function newW = eulerstep(current_time, currentW, step_size, f)
		%one step of Euler’s Method
		newW = currentW + step_size * f(current_time + step_size/2, currentW + step_size/2 * f(current_time, currentW));
	end
end