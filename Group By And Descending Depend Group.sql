----------------------------- # GROUP BY AND GROUP BY 2 DESC # ----------------------------

# Sort the results based on the second column in the SELECT statement.
## Arrange the rows in descending order and depend on Company
### meaning the rows with the highest values in the second column will appear first.

----------      ------------
# Company

SELECT company, SUM(total_laid_off)
FROM layoffs_staging
GROUP BY company
ORDER BY 2 DESC;
----------      ------------
# Industry

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging
GROUP BY industry
ORDER BY 2 DESC;
----------------------------
# Location
SELECT location, SUM(total_laid_off)
FROM layoffs_staging
GROUP BY location
ORDER BY 2 DESC;
----------------------------
# Country

SELECT country, SUM(total_laid_off)
FROM layoffs_staging
GROUP BY country
ORDER BY 2 DESC;
----------------------------
# Date

SELECT `date`, SUM(total_laid_off)
FROM layoffs_staging
GROUP BY `date`
ORDER BY 2 DESC;
----------      ------------
# YEAR

SELECT 
    YEAR(STR_TO_DATE(date, '%m/%d/%Y')) AS year, # Convert Date to String first
    SUM(total_laid_off)
FROM 
    layoffs_staging
GROUP BY 
    YEAR(STR_TO_DATE(date, '%m/%d/%Y')) 
ORDER BY 
    year DESC;
----------      ------------
SELECT 
	stage, SUM(total_laid_off)
FROM 
	layoffs_staging
GROUP BY 
	stage
ORDER BY 
	1 DESC; #Depen on stage, alphabeth descending
--
SELECT 
	stage, SUM(total_laid_off)
FROM 
	layoffs_staging
GROUP BY 
	stage
ORDER BY 
	2 DESC; #Depen layoffs_staging , SUM(total_laid_off) descending
----------------------------
----------------------------- # END GROUP BY AND GROUP BY 2 DESC END # ----------------------------