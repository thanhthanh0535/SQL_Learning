-------------------------- I N S T R U C T I O N S ----------------------------
-- Display all Employees and their Managers. Include the Employee Name (concat
-- first + last with space between and alias “Employee”), their job title, and
-- their Manager’s Name (likewise concat first and last and alias as “Manager”),
-- and their manager’s job title. Sort by the employees last name and then first
-- name.
-- 
-- 22 results...hmm, why isn't Diane Murphy Listed?
-- 
-- Hint: this is a self-join. Use good alias names for the tables and join from
-- the employee's reportsTo field to the manager's employeeNumber. And yes
-- you’ll see these again on exam.
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT concat(emps.lastName, " ",emps.firstName) AS Employee,emps.jobTitle as Employee_Job_Title, concat(emps1.lastName, " ",emps1.firstName) AS Manager, emps1.jobTitle as Manager_Job_Title
FROM employees as emps
JOIN employees as emps1
ON emps.reportsTo = emps1.employeeNumber
ORDER BY emps.lastName, emps.firstName;

