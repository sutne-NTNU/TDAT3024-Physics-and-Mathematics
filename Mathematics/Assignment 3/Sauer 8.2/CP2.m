f = @(x) 0*x;              x_left=0; x_right=1;
g = @(x) 2*pi*sin(pi*x);
l = @(t) 0*t;              y_bottom=0; y_top=1;
r = @(t) 0*t;

c = sqrt(4); 
h = 0.05;
k = h/c; % maximum calue of k
wave(x_left, x_right, y_bottom, y_top, c, h, k, f, g, l, r)

k = 0.03; % Testing with too large k
wave(x_left, x_right, y_bottom, y_top, c, h, k, f, g, l, r)