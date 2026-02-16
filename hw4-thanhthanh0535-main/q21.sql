-------------------------- I N S T R U C T I O N S ----------------------------
-- Write a query to show the count of employees in the new Augusta office. Alias
-- this count as "Augusta Office Count".
-- 
-- 1 result...must be 2 since it's just you and your boss.
-- 
-- NOTE: this assumes that you are executing the queries in order. If you run
--       them out of order, then it's likely that this query will return a count
--       of 0 since there won't be any employees in the Augusta office.
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT COUNT(employeeNumber)  as AugustaOfficeCount
FROM employees as emps
JOIN offices as offs
ON offs.officeCode = emps.officeCode
WHERE offs.officeCode LIKE "10";
