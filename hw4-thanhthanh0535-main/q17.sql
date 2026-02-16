-------------------------- I N S T R U C T I O N S ----------------------------
-- You want to know your underperforming products. But there's a missing product
-- from query 16 (109 results but 110 products). Hmm, must not have any sales.
-- Anyway, similar to 16 write a query to show product names and QuantitySold,
-- but only for those products having sold fewer than 900 units. This time sort
-- lowest to highest (worst-to-first). BUT, you must also include the product
-- that hasn't sold, and replace the "NULL" value with a 0.
-- 
-- (19 results)

--   1:   1985 Toyota Supra   | 0
--   ...
--   19:  The Mayflower       | 898
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT prod.productName, IFNULL(SUM(orde.quantityOrdered),0) as QuantitySold
FROM products as prod
LEFT JOIN orderdetails as orde
ON orde.productCode = prod.productCode
GROUP BY prod.productName
HAVING QuantitySold < 900
ORDER BY QuantitySold ASC;
