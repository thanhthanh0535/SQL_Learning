-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the Customer Name, Order Number, Order Date, Product Code, Product
-- Name, Quantity Ordered, and Actual Profit MARGIN (alias as "ProfitMargin")
-- for all sales that earned a margin below 15% (0.15). Don't foget that you
-- can't use the alias in the WHERE clause. Sort by ProfitMargin and then by
-- order number, both lowest first.
-- 
-- NOTE: Refer to README_PROFIT.md for an understanding of the profit
-- calculations.
-- 
-- 23 results; a Diecast Classics order for a 1940s Ford truck with a profit
-- margin of 0.124923 will be first.
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT cus.customerName, od.orderNumber, orderDate, prod.productCode, productName, quantityOrdered, ((odd.PriceEach-prod.BuyPrice)/odd.PriceEach) AS "ProfitMargin"
FROM customers AS cus
JOIN orders AS od
    ON od.customerNumber= cus.customerNumber
JOIN orderdetails AS odd
    ON od.orderNumber = odd.orderNumber
JOIN products AS prod
    ON prod.productCode = odd.productCode
HAVING ProfitMargin < 0.15
ORDER BY ProfitMargin ASC, odd.orderNumber ASC;

