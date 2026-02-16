-------------------------- I N S T R U C T I O N S ----------------------------
-- Now we want ONLY customers who’ve made no payments. And don't actually
-- display the total payments, since they'll all be NULL (duh). So we're showing
-- the customer name, contact name (still concatenated) and phone. Sort
-- alphabetically by customer name.
-- 
-- One step at a time:
-- 
--   * Start the prior query...the one before last with no IFNULL
--   * You don't need to SHOW total payments column, so remove it from the
--     SELECT clause (careful with the trailing comma...)
--   * You want HAVING <something> IS NULL for your filter
--   * That <something> used to be in the SELECT clause
-- 
-- 24 results; first is American Souvenirs Inc
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------

SELECT cus.customerName, concat(cus.contactLastName, " ", cus.contactFirstName) as ContactName, cus.phone, IFNULL(SUM(amount),"0") AS TotalPayments
FROM customers as cus
LEFT JOIN payments as pay
ON cus.customerNumber = pay.customerNumber
GROUP BY ContactName
HAVING Totalpayments = 0
ORDER BY TotalPayments ASC;
