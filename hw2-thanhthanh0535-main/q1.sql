-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the Customer Name (not contact), Phone, Payment Date, Payment Amount
-- and Check Number for all customers’ payments. Order by payment data from most
-- recent to oldest.
-- 
-- 273 rows; Reims payment on 2005-06-09 will be first
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT customerName,phone,paymentDate,amount,checkNumber
FROM payments AS pay
JOIN customers AS cus
    ON cus.customerNumber= pay.customerNumber
ORDER BY amount ASC;