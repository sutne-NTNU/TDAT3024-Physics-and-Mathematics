function ohm = rotating_matrix(w)
w_x = w(1);
w_z = w(2);
w_y = w(3);

ohm = [[  0   -w_y   w_z];
	   [ w_y    0   -w_x];
	   [-w_z   w_x    0 ]];
end