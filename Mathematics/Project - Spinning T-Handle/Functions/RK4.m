function [W, X_all] = RK4(time_interval, X0, h, I, L)
W    = X0;
n    = (time_interval(2) - time_interval(1)) / h;
    
X_all = cell(1,n); % save instances of X matrix for animation/plotting
for i = 1:n
    W = rk4step(W, h, I, L);
    X_all{i} = W;
end

function W = rk4step(W, h, I, L)
sigma1 = I \ W' * L;
SIGMA1 = rotating_matrix(sigma1);
	   
sigma2 = I \ exponent_function((-h/2), SIGMA1) * W' * L;
SIGMA2 = rotating_matrix(sigma2);
	   
sigma3 = I \ exponent_function((-h/2), SIGMA2) * W' * L;
SIGMA3 = rotating_matrix(sigma3);
	   
sigma4 = I \ exponent_function(-h, SIGMA3) * W' * L;
SIGMA4 = rotating_matrix(sigma4);
	   
W = W * exponent_function(h/6, ...
	                     (SIGMA1 + (2 * SIGMA2) + (2 * SIGMA3) + SIGMA4));
end
end