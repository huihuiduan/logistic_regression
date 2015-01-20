%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: Logistic regression with gradient descent

% Objective: Implement Gradient Descent algorithm to logistic regression

% Author: Huihui Duan
% First Created: Sep/17/2013
% Last Modified: Jan/19/2015

% Usage: 
% /usr/local/octave/3.8.0/bin/octave logistic_regression.m arg1 arg2 arg3
% arg1 - training.txt - training data set (no col names, last column as output)
% arg2 - testing.txt - testing data set (no col names)
% arg3 - prediction.txt - predictions of testing data set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#!/usr/local/octave/3.8.0/bin/octave -qf

%% Initialization
clear ; close all; clc;

%% ============ Part 1:Load training data set  ============
%% Load Data
fprintf('Loading training data ...\n');

%% Load Data with last column of output, y
training = load(argv(){1});
% number of parameters exclude intercept
p = columns(training) - 1;
X = training(:, 1 : p);
y = training(:, (p + 1));

%% ============ Part 2: Compute Cost and Gradient ============

%  Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X);

% Add intercept term to X and X_test
X = [ones(m, 1) X];

% Initialize fitting parameters
initial_theta = zeros(n + 1, 1);

%% ============= Part 3: Optimizing using fminunc  =============
%  se a built-in function (fminunc) to find the
%  optimal parameters theta.

fprintf('Running gradient descent using fminnuc...\n');
%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 4000);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% Print theta to screen
fprintf('theta: \n');
fprintf(' %f \n', theta);

%% ============== Part 4: Predict and Output ==============
% Load testing data
fprintf('Loading testing data ...\n');
testing = load(argv(){2});
fprintf('Making prediction ...\n');

% Prediction on testing data
X_testing = [ones(size(testing, 1), 1) testing];
p = predict(theta, X_testing);

fprintf('Writing to text file ...\n');
% Write testing predictions to a file
fid = fopen(argv(){3}, "w");
fprintf(fid,'%.7g\n',[p]);
fclose(fid);
fprintf('Done ...\n');
