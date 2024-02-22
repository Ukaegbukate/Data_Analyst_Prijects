--Firstly Let check if our tables are properly Imported 
 

-- show the percentage of people who died after contaction per day


--show the current percentage of death from contaction per country 


--SHOW THE COUNTRY WITH THE HIGHEST INFECTION RATE


-- showing the country with highest death rate per population


-- showing the continent with the highest death count



--show the  percentage of dying from 
--contaction IN THE WORLD



--show the  vaccination to population ratio per day

--TEMP TABLE
CREATE TABLE #PercentagePopulationVaccinated
(
location varchar(50),
date datetime,
population numeric,
new_vaccinations numeric,
RollingVaccinatedPeople numeric
)

INSERT INTO #PercentagePopulationVaccinated 
SELECT dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(FLOAT,vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) as RollingVaccinatedPeople
FROM coviddeaths dea
JOIN covidvaccine vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
order by dea.location, dea.date

SELECT *, (RollingVaccinatedPeople/population)*100 PERCENTAGE_POPULATION_VACCINATED
FROM #PercentagePopulationVaccinated
ORDER BY location, date

--CREATING VIEW FOR VISUALIZATION

-- view for country with the highest infection


-- view for continent with the highest infection


-- view for the percentage of death per country


-- view for percentage vaccinated

