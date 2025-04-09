-- Checking Tables

SELECT *
FROM CovidDatabase..CovidDeaths
ORDER BY location,date;

SELECT *
FROM CovidDatabase..CovidVaccinations
ORDER BY location,date;

-- Select few Columns

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidDatabase..CovidDeaths
ORDER BY location, date;

-- Death Percentage Among Confirmed Cases

SELECT location, date, total_cases, total_deaths, ROUND(((total_deaths/total_cases) * 100),4) AS death_percentage
FROM CovidDatabase..CovidDeaths
ORDER BY location, date;

-- Death Percentage Among Confirmed Cases in USA

SELECT location, date, total_cases, total_deaths, ROUND(((total_deaths/total_cases) * 100),4) AS death_percentage
FROM CovidDatabase..CovidDeaths
WHERE location LIKE '%States%'
ORDER BY location, date;  

-- Percentage of Confirmed Cases Among Total Population in USA

SELECT location, date, total_cases, population,((total_cases/population) * 100) AS infection_percentage
FROM CovidDatabase..CovidDeaths
WHERE location LIKE '%States%'
ORDER BY location, date;  

-- Countries With Highest Infection Percentage

SELECT location, MAX(total_cases) AS max_total_cases, population,ROUND(((MAX(total_cases)/MAX(population)) * 100),5) AS infection_percentage
FROM CovidDatabase..CovidDeaths
GROUP BY location
ORDER BY infection_percentage DESC;

-- Countries With Highest Death Count

SELECT location, MAX(CAST(total_deaths as INT)) AS max_total_deaths, MAX(population) AS population, ROUND(((MAX(total_deaths)/MAX(population)) * 100),5) AS death_percentage
FROM CovidDatabase..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY max_total_deaths DESC;

-- Total Death Count by Continent

SELECT continent, MAX(CAST(total_deaths as INT)) AS max_total_deaths
FROM CovidDatabase..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY max_total_deaths DESC;

-- Total Death Count by location (Continents)

-- CONVERT(INT,total_deaths)
SELECT location, MAX(CAST(total_deaths as INT)) AS max_total_deaths
FROM CovidDatabase..CovidDeaths
WHERE continent IS NULL
GROUP BY location
ORDER BY max_total_deaths DESC;

-- Global Measurements

-- Death Percentage per Day

SELECT date, SUM(CAST(new_deaths as INT)) AS total_deaths, SUM(new_cases) AS total_cases, ((SUM(CAST(new_deaths as INT))/SUM(new_cases))*100) AS death_percentage
FROM CovidDatabase..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date;


-- Table CovidVaccinations

SELECT *
FROM CovidDatabase..CovidVaccinations

-- Vaccination Start Date for Locations

WITH VacRow (continent,location,date,new_vaccinations,row_num) AS
(SELECT continent,location,date,new_vaccinations,
		ROW_NUMBER() OVER(PARTITION BY continent,location ORDER BY date) AS row_num
FROM CovidDatabase..CovidVaccinations
WHERE continent IS NOT NULL
AND new_vaccinations IS NOT NULL)

SELECT continent,location,date,new_vaccinations
FROM VacRow
WHERE row_num = 1
ORDER BY continent,location,date;


-- Rolling Sum of Vaccinations

SELECT continent,location,date,new_vaccinations,
		SUM(CAST(new_vaccinations AS INT)) OVER(PARTITION BY location ORDER BY date) AS total_vaccinations
FROM CovidDatabase..CovidVaccinations
WHERE continent IS NOT NULL
AND new_vaccinations IS NOT NULL 
ORDER BY continent,location;


-- Joining Two Tables 

SELECT *
FROM CovidDatabase..CovidDeaths AS cd
JOIN CovidDatabase..CovidVaccinations AS cv
ON cd.location = cv.location
AND cd.date = cv.date;


-- Create View to Store Data for Later Visualizations

-- Death By Continent

DROP VIEW IF EXISTS DeathByContinent;
CREATE VIEW DeathByContinent AS
SELECT location, MAX(CAST(total_deaths as INT)) AS total_deaths
FROM CovidDatabase..CovidDeaths
WHERE continent IS NULL
GROUP BY location;

-- Load View

SELECT * 
FROM DeathByContinent
ORDER BY total_deaths DESC;