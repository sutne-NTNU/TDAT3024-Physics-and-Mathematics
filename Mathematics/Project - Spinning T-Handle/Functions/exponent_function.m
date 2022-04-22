function X = exponent_function(h, ohm)
I = eye(3);
w = norm([ohm(2,3) -ohm(1,3) ohm(1,2)]);

X = I + (1 - cos(w * h)) * (ohm.^2/w^2) + sin(w * h) * (ohm/w);
end