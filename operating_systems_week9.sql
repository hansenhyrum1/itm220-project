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