-------------------------- I N S T R U C T I O N S ----------------------------
-- Might as well finish the drill. Create a complete employee directory
-- including the manager name. So similar to an earlier query, include the
-- following aliased as indicated in parentheses:
-- 
--   * Employee Last Name (Last)
--   * Employee First Name (First)
--   * Employee Title (Title)
--   * Office City (Office)
--   * Office Phone Number (Phone)
--   * Employee Extension (Ext)
--   * Employee Email (Email)
--   * Add the Concatenated Manager's First and Last Name (Manager)
--
-- Just allow the Manger field to be Null for Diane.
-- 
-- Sort by employee last and then first.
-- 
-- Hint: you ONLY need the outer join between the "employee" and "manager"
-- aliased tables.
-- 
-- 23 results
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT emps.lastName,emps.firstName, emps.jobTitle, emps.officeCode, o.phone, emps.extension,emps.email, concat(emps1.lastName, " ",emps1.firstName) AS Manager
FROM employees as emps
LEFT JOIN employees as emps1
ON emps.reportsTo = emps1.employeeNumber
JOIN offices as o
ON o.officeCode = emps.officeCode
ORDER BY emps.lastName, emps.firstName;
