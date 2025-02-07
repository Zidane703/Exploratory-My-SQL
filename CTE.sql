----------------------------- # ADD CTE "WITH ROLLING TOTAL" # ----------------------------

WITH 
	Rolling_Total AS #Common Table Expression (CTE)
(
SELECT 
	SUBSTRING(`date`, 1, 7) # We extract the first 7 characters of the date (assuming the format is 'YYYY-MM') to get the year and month
    AS `MONTH`, SUM(total_laid_off) AS total_off # We calculate the total layoffs for each month and store it as total_off
FROM 
	layoffs_staging2
WHERE
	SUBSTRING(`date`, 1, 7) IS NOT NULL # We filter out any rows where the extracted month is missing or invalid.
GROUP BY
	`MONTH`# We group the results by the extracted month (e.g., all layoffs in January 2024 are grouped together).
ORDER BY 1 ASC
)
SELECT
	`MONTH`, SUM(total_off)  # We sort the results in ascending order based on the month.
OVER
	(ORDER BY `MONTH`) AS rolling_total # This is the window function that calculates the cumulative sum.
FROM
	Rolling_Total; # specifies that the cumulative sum should be calculated across the rows ordered by the MONTH column.

----------------------------- # END <ADD CTE "WITH ROLLING TOTAL"> END # ----------------------------

----------------------------- ADD CTE <COMPANY YEAR AND DENSE RANK> ----------------------------
WITH 
	Company_Year (COMPANY, YEARS, TOTAL_LAID_OFF) AS
(
SELECT 
	company, YEAR(`date`), SUM(total_laid_off)
FROM
	layoffs_staging2
GROUP BY
	company,  YEAR(`date`)
)
SELECT 
	*, DENSE_RANK() OVER(PARTITION BY YEARS ORDER BY TOTAL_LAID_OFF DESC) # assigns a dense rank, meaning that if multiple companies have 
																		  #the same number of layoffs in a year, they will receive the same rank, 
                                                                          #and the next rank will not be skipped.
FROM
	Company_Year;