USE operating_system;


-- Hyrum Hansen

-- John is a employee at a store that sells computer equipment. A named Hyrum Hansen calls and says that he recently built
-- orderd and built a computer through the store. He has a Windows 10 and would like to upgrade to Windows 11, 
-- but it is telling him that he needs to upgrade his storage and Ram. He has 32gb of storage and 2gb of DDR4 RAM.
-- Use the database to find how much more storage and memory your customer must add in order to upgrade to Windows 11.
-- Also include the price difference of the new operating system and the time since the computer was purchased on January, 13th.

SET @current_storage := 32;
SET @current_ram := 2; 
SET @current_price := 99.99;
SET @purchase_date := "2025-01-13";
SET @customer_name := "Hyrum Hansen";

SELECT CONCAT(c.first_name, " ", c.last_name) AS "Name"
	, FLOOR(DATEDIFF(NOW(), @purchase_date)) AS "Days Since Purchase"
    , os.os_name AS "Operating System"
	, (mr.ram_size - @current_ram) AS "RAM Needed"
    , (ms.storage_size - @current_storage) AS "Storage Needed"
    , CONCAT("$", ROUND((os.cost - @current_price), 2)) AS "Price Difference"
FROM operating_system os 
	JOIN required_specs rs ON os.required_specs_id = rs.required_specs_id
    JOIN min_ram mr ON rs.min_ram_id = mr.min_ram_id
    JOIN min_storage ms ON rs.min_storage_id = ms.min_storage_id
    , customer c
WHERE os.os_name = "Windows 11 Pro" AND CONCAT(c.first_name, " ", c.last_name) = "Hyrum Hansen";


-- Zach Pinney

-- QUERY: Find the customers and their credit card number. Find the 
-- customers who made purchases of $30 or more and the date they made the
-- purchase. The format of the date should look like (1 March 2024)
--    The columns will look like the following:
--    | Customer Name | Credit Card Number | Cost ($) | Purchase Date

SELECT CONCAT(c.first_name, ' ', c.last_name) AS 'Customer Name'
, cn.card_number AS 'Credit Card Number'
, CONCAT('$', o.cost) AS 'Cost ($)'
, DATE_FORMAT(o.order_date, '%e %M %Y') AS 'Purchase Date'
FROM customer c
INNER JOIN credit_card cn
ON c.credit_card_id = cn.credit_card_id
INNER JOIN os_order_customer ooc
ON c.customer_id = ooc.customer_id
INNER JOIN orders o
ON ooc.order_id = o.order_id
WHERE o.cost >= '30';


-- Tam Tran

--  Select the customers that use "Windows 11 Pro" and the cost, order by alphabetically by the customer's last name.
-- --------------------------------------------------------------------------

SELECT c.first_name, c.last_name, os.os_name, os.cost 
FROM customer c 
JOIN os_order_customer ooc ON c.customer_id = ooc.customer_id
JOIN operating_system os ON os.os_id = ooc.os_id
WHERE os.os_name = "Windows 11 Pro"
ORDER BY last_name ASC;


-- Andrew Benge

-- -------------------------------------------------------
-- Rank the opperating systems by their storage use in GB
-- -------------------------------------------------------

Select os.os_name
,      CONCAT(ms.storage_size, 'GB')
,      RANK() OVER (ORDER BY ms.storage_size ASC)
FROM operating_system os
INNER JOIN required_specs rs
ON os.required_specs_id = rs.required_specs_id
INNER JOIN min_storage ms
ON rs.min_storage_id = ms.min_storage_id
ORDER BY ms.storage_size ASC;
 
 
 -- Cashton Bone
 
 -- -------------------------------------------
-- >Give me all the people that have an order
-- and the rank the customers who spent the most
-- amount of money from most to last
-- >Order it by highest cost to lost cost
-- -------------------------------------------
SELECT CONCAT(c.first_name, ' ', c.last_name) AS 'Customer Name'
, o.cost AS 'Cost'
, ROW_NUMBER() OVER(ORDER BY o.cost) AS 'Customer Rank'
FROM customer c
INNER JOIN os_order_customer ooc
ON c.customer_id = ooc.customer_id
INNER JOIN orders o
ON ooc.order_id = o.order_id
ORDER BY o.cost;
-- -------------------------------------------
 