-------------------------- I N S T R U C T I O N S ----------------------------
-- Write a single query to change the employee records for both you and your
-- manager to point to the new Augusta office. Use employeeNumber and the IN
-- operator in your where clause.
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
UPDATE employees
SET officeCode = 10
WHERE employeeNumber IN(1001,1143)
