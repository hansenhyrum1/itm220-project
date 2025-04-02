USE operating_system;

-- Hyrum Hansen
-- You have been asked by your boss to make a list of all the operating systems in your database and include information
--  about the  operating system, the most recent customer, order, and how many times that operating system has been ordered.

SELECT os.os_name AS "OS Name",
    os.version AS "OS Version",
    os.cost AS "OS Cost",
    c.company_name AS "Company Name",
    CONCAT(cust.first_name, " ", cust.last_name) AS "Recent Customer",
    ord.order_date AS "Recent Order Date",
    ord.cost AS "Recent Order Cost",
    COUNT(ord.order_id) AS "Number of Orders"
FROM operating_system os
	LEFT JOIN os_order_customer ooc ON os.os_id = ooc.os_id
    LEFT JOIN orders ord ON ooc.order_id = ord.order_id
    LEFT JOIN customer cust ON ooc.customer_id = cust.customer_id
	LEFT JOIN company c ON os.company_id = c.company_id
GROUP BY os.os_id, os.os_name, os.version, os.cost, c.company_name, cust.first_name, cust.last_name, ord.order_date, ord.cost
ORDER BY ord.cost DESC;


-- Cashton Bone

-- ------------------------------------------- 
-- >List the customer's that have spent the most amount of money. 
-- >Use LEFT JOINS to join the tables -- ------------------------------------------- 
SELECT CONCAT(c.first_name, ' ', c.last_name) AS 'Customer Name' 
, o.cost AS 'Cost' , 
CASE 
WHEN COUNT(o.cost) >= 3500 THEN 'Very High' 
WHEN COUNT(o.cost) >= 2000 AND COUNT(o.cost) < 3500 THEN 'High' 
WHEN COUNT(o.cost) >= 800 AND COUNT(o.cost) < 2000 THEN 'Average' 
WHEN COUNT(o.cost) < 800 THEN 'Low' 
END AS 'Customer''s Spent Average' 
FROM customer c 
LEFT JOIN os_order_customer ooc 
ON c.customer_id = ooc.customer_id 
LEFT JOIN orders o 
ON ooc.order_id = o.order_id 
ORDER BY o.cost;
-- -------------------------------------------


-- Andrew Benge

-- ------------------------------------------------
-- Find any null values in the requirements or specs of all operating systems that need to be filled
-- in. Organize them by table, as either 'complete' or 'data missing'
-- GPU and CPU should also contain the architecture
-- Columns should be as follows:
-- | Operating System | GPU | CPU | Kernel | Company | RAM | Storage |
-- ------------------------------------------------
SELECT os.os_name
, CASE
WHEN (ga.gpu_architecture_id IS NULL OR g.min_gpu_id IS NULL) THEN 'Data Missing'
ELSE 'Complete'
END AS 'GPU'
, CASE
WHEN (a.architecture_id IS NULL OR c.min_cpu_id IS NULL) THEN 'Data Missing'
ELSE 'Complete'
END AS 'CPU'
, CASE
WHEN k.kernel_id IS NULL THEN 'Data Missing'
ELSE 'Complete'
END AS 'Kernel'
, CASE
WHEN co.company_id IS NULL THEN 'Data Missing'
ELSE 'Complete'
END AS 'Company'
, CASE
WHEN r.min_ram_id IS NULL THEN 'Data Missing'
ELSE 'Complete'
END AS 'RAM'
, CASE
WHEN s.min_storage_id IS NULL THEN 'Data Missing'
ELSE 'Complete'
END AS 'Storage'
FROM operating_system os
LEFT JOIN required_specs rs
ON os.required_specs_id = rs.required_specs_id
LEFT JOIN min_cpu c
ON rs.min_cpu_id = c.min_cpu_id
LEFT JOIN architecture a
ON c.architecture_id = a.architecture_id
LEFT JOIN min_gpu g
ON rs.min_gpu_id = g.min_gpu_id
LEFT JOIN gpu_architecture ga
ON g.gpu_architecture_id = ga.gpu_architecture_id
LEFT JOIN kernel k
ON os.kernel_id = k.kernel_id
LEFT JOIN company co
ON os.company_id = co.company_id
LEFT JOIN min_ram r
ON rs.min_ram_id = r.min_ram_id
LEFT JOIN min_storage s
ON rs.min_storage_id = s.min_storage_id
ORDER BY os.os_name;


-- Zach Pinney

-- Find customers who live in California and Texas and have spent $70 or more on a purchase
-- List the operating system and the amount of the purchase as well
-- Columns should look like this:
-- Customer | Operating System | Payment Amount | State |
SELECT CONCAT(c.first_name, ' ', c.last_name) AS 'Customer'
, os_name AS 'Operating System'
, CONCAT ('$', o.cost) AS 'Payment Amount'
, CASE
WHEN a.address LIKE '%California%' THEN 'California'
WHEN a.address LIKE '%Texas%' THEN 'Texas'
END AS 'State'
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
WHERE (a.address LIKE '%Texas%' OR a.address LIKE '%California%')
AND o.cost >= 70;


-- Aaron Quick

-- A customer wants to check which of the operating systems he CAN'T use, so he asked you to create a code to select which ones to avoid based on his restrictions --
 
SELECT os.os_id, os.os_name, os.version, mr.ram_size, ms.storage_size
FROM operating_system os
LEFT JOIN required_specs rs ON os.required_specs_id = rs.required_specs_id
LEFT JOIN min_ram mr ON rs.min_ram_id = mr.min_ram_id
LEFT JOIN min_storage ms ON rs.min_storage_id = ms.min_storage_id
WHERE mr.ram_size >= 4
AND ms.storage_size >= 32;


-- Tam Tran

-- Which customers have purchased 'Windows 11 Pro' with an order cost greater than $10? Show their name, the operating system they purchased, the cost of their order, its cost category (Low, Medium, or High), and the total number of their orders. 
-- Sort the results by order cost in descending order
USE operating_system;
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    os.os_name AS operating_system,
    o.cost AS order_cost,
    CASE 
        WHEN o.cost < 10 THEN 'Low'
        WHEN o.cost BETWEEN 10 AND 100 THEN 'Medium'
        ELSE 'High'
    END AS cost_category,
    COUNT(ooc.order_id) AS total_orders
FROM operating_system.os_order_customer ooc
LEFT JOIN operating_system.customer c ON ooc.customer_id = c.customer_id
LEFT JOIN operating_system.orders o ON ooc.order_id = o.order_id
LEFT JOIN operating_system.operating_system os ON ooc.os_id = os.os_id
WHERE o.cost IS NOT NULL 
    AND os.os_name = 'Windows 11 Pro'  
    AND o.cost > 10  
GROUP BY customer_name, operating_system, order_cost
ORDER BY o.cost DESC;  