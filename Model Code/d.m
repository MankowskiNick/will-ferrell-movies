% Rotten tomato scores
tomato_score = [21; 10; 24; 84; 79; 66; 65; 41; 23; 28];
% IMDb Scores
imdb_score = [6; 3.9; 4.8; 6.6; 6.6; 7.1; 6.5; 5.6; 5.8; 6];
% Will Ferrell's Age
age = [50; 51; 38; 52; 43; 37; 34; 38; 41; 48];
% Production cost
cost = [86.05; 51.13; 133.05; 118.38; 140.19; 42.07; 45.31; 70.44; 78.09; 51.59];
% Final Box Office Sales
sales = [225.24; 49.26; 205.71; 238.67; 238.97; 146.79; 98.36; 87.76; 62.48; 144.08];

% Set up A matrix and b vector
A = [ones(size(tomato_score)) tomato_score cost (tomato_score.^2) (cost.^2) (tomato_score.*cost)];
b = sales;

% Solve Ax = b for x
x = A\b;

% Print coefficients
for i = 1:size(x)
    fprintf("a_%d = %f\n", i, x(i));
end
% Build our model
model = @(t, b)(x(1) + x(2)*t + x(3)*b + x(4)*(t.^2) + x(5)*(b.^2) + x(6)*(t.*b));

% Create our model visualization
[X, Y] = meshgrid(0:1:100, 0:1:200);
model_visualization = model(X, Y);

% Plot our results
hold on;
scatter3(tomato_score, cost, sales, 'filled', 'r', 'DisplayName', 'Raw Data');
surf(X, Y, model_visualization, 'DisplayName', 'Quadratic Regression Model');
alpha(0.5);
xlabel('Rotten Tomato Score');
ylabel('Production Cost Adjusted for Inflation(millions)')
zlabel('Final Box Office Sales Adjusted for Inflation(millions)')
title('Rotten Tomato Score & Production Cost vs. Final Box Office Sales of a Will Ferrell Movie')
hold off;

% Gather error of our model
error = sum((sales - model(tomato_score, cost)).^2);
fprintf("OLS Error: %f\n", error);