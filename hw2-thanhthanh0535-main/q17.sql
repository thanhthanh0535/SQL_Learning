-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the Customer Name, Order Number, Order Date, Product Code, Product
-- Name, Quantity Ordered, and Actual Profit (alias as "Profit") for all sales
-- for the "Planes" product line. Sort by Profit highest first.
-- 
-- NOTE: Refer to README_PROFIT.md for an understanding of the profit
-- calculations.
-- 
-- 336 results, Euro+ with a Black Hawk Helicopter--ironically NOT a plane--
-- will be first
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT DISTINCT cus.customerName, od.orderNumber, od.orderDate, prod.productCode, prod.productName, odd.quantityOrdered, (odd.PriceEach-prod.BuyPrice) AS Profit
FROM customers AS cus
JOIN orders AS od
    ON od.customerNumber= cus.customerNumber
JOIN orderdetails AS odd
    ON od.orderNumber = odd.orderNumber
JOIN products AS prod
    ON prod.productCode = odd.productCode
WHERE prod.productLine LIKE "Planes"
ORDER BY Profit DESC;



