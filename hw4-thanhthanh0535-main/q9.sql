-------------------------- I N S T R U C T I O N S ----------------------------
-- Same as the prior query, but instead of showing Null for the total payments
-- of customers that haven't made any, replace this with 0 using the IFNULL
-- funtion.
-- 
-- 122 results, the last 24 will now have 0 instead of Null for TotalPayments.
-- 
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT cus.customerName, concat(cus.contactLastName, " ", cus.contactFirstName) as ContactName, cus.phone, IFNULL(SUM(amount),"0") AS TotalPayments
FROM customers as cus
LEFT JOIN payments as pay
ON cus.customerNumber = pay.customerNumber
GROUP BY ContactName
ORDER BY TotalPayments DESC;

