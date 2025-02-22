---1. How many rows are in the names table? ans: 1957046
SELECT COUNT(name) AS total_rows
FROM names;
-- count all rows
SELECT COUNT(*) AS row_number
FROM names;
---2. How many total registered people appear in the dataset? ans: 351653025
SELECT SUM(num_registered) AS total_registered_people
FROM names;
---3. Which name had the most appearances in a single year in the dataset? ans: Linda
SELECT year, name, MAX(num_registered) AS most_appearances
FROM names
GROUP BY year, name
ORDER BY MAX(num_registered) DESC
LIMIT 1;
---4. What range of years are included? ans: 1880 -2018
SELECT MAX(year) AS highest_year, MIN(year) AS lowest_year
FROM names;
---5. What year has the largest number of registrations? ans: 1957
SELECT year, SUM(num_registered) AS Total_registration_no
FROM names
GROUP BY year
ORDER BY sum(num_registered) DESC
LIMIT 1;
---6. How many different (distinct) names are contained in the dataset? ans: 98400
SELECT COUNT(DISTINCT name) AS total_unique_name
FROM names;
---7. Are there more males or more females registered? ans: Females
SELECT gender, COUNT(gender) AS gender_count
FROM names
GROUP BY gender
ORDER BY COUNT(gender) DESC;
---8. What are the most popular male and female names overall (i.e., the most total registrations)? ans: male name is James, Female name is Mary
SELECT DISTINCT ON(gender) gender, name, SUM(num_registered) AS total_registered_count
FROM names
GROUP BY gender, name
ORDER BY gender, SUM(num_registered) DESC;
---9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)? ans: Male name is Jacob, Female name is Emily.
SELECT DISTINCT ON(gender) gender, name, SUM(num_registered) AS registered_count
FROM names
WHERE year BETWEEN 2000 AND 2009
GROUP BY gender, name
ORDER BY gender, SUM(num_registered) DESC;
---10. Which year had the most variety in names (i.e. had the most distinct names)? ans: 2008
SELECT year, COUNT(DISTINCT name) AS distinct_name_count
FROM names
GROUP BY year
ORDER BY COUNT(DISTINCT name) DESC
LIMIT 1;
---11. What is the most popular name for a girl that starts with the letter X? ans: Ximena
SELECT name, SUM(num_registered) as name_count
FROM names
WHERE name LIKE 'X%' AND gender = 'F'
GROUP BY name
ORDER BY name_count DESC
LIMIT 1;
---12. Write a query to find all (distinct) names that start with a 'Q' but whose second letter is not 'u'.
SELECT DISTINCT name
FROM names
WHERE name LIKE 'Q%' 
AND name NOT LIKE 'Qu%';
---13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question. ans: Stephen
SELECT name, COUNT(name) AS name_count
FROM names
WHERE name IN ('Stephen','Steven')
GROUP BY name
ORDER BY COUNT(name) DESC;
---14. Find all names that are "unisex" - that is all names that have been used both for boys and for girls.
SELECT name
FROM names
GROUP BY name
HAVING COUNT(DISTINCT gender) >1;
---15. Find all names that have made an appearance in every single year since 1880.
SELECT name 
FROM names
WHERE year >= 1880
GROUP BY name
HAVING COUNT(DISTINCT name) = COUNT(DISTINCT year);
---16. Find all names that have only appeared in one year.
SELECT name 
FROM names
GROUP BY name
HAVING COUNT(DISTINCT year) = 1;
---17. Find all names that only appeared in the 1950s.
SELECT name
FROM names
GROUP BY name
HAVING MIN(year)>1950 AND MAX(year) <1959;
---18. Find all names that made their first appearance in the 2010s.
SELECT name
FROM names
GROUP BY name
HAVING MIN(year) BETWEEN 2010 AND 2019;
---19. Find the names that have not be used in the longest. ans: Zilpah
SELECT name
FROM names
GROUP BY name
ORDER BY MAX(year)
LIMIT 1;
---20. Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.
---Between Lawrence and Vincent, which name is more used 
SELECT name, COUNT(num_registered)
FROM names
WHERE name IN ('Lawrence', 'Vincent');




	