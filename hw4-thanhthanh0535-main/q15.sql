-------------------------- I N S T R U C T I O N S ----------------------------
-- Yep, you guessed it. The last query showed only 100 customers, not 122. Fix
-- this, but also make sure to replace a null SalesRep with the string:
-- 
--      ** NOT ASSIGNED **
-- 
-- The asterisks at the front are just for aesthetics, but they DO happend to
-- ensure that these show up first in the sort order since * comes before A when
-- computers sort things alphabetically.
-- 
-- 122 results...ANG Resellers should be first and should be ** NOT ASSIGNED **
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT DISTINCT cus.customerName, CONCAT(cus.contactFirstName, " ",cus.contactLastName) as Contact, cus.city, cus.state, cus.country, cus.phone, CONCAT(emp.firstName, " ", emp.lastName) as SalesRep
FROM customers as cus
JOIN offices as offs
ON offs.postalCode = offs.postalCode
JOIN employees as emp
ON emp.officeCode = offs.officeCode
GROUP BY cus.customerName
ORDER BY cus.customerName ASC;
