f = @(t,y) t^2*y;
initial_t = 0;
initial_y = 1;
h = 0.1;
interval = [0, 1];
y_exact = @(t) exp(t.^3/3);

Euler(f, initial_t, initial_y, h, interval, y_exact)
