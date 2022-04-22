time_interval = [0 100];
initial_positions = [[2 2]' [0 0]' [-2 -2]'];
% (a)
initial_velocities = [[0.2 -0.2]' [0 0]' [-0.2 0.2]'];
% (b)
initial_velocities = [[0.20001 -0.2]' [0 0]' [-0.2 0.2]'];
masses = [0.03 0.3 0.03];
number_of_steps = 10000;
steps_per_point_plotted = 5;

orbit_3body(time_interval, initial_positions, initial_velocities, masses, number_of_steps, steps_per_point_plotted)