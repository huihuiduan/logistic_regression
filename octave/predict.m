function p = predict(theta, X)

	%PREDICT Predict the probability using learned logistic
	%regression parameters theta
	%   p = PREDICT(theta, X) computes the predictions for X

	m = size(X, 1); % Number of training examples

	p = zeros(m, 1);

	% make predictions using learned logistic regression parameters.

	for i = 1 : m
		p(i) = sigmoid(theta' * X(i, :)');
	endfor

end
