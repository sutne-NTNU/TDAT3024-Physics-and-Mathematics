% use Trapezoid method to approximate differential equations
% parameters: f       : the function f(t,y)=y'
%             inital_t: inital value of t
%             inital_y: y(initial_t)
%             h       : step-length
%             interval: interval for approximation eg. [0, 1]
%             y_exact : exact solution for calculation of error
function Trapezoid(f, initial_t, initial_y, h, interval, y_exact)
% calculate number of iterations
length_of_interval = interval(2) - interval(1);
iterations = length_of_interval/h;

% Creating array of timepoints
t = h * (0:iterations)';

% Calculating exact solution for all values of t
y = y_exact(t);

% Create empty w and error arrays
w = zeros(1, iterations+1)';
error = zeros(1, iterations+1)';

% add initial value to w
w(initial_t + 1) = initial_y;

% Euler steps
for i=(1:iterations)
	w(i + 1) = w(i) ...
	           + h/2 * f(t(i), w(i)) ...
			   + h/2 * f(t(i) + h, w(i) + h * f(t(i), w(i)));
	 
	% calculate error at this step
	error(i + 1) = abs(y(i + 1) - w(i + 1));
end
% Display results in a table
table(t, w, y, error)
end

