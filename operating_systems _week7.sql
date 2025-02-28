-- Operating Systems Group Project -- Week 7

USE operating_system;

-- Hyrum Hansen

-- John has a old CPU lying around, and he wants to build a computer with it. His CPU only has two cores, but is capable of a speed of 1.6 GHZ
-- and an architecture of x86. John wants to know what operating system he can run before he buys the computer parts. List a set of operating
-- list the compatible Operating systems sorted by price 

SELECT os.os_name, os.cost, mc.num_cores AS "CPU Cores", mc.speed AS "CPU Speed", a.architecture_type
FROM operating_system os 
	JOIN required_specs rs ON os.required_specs_id = rs.required_specs_id
    JOIN min_cpu mc ON rs.min_cpu_id = mc.min_cpu_id
    JOIN architecture a ON mc.architecture_id = a.architecture_id
WHERE mc.num_cores <= 2 AND CAST(mc.speed AS SIGNED) <= 1.6 AND a.architecture_type LIKE "x86"
ORDER BY os.cost;


-- Andrew Benge

-- -------------------------------------------------------
-- Find all of our operating systems currently from price low to high
-- with their kernel, exluding anything not linux, mac, or windows.
-- -------------------------------------------------------

SELECT  os.os_name
,        k.kernel_name
FROM operating_system os
INNER JOIN kernel k
ON os.kernel_id = k.kernel_id
WHERE kernel_name IN ('XNU (Darwin Kernel)', 'Windows 9x Kernel', 'Windows NT Kernel', 'Linux Kernel')
ORDER BY os.cost ASC;


-- Cashton Bone

-- -------------------------------
-- What is the highest VRAM for the GPU Architectures?
-- Sort it by highest minimum VRAM to lowest minimum VRAM.
-- -------------------------------

USE operating_system;

SELECT g.gpu_architecture AS 'GPU'
, g.vram_min AS 'VRAM'
FROM gpu g
ORDER BY g.vram_min;


-- Tam Tran

-- Select all the customers and then order the last name alphebettically, in which card type is visa
-- --------------------------------------------------------------------------
USE operating_system;
SELECT c.first_name, c.last_name, cc.card_type FROM customer c
JOIN credit_card cc ON c.credit_card_id = cc.credit_card_id
WHERE cc.card_type = "MasterCard"
ORDER BY last_name ASC;


-- Aaron Quick

-- Checking the requirements for each of the OS.--
USE operating_system;
SELECT os_name, m.min_storage
FROM operating_system os
INNER JOIN required_specs rs
	ON os.required_specs_id = rs.required_specs_id
INNER JOIN min_storage m
	ON rs.min_storage_id = m.min_storage_id
ORDER BY min_storage;


-- Zach Pinney

-- What are the operating systems that were released before 2015?

SELECT os_name
, release_date
FROM operating_system
WHERE release_date < '2015-01-01';