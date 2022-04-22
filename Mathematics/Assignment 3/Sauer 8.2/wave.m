% Finite Difference Method 
% input: space interval [x_left, x_right], 
%        time interval [y_bottom, y_top],
%        step size [h],
%        boundary conditions [f,g,l,r]
% number of space steps m, number of time steps n
% output: figure
function wave(x_left, x_right,y_bottom, y_top, c, h, k, f, g, l, r)
n = y_top/k; 
m = (x_right-x_left)/h-1;

sigma = c*k/h;

a = diag(ones(m,1)*(2-2*sigma^2)) + diag(ones(m-1,1)*sigma^2,-1);
a = a + diag(ones(m-1,1)*sigma^2, 1);

x = x_left+(1:m)*h;
t = 0+(0:n)*k;

w(:,1) = f(x);
Vside = l(t);
Hside = r(t);

w(:,2) = (1/2)*a*f(x')+k*g(x');%(1/2)sigma^2*s(...) som er 0
for j=2:n
	w(:,1+j) = a*w(:,j)-w(:,j-1);
end
w = [Vside;w;Hside];

% Plotting
figure
x = [x_left,x,x_right];
mesh(x,t,w');
z_min = min(min(w));
z_max = max(max(w));
view(-60,30);
axis([x_left x_right y_bottom y_top z_min z_max]);
end

