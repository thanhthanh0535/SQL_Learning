-------------------------- I N S T R U C T I O N S ----------------------------
-- Display a list of all managers and the number of employees that they manage.
-- 
-- Yep. A self-join is needed here. This is similar to a list of employees and
-- their managers. Except instead of SHOWING the employees, you are just
-- "rolling them up" using COUNT(*) and grouping by the managers.
-- 
-- Show the manager’s name (concat first and last and alias as “Manager”) and
-- the manager’s job title. Alias the count as “DirectReports”. Order by the
-- number of direct reports lowest to highest.
-- 
-- 6 results

-- 1: Mami Nishi    | Sales Rep             | 1
-- ...
-- 6: GerardBondur  | Sales Manager (EMEA)  | 6
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT concat(emps1.lastName, " ",emps1.firstName) AS Manager, emps1.jobTitle as DirectReports,COUNT(*)
FROM employees as emps
LEFT JOIN employees as emps1
ON emps.reportsTo = emps1.employeeNumber
GROUP BY Manager
ORDER BY count(*) ASC;
