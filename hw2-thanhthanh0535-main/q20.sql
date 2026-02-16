-------------------------- I N S T R U C T I O N S ----------------------------
-- Display a list of product names (with no duplicates) for all products that
-- have ever had sales with a total profit of $4000 or more. Sort the list
-- alphabetically.
-- 
-- Hint: Don't get too confused; this is somewhat similar to the last query, but
-- with far fewer columns, no need for the order or customer tables, and a WHERE
-- clause instead of a LIMIT.
-- 
-- NOTE: Refer to README_PROFIT.md for an understanding of the profit
-- calculations.
-- 
-- 9 results; with a 1917 Grand Touring Sedan at the top
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT DISTINCT prod.productName, ((odd.PriceEach-prod.BuyPrice) * odd.QuantityOrdered) AS "TotalProfit"
FROM products as prod
JOIN orderdetails AS odd
    ON prod.productCode = odd.productCode
HAVING TotalProfit >= 4000
ORDER BY productName ASC;

JOIN orders AS od
    ON odd.orderNumber= od.orderNumber
((odd.PriceEach-prod.BuyPrice) * odd.QuantityOrdered) AS "TotalProfit"