-------------------------- I N S T R U C T I O N S ----------------------------
-- Display a list of all employees, including their full name and email address.
-- The full name should be in the form "first last" (concatenated with a space
-- in between). Alias the full name column as "FullName". Sort the list
-- alphabetically by last name and then first name.
-- 
-- (23 rows, "Gerard Bondur" will be first)
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT CONCAT (firstName, " ",lastName) AS FullName, email
FROM employees
ORDER BY
    FullName ASC;
