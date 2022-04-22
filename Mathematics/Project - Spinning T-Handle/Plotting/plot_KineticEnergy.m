function plt = plot_KineticEnergy(X, interval, I, L)
%plot_KineticEnergy plots the total kinetic energy for the T-Handle
%   X = a list of X matricies for each time step 
%       over the time interval 'interval'
%   I = moment of inertia for  the T-handle 
%   L = torque for the t-handle

n = length(X);
h = (interval(2) - interval(1)) / n;
t = interval(1) + h : h : interval(2);

K = zeros(1, n);
for i = 1:n
    wb = angular_velocity(X{i}, I, L);
    K(i) = kinetic_energy(I, wb);
end

plt = plot(t, K,'linewidth', 2);
xlabel('Time (seconds)');
ylabel('Rotational kinetic energy (Joule)');
end