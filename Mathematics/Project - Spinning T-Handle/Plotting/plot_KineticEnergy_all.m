function plot_KineticEnergy_all(Xa, Xb, Xc, La, Lb, Lc, I, interval)
%plots the total kinetic energy for each X, for each of the exercises
%   Xn = a list of X matricies for each time step for exercise n
%   Ln = Torque for t-handle for exercise n
%   I = moment of inertia for the t-handle
%   interval = time interval for X

figure
set(gcf,'position',[0,0, 900, 400])
title('All kinetic energies')
hold on
plot_KineticEnergy(Xa, interval, I, La);
plot_KineticEnergy(Xb, interval, I, Lb);
plot_KineticEnergy(Xc, interval, I, Lc);
hold off
ylim([300 900])
legend('K_a', 'K_b', 'K_c', 'FontSize', 12)
end