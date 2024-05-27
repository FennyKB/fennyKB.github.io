# Portfolio Project: Data Analysis Using PostgreSQL

## Overview:
For this portfolio project, I conducted a comprehensive data analysis using PostgreSQL, focusing on two primary datasets.<br>
The first dataset comprises columns iso_code, continent, location, date, population, and various COVID-19-related metrics such as total_cases, total_deaths, and others.<br>
The second dataset contained similar columns but focused on additional metrics related to COVID-19 testing, vaccinations, and demographic indicators.<br>

## Methodology:
### Data Upload and Schema Definition:
The initial step involved creating a PostgreSQL database and defining appropriate tables with corresponding data types to accommodate the datasets. This ensured data integrity and efficient querying.
### Data Analysis:
**Total Cases and Deaths in the US**: I analyzed the data to extract the number of total cases and total deaths in the United States on a date-wise basis.<br>

**Percentage of Deaths in the US Population**: Utilizing population data, I calculated the percentage of deaths relative to the entire US population.<br>

**Death Rate Calculation**: I computed the death rate for all countries and identified the third-highest death rate.<br>

**Percentage of Positive Cases**: Calculated the percentage of positive cases in both the US and worldwide.

### SQL Queries and Functions:
I leveraged SQL queries, including joins, aggregate functions, and window functions, to perform various analyses. Common Table Expression (CTE) was used for readability and modularity in complex queries.

### Key Insights:
The analysis revealed critical insights into the COVID-19 situation, including trends in total cases and deaths, death rates, and positivity rates. By employing advanced SQL techniques, I extracted valuable information from the datasets, enabling informed decision-making and strategic planning.
-	Peru had the highest percentage of deaths out of the entire population when compared to all other locations
-	Assuming we need to find the ninth highest deaths as a percentage of population then that was Slovenia. This was found by writing a CTE and using window function.
-	The country with third highest deaths as a percentage of population using the offset function. Here the result is Bosnia and Herzegovina. 
-	The highest number of deaths continent wise where Europe had the highest, followed by North America and then Asia and South America. Location was selected in this case as there are places where the continent is Null. 

1. **Datewise likelihood of dying due to COVID-19 (Total Cases vs Total Deaths) in the US**
```
SELECT date, total_cases, total_deaths
FROM "CovidDeathsD"
WHERE location = 'United States' AND total_deaths > 0;
```
 

2. **Total % of deaths out of the entire population in the US**
```
SELECT (CAST(MAX(total_deaths) AS double precision) / AVG(CAST(population AS double precision)) * 100) AS percentage
FROM "CovidDeathsD"
WHERE location = 'United States';
```
 
3. **Total % of deaths out of the entire population for all locations**
```   
SELECT location, (CAST(MAX(total_deaths) AS double precision) / AVG(CAST(population AS double precision)) * 100) AS percentage 
FROM "CovidDeathsD" 
GROUP BY location 
HAVING (CAST(MAX(total_deaths) AS double precision) / AVG(CAST(population AS double precision))) IS NOT NULL
ORDER BY percentage DESC;
``` 

4. **Country with the highest deaths as a % of population**
``` 
SELECT location, (CAST(MAX(total_deaths) AS double precision) / AVG(CAST(population AS double precision)) * 100) AS percentage 
FROM "CovidDeathsD" 
WHERE total_deaths IS NOT NULL AND population IS NOT NULL
GROUP BY location 
ORDER BY percentage DESC
LIMIT 1;
```
 
5. **Country with seventh highest deaths as a % of population**
```
With Rank_Percentage as
(Select 
location, 
cast(max(total_deaths) as double precision)/avg(cast(population as double precision)) as Percentage_LocationsDeaths,
Rank() over (order by cast(max(total_deaths) as double precision)/avg(cast(population as double precision)) DESC) as Rank_LocationDeaths
from "CovidDeathsD"
where total_deaths is not null and population is not null
Group by location
order by Rank_LocationDeaths ASC
)
Select location, Percentage_LocationsDeaths, Rank_LocationDeaths
from Rank_Percentage 
where Rank_LocationDeaths = 7 and Percentage_LocationsDeaths>0;
```
 
6. **Country with third highest deaths as a % of population**
```
Select location,(cast(max(total_deaths) as double precision)/avg(cast(population as double precision))*100) as percentage 
from "CovidDeathsD" 
where total_deaths is not null and population is not null
group by location 
order by percentage desc
limit 1
offset 2;
``` 

7. **Total % of covid +ve cases - in the US**
```
Select location, 
cast(max(total_cases) as double precision)/avg(cast(population as double precision)) as Percentage_CovidCases
from "CovidDeathsD"
where location like '%United States%' AND location <> 'United States Virgin Islands'
Group by location;
```
 
8. **Continent wise +ve cases**
```
Select location, sum(total_cases) as Positive_Cases
from "CovidDeathsD"
where continent is NULL
Group by location
order by Positive_Cases DESC;
``` 

9. **Continent wise deaths**
```
Select location, sum(total_deaths) as Continent_Deaths
from "CovidDeathsD"
where continent is null
group by location
order by Continent_Deaths DESC;
``` 

10. **Daily new cases vs hospitalizations vs icu_patients - US**
```
Select date, location, new_cases, hosp_patients, icu_patients
from "CovidDeathsD"
where location like '%United States%';
``` 

11. **Country wise total cases and diabetes prevalence**
```
Select "CovidDeathsD".location as Country,
Cast(Max("CovidDeathsD".total_cases) as Double Precision) as Total_Cases, 
Avg(Cast("CovidVaccinationsV".diabetes_prevalence as Double Precision)) as Diabetes
from "CovidDeathsD" Inner join "CovidVaccinationsV" 
on "CovidDeathsD".iso_code="CovidVaccinationsV".iso_code 
and "CovidDeathsD".date = "CovidVaccinationsV".date
where "CovidDeathsD".continent is not null 
group by Country
;
``` 

## Conclusion:
This portfolio project showcases my proficiency in data analysis using PostgreSQL. Through rigorous analysis and utilization of SQL functionalities, I provided actionable insights into COVID-19 trends and metrics. The project highlights my technical skills and ability to derive meaningful conclusions from complex datasets, essential for data-driven decision-making.

## Repository:
The project code and documentation is available on GitHub, providing a detailed overview of the analysis process and findings.

