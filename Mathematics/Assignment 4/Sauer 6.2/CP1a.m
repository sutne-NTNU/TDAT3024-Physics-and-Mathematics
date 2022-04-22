f = @(t,y) t;
initial_t = 0;
initial_y = 1;
h = 0.1;
interval = [0, 1];
y_exact = @(t) 1+t.^2/2;

Trapezoid(f, initial_t, initial_y, h, interval, y_exact)