-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the Customer Name, Contact Name (concat as "first last" and alias as
-- “Contact”), City, (NOT STATE), Country, Phone, Sales Rep (concat employee
-- "first last" and alias as “SalesRep”), and sales rep phone number (Concat
-- office phone and sales rep extension separated by a space and alias as
-- "SalesRepPhone") for all Customers that are located outside of the USA. Sort
-- alphabetically by customer name.
-- 
-- Hint: You need the offices table for this. Be careful because now there are
-- two different fields for city, country and phone, so be sure you select the
-- right ones.
-- 
-- 64 rows, Alpha Cognac is first
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT DISTINCT cus.customerName,CONCAT(cus.contactFirstName, " ",cus.contactLastName),cus.city,cus.country,cus.phone, CONCAT(emp.firstName, " " ,emp.lastName) AS SalesRep, CONCAT (offi.phone," ",emp.extension) AS SalesRepPhone
FROM customers AS cus
JOIN offices AS offi
    ON offi.country = cus.country
JOIN employees AS emp
    On emp.officeCode = offi.officeCode
WHERE cus.country NOT LIKE "USA"
ORDER BY cus.customerName ASC;