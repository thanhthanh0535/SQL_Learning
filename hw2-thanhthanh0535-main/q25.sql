-------------------------- I N S T R U C T I O N S ----------------------------
-- Display a list of customer names along with a total dollar amount of all
-- orders. It's not as bad as it seems. Join customer to order to orderdetails.
-- Select the customer name and sum price x quantity from the orderdetails
-- (alias as TotalSales). Group by the customer name. Only include results for
-- customers with less than $50,000 in total sales.  Order by the TotalSales,
-- lowest-to-highest.
-- 
-- 16 results. Boards & Toys is first with $7,918.60 in total sales
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT customerName, SUM(odd.priceEach*odd.quantityOrdered) AS "TotalSales"
FROM customers AS cus
JOIN orders AS od
    ON od.customerNumber= cus.customerNumber
JOIN orderdetails AS odd
    ON od.orderNumber = odd.orderNumber
JOIN products AS prod
    ON prod.productCode = odd.productCode
GROUP BY customerName
HAVING TotalSales < 50000
ORDER BY TotalSales ASC;