-------------------------- I N S T R U C T I O N S ----------------------------
-- Everything should be back the way it was before you started. So write a query
-- showing the office city and the count of employees in that office. Alias the
-- city as "Office" and the count as "Employee Count". Sort by the office (city)
-- alphabetically.
-- 
-- Results should be:
-- 
-- Office           | Employee Count
-- ---------------- | --------------
-- Boston           | 2
-- London           | 2
-- NYC              | 2
-- Paris            | 5
-- San Francisco    | 6
-- Sydney           | 4
-- Tokyo            | 2
-- 
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT offs.city as Office, COUNT(employeeNumber) AS EmployeeCount
FROM offices AS offs
JOIN employees as emps
ON emps.officeCode = offs.officeCode
GROUP BY Office
ORDER BY Office ASC;
