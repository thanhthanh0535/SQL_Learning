-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the Customer Name, Order Number, Order Date, Product Code, Product
-- Name, and Total Profit (alias as "TotalProfit") for all sales. BUT, you want
-- to only show the 20 most profitable sales ever. So:
-- 
--  * Sort by the total profit, highest first
--  * Add LIMIT 20 to the end of the query (not SQL standard)
-- 
-- NOTE: Refer to README_PROFIT.md for an understanding of the profit
-- calculations.
-- 
-- 20 results; Mini Gifts Distributors order of 1952 Alpine Renaults will be the
-- most profitable
-- 
-- **** WARNING ****: Even though you should only see 20 results, the extension
-- may report that there are 2996 total results. Whether by design or a bug, it
-- assumes that the LIMIT clause is just specifying how many to display at a
-- time instead of total.
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT customerName, orderDate, prod.productCode, productName, ((odd.PriceEach-prod.BuyPrice) * odd.QuantityOrdered) AS "TotalProfit"
FROM customers AS cus
JOIN orders AS od
    ON od.customerNumber= cus.customerNumber
JOIN orderdetails AS odd
    ON od.orderNumber = odd.orderNumber
JOIN products AS prod
    ON prod.productCode = odd.productCode
ORDER BY TotalProfit DESC 
LIMIT 20 OFFSET 1; -- limit highest profit from top to 20 