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
A = [ones(size(tomato_score)) tomato_score age cost];
b = sales;

% Solve Ax = b for x
x = A\b;

% Print the coefficients
for i = 1:length(x)
    fprintf("a_%d = %f, ", i, x(i));
end
fprintf("\n");

x = 0:1:100;
y = 30:1:60;
z = 30:1:250;
[X, Y, Z] = meshgrid(0:1:100, 30:1:60, 30:1:250);

model = @(t, a, b)(x(1) + x(2)*t + x(3)*a + x(4)*b);

error = sum((model(tomato_score, age, cost) - sales).^2);
fprintf("Error: %f\n", error);

% Results: 
%   Error: 565319.514600