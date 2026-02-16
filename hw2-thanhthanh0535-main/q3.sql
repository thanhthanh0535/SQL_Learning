-------------------------- I N S T R U C T I O N S ----------------------------
-- Management wants to see which customers may deserve a credit limit increase.
-- Display the Customer Name, Contact Name (concat "last, first" alias as
-- "Contact Name"), Phone Number, and Credit Limit for payments that are within
-- 30% of the customer’s credit limit (i.e., greater than 0.7 times their credit
-- limit). Order by credit limit lowest first.
-- 
-- 8 results, first will be:
-- 
--     Australian Collectors, Co. | Ferguson, Peter | 03 9520 4555 | 117300.00
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------

SELECT customerName, CONCAT (cus.contactFirstName, " ", cus.contactLastName) as contactname, phone,creditLimit
FROM customers AS cus
JOIN payments as pay
    ON cus.customerNumber = pay.customerNumber
WHERE  pay.amount > 0.7*cus.creditLimit
ORDER BY creditLimit DESC;

