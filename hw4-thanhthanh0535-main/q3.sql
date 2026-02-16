-------------------------- I N S T R U C T I O N S ----------------------------
-- Similar to the prior query, but display ALL Employees (including Diane
-- Murphy) and their Managers. Include the Employee Name (concat first + last
-- and alias “Employee”), their job title, and their Manager’s Name (likewise
-- concat first and last and alias as “Manager”), and their manager’s job title.
-- Sort by the employees last name and then first name.
-- 
-- Hint: join the outer space alliance.
-- 
-- 23 results...Diane Murphy's manager should be Null
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT concat(emps.lastName, " ",emps.firstName) AS Employee,emps.jobTitle as Employee_Job_Title, concat(emps1.lastName, " ",emps1.firstName) AS Manager, emps1.jobTitle as Manager_Job_Title
FROM employees as emps
LEFT JOIN employees as emps1
ON emps.reportsTo = emps1.employeeNumber
ORDER BY emps.lastName, emps.firstName;
