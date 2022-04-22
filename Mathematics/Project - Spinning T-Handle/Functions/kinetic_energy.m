function K = kinetic_energy(I, w)
% Calculates the total rotational kinetic energy of the object
%    I = moment of inertia around each axis
%    w = angular velocity around center of mass

I_x = I(1,1);
I_y = I(2,2);
I_z = I(3,3);

w_x = w(1);
w_y = w(2);
w_z = w(3);

K = 1/2 * ((I_x * w_x^2) + (I_y * w_y^2) + (I_z * w_z^2));
end

