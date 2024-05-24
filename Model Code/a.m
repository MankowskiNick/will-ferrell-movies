% Production cost
cost = [86.05, 51.13, 133.05, 118.38, 140.19, 42.07, 45.31, 70.44, 78.09, 51.59];

% Final Box Office Sales
sales = [225.24, 49.26, 205.71, 238.67, 238.97, 146.79, 98.36, 87.76, 62.48, 144.08];

% Get our coeficients a_1, a_2
coef = polyfit(cost, sales, 1);

% Print our coeficients
fprintf("a_1 = %f\n", coef(1));
fprintf("a_2 = %f\n", coef(2));

% Assemble our model for a given cost c
model = @(c) polyval(coef, c);

% Create a domain for the models
timeCts = 0:0.1:150;
% Create the models
cost_visualization = model(timeCts);

hold on;
% Plot the raw data
scatter(cost, sales, 'DisplayName', 'Raw Data');
% Plot our model
plot(timeCts, cost_visualization, 'DisplayName', "Linear Regression Model");
% Set limits to properly showcase our graph
xlim([0, 150]);
ylim([0, 300]);
% Label and title the graph accordingly
xlabel("Production Cost of Movie Adjusted for Inflation(millions)");
ylabel("Final Box Office Sales of Movie Adjusted for Inflation(millions)");
title("Cost vs. Final Box Office Sales of a Will Ferrell Movie");
legend;
hold off;

% Calculate OLS error of each model
cost_error = sum((sales - polyval(coef, cost)).^2);

% Print error
fprintf('Movie Cost Error: %f\n', cost_error);

% Results:
%   Movie Cost Error: 22808.960460