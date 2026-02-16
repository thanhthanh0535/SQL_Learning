-------------------------- I N S T R U C T I O N S ----------------------------
-- Give me a list showing product name, order number, quantity ordered and MSRP
-- for every time a product sold for full price (i.e., where the sale price is
-- the same as the product's MSRP). Sort by MSRP and then Order Number (both low
-- to high).
-- 
-- 141 rows, Order 10138 is first
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT productName,quantityOrdered,orderNumber, prod.MSRP
FROM products AS prod
JOIN orderdetails AS ordd
    ON prod.productCode = ordd.productCode
WHERE prod.MSRP = ordd.priceEach
ORDER BY prod.MSRP ASC, ordd.orderNumber ASC;
