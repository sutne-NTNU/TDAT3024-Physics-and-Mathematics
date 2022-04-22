f = @(x)exp(x);      x_left=0;    x_right=1;
l = @(t)exp(2*t);    y_bottom=0;  y_top=1;
r = @(t)exp(2*t+1);

k = 0.002; h = 0.1;

heat(x_left, x_right, y_bottom, y_top, h, k, f, l, r);