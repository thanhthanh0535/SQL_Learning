-------------------------- I N S T R U C T I O N S ----------------------------
-- Show the name of all customers as well as the count of orders that each has
-- placed. Alias the count of orders as "OrderCount". Sort by the order count
-- highest to lowest and then alphabetically by customer name.
-- 
-- 98 rows, Euro+ Shopping Channel is first with 26 orders
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT customerName,count(od.orderNumber) AS OrderCount
FROM customers AS cus
JOIN orders AS od
    ON cus.customerNumber=od.customerNumber
GROUP BY customerName 
ORDER BY OrderCount DESC, customerName ASC;



