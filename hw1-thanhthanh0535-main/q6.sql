-------------------------- I N S T R U C T I O N S ----------------------------
-- Write a query to display the count of customers that live in the USA. Alias
-- that column as "CustCount".
-- 
-- (1 row, the value will be 36)
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT COUNT(*) AS CustCount
FROM customers
WHERE country = "USA";
