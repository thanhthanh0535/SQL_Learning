-------------------------- I N S T R U C T I O N S ----------------------------
-- Display the city, country, postal code, and phone number of all offices that
-- are either in the Asia/Pacific APAC) or Europe/Middle East/Africa (EMEA)
-- territories.
-- 
-- (3 rows)
-------------------------------------------------------------------------------
------------------ W R I T E   Q U E R Y   B E L O W   H E R E ----------------
SELECT city, country, postalCode, phone, territory
From offices
WHERE territory = "APAC" OR territory = "EMEA";
