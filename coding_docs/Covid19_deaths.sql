--Datewise likelihood of dying due to covid - TotalCases vs TotalDeaths - in the US
Select date, total_cases, total_deaths
From "CovidDeathsD"
Where location = 'United States' and total_deaths > 0;

--Total % of deaths out of entire population - in the US
SELECT (CAST(MAX(total_deaths) AS double precision) / AVG(CAST(population AS double precision)) * 100) AS percentage
FROM "CovidDeathsD"
WHERE location = 'United States';

--Total % of deaths out of entire population - for all locations
Select location,
(cast(max(total_deaths) as double precision)/avg(cast(population as double precision))*100) as percentage 
from "CovidDeathsD" 
group by location 
having (cast(max(total_deaths) as double precision)/avg(cast(population as double precision))) IS NOT NULL
order by percentage desc;

--Country with highest deaths as a % of population
Select location,(cast(max(total_deaths) as double precision)/avg(cast(population as double precision))*100) as percentage 
from "CovidDeathsD" 
where total_deaths is not null and population is not null
group by location 
order by percentage desc
limit 1;

--Country with seventh highest deaths as a % of population
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

--Country with third highest deaths as a % of population
Select location,(cast(max(total_deaths) as double precision)/avg(cast(population as double precision))*100) as percentage 
from "CovidDeathsD" 
where total_deaths is not null and population is not null
group by location 
order by percentage desc
limit 1
offset 2;

--Total % of covid +ve cases - in the US
Select location, 
cast(max(total_cases) as double precision)/avg(cast(population as double precision)) as Percentage_CovidCases
from "CovidDeathsD"
where location like '%United States%' AND location <> 'United States Virgin Islands'
Group by location;

--Continent wise +ve cases
Select location, sum(total_cases) as Positive_Cases
from "CovidDeathsD"
where continent is NULL
Group by location
order by Positive_Cases DESC;

--Continetwise deaths
Select location, sum(total_deaths) as Continent_Deaths
from "CovidDeathsD"
where continent is null
group by location
order by Continent_Deaths DESC;

--Daily new cases vs hospitalizations vs icu_patients - US
Select date, location, new_cases, hosp_patients, icu_patients
from "CovidDeathsD"
where location like '%United States%'
;

--Country wise total cases and diabetes prevalence 
Select "CovidDeathsD".location as Country,
Cast(Max("CovidDeathsD".total_cases) as Double Precision) as Total_Cases, 
Avg(Cast("CovidVaccinationsV".diabetes_prevalence as Double Precision)) as Diabetes
from "CovidDeathsD" Inner join "CovidVaccinationsV" 
on "CovidDeathsD".iso_code="CovidVaccinationsV".iso_code 
and "CovidDeathsD".date = "CovidVaccinationsV".date
where "CovidDeathsD".continent is not null 
group by Country
;
