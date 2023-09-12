# Import necessary libraries to use regex and random number generation
import re, random

# Create empty lists to store movie titles, years, and rotten tomato scores
titles = []
years = []
tomato_scores = []

# Open the HTML file and grab the titles from it
with open('movies_site.html', 'r') as file:
    # Get contents of HTML file
    html = file.read()

    # Use regex to pull movie titles, years, and rotten tomato scores
    title_expr = r'<a href="[^"]+">([^<]+)</a>'
    year_expr = r'<span class="subtle start-year">\((\d{4})\)</span>'
    tomato_expr = r'<span class="tMeterScore">(\d+%)</span>'

    # Extract the titles, years, and tomato scores from the HTML
    titles = re.findall(title_expr, html)
    years = re.findall(year_expr, html)
    tomato_scores = re.findall(tomato_expr, html)

# Pick 10 random indices to pull data from
titled_indices = []
while len(titled_indices) < 10:
    number = random.randint(0, len(titles) - 1)

    # Only pick the numbers not already picked, this way we don't pick any duplicate movies
    if number not in titled_indices:
        titled_indices.append(number)

# Create the CSV file content
content = "Title,Year,Rotten Tomatoes Score,IMDb Rating,Production Cost(Adjusted for Inflation),Final Box Office Sales(Adjusted for Inflation)\n"

# Add the randomly chosen indices to the CSV file content
for index in titled_indices:
    content += titles[index] + "," + years[index] + "," + tomato_scores[index] + ",,,\n"

# Write the titles to a file
with open('will_ferrell_movies.csv', 'w') as file:
    file.write(content)