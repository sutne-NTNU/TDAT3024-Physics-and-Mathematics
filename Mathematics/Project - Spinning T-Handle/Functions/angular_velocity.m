function w = angular_velocity(X, I, L)
w = (X * I) \ L;
end