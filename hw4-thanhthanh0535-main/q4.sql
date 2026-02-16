-------------------------- I N S T R U C T I O N S ----------------------------
-- Similar to the prior query, display ALL Employees (including Diane Murphy)
-- and their Managers. Include the Employee Name (concat first + last and alias
-- “Employee”), their job title, and their Manager’s Name (likewise concat first
-- and last and alias as “Manager”), and their manager’s job title.
-- 
-- BUT ALSO replace the Null manager and title with the name of your favorite
-- mythical god or beast (e.g., Norse, Greek, Roman, etc.) or superhero and an
-- appropriate title. Add a short comment BELOW your query telling me why you
-- this is your favorite. Use the IFNULL() function for these.
-- 
-- Sort by the employees last name and then first name.
-- 
-- Hint: You can combine two functions...e.g., IFNULL(CONCAT(...), ...)
-- 
-- 23 results...and Diane Murphy's manager should no longer be Null.
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------SELECT concat(emps.lastName, " ",emps.firstName) AS Employee,emps.jobTitle as Employee_Job_Title, concat(emps1.lastName, " ",emps1.firstName) AS Manager, emps1.jobTitle as Manager_Job_Title
SELECT IFNULL(concat(emps.lastName, " ",emps.firstName),"Athena") AS Employee,emps.jobTitle as Employee_Job_Title, IFNULL(concat(emps1.lastName, " ",emps1.firstName),"Zeus") AS Manager, IFNULL(emps1.jobTitle,"Geek") as Manager_Job_Title
FROM employees as emps
LEFT JOIN employees as emps1
ON emps.reportsTo = emps1.employeeNumber
ORDER BY emps.lastName, emps.firstName;
