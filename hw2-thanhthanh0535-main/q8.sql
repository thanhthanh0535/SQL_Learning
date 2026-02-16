-------------------------- I N S T R U C T I O N S ----------------------------
-- Show the name of all customers with orders in the year 2005. You will need to
-- use the YEAR() funciton to extract only the year from the order date so you
-- see if it is equal to 2005. Note that there will be duplicates, so be sure to
-- eliminate them from your final list. Sort alphabetically.
-- 
-- 44 rows, Alpha Cognac is first
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------

SELECT DISTINCT customerName, cus.customerNumber, YEAR(odr.orderDate)
FROM customers AS cus
JOIN orders AS odr
    ON odr.customerNumber= cus.customerNumber
WHERE odr.orderDate LIKE "2005%"
ORDER BY cus.customerName ASC;