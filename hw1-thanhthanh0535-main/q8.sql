-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the code, name, buy price, and profit (i.e., MSRP - buyPrice) of all
-- products. Alias your profit calculation as "Profit". Sort by profit
-- descending from highest to lowest.
-- 
-- Note that since this is the MSRP and not the actual sales price, this is
-- actually the POTENTIAL profit, but we'll just run with it. For now.
-- 
-- (110 rows, a 1952 Renault will be first)
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT productCode, productName, buyPrice, MSRP

FROM products
