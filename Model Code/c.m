% Rotten tomato scores
tomato_score = [21; 10; 24; 84; 79; 66; 65; 41; 23; 28];
% Production cost
cost = [86.05; 51.13; 133.05; 118.38; 140.19; 42.07; 45.31; 70.44; 78.09; 51.59];
% Final Box Office Sales
sales = [225.24; 49.26; 205.71; 238.67; 238.97; 146.79; 98.36; 87.76; 62.48; 144.08];

% Set up A matrix and b vector
A = [ones(size(tomato_score)) tomato_score cost];
b = sales;

% Solve Ax = b for x
x = A\b;

% Create our model
model = @(t, b) (x(1) + x(2)*t + x(3)*b);
fprintf("a_1 = %f\n", x(1))
fprintf("a_2 = %f\n", x(2))
fprintf("a_3 = %f\n", x(3))

% Build our model visualization
[X, Y] = meshgrid(0:1:100, 0:1:200);
model_visualization = model(X, Y);

% Plot our results
hold on;
scatter3(tomato_score, cost, sales, 'filled', 'DisplayName', "Raw Data");
surf(X, Y, model_visualization, 'DisplayName', "Regression Model");
alpha(0.5);
xlabel('Rotten Tomato Score');
ylabel('Production Cost Adjusted for Inflation(millions)')
zlabel('Final Box Office Sales Adjusted for Inflation(millions)')
title('Rotten Tomato Score & Production Cost vs. Final Box Office Sales of a Will Ferrell Movie')
legend;
hold off;

% Gather error of our model
error = sum((sales - model(tomato_score, cost)).^2);
fprintf("OLS Error: %f\n", error);

% Prediction
model(54, 46)