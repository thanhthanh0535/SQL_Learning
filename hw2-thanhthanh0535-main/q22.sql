-------------------------- I N S T R U C T I O N S ----------------------------
-- Display a count of employees by office city. First column should be the city
-- and the second the count (aliased as EmployeeCount). Order the results by the
-- employee count, largest to smallest.
-- 
-- 7 results, San Fran will be first with 6 employees
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ---------------
SELECT offi.city,emp.employeeNumber AS "EmployeeCount"
FROM offices AS offi
JOIN employees AS emp
    ON emp.officeCode = offi.officeCode
GROUP BY offi.city
ORDER BY EmployeeCount DESC;