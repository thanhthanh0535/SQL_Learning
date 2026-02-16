# FEEDBACK
## SCORE: 76

------------------------------------------------------------------------------
### ✗  q1 (DEDUCTION: 1)
  * wrong ORDER BY

**YOUR SQL**

```
ORDER BY amount ASC
```

**SOLUTION SQL**

```
ORDER BY paymentDate DESC
```

------------------------------------------------------------------------------
### ✓  q2
------------------------------------------------------------------------------
### ✗  q3 (DEDUCTION: 1)
  * Unexpected alias contactname found for column Contact Name
  * Needed "Last, First" not "First Last"

**YOUR SQL**

```
SELECT customerName, CONCAT (cus.contactFirstName, " ", cus.contactLastName) as contactname, phone,creditLimit
```

**SOLUTION SQL**

```
SELECT
    customerName,
    CONCAT(contactLastName, ", ", contactFirstName) as "Contact Name",
    phone,
    creditLimit
```

------------------------------------------------------------------------------
### ✓  q4
------------------------------------------------------------------------------
### ✓  q5
------------------------------------------------------------------------------
### ✓  q6
------------------------------------------------------------------------------
### ✗  q7 (DEDUCTION: .5)
  * Expected 3 for number of columns but retrieved 4

**YOUR SQL**

```
SELECT odd.orderNumber, orderDate,status, prod.productName
```

**SOLUTION SQL**

```
SELECT orderNumber, orderDate, productName
```

------------------------------------------------------------------------------
### ✗  q8 (DEDUCTION: 1.5)
  * Expected 1 for number of columns but retrieved 3
  * YEAR(odr.orderDate) would normally break the query by not really getting a
    distinct list; it works only because you limit the orders to 2005
  * Use WHERE = with the YEAR function, not WHERE LIKE...LIKE is for strings and
    not for dates...honestly surprised that this worked.

**YOUR SQL**

```
SELECT DISTINCT customerName, cus.customerNumber, YEAR(odr.orderDate)
FROM customers AS cus
JOIN orders AS odr
    ON odr.customerNumber= cus.customerNumber
WHERE odr.orderDate LIKE "2005%"
ORDER BY cus.customerName ASC
```

**SOLUTION SQL**

```
SELECT DISTINCT customerName
FROM customers
JOIN orders USING (customerNumber)
WHERE YEAR(orderDate) = 2005
ORDER BY customerName
```

------------------------------------------------------------------------------
### ✗  q9 (DEDUCTION: .5)
  * Expected True for uses COUNT(*) to count records but retrieved
    False

**YOUR SQL**

```
SELECT customerName,count(od.orderNumber) AS OrderCount
```

**SOLUTION SQL**

```
SELECT customerName, COUNT(*) AS "OrderCount"
```

------------------------------------------------------------------------------
### ✓  q10
------------------------------------------------------------------------------
### ✗  q11 (DEDUCTION: 3)
  * Missing GROUP BY...fundamental issue with the query

**YOUR SQL**

```
SELECT productLine, COUNT(*) as ProductCount
FROM productlines
ORDER BY ProductCount ASC
```

**SOLUTION SQL**

```
SELECT productLine, COUNT(*) as "ProductCount"
FROM products
GROUP BY productLine
ORDER BY ProductCount DESC
```

------------------------------------------------------------------------------
### ✓  q12
------------------------------------------------------------------------------
### ✗  q13 (DEDUCTION: 3)
  * Customers join to Employees via the Sales Rep, not to office via country. Joins ONLY go between a primary and foreign key, and country is a key in neither database.
  * Office should not have been included in the query.

**YOUR SQL**

```
FROM customers AS cus
JOIN offices AS offi
    ON offi.country = cus.country
JOIN employees AS emp
    On emp.officeCode = offi.officeCode
```

**SOLUTION SQL**

```
FROM customers
JOIN employees
  ON salesRepEmployeeNumber = employeeNumber
```

------------------------------------------------------------------------------
### ✗  q14 (DEDUCTION: 3)
  * Expected to find a column named Contact
  * don't use (NOT) LIKE when = (or !=) works
  * Same issue as above with the JOIN
  * No need for DISTINCT here as no duplicates are being removed.

**YOUR SQL**

```
SELECT DISTINCT cus.customerName,CONCAT(cus.contactFirstName, " ",cus.contactLastName),cus.city,cus.country,cus.phone, CONCAT(emp.firstName, " " ,emp.lastName) AS SalesRep, CONCAT (offi.phone," ",emp.extension) AS SalesRepPhone
FROM customers AS cus
JOIN offices AS offi
    ON offi.country = cus.country
JOIN employees AS emp
    On emp.officeCode = offi.officeCode
WHERE cus.country NOT LIKE "USA"
ORDER BY cus.customerName ASC
```

**SOLUTION SQL**

```
SELECT
    customerName,
    CONCAT(contactFirstName, " ", contactLastName) AS "Contact",
    c.city,
    c.country,
    c.phone,
    CONCAT(firstName, " ", lastName) AS SalesRep,
    CONCAT(o.phone, " ", e.extension) AS SalesRepPhone
FROM customers AS c
JOIN employees AS e
  ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices AS o
  ON e.officeCode = o.officeCode
WHERE c.country != "USA"
ORDER BY customerName
```

------------------------------------------------------------------------------
### ✗  q15 (DEDUCTION: 2)
  * Expected 40 for number of rows but retrieved 60
  * Same fundamental issue with the JOIN

**YOUR SQL**

```
FROM customers AS cus
JOIN offices AS o
    ON o.country = cus.country
```

**SOLUTION SQL**

```
FROM customers AS c
JOIN employees AS e
  ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices AS o
  ON e.officeCode = o.officeCode
```

------------------------------------------------------------------------------
### ✓  q16
------------------------------------------------------------------------------
### ✓  q17
------------------------------------------------------------------------------
### ✓  q18
------------------------------------------------------------------------------
### ✗  q19 (DEDUCTION: 1.5)
  * Expected to find a column named orderNumber
  * Expected to find a column named quantityOrdered
  * Added OFFSET gives you the wrong results

**YOUR SQL**

```
SELECT customerName, orderDate, prod.productCode, productName, ((odd.PriceEach-prod.BuyPrice) * odd.QuantityOrdered) AS "TotalProfit"
...
LIMIT 20 OFFSET 1
```

**SOLUTION SQL**

```
SELECT
    customerName, orderNumber, orderDate, productCode, productName, quantityOrdered,
    (priceEach - buyPrice) * quantityOrdered as "TotalProfit"
...
LIMIT 20
```

------------------------------------------------------------------------------
### ✗  q20 (DEDUCTION: 2)
  * Expected 9 for number of rows but retrieved 34
  * Expected 1 for number of columns but retrieved 2
  * Having the total profit in the select clause makes it impossible to get a unique list of just product names.

**YOUR SQL**

```
SELECT DISTINCT prod.productName, ((odd.PriceEach-prod.BuyPrice) * odd.QuantityOrdered) AS "TotalProfit"
```

**SOLUTION SQL**

```
SELECT DISTINCT productName
```

------------------------------------------------------------------------------
### ✗  q21 (DEDUCTION: 1.5)
  * Expected to find a column named country
  * Wrong ORDER BY

**YOUR SQL**

```
SELECT customerNumber, Count(*) AS CustomerCount, ROUND(AVG(cus.creditLimit)) AS AverageCreditLimit, MAX(cus.creditLimit) AS MaximumCreditLimit, MIN(cus.creditLimit) AS MinimumCreditLimit
FROM customers AS cus
GROUP BY cus.country
ORDER BY cus.country ASC
```

**SOLUTION SQL**

```
SELECT country,
       COUNT(*) as CustomerCount,
       ROUND(AVG(creditLimit),2) as AverageCreditLimit,
       MAX(creditLimit) as MaximumCreditLimit,
       MIN(creditLimit) as MinimumCreditLimit
FROM customers
GROUP BY country
ORDER BY AverageCreditLimit DESC
```

------------------------------------------------------------------------------
### ✗  q22 (DEDUCTION: 2)
  * Expected True for uses COUNT(*) to count records but retrieved
    False
  * You need an aggregate function of some sort for a sumamry query.

**YOUR SQL**

```
SELECT offi.city,emp.employeeNumber AS "EmployeeCount"
```

**SOLUTION SQL**

```
SELECT city, COUNT(*) as EmployeeCount
```

------------------------------------------------------------------------------
### ✗  q23 (DEDUCTION: 1)
  * Expected to find a column named ContactName
  * DISTINCT is not appropriate here as we're not removing duplicates.

**YOUR SQL**

```
SELECT DISTINCT customerName, CONCAT(cus.contactFirstName, " ",cus.contactLastName), cus.phone, SUM(pay.amount) AS "TotalPayments"
```

**SOLUTION SQL**

```
SELECT cus.customerName,
     CONCAT(cus.contactFirstName, ' ', cus.contactLastName) as ContactName,
     cus.phone ,
     SUM(pay.amount) as TotalPayments
```

------------------------------------------------------------------------------
### ✗  q24 (DEDUCTION: .5)
  * Expected True for uses COUNT(*) to count records but retrieved
    False

**YOUR SQL**

```
SELECT cus.customerName, COUNT(cus.customerName) AS "OrdersPlaced"
```

**SOLUTION SQL**

```
SELECT customerName, COUNT(*) as OrdersPlaced
```

------------------------------------------------------------------------------
### ✓  q25
