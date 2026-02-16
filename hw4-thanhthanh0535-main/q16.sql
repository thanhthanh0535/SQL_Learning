-------------------------- I N S T R U C T I O N S ----------------------------
-- Show a list of product names and the total quantity of each sold (alias as
-- QuantitySold). Recall that the quantity is part of the order details for a
-- product. Sort to show the highest QuantitySold first.
-- 
-- 109 results, a 1992 Ferrari will be first with a QuantitySold of 1808.
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT prod.productName, SUM(orde.quantityOrdered) as QuantitySold
FROM products as prod
JOIN orderdetails as orde
ON orde.productCode = prod.productCode
GROUP BY prod.productName
ORDER BY QuantitySold DESC;