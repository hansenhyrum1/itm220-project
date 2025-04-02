USE operating_system;

-- Hyrum Hansen

-- You have been asked to create a query from the database that shows a layout of the data from several tables into one 
-- to show the total sales of operating systems. You have been given a view to work with by the database administrator. 
-- You decided to use a CTE because you want to make your data avialable to be used by others in the future.

CREATE OR REPLACE VIEW all_info AS
	SELECT os.os_id 
		, os.os_name
        , os.cost
        , co.company_name
        , CONCAT(c.first_name, " ", c.last_name) AS "name"
	FROM operating_system os
		JOIN company co ON os.company_id = co.company_id
        JOIN os_order_customer ooc ON os.os_id = ooc.os_id
        JOIN customer c ON ooc.customer_id = c.customer_id;

WITH order_details AS (
	SELECT a.os_id
		, a.os_name
        , a.company_name
        , COUNT(o.order_id) AS "order_count"
        , SUM(o.cost) AS "total_cost"
	FROM all_info a
		JOIN os_order_customer ooc ON a.os_id = ooc.os_id
        JOIN orders o ON ooc.order_id = o.order_id
	WHERE o.order_date > "2023-01-01"
    GROUP BY a.os_id, a.os_name, a.company_name
)

SELECT 
    os_name AS "Operating System",
    company_name AS "Company",
    order_count AS "Total Orders",
    ROUND(total_cost, 2) AS "Total Cost"
FROM order_details
ORDER BY total_cost DESC;


-- Tam Tran

-- Analyze customer spending on different operating systems.
-- Retrieves customer details along with the total amount they have spent on operating systems.
-- Categorizes customers based on their total spending:
-- "High Spender" (spent more than $1000)
-- "Medium Spender" (spent between $500 and $1000)
-- "Low Spender" (spent less than $500)
-- Uses CTEs and CASE statements to categorize spending.
-- Sorts the results by total spending in descending order.
USE operating_system;
WITH customer_spending AS (
SELECT
c.customer_id,
CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
SUM(o.cost) AS total_spent
FROM operating_system.customer c
JOIN operating_system.os_order_customer ooc ON c.customer_id = ooc.customer_id
JOIN operating_system.orders o ON ooc.order_id = o.order_id
GROUP BY c.customer_id, customer_name
)
SELECT
customer_name AS "Customer Name",
ROUND(total_spent, 2) AS "Total Spent ($)",
CASE
WHEN total_spent > 1000 THEN 'High Spender'
WHEN total_spent BETWEEN 500 AND 1000 THEN 'Medium Spender'
ELSE 'Low Spender'
END AS "Spending Category"
FROM customer_spending
ORDER BY total_spent DESC;



-- Andrew Benge
-- -------------------------------------------
-- Show each operating system, the number of downloads, and the total amount spent.
-- Also include if the OS is Popular, with 5+ purchases, Average, with between 3 and 5, or unpopular with less than 3
-- IF the Operating system has not been purchased, mark it as 'no purchases'
-- -------------------------------------------
 
SELECT  os.os_name AS 'Operate System'
,		COUNT(ooc.order_id) AS 'Number of Downloads'
,		SUM(o.cost) AS 'Total Revenue'
,		CASE
			WHEN COUNT(ooc.order_id) >= 5 THEN 'Popular'
            WHEN COUNT(ooc.order_id) BETWEEN 3 AND 5 THEN 'Average'
            WHEN COUNT(ooc.order_id) < 3 THEN 'Unpopular'
            WHEN COUNT(ooc.order_id) IS NULL THEN 'No purchases'
		END AS 'Popularity'
FROM operating_system os
LEFT JOIN os_order_customer ooc
ON os.os_id = ooc.os_id
INNER JOIN orders o
on ooc.order_id = o.order_id
GROUP BY os.os_name
ORDER BY COUNT(ooc.order_id);
 
-- Obviously, we should have had more than one purchase per.... but it works!