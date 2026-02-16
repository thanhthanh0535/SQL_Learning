-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the Order Number, Order Date, Status, Quantity Ordered and Price Each
-- for all orders of their popular 1962 Volkswagen Microbus (productCode is
-- S24_2300). Sort the results by the quantity ordered lowest to highest and
-- then by order date most recent to oldest.
-- 
-- Hint: this will only require joining Orders & Order Details since you know
-- the product code. 
-- 
-- 28 results, order 10382 will be first
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT orderDate, status, quantityOrdered, priceEach, ors.orderNumber
FROM orderdetails AS od
JOIN orders as ors
    ON ors.orderNumber = od.orderNumber
WHERE od.productCode LIKE "S24_2300"
ORDER BY quantityOrdered ASC,orderDate DESC;

