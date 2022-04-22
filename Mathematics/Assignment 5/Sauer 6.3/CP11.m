% (a)
time_interval = [0 100];
initial_positions = [[-0.970 0.243]' [0.970 -0.243]' [0 0]'];
initial_velocities = [[-0.466 -0.433]' [-0.466 -0.433]' [-2*-0.466 -2*-0.433]'];
masses = [1 1 1];
number_of_steps = 10000;
steps_per_point_plotted = 5;

orbit_3body(time_interval, initial_positions, initial_velocities, masses, number_of_steps, steps_per_point_plotted)


% (b)
k = 5;
initial_velocities = [[-0.466 -0.433]' [-0.466 -0.433]' [10-k -2*-0.433]'];
%orbit_3body(time_interval, initial_positions, initial_velocities, masses, number_of_steps, steps_per_point_plotted)

