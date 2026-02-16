-------------------------- I N S T R U C T I O N S ----------------------------
-- You want a list of customers that have sales reps that are based in a country
-- that is different from the customer. Show customer name, customer countryj
-- (alias as "CustomerCountry"), sales rep name (concat as "first last" and
-- alias as "SalesRep"), and sales rep country (from office; alias as
-- "SalesRepCountry"). Sort alphabetically by SalesRep and then by customer
-- name.
-- 
-- 40 rows; Baane Mini Imports with Barry Jones is first
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT DISTINCT cus.customerName, cus.country AS CustomerCountry,CONCAT(cus.contactFirstName, " ",cus.contactLastName) AS SalesRep, o.country AS SalesRepCountry
FROM customers AS cus
JOIN offices AS o
    ON o.country = cus.country
ORDER BY SalesRep ASC, cus.customerName ASC;