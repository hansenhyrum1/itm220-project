USE operating_system;

-- Hyrum Hansen
-- A customer comes in and would like to build a computer. They are unsure what operating system they would like to put into
-- there computer, but they would like to know how much ram they should put into the system. Looking at the previous orders, what
-- is average cost of orders for each ram size, and how many times was each ram size purchased. Include only Ram sizes that have
-- been purchased more than once and sort by number of times purcahsd.

SELECT mr.ram_size AS "RAM Size",
	CONCAT("$", FORMAT(AVG(o.cost), 2)) AS "Average Order Cost",
    COUNT(*) AS "Times Purchased"
FROM orders o
	JOIN os_order_customer ooc ON o.order_id = ooc.order_id
    JOIN customer c ON ooc.customer_id = c.customer_id
    JOIN operating_system os ON ooc.os_id = os.os_id
    JOIN required_specs rs ON os.required_specs_id = rs.required_specs_id
    JOIN min_ram mr ON rs.min_ram_id = mr.min_ram_id
GROUP BY mr.ram_size
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- Previous Attempt

-- SELECT o.order_id AS "Order ID",
-- 	CONCAT(c.first_name, " ", c.last_name) AS "Customer Name",
-- 	os.os_name AS "Operating System",
--     o.cost AS "Order Cost",
-- 	AVG(o.cost) AS "Avereage Purchase Price",
-- 	AVG(mr.ram_size) AS "Average Ram Size"
-- FROM orders o
-- 	JOIN os_order_customer ooc ON o.order_id = ooc.order_id
--     JOIN customer c ON ooc.customer_id = c.customer_id
--     JOIN operating_system os ON ooc.os_id = os.os_id
--     JOIN required_specs rs ON os.required_specs_id = rs.required_specs_id
--     JOIN min_ram mr ON rs.min_ram_id = mr.min_ram_id
-- GROUP BY o.order_id, c.first_name, c.last_name, os.os_name, o.cost;



-- Tam Tran

# List the total number of operating systems sold by each company, 
# including the total revenue generated and the average price per operating system.
USE operating_system;
SELECT 
    c.company_name AS "Company Name",
    COUNT(ooc.os_id) AS "Total Operating System Sold",
    CONCAT('$', FORMAT(SUM(o.cost), 2)) AS "Total Revenue",
    CONCAT('$', FORMAT(AVG(o.cost), 2)) AS "Average Price"
FROM operating_system os
JOIN company c ON os.company_id = c.company_id
JOIN os_order_customer ooc ON os.os_id = ooc.os_id
JOIN orders o ON ooc.order_id = o.order_id
GROUP BY c.company_name
ORDER BY SUM(o.cost) DESC;


-- Zach Pinney

-- Find customers who have a spent a total of $25 or more on purchases towards Windows operating systems.
-- List the operating system, the amount of the purchase and how many purchases they have made
-- Those who have spent more should be listed first
-- Columns should look like this:
-- Customer | Operating System | Payment Amount | Number of purchases |
 
SELECT CONCAT(c.first_name, ' ', c.last_name) AS 'Customer'
, os.os_name AS 'Operating System'
, CONCAT('$', SUM(o.cost)) AS 'Payment Amount'
, COUNT(o.cost) AS 'Number of Purchases'
FROM customer c
INNER JOIN os_order_customer ooc
ON c.customer_id = ooc.customer_id
INNER JOIN operating_system os
ON ooc.os_id = os.os_id
INNER JOIN orders o
ON ooc.order_id = o.order_id
INNER JOIN credit_card cc
ON c.credit_card_id = cc.credit_card_id
INNER JOIN address a
ON cc.address_id = a.address_id
WHERE os.os_name LIKE '%Windows%'
GROUP BY c.first_name, c.last_name, o.cost, os_name
HAVING SUM(o.cost) >= 25
ORDER BY SUM(o.cost) DESC;



-- Cashton Bone
-- ------------------------------------------- 
-- >List the customer's that have spent the most amount of money 
-- >and also the average amount of money spent by a customer 
-- >Order by the highest average and GROUP BY the correct columns 
-- ------------------------------------------- 
SELECT CONCAT(c.firstname, ' ', c.lastname) AS 'Customer Name' 
	, o.cost AS 'Cost' 
    , CASE 
		WHEN COUNT(o.cost) >= 3500 THEN 'Very High' 
        WHEN COUNT(o.cost) >= 2000 AND COUNT(o.cost) < 3500 THEN 'High' 
        WHEN COUNT(o.cost) >= 800 AND COUNT(o.cost) < 2000 THEN 'Mid' 
        WHEN COUNT(o.cost) < 800 THEN 'Low' 
			END AS 'Customer''s $$$ Spent' 
	, CONCAT('$', ROUND(AVG(o.cost), 2)) AS 'Average' 
FROM customer c 
	LEFT JOIN os_order_customer ooc ON c.customer_id = ooc.customer_id 
    LEFT JOIN orders o ON ooc.order_id = o.order_id 
GROUP BY c.firstname, c.lastname 
ORDER BY o.cost;
-- -------------------------------------------


-- Aaron Quick
-- You are asked to create a way to see all the details for an OS before purchase based on a filter given by the customer
-- Creating a view that can be called upon to see the min reqs, the os version, and costs
 
CREATE OR REPLACE VIEW os_details AS
SELECT
	os.os_name AS os_name,
    os.version AS os_version,
    os.cost AS os_cost,
    mr.ram_size AS min_ram,
    ms.storage_size AS min_storage,
    mc.speed AS min_cpu_speed,
    mg.vram_min AS min_gpu_vram
FROM operating_system os
INNER JOIN required_specs rs ON os.required_specs_id = rs.required_specs_id
INNER JOIN min_ram mr ON rs.min_ram_id = mr.min_ram_id
INNER JOIN min_storage ms ON rs.min_storage_id = ms.min_storage_id
INNER JOIN min_cpu mc ON rs.min_cpu_id = mc.min_cpu_id
INNER JOIN min_gpu mg ON rs.min_gpu_id = mg.min_gpu_id;
 
SELECT *
FROM os_details
WHERE min_gpu_vram >= 1000 AND min_storage >= 30