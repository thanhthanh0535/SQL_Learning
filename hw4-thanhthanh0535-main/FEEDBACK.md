# FEEDBACK
## SCORE: 81.5

------------------------------------------------------------------------------
### ✗  q1 (DEDUCTION: .5)
  * Expected to find a column named jobTitle
  * Expected 7 for number of columns but retrieved 6

**YOUR SQL**

```
SELECT emps.lastName, emps.firstName, emps.email, emps.extension, offs.city, offs.phone
```

**SOLUTION SQL**

```
SELECT e.lastName, e.firstName, e.jobTitle, o.phone, e.extension, e.email, o.city
```

------------------------------------------------------------------------------
### ✗  q2 (DEDUCTION: .5)
  * Unexpected alias Employee_Job_Title found for jobTitle
  * Unexpected alias Manager_Job_Title found for jobTitle
  * Expected to find Gerard Bondur in Employee for first row

You did lastName firstName instead of first last
  
**YOUR SQL**

```
SELECT concat(emps.lastName, " ",emps.firstName) AS Employee,emps.jobTitle as Employee_Job_Title, concat(emps1.lastName, " ",emps1.firstName) AS Manager, emps1.jobTitle as Manager_Job_Title
```

**SOLUTION SQL**

```
SELECT
    CONCAT(emp.firstName, ' ', emp.lastName) as Employee,
    emp.jobTitle,
    CONCAT(mgr.firstName, ' ', mgr.lastName) as Manager,
    mgr.jobTitle
```

------------------------------------------------------------------------------
### ✗  q3 (DEDUCTION: .5)
  * CONCAT last first instead of first last

------------------------------------------------------------------------------
### ✗  q4 (DEDUCTION: 0)
  * CONCAT last first instead of first last

------------------------------------------------------------------------------
### ✗  q5 (DEDUCTION: .5)
  * Missing alias Last for lastName
  * Missing alias First for firstName
  * Missing alias Title for jobTitle
  * Missing alias Ext for extension
  * CONCAT last first instead of first last

**YOUR SQL**

```
SELECT emps.lastName,emps.firstName, emps.jobTitle, emps.officeCode, o.phone, emps.extension,emps.email, concat(emps1.lastName, " ",emps1.firstName) AS Manager
```

**SOLUTION SQL**

```
SELECT e.lastName AS Last,
       e.firstName AS First,
       e.jobTitle AS Title,
       o.city AS Office,
       o.phone AS Phone,
       e.extension AS Ext,
       e.email AS Email,
       CONCAT(m.firstName, " ", m.lastName) as Manager
```

------------------------------------------------------------------------------
### ✗  q6 (DEDUCTION: .5)
  * Expected to find a column named jobTitle
  * Expected 6 for number of rows but retrieved 7
  * CONCAT last first instead of first last

**YOUR SQL**

```
SELECT concat(emps1.lastName, " ",emps1.firstName) AS Manager, emps1.jobTitle as DirectReports,COUNT(*)
```

**SOLUTION SQL**

```
SELECT CONCAT(m.firstName, ' ', m.lastName) as Manager, m.jobTitle, COUNT(*) as DirectReports
```

------------------------------------------------------------------------------
### ✗  q7 (DEDUCTION: 0)
  * CONCAT last first instead of first last

------------------------------------------------------------------------------
### ✗  q8 (DEDUCTION: 0)
  * CONCAT last first instead of first last

------------------------------------------------------------------------------
### ✗  q9 (DEDUCTION: .5)
  * Expected to find Euro+ Shopping Channel in customerName for first
    row
  * Expected to find Diego  Freyre in ContactName for first row
  * Expected to find (91) 555 94 44 in phone for first row
  * Expected to find 715738.98 in TotalPayments for first row

So this one is a not-obvious error. Quotes around the zero in IFNULL(..., "0") turns that column into a string (varchar). This causes the column to be sorted alphabetically instead of numerically. So obviously 100000 comes WAY after 2, but "100000" comes before "2" when sorted alphabetically.

**YOUR SQL**

```
SELECT cus.customerName, concat(cus.contactLastName, " ", cus.contactFirstName) as ContactName, cus.phone, IFNULL(SUM(amount),"0") AS TotalPayments
```

**SOLUTION SQL**

```
SELECT cus.customerName,
     CONCAT(cus.contactFirstName, ' ', cus.contactLastName) as ContactName,
     cus.phone ,
     IFNULL(SUM(pay.amount),0) as TotalPayments
```

------------------------------------------------------------------------------
### ✗  q10 (DEDUCTION: 0)
  * Expected 3 for number of columns but retrieved 4
  * Same sorting issue as above

------------------------------------------------------------------------------
### ✗  q11 (DEDUCTION: 2)
  * Expected True for uses COUNT(*) to count records but retrieved
    False
  * Expected to find Bavarian Collectables Imports, Co. in
    customerName for first row
  * Expected to find 1 in OrdersPlaced for first row
  * Expected to find 26 in OrdersPlaced for last row

Here you actually end up with the wrong query. Because you include the order
details table, you end up counting EACH item as a separate order instead of just
counting orders.

Both q11 and q12 were to have used COUNT(*), not COUNT(orderNumber).

**YOUR SQL**

```
SELECT cus.customerName, count(orde.orderNumber)  as OrdersPlaced
FROM customers as cus
JOIN orders as ord
ON ord.customerNumber = cus.customerNumber
JOIN orderdetails as orde
ON orde.orderNumber = ord.orderNumber
```

**SOLUTION SQL**

```
SELECT customerName, COUNT(*) as OrdersPlaced
FROM customers
JOIN orders using(customerNumber)
```

------------------------------------------------------------------------------
### ✗  q12 (DEDUCTION: 1)
  * Unexpected alias OrderPlaced found for COUNT(*) (plural...not an issue)
  * Expected True for uses COUNT(*) to count records but retrieved
    False
  * Same issue as q11 regarding extra table

------------------------------------------------------------------------------
### ✗  q13 (DEDUCTION: .5)
  * Unexpected alias OrderPlaced found for COUNT(orderNumber)
  * Same issue as q11 regarding extra table

------------------------------------------------------------------------------
### ✗  q14 (DEDUCTION: 2)
  * Expected 100 for number of rows but retrieved 122
  
Three "root cause" issues here:

  * You didn't want outer joins here at all.
  * You didn't need to include the office (no fields come from the office nor was it needed in order to link the sales rep anc customer)
  * You needed to sort by SalesRep and customerName, not Contact

**YOUR SQL**

```
SELECT DISTINCT cus.customerName, CONCAT(cus.contactFirstName, " ",cus.contactLastName) as Contact, cus.city, cus.state, cus.country, cus.phone, CONCAT(emp.firstName, " ", emp.lastName) as SalesRep
FROM customers as cus
LEFT JOIN offices as offs
ON offs.postalCode = offs.postalCode
RIGHT JOIN employees as emp
ON emp.officeCode = offs.officeCode
```

**SOLUTION SQL**

```
SELECT
  c.customerName,
  CONCAT(c.contactFirstName, ' ', c.contactLastName) as Contact,
  c.city,
  c.state,
  c.country,
  c.phone,
  CONCAT(e.firstName, ' ', e.lastName) as SalesRep
FROM customers as c
JOIN employees as e
  ON c.salesRepEmployeeNumber = e.employeeNumber
```

------------------------------------------------------------------------------
### ✗  q15 (DEDUCTION: 2)
  * Here you actually DID want outer joins
  * In addition to the q14 feedback, here you also needed an IFNULL around your
    CONCAT.

**YOUR SQL**

```
SELECT DISTINCT cus.customerName, CONCAT(cus.contactFirstName, " ",cus.contactLastName) as Contact, cus.city, cus.state, cus.country, cus.phone, CONCAT(emp.firstName, " ", emp.lastName) as SalesRep
FROM customers as cus
JOIN offices as offs
ON offs.postalCode = offs.postalCode
JOIN employees as emp
ON emp.officeCode = offs.officeCode
```

**SOLUTION SQL**

```
SELECT
  c.customerName,
  CONCAT(c.contactFirstName, ' ', c.contactLastName) as Contact,
  c.city,
  c.state,
  c.country,
  c.phone,
  IFNULL(CONCAT(e.firstName, ' ', e.lastName), "** NOT ASSIGNED **") as SalesRep
FROM customers as c
LEFT OUTER JOIN employees as e
  ON c.salesRepEmployeeNumber = e.employeeNumber
```

------------------------------------------------------------------------------
### ✓  q16
------------------------------------------------------------------------------
### ✓  q17
------------------------------------------------------------------------------
### ✗  q18 (DEDUCTION: 2)
  * Error executing SQL: Cannot add or update a child row: a foreign
    key constraint fails (`classicmodels`.`employees`, CONSTRAINT
    `employees_ibfk_2` FOREIGN KEY (`officeCode`) REFERENCES `offices`
    (`officeCode`))

Unfortunately, for these I'm deducting 50% for those that did not run and thus
were not fully tested. Here yiou are attempting to add yourself to office 10
(Augusta). This is where you eventually want to be, but the rules of referential
integrity mean that this fails since Augusta isn't in the database yet.

**YOUR SQL**

```
INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES (1001, "Nguyen", "Thanh", "x180", "tt@classicmodelcars.com", "10", 1002, "Grunt")
```

------------------------------------------------------------------------------
### ✓  q19
------------------------------------------------------------------------------
### ✗  q20 (DEDUCTION: 2.5)
  * Expected 2 for rows affected but retrieved 1

Syntax here is okay. BUT:
  * q18 failed so employee 1001 iosn't there.
  * 1043 is not the employee that you specified to be your manager in q18 (you said 1002)


**YOUR SQL**

```
UPDATE employees
SET officeCode = 10
WHERE employeeNumber IN(1001,1143)
```
------------------------------------------------------------------------------
### ✗  q21 (DEDUCTION: 1)
  * Unexpected alias AugustaOfficeCount found for Augusta Office Count
  * Expected True for uses COUNT(*) to count records but retrieved
    False
  * Expected to find 2 in Augusta Office Count for first row

This one would have been okay, though:

  * officeCode is already in the employee table so there was no need to join to
    the offices table
  * don't use LIKE here. You are asking if it is exactly equal to "10"

**YOUR SQL**

```
SELECT COUNT(employeeNumber)  as AugustaOfficeCount
FROM employees as emps
JOIN offices as offs
ON offs.officeCode = emps.officeCode
WHERE offs.officeCode LIKE "10"
```

**SOLUTION SQL**

```
SELECT COUNT(*) AS "Augusta Office Count"
FROM employees
WHERE officeCode = 10
```

------------------------------------------------------------------------------
### ✓  q22
------------------------------------------------------------------------------
### ✗  q23 (DEDUCTION: 2)
  * Expected 1 for rows affected but retrieved 0

Doesn't run because of q18 AND because you said 1000 instead of 1001 for the
employee number.

**YOUR SQL**

```
DELETE FROM employees
WHERE employeeNumber = 1000
```

------------------------------------------------------------------------------
### ✓  q24
------------------------------------------------------------------------------
### ✗  q25 (DEDUCTION: .5)
  * Unexpected alias EmployeeCount found for Employee Count
  * Expected True for uses COUNT(*) to count records but retrieved
    False

**YOUR SQL**

```
SELECT offs.city as Office, COUNT(employeeNumber) AS EmployeeCount
```

**SOLUTION SQL**

```
SELECT city as "Office", COUNT(*) as "Employee Count"
```

