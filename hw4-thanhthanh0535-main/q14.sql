-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the Customer Name, Contact Name (concat first + last … alias as
-- “Contact”), City, State, Country, Phone and Sales Rep (concat employee first
-- + last … alias as “SalesRep”) for all Customers. Sort alphabetically by the
--   sales rep and then by the customer name.
-- 
-- 100 results
-- 
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT DISTINCT cus.customerName, CONCAT(cus.contactFirstName, " ",cus.contactLastName) as Contact, cus.city, cus.state, cus.country, cus.phone, CONCAT(emp.firstName, " ", emp.lastName) as SalesRep
FROM customers as cus
LEFT JOIN offices as offs
ON offs.postalCode = offs.postalCode
RIGHT JOIN employees as emp
ON emp.officeCode = offs.officeCode
GROUP BY cus.customerName
ORDER BY SalesRep ASC, Contact ASC;
#run this code for 122 result, just random pick any salesrep

SELECT DISTINCT cus.customerName, CONCAT(cus.contactFirstName, " ",cus.contactLastName) as Contact, cus.city, cus.state, cus.country, cus.phone, CONCAT(emp.firstName, " ", emp.lastName) as SalesRep
FROM customers as cus
JOIN offices as offs
ON offs.postalCode = offs.postalCode
JOIN employees as emp
ON emp.officeCode = offs.officeCode
ORDER BY SalesRep ASC, Contact ASC;
# run thhat code for 2906 results because one customername haiving a tons of different salesreps




