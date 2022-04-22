function W = euler_method(time_interval, X0, h, I, L)

W = X0;
n = (time_interval(2) - time_interval(1)) / h;
    
for i = 1:n
   W = eulerstep(W, h, I, L);
end

function W = eulerstep(W, h, I, L)
wb = I \ W' * L;    
omega = rotating_matrix(wb);
W = W * exponent_function(h, omega);  
end 
end