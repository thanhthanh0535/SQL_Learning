-------------------------- I N S T R U C T I O N S ----------------------------
-- Display a list of all customer names and a count of orders each has placed.
-- Alias your count as OrdersPlaced. This very similar to #6. Join customers and
-- orders and count the records grouped by customer name. Order by the order
-- count (smallest first) and then by name (A-Z).
-- 
-- Remember, you are counting the number of order records, so you want COUNT(*)
-- here.
-- 
-- 98 results:
-- 
-- customerName                         | OrdersPlaced
-- ------------------------------------ | ------------
-- Bavarian Collectables Imports, Co.   | 1
-- Amica Models & Co.                   | 2
-- ...                                  | ...
-- Euro+ Shopping Channel               | 26
-- 
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT cus.customerName, count(orde.orderNumber)  as OrdersPlaced 
FROM customers as cus
JOIN orders as ord
ON ord.customerNumber = cus.customerNumber
JOIN orderdetails as orde
ON orde.orderNumber = ord.orderNumber
GROUP BY cus.customerName
ORDER BY OrdersPlaced ASC, cus.customerName ASC;