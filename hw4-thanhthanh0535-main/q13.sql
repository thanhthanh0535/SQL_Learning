-------------------------- I N S T R U C T I O N S ----------------------------
-- Fix the prior query so that the customrs with 0 orders actually show 0
-- orders. You will need to watch the lectures to fix this one. And remember
-- that this is one of the VERY few times you'll be COUNTing something other
-- than records.
-- 
-- 122 results...now with more betterer counts of orders showing everyone from
-- American Souvenirs to Warburg Exchange having placed 0 orders.
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------

SELECT cus.customerName, count(orde.orderNumber) as OrderPlaced 
FROM customers as cus
LEFT JOIN orders as ord
ON ord.customerNumber = cus.customerNumber
LEFT JOIN orderdetails as orde
ON orde.orderNumber = ord.orderNumber
GROUP BY cus.customerName
ORDER BY OrderPlaced ASC,cus.customerName ASC;