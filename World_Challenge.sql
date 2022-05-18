-- WORLD
USE World;
 
-- (1) Using COUNT, get the number of cities in the USA.
SELECT COUNT(CountryCode) `Number of Cities in the USA`
FROM (City)
WHERE CountryCode="USA";

-- (2) Find out the population and life expectancy for people in Argentina.
SELECT Population `Population of Argentina`, LifeExpectancy `Life Expectancy of Argentinians`
FROM Country 
GROUP BY 'Argentina';

-- (3) Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT Name `Country`, LifeExpectancy `Highest Life Expectancy`
FROM Country
WHERE LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy DESC
LIMIT 1;

-- (4) Using JOIN ... ON, find the capital city of Spain.
SELECT Country.Name `Country Name`, City.Name `City Name`, City.CountryCode `Country Code`
FROM Country 
JOIN City ON Country.Capital = City.ID
WHERE Country.Code = 'ESP';

-- (5) Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
SELECT DISTINCT CL.Language `Languages Spoken in Southeast Asia`
FROM Country C 
LEFT JOIN CountryLanguage CL ON C.Code = CL.CountryCode 
WHERE C.Region = 'Southeast Asia';

-- (6) Using a single query, list 25 cities around the world that start with the letter F.
SELECT Name `Cities Beginning with the Letter 'F'`
FROM City 
WHERE Name 
LIKE 'F%' 
LIMIT 25;

-- (7) Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT COUNT(City.ID) AS `Number of Cities in China`
FROM (City)
WHERE CountryCode="CHN";

-- (8) Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT Name `Country`, Population `Lowest Population`
FROM Country
WHERE Population IS NOT NULL
ORDER BY Population ASC
LIMIT 7;

-- (9) Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(Name) `Number of Countries in the Database`
FROM (Country);

-- (10) What are the top ten largest countries by area?
SELECT Name `Country`, SurfaceArea `Largest Surface Area`
FROM Country
ORDER BY SurfaceArea DESC
LIMIT 10;

-- (11) List the five largest cities by population in Japan.
SELECT C.Name, C.Population `Cities By Population in Japan`
FROM City C 
LEFT JOIN Country ON Country.Code = C.CountryCode 
WHERE Country.Code = 'JPN'
ORDER BY Country.Population DESC
LIMIT 5;

-- (12) List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
UPDATE Country C
SET HeadOfState = C.HeadOfState
WHERE 'Elisabeth II' = 'EliZabeth II';

SELECT C.Name, C.Population `Cities By Population in Japan`
FROM City C 
LEFT JOIN Country ON Country.Code = C.CountryCode 
WHERE Country.Code = 'JPN'
ORDER BY Country.Population DESC
LIMIT 5;
-- (13) List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
-- (14) List every unique world language.
-- (15) List the names and GNP of the world's top 10 richest countries.
-- (16) List the names of, and number of languages spoken by, the top ten most multilingual countries.
-- (17) List every country where over 50% of its population can speak German.

-- (18) Which country has the worst life expectancy? Discard zero or null values.
SELECT Name, LifeExpectancy
FROM Country
WHERE LifeExpectancy>0 IS NOT NULL
ORDER BY LifeExpectancy ASC
LIMIT 1;


-- (19) List the top three most common government forms.
-- (20) How many countries have gained independence since records began?