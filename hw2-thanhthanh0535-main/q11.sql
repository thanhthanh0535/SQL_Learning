-------------------------- I N S T R U C T I O N S ----------------------------
-- Display a count of products by product line. Obviously, this means include
-- the product line and a count (aliased as "ProductCount") in the report. Sort
-- by the count highest first.
-- 
-- Hint: because the product line field is the PK for the productline table and
-- thus the FK in the products table, there's actually no need to join to the
-- productlines table at all for this one.
-- 
-- 7 rows, Classic Cars is first with 38 models
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT productLine, COUNT(*) as ProductCount
FROM productlines
ORDER BY ProductCount ASC;
