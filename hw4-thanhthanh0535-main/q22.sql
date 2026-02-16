-------------------------- I N S T R U C T I O N S ----------------------------
-- BAD NEWS!! They’re closing the Augusta office, firing your sorry butt, and
-- moving your manager back to the office they came from.
-- 
-- Here you need to write the query to change your (former) manager's office
-- code back to their original one. Use his employeeNumber in the where clause.
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
UPDATE employees
SET officeCode = 3
WHERE employeeNumber IN(1143)
