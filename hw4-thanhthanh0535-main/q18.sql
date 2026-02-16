-------------------------- I N S T R U C T I O N S ----------------------------
-- GREAT NEWS!! You’ve been hired!! Write a query to add yourself as an employee
-- in whichever office is your favorite and have yourself report to someone in
-- that office. Give yourself an appropriate title of “Grunt” (or something
-- similar).
------------------------------------------------------------------------------------------------- W R I T E   Q U E R Y   B E L O W   H E R E ----------------
INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES (1001, "Nguyen", "Thanh", "x180", "tt@classicmodelcars.com", "10", 1002, "Grunt");

SELECT employeeNumber,lastName,firstName,extension,email,officeCode,reportsTo,jobTitle
FROM employees
