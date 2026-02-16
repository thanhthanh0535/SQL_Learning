-------------------------- I N S T R U C T I O N S ----------------------------
-- Show the Order Number, Product Namer, Order Date, Status, Quantity Ordered,
-- and Price Each for all orders where the price each is below $35. Sort
-- alphabetically by product name and then by order number.
--  
-- 86 results, order 10143 will be first
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT productName, orderDate,status, quantityOrdered,priceEach, orde.orderNumber
FROM orderdetails AS orde
JOIN orders AS ords
    ON orde.orderNumber=ords.orderNumber
JOIN products AS prod
    ON orde.productCode=prod.productCode
HAVING orde.priceEach < 35
ORDER BY prod.productName ASC;