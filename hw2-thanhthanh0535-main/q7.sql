-------------------------- I N S T R U C T I O N S ----------------------------
-- Show order number, order date, status and product name for orders or products
-- that sold for full price. for full price (i.e., where the sale price is the
-- same as the product's MSRP) and the order's status is "Cancelled". Sort by
-- order date, newest to oldest. You'll note one order with 2 products. This
-- means you will need to add a second sort criteria to insure a predictable
-- order. So ALSO sort alphabetically by product name.
-- 
-- 5 rows, the Horch Limo from Order 10262 is first
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT odd.orderNumber, orderDate,status, prod.productName
FROM orders AS od
JOIN orderdetails AS odd
    ON od.orderNumber=odd.orderNumber
JOIN products AS prod
    ON odd.productCode =prod.productCode
WHERE od.status LIKE "Cancelled" AND prod.MSRP = odd.priceEach
ORDER BY od.orderDate DESC, prod.productName ASC;