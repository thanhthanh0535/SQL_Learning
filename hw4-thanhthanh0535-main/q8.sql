-------------------------- I N S T R U C T I O N S ----------------------------
-- You remember that you have 122 customers, not 98. You now want a list of ALL
-- customers, even those who've never made any payments. So similar to the last
-- query, BUT make sure it is ALL customers (i.e., you'll need an outer join,
-- left or right depending on which "side" customers is joined on).
--
-- 122 results, Euro+ is still first but a lot of customers will have Null for
-- the total payments
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT cus.customerName, concat(cus.contactLastName, " ", cus.contactFirstName) as ContactName, cus.phone, SUM(amount) AS TotalPayments
FROM customers as cus
LEFT JOIN payments as pay
ON cus.customerNumber = pay.customerNumber
GROUP BY ContactName
ORDER BY TotalPayments DESC;
