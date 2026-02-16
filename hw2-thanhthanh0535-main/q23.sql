-------------------------- I N S T R U C T I O N S ----------------------------
-- You want a list of your best customers. Display a list of customers,
-- including customer name, contact name (concatenated first & last alias as
-- ContactName), phone number, along with the sum of all payments they have ever
-- made (alias as TotalPayments). Limit the results to only those customers
-- having total payments above 100,000. Sort high-to-low by the total payments.
-- 
-- 25 results, first will be:
-- 
--      Euro+ Shopping Channel | Diego Freyre | (91) 555 94 44 | 715738.98
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT DISTINCT customerName, CONCAT(cus.contactFirstName, " ",cus.contactLastName), cus.phone, SUM(pay.amount) AS "TotalPayments"
FROM customers AS cus
JOIN payments AS pay
    ON cus.customerNumber = pay.customerNumber
GROUP BY customerName
HAVING TotalPayments > 100000
ORDER BY TotalPayments DESC;


