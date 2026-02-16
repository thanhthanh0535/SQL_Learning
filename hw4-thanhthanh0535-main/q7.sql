-------------------------- I N S T R U C T I O N S ----------------------------
-- You want a list of your best customers. Display a list of customers —
-- customer name, contact name (concatenated first & last alias as ContactName),
-- phone number—along with the sum of all payments they have ever made (alias as
-- TotalPayments). Sort high-to-low by the total payments.
-- 
-- Hint: this is a JOIN/GROUP BY/SUM thing.

-- 98 results, Euro+ Shopping Channel should be your best customer with
-- $715,738.98 in TotalPayments
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT cus.customerName, concat(cus.contactLastName, " ", cus.contactFirstName) as ContactName, cus.phone, SUM(amount) AS TotalPayments
FROM customers as cus
JOIN payments as pay
ON cus.customerNumber = pay.customerNumber
GROUP BY ContactName
ORDER BY TotalPayments DESC;

