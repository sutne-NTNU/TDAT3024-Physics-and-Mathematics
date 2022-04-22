% Forward Difference Method
% input: space interval [x_left, x_right], 
%        time interval [y_bottom, y_top],
%        stepsize [h],
%        ? [k],
%        bounding conditions [f, l, r]
% output: figure
function heat(x_left, x_right, y_bottom, y_top, h, k, f, l, r)	
    m = ((x_right-x_left)/h)-1; 
    n = (y_top-y_bottom)/k; 
	
    sigma = (1*k)/(h*h);
	
    a = diag(1-2*sigma*ones(m,1))+diag(sigma*ones(m-1,1),1);
    a = a+diag(sigma*ones(m-1,1),-1); 
	
    left_side = l(y_bottom+(0:n)*k); 
	right_side = r(y_bottom+(0:n)*k);
	
    w(:,1)=f(x_left+(1:m)*h)'; 
    for j=1:n
        w(:,j+1)=a*w(:,j)+sigma*[left_side(j);zeros(m-2,1);right_side(j)];
    end
    w=[left_side;w;right_side]; 
    x=(0:m+1)*h; t=(0:n)*k;
	
	% Plotting
    mesh(x,t,w') 
    view(-60,30)
	axis([x_left x_right y_bottom y_top 1 25])
end

