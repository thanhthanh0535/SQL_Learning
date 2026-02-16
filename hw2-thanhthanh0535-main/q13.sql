-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the Customer Name, Contact Name (concat as "first last" and alias as
-- “Contact”), City, State, Country, Phone and Sales Rep (concat employee "first
-- last" and alias as “SalesRep”) for all Customers. Sort alphabetically by
-- country and then by customer name.
-- 
-- NOTE: There are 122 customers, but only 100 show up in this report. Though
-- we've not yet covered why this is and how to handle it, see if you can figure
-- out what is common about the missing customers and try to intuit "why".
-- 
-- 100 rows, Anna's Decorations is first
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT customerName, CONCAT(contactFirstName, " ",contactLastName) as Contact, cus.city, cus.state,cus.phone, cus.country, CONCAT(emp.firstName, " ",emp.lastName) AS SalesRep
FROM customers AS cus
JOIN offices AS offi
    ON offi.country = cus.country
JOIN employees AS emp
    On emp.officeCode = offi.officeCode
ORDER BY cus.country ASC, cus.customerName ASC;


-- Different method to output 122 customer, but cannot include SalesRep
SELECT DISTINCT customerName,CONCAT(contactFirstName, " ",contactLastName) as Contact, cus.city, cus.state,cus.phone, cus.country
FROM customers AS cus
ORDER BY cus.country ASC, cus.customerName ASC;