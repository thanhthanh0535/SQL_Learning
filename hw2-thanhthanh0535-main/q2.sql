-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the Customer Number, Customer Name, Payment Date, Payment Amount and
-- Credit Limit for all payments that are above the customer’s credit limit.
-- 
-- just 1 row, Dragon Souveniers on 2003-12-26
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT customerName,paymentDate,amount,creditLimit,pay.customerNumber
FROM payments as pay
JOIN customers AS cus
    ON cus.customerNumber= pay.customerNumber
HAVING amount > creditLimit;