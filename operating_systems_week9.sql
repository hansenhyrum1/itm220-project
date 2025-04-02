USE operating_system;

-- Hyrum Hansen

-- A customer comes into the store wondering about their recent purchase of a used computer. After the purchase he learned
-- that his company was no longer allowing "Legacy" operating systems and needs to determine if his computer software is
-- considered legacy. 
SET @customer_first_name := "Hyrum";

SELECT 
	CONCAT(c.first_name, " ", c.last_name) AS "Customer Name"
    , os.os_name AS "Operating System"
    , CASE
		WHEN YEAR(os.release_date) > 2020 THEN "Modern"
        WHEN YEAR(os.release_date) <= 2020 THEN "Legacy"
        ELSE "Error"
        END AS "OS Classification"
	, CASE
		WHEN YEAR(os.release_date) > 2020 THEN YEAR(os.release_date)
        WHEN YEAR(os.release_date) <= 2020 THEN "Older than 2020"
        ELSE "Error"
        END AS "OS Release Year"
FROM os_order_customer osoc
	JOIN customer c ON osoc.customer_id = c.customer_id
    JOIN operating_system os ON osoc.os_id = os.os_id
WHERE c.first_name = @customer_first_name;


-- Zach Pinney

-- Show the cusomers with their order date and status. If the date is in 2023 then the customer should be listed as inactive.
-- If the date is in 2024 then list the current status of the customer as active. The table should list the active customers first.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS 'Customer Name'
, o.order_date AS 'Order Date'
, CASE
WHEN o.order_date >= '2024-01-01' THEN 'Active'
ELSE 'Inactive'
END AS 'Status'
FROM customer c
INNER JOIN os_order_customer ooc
ON c.customer_id = ooc.customer_id
INNER JOIN orders o
ON ooc.order_id = o.order_id
ORDER BY o.order_date DESC;


-- Andrew Benge

-- --------------------------------------------
-- Find how much each customer has spent, how many orders,
-- and if they've purchased two or more OS's or have spent 30 or more
-- dollars mark them as a top contributer. Rank from those who spent
-- the most to the least.
-- --------------------------------------------

SELECT CONCAT(c.first_name, ' ', c.last_name)
, SUM(o.cost) AS 'Dollars Spent'
, COUNT(o.order_id) AS 'Amount of Orders'
, CASE
WHEN (SUM(o.cost) > 30 OR COUNT(o.order_id) > 1) THEN 'Top Contributer'
ELSE 'Low Contributer'
END AS 'Contribution Status'
FROM customer c
INNER JOIN os_order_customer ooc
ON c.customer_id = ooc.customer_id
INNER JOIN orders o
ON ooc.order_id = o.order_id
GROUP BY c.customer_id
ORDER BY SUM(o.cost) DESC;


-- Aaron Quick

-- ---------------------------
-- Checking the expensiveness of each OS
-- ---------------------------

SELECT os.os_name AS 'Operating System',
 os.version AS 'OS Version',
 o.cost AS 'Cost',
 CASE
    WHEN o.cost > 20 AND o.cost < 40 THEN 'Normal Cost'
    WHEN o.cost > 40 THEN 'High Cost'
    ELSE 'Low Cost'
    END AS 'Cost Level'
FROM operating_system os
INNER JOIN os_order_customer ooc
    ON os.os_id = ooc.os_id
INNER JOIN orders o
    ON ooc.order_id = o.order_id
ORDER BY 'Cost' DESC;


-- Tam Tran

# Select Customer Orders with a Price Category

SELECT c.customer_id, c.first_name,c.last_name, os.cost,
       CASE 
           WHEN os.cost IS NULL THEN 'No Orders'
           WHEN os.cost <= 10 THEN 'Low'
           WHEN os.cost BETWEEN 10 AND 15 THEN 'Medium'
           ELSE 'High'
       END AS price_category
FROM customer c
JOIN os_order_customer ooc ON c.customer_id = ooc.customer_id
JOIN operating_system os ON os.os_id = ooc.os_id;


-- Cashton Bone
 
-- -------------------------------------------
-- >Give me all the people that have an order
-- and the rank the customers who spent the most
-- amount of money from most to last
-- >Order it by highest cost to lost cost
-- -------------------------------------------
SELECT CONCAT(c.firstname, ' ', c.lastname) AS 'Customer Name'
, o.cost AS 'Cost'
, ROW_NUMBER() OVER(ORDER BY o.cost) AS 'Customer Rank'
FROM customer c
INNER JOIN os_order_customer ooc
ON c.customer_id = ooc.customer_id
INNER JOIN orders o
ON ooc.order_id = o.order_id
ORDER BY o.cost
-- -------------------------------------------