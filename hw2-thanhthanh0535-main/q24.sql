-------------------------- I N S T R U C T I O N S ----------------------------
-- You want to target the customers with the least number of orders with a
-- marketing campaign. Display a list of all customer names and a count of
-- orders each has placed. Alias your count as OrdersPlaced. Only include
-- customers that have fewer than 3 total orders placed. Sort alphabetically by
-- customer name.
-- 
-- Hint: You simply joining customers and orders, grouping by the customer name
-- and counting the records. The join gives you all orders (the "most many"
-- table) along with the associated customer for each. 
-- 
-- 31 results, the first two will be Amica Models & Co with 2 orders placed.
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT cus.customerName, COUNT(cus.customerName) AS "OrdersPlaced"
FROM customers AS cus
JOIN orders AS od
    ON od.customerNumber= cus.customerNumber
GROUP BY customerName
HAVING OrdersPlaced < 3
ORDER BY cus.customerName ASC;
