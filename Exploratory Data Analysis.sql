# Exploratory Data Analysis

SELECT *
FROM layoffs_staging;
----------------------------
SELECT total_laid_off
FROM layoffs_staging;
----------      ------------
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging;
----------      ------------
SELECT *
FROM layoffs_staging
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;
----------      ------------
SELECT *
FROM layoffs_staging
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;
----------      ------------
SELECT *
FROM layoffs_staging
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;
----------------------------
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
----------------------------
# See the newest date and Oldest Date

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging;



