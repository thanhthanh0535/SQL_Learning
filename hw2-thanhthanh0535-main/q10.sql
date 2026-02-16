-------------------------- I N S T R U C T I O N S ----------------------------
-- You want a "sucker report". Show the Customer Name for all customers that
-- have ever paid MSRP for their products. You just want the customer name, and
-- you want the list not to contain duplicates. Sort the list alphabetically.
-- 
-- 66 rows, Alpha Cognac is first
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT DISTINCT customerName
FROM customers AS cus
JOIN orders AS od
    ON od.customerNumber= cus.customerNumber
JOIN orderdetails AS odd
    ON odd.orderNumber = od.orderNumber
JOIN products AS prod
    ON odd.productCode = prod.productCode
WHERE odd.priceEach = prod.MSRP
ORDER BY customerName ASC;