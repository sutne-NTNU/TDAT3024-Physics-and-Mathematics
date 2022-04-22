f = @(t,y) t^2 * y;
g = @(t) exp(t^3 / 3);
interval = [0, 1];
initialY = 1;
h = 0.1; n = 1/h;

midpoint(interval, initialY, n, f, g)