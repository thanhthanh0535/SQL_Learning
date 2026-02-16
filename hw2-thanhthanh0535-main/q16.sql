-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the Customer Name, Order Number, Order Date, Product Code, Product
-- Name, Quantity Ordered, and Price Each for all sales for the "Trains"
-- product line. Sort alphabetically by customer name and then by order number (low to high).
-- 
-- 81 results, Amica Models order from 2004-09-09 will be first
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT customerName, od.orderNumber,orderDate,prod.productCode,productName,quantityOrdered,priceEach
FROM customers AS cus
JOIN orders AS od
    ON od.customerNumber= cus.customerNumber
JOIN orderdetails AS odd
    ON od.orderNumber = odd.orderNumber
JOIN products AS prod
    ON prod.productCode = odd.productCode
WHERE prod.productLine LIKE "Trains"
ORDER BY customerName ASC, od.orderNumber ASC;