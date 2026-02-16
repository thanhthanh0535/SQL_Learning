-------------------------- I N S T R U C T I O N S ----------------------------
-- We want an employee directory. Show Last Name, First Name, Title, Phone
-- Number (from office), Extension, Email and Office City for all employees.
-- Sort by Last Name and then First Name.
-- 
-- 23 rows, Gerard Bondur is first, and Mary Patterson comes before Steve or
-- William
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT emps.lastName, emps.firstName, emps.email, emps.extension, offs.city, offs.phone
FROM employees as emps
JOIN offices as offs
ON offs.officeCode = emps.officeCode
ORDER BY lastName, firstName
