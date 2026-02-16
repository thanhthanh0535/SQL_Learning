-------------------------- I N S T R U C T I O N S ----------------------------
-- Display a list of countries that customers resid in along with the count of
-- customers in each and the average, maximum and minimum credit limits for
-- customers in the country. Alias the aggregate columns as CustomerCount,
-- AverageCreditLimit, MaximumCreditLimit and MinimumCreditLimit respectively.
-- Use the ROUND function to round the average to two decimal places. Sort the
-- list alphabetically by country.
-- 
-- 27 rows; the first should be:
-- 
--      Denmark | 2 | 102100.00 | 120800.00 | 83400.00
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT customerNumber, Count(*) AS CustomerCount, ROUND(AVG(cus.creditLimit)) AS AverageCreditLimit, MAX(cus.creditLimit) AS MaximumCreditLimit, MIN(cus.creditLimit) AS MinimumCreditLimit 
FROM customers AS cus
GROUP BY cus.country
ORDER BY cus.country ASC;
