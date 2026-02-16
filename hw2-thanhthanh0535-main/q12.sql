-------------------------- I N S T R U C T I O N S ----------------------------
-- We want an employee directory. Show Last Name, First Name, Job Title, Phone
-- Number (from office), Extension, Email and Office City for ALL employees.
-- Sort by Last Name and then First Name.
-- 
-- 23 results, Gerard Bondur is first and Mary Patterson comes before Steve or
-- William
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT lastName, firstName, jobTitle,extension,email, offi.phone, offi.city
FROM employees AS emp
JOIN offices AS offi
    On offi.officeCode = emp.officeCode
ORDER BY emp.lastName, emp.firstName