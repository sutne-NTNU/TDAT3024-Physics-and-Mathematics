function plot_AngularVelocity(X, interval, I, L)
%plots the angular velocity around x, y and z axis
%   X = a list of X matricies for each time step
%   over the time interval 'interval'
%   I = moment of inertia for t-handle
%   L = torque for t-handle

n = length(X);
h = (interval(2) - interval(1)) / n;
t = interval(1) + h : h : interval(2);

wb_x = zeros(1, n);
wb_y = zeros(1, n);
wb_z = zeros(1, n);

for i = 1 : n
    wb = (X{i}*I) \ L;
    wb_x(i) = wb(1);
    wb_y(i) = wb(2);
	wb_z(i) = wb(3);
end

figure
set(gcf,'position',[0,0, 900, 400])
hold on
plot(t, wb_x, 'blue', 'LineWidth', 2)
plot(t, wb_y, 'red', 'LineWidth', 2)
plot(t, wb_z, 'green', 'LineWidth', 2)
hold off
xlabel('Time (seconds)');
ylabel('Angular velocity around center of mass (rad/s)');
legend({'${\omega_{x}}$', '${\omega_{y}}$', '${\omega_{z}}$'}, ...
	    'Interpreter','latex', 'FontSize', 18)
end