-------------------------- I N S T R U C T I O N S ----------------------------
-- Yeah, there's 122 customers, not 98. So obviously there's a lot of customers
-- that haven't placed orders. Fix that. Copy the last query and modify it so
-- that you include customers that have zero orders. Yep, outer join time.
-- 
-- 122 results...but it's weird because there's a LOT of customers now showing 1
-- order even though they have not made ANY orders.
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
