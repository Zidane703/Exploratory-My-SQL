----------------------------- FIRST ORDINARY # SUBSTRING # ----------------------------
----------------------------
#See The DB

SELECT
	*
FROM
	layoffs_staging2;

----------------------------
#Substring Example
## This query will extract a substring from the string 'Hello World' starting from the 7th character ('W') 
### and extracting 5 characters. The result will be 'World'.

SELECT SUBSTRING('Hello World', 7, 5) AS extracted_substring;

----------------------------
SELECT 
	SUBSTRING(`date`, 6, 2) AS `MONTH`, SUM(total_laid_off) # 6 means start grabbing from the 6th character (the first '0' in the month).
															# 2 means grab 2 characters (the two digits of the month)
FROM 
	layoffs_staging2
GROUP BY
	`MONTH`;
----------      ------------
SELECT 
    MONTH(STR_TO_DATE(date, '%m/%d/%Y')) AS `Month`, 
    SUM(total_laid_off) AS Total_Laid_Off
FROM 
    layoffs_staging
GROUP BY 
    `Month`
ORDER BY 
    `Month`;
----------      ------------
SELECT 
	SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) 
FROM 
	layoffs_staging2
WHERE
	SUBSTRING(`date`, 1, 7) IS NOT NULL 
GROUP BY
	`MONTH`
ORDER BY 1 ASC;
----------------------------- END <FIRST ORDINARY # SUBSTRING> END # ----------------------------

----------------------------- SECOND ORDINARY # SUBSTRING # ----------------------------
SELECT
	company, SUM(total_laid_off)
FROM
	layoffs_staging2
GROUP BY
	company
ORDER BY
		2 DESC;
----------      ------------
SELECT
	company, YEAR(`date`), SUM(total_laid_off)
FROM
	layoffs_staging2
GROUP BY
	company, YEAR(`date`)
ORDER BY
		company ASC;
----------      -----------
SELECT
	company, YEAR(`date`), SUM(total_laid_off)
FROM
	layoffs_staging2
GROUP BY
	company, YEAR(`date`)
ORDER BY
		3 DESC;

----------------------------- END <SECOND ORDINARY # SUBSTRING #> END ----------------------------

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















