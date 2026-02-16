-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the code, name and buy price of all products that have a buy price of
-- less than $30.
-- 
-- (16 rows)
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice < 30;
