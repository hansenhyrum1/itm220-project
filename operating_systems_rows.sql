SET AUTOCOMMIT=0;

-- 1. kernel ------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT kernel1;

INSERT INTO kernel
(kernel_name)
VALUES
('Linux Kernel'),
('Windows NT Kernel'),
('Windows 9x Kernel'),
('Solaris Kernel'),
('XNU (Darwin Kernel)'),
('Zircon');

COMMIT;


-- -------------------------------------------
-- THIS IS FOR THE ARCHITECTURE TABLE.
-- https://www.windriver.com/solutions/learning/leading-processor-architectures
-- SEE LINK FOR DETAIL ON THE TYPES
-- -------------------------------------------

-- 2. architecture ------------------------------------------------------------
START TRANSACTION;

SAVEPOINT architecture1;

INSERT INTO architecture
(architecture_type)
VALUES
('x86'),
('ARM');

COMMIT;

-- 3. min_ram----------------------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT min_ram1;

INSERT INTO min_ram
(ram_size, ram_type)
VALUES
(4, 'DDR4'), -- Win11
(2, 'DDR3'), -- Win10 & Ubuntu
(4, 'LPDDR4/DDR4'), -- Macs
(2, 'LPDDR3/DDR3'); -- ChromeOS

COMMIT;

-- 4. min_storage ------------------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT min_storage1;

INSERT INTO min_storage
(storage_size)
VALUES
(64), -- Windows 11 Pro
(16), -- ChromeOS
(20), -- Windows 10 Pro
(25); -- Ubuntu & MACs

COMMIT;	

-- 5. gpu_architecture-------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT gpu_architecture1;

INSERT INTO gpu_architecture
(gpu_architecture_type)
VALUES
('DirectX 12'), -- Windows 11 Pro
('DirectX 9'), -- Windows 10 Pro
('Apple M2'), -- Apple
('3D acceleration-capable GPU'), -- Ubuntu
('2010 or Newer'); -- ChromeOS

COMMIT;

-- 6. zip code ------------------------------------------------------
START TRANSACTION;

SAVEPOINT zip_code1;

INSERT INTO zip_code 
(zip_code)
VALUES
('12345'), 
('67890'), 
('54321'), 
('98765'), 
('11111'),
('13579');

COMMIT;

-- 7. address --------------------------------------------------------------
START TRANSACTION;

SAVEPOINT address1;

INSERT INTO address
(address)
VALUES
('1437 Galaxy Way, Salt Lake City, Utah, 12345'),
('1556 Filmore Avenue, Provo, Utah, 67890'),
('951 Clark Street, Dallas, Texas, 54321'),
('24 Cedar Street, Chicago, Illinois, 98765'),
('1776 Independence Lane, Philadelphia, Pennslyvania, 11111'),
('1993 Cherry Lane, Raleigh, North Carolina, 13579');

COMMIT;

-- 8. order ------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT order1;

INSERT INTO orders 
(cost, order_date)
VALUES
(25.5, "2023-04-12"),
(30, "2023-04-20"),
(40, "2023-04-24"),
(50, "2024-05-10"),
(10, "2024-05-14"),
(14.5, "2024-08-12");

COMMIT;

-- 9. company -----------------------------------------------------------------
START TRANSACTION;

SAVEPOINT company1;

INSERT INTO company
(company_name)
VALUES
("Microsoft"),
("Apple"),
("Canonical"),
("Google");

COMMIT;

-- 10. min_cpu --------------------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT min_cpu1;

INSERT INTO min_cpu
(num_cores, speed, architecture_id)
VALUES
(2, "1", (SELECT architecture_id FROM architecture WHERE architecture_type = 'X86')), -- Windows 11 Pro
(1, "1", (SELECT architecture_id FROM architecture WHERE architecture_type = 'x86')), -- Windows 10 Pro
(8, "3.2", (SELECT architecture_id FROM architecture WHERE architecture_type = 'ARM')), -- Macs
(2, "2", (SELECT architecture_id FROM architecture WHERE architecture_type = 'x86')), -- Ubuntu
(2, "1.1", (SELECT architecture_id FROM architecture WHERE architecture_type = 'x86')); -- ChromeOS

COMMIT;

-- 11. min_gpu -------------------------------------------------------------
START TRANSACTION;

SAVEPOINT gpu1;

INSERT INTO min_gpu
(vram_min, gpu_architecture_id)
VALUES
(1024, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'DirectX 12')), -- Win11
(1024, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'DirectX 9')), -- Win10
(2048, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'Apple M2')), -- Mac Sonoma and Ventura
(256, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = '3D acceleration-capable GPU')), -- Ubuntu
(128, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = '2010 or Newer')); -- ChromeOS
 
COMMIT;

-- 12. credit_card ---------------------------------------------------------
START TRANSACTION;

SAVEPOINT credit_card1;

INSERT INTO credit_card 
(card_number, card_name, card_type, csv, expiration_date, zip_code_id, address_id)
VALUES
('2378658490101234', 'Tam Tran', 'VISA', 123, '2026-12-31', (SELECT zip_code_id FROM zip_code WHERE zip_code = 12345), (SELECT address_id FROM address WHERE address = '1437 Galaxy Way, Salt Lake City, Utah, 12345')),
('1458854124070007', 'Andrew Benge', 'MasterCard', 456, '2027-06-30', (SELECT zip_code_id FROM zip_code WHERE zip_code = 67890), (SELECT address_id FROM address WHERE address = '1556 Filmore Avenue, Provo, Utah, 67890')), 
('1987638761776123', 'Hyrum Hansen', 'VISA', 789, '2028-09-15', (SELECT zip_code_id FROM zip_code WHERE zip_code = 54321), (SELECT address_id FROM address WHERE address = '951 Clark Street, Dallas, Texas, 54321')),
('4524031122347685', 'Cashton Bone', 'MasterCard', 101, '2029-03-25', (SELECT zip_code_id FROM zip_code WHERE zip_code = 98765), (SELECT address_id FROM address WHERE address = '24 Cedar Street, Chicago, Illinois, 98765')),
('4578443310293853', 'Zach Pinney', 'VISA', 112, '2025-11-05', (SELECT zip_code_id FROM zip_code WHERE zip_code = 11111), (SELECT address_id FROM address WHERE address = '1776 Independence Lane, Philadelphia, Pennslyvania, 11111')),
('1358269895312840', 'Aaron Quick', 'MasterCard', 244, '2027-10-31', (SELECT zip_code_id FROM zip_code WHERE zip_code = 13579), (SELECT address_id FROM address WHERE address = '1993 Cherry Lane, Raleigh, North Carolina, 13579'));

COMMIT;

-- 13. customer--------------------------------------------------------------
START TRANSACTION;

SAVEPOINT customer1;

INSERT INTO customer
(first_name, last_name, credit_card_id)
VALUES
('Tam', 'Tran', (SELECT credit_card_id FROM credit_card WHERE card_number = '2378658490101234')),
('Andrew', 'Benge',(SELECT credit_card_id FROM credit_card WHERE card_number = '1458854124070007')),
('Hyrum', 'Hansen', (SELECT credit_card_id FROM credit_card WHERE card_number = '1987638761776123')),
('Cashton', 'Bone', (SELECT credit_card_id FROM credit_card WHERE card_number = '4524031122347685')),
('Zach', 'Pinney', (SELECT credit_card_id FROM credit_card WHERE card_number = '4578443310293853')),
('Aaron', 'Quick', (SELECT credit_card_id FROM credit_card WHERE card_number = '1358269895312840'));

COMMIT;

-- 14. required_specs -------------------------------------------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT required_specs1;

INSERT INTO required_specs
(min_cpu_id, min_ram_id, min_storage_id, min_gpu_id)
VALUES
-- Windows 11 Pro (Requires 2 Cores, 4GB DDR4, 64GB Storage, DirectX 12 GPU)
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 2 AND speed = "1" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'x86')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 4 AND ram_type = 'DDR4'),
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 64),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 1024 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'DirectX 12'))),

-- Windows 10 Pro (Requires 1 Core, 2GB DDR3, 20GB Storage, DirectX 9 GPU)
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 1 AND speed = "1" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'x86')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 2 AND ram_type = 'DDR3'),
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 20),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 1024 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'DirectX 9'))),

-- macOS Sonoma (Requires 8 Cores, 4GB LPDDR4, 25GB Storage, Apple M2 GPU)
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 8 AND speed = "3.2" AND architecture_id = (SELECT architecture_id FROM architecture 
WHERE architecture_type = 'ARM')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 4 AND ram_type = 'LPDDR4/DDR4'),
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 25),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 2048 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'Apple M2'))),

-- Ubuntu (Requires 2 Cores, 2GB DDR3, 25GB Storage, 3D Acceleration GPU)
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 2 AND speed = "2" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'x86')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 2 AND ram_type = 'DDR3'),
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 25),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 256 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = '3D acceleration-capable GPU'))),

-- ChromeOS (Requires 2 Cores, 2GB LPDDR3, 16GB Storage, OpenGL 3.0 GPU)
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 2 AND speed = "1.1" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'x86')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 2 AND ram_type = 'LPDDR3/DDR3'),
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 16),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 128 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = '2010 or Newer')));

COMMIT;

-- 15. operating_system ----------------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT operating_system1;

INSERT INTO operating_system
(os_name, release_date, version, cost, required_specs_id, kernel_id, company_id)
VALUES
("Windows 11 Pro", "2021-10-5", "24H2", "199.99", 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 2 AND speed = "1" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "x86")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 4 AND ram_type = "DDR4")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 64)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 1024) AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "DirectX 12")),
	(SELECT kernel_id FROM kernel WHERE kernel = "Windows NT Kernel"), 
	(SELECT company_id FROM company WHERE company_name = "Microsoft")),
("Windows 10 Pro", "2015-7-29", "22H2", "99.99", 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 1 AND speed = "1" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "x86")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 2 AND ram_type = "DDR3")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 20)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 1024) AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "DirectX 9")), 
	(SELECT kernel_id FROM kernel WHERE kernel = "Windows NT Kernel"), 
	(SELECT company_id FROM company WHERE company_name = "Microsoft")),
("macOS Sonoma", "2023-9-26", "14.7.4", "0", 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 8 AND speed = "3.2" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "ARM64")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 4 AND ram_type = "LPDDR4/DDR4")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 25)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 2048) AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "Apple M2")), 
    (SELECT kernel_id FROM kernel WHERE kernel = "XNU (Darwin Kernel)"), 
    (SELECT company_id FROM company WHERE company_name = "Apple")),
("macOS Ventura", "2022-10-24", "13.6.7", "0", 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 8 AND speed = "3.2" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = 'ARM64'))
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 4 AND ram_type = "LPDDR4/DDR4")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 25)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 2048) AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "Apple M2")), 
    (SELECT kernel_id FROM kernel WHERE kernel = "XNU (Darwin Kernel)"), 
    (SELECT company_id FROM company WHERE company_name = "Apple")),
("Ubuntu", "2004-10-20", "24.10", "0", 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 2 AND speed = "2" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "x86")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 2 AND ram_type = "DDR3")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 25)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 256) AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "3D acceleration-capable GPU")),
    (SELECT kernel_id FROM kernel WHERE kernel = "Linux Kernel"),
    (SELECT company_id FROM company WHERE company_name = "Canonical")),
("ChromeOS", "2011-6-11", "132.0", "0", 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 2 AND speed = "1.1" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "x86")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 2 AND ram_type = "LPDDR3/DDR3")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 16)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 128) AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "2010 or Newer")),
    (SELECT kernel_id FROM kernel WHERE kernel = "Linux Kernel"), 
    (SELECT company_id FROM company WHERE company_name = "Google"));

COMMIT;

-- 16. os_order_customer ------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT os_order_customer1;

INSERT INTO os_order_customer
(os_id, order_id, customer_id)
VALUES
((SELECT os_id FROM operating_system WHERE os_name = 'Windows 11 Pro'), 
(SELECT order_id FROM orders WHERE cost = '25.5'), 
(SELECT customer_id FROM customer WHERE first_name = 'Tam')),

((SELECT os_id FROM operating_system WHERE os_name = 'Ubuntu'),
(SELECT order_id FROM orders WHERE cost = '30'),
(SELECT customer_id FROM customer WHERE first_name = 'Andrew')),

((SELECT os_id FROM operating_system WHERE os_name = 'macOS Ventura'),
(SELECT order_id FROM orders WHERE cost = '40'),
(SELECT customer_id FROM customer WHERE first_name = 'Hyrum')),

((SELECT os_id FROM operating_system WHERE os_name = 'Window 10 Pro'),
(SELECT order_id FROM orders WHERE cost = '50'),
(SELECT customer_id FROM customer WHERE first_name = 'Cashton')),

((SELECT os_id FROM operating_system WHERE os_name = 'macOS Soroma'),
(SELECT order_id FROM orders WHERE cost = '10'),
(SELECT customer_id FROM customer WHERE first_name = 'Zach')),

((SELECT os_id FROM operating_system WHERE os_name = 'ChromeOS'),
(SELECT order_id FROM orders WHERE cost = '14.5'),
(SELECT customer_id FROM customer WHERE first_name = 'Aaron'));

COMMIT;

