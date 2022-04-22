% 4th order Runge-Kutta Method for Solving Initial Value Problems
function [t, approximation] = RungeKutta_4th_order(interval, initialY, n, f)
% calculating step size
h = (interval(2) - interval(1)) / n;

% Setting inital conditons
t(1) = interval(1);
approximation(1) = initialY;

% Iterating
for i = 1:n
	t(i+1) = t(i) + h;
	approximation(i+1) = step(t(i), approximation(i), h, f);
end

	function next_w = step(current_time, w, h, f)
		s1 = f(current_time, w);
		s2 = f(current_time + h/2, w + h/2 * s1);
		s3 = f(current_time + h/2, w + h/2 * s2);
		s4 = f(current_time + h, w + h * s3);
		next_w = w + (h * (s1 + 2 * s2 + 2 * s3 + s4)/6);
	end
end

