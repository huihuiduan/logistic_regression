function g = sigmoid(z)
	%SIGMOID Compute sigmoid functoon
	%   J = SIGMOID(z) computes the sigmoid of z.

	g = zeros(size(z));

	% Compute the sigmoid of each value of z (z can be a matrix, vector or scalar).
	[a, b] = size(z);

	if (a == 1 && b == 1)
	    g = 1 / (1 + exp(-z));
	else
	    for i = 1 : a
			for j = 1 : b
			    g(i, j) = 1 / (1 + exp(-z(i, j)));
			endfor
	    endfor
	endif

end
