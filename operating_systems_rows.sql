SET AUTOCOMMIT=0;

USE operating_system;

-- Andrew Benge
-- 1. kernel ------------------------------------------------------------------
START TRANSACTION;
 
SAVEPOINT kernel1;
 
INSERT INTO kernel
(kernel_name)
VALUES
('Linux Kernel'), -- If it has 'linux' in it, this is its kernel
('Windows NT Kernel'), -- If it has windows in it, its made on this kernel
('Windows 9x Kernel'), -- If its windows before 2000 but after 95, its this kernel
('Oracle Solaris Kernel'), -- Solaris is the only OS on this
('XNU (Darwin Kernel)'), -- MAC baby, MAC
('Zircon'), -- Made by google, Fuschia runs on this kernel
('TIMI'), -- IBM i Kernel
('MONTEREY'), -- IBM AIX kernel
('Unknown'); -- Red Star

COMMIT;

-- Andrew Benge
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
('x86'), -- Everything that isn't ARM, including windows and linux
('ARM'), -- Everything that is ARM (MAC, and some Linux)
('SPARC'), -- scalable processor system, used by Solaris (which can also run on x86)
('Monolithic'), -- RED STAR, RED STAR, RED STAR
('RISC-V'), -- Fedora, ubuntu, and others can run on RISC-V, but egos-2000 only runs on RISC-V
('POWER'); -- USed by IBM i.
 
COMMIT;

-- Cashton Bone
-- 3. min_ram----------------------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT min_ram1;

INSERT INTO min_ram
(ram_size, ram_type)
VALUES
(4, 'DDR4'), -- Win11
(2, 'DDR3'), -- Win10 & Ubuntu & Linux
(4, 'LPDDR4/DDR4'), -- Macs
(2, 'LPDDR3/DDR3'), -- ChromeOS
(1, 'DDR3'), -- Microsoft Windows Server 2022 Standard Version: 23H2
(6, 'LPDDR4X'), -- Fuschia F23
(1, 'ECC'), -- IBM i7.5
(2, 'DDR4 ECC'), -- IBM AIX 7.3
(4, 'LPDDR4X'), -- Android 15
(1, 'DDR'), -- Windows XP (Nothing specific for Service Pack 3)
(1, 'DDR4 ECC'), -- Oracle Solaris 11.4
(8, 'DDR3'), -- Red Star OS (Nothing specific for 4.0)
(1, 'LPDDR2'); -- Rasberry Pi

COMMIT;

-- Aaron Quick
-- 4. min_storage ------------------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT min_storage1;

INSERT INTO min_storage
(storage_size)
VALUES
(64), -- Windows 11 Pro
(16), -- ChromeOS
(20), -- Windows 10 Pro
(25), -- Ubuntu & MACs
(32), -- Microsoft Windows Server 2022 Standard Version, and Android 15 --
(0),-- Fuchsia F23 doesn't have released specs --
(8), -- IBM i 7.5 and AIX 7.3 and Raspberry Pi Bookworm
(2), -- Windows XP
(3), -- Red Star 4.0
(13); -- Oracle Solaris 11.4
-- Kali Linux requires 20 (ID 3)

COMMIT;	

-- Cashton Bone
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
('2010 or Newer'), -- ChromeOS
('No Preference/Any Type'), -- Microsoft Windows Server 2022 Standard Version: 23H2
('ARM64'), -- Fuschia F23
('NVIDIA A100'), -- IBM i7.5
('NVIDIA Volta'), -- IBM AIX 7.3
('Vulkan API'), -- Android 15
('Integrated Graphics/DirectX 8.1'), -- Windows XP (Nothing specific for Service Pack 3)
('NVIDIA/ARM'), -- Oracle Solaris 11.4
('Unknown'), -- Red Star OS (Nothing specific for 4.0)
('Broadcom Videocore IV'); -- Rasberry Pi

COMMIT;

-- Zach Pinney
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
('13579'),
('90210'),  
('10001'),  
('60601'),  
('94105'),  
('75201'),  
('33101'),  
('85001'),  
('30301'),  
('98001'),  
('19103');

COMMIT;

-- Zach Pinney
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
('1993 Cherry Lane, Raleigh, North Carolina, 13579'),
('123 Beverly Blvd, Beverly Hills, California, 90210'),
('456 7th Ave, New York, New York, 10001'),
('789 Lakeshore Dr, Chicago, Illinois, 60601'),
('987 Market St, San Francisco, California, 94105'),
('654 Elm St, Dallas, Texas, 75201'),
('321 Ocean Dr, Miami, Florida, 33101'),
('741 Desert Rd, Phoenix, Arizona, 85001'),
('852 Peachtree St, Atlanta, Georgia, 30301'),
('369 Rainier Ave, Seattle, Washington, 98001'),
('147 Liberty St, Philadelphia, Pennsylvania, 19103');

COMMIT;

-- Tam Tran
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
(14.5, "2024-08-12"),
(60, '2024-09-15'),
(35, '2024-10-01'),
(22.75, '2024-11-20'),
(100, '2024-12-05'),
(75, '2025-01-10'),
(55, '2025-02-15'),
(45, '2025-03-20'),
(80, '2025-04-05'),
(65, '2025-05-12');

COMMIT;

-- Hyrum Hansen
-- 9. company -----------------------------------------------------------------
START TRANSACTION;

SAVEPOINT company1;

INSERT INTO company
(company_name)
VALUES
("Microsoft"),
("Apple"),
("Canonical"),
("Google"),
("IBM"),
("Oracle"),
("Raspberry Pi Ltd"),
("North Korean Government"),
("Offensive Security");

COMMIT;

-- Andrew Benge
-- 10. min_cpu --------------------------------------------------------------------------------
START TRANSACTION;
 
SAVEPOINT min_cpu1;
 
INSERT INTO min_cpu
(num_cores, speed, architecture_id)
VALUES
(2, "1", (SELECT architecture_id FROM architecture WHERE architecture_type = 'x86')), -- Windows 11 Pro
(1, "1", (SELECT architecture_id FROM architecture WHERE architecture_type = 'x86')), -- Windows 10 Pro
(8, "3.2", (SELECT architecture_id FROM architecture WHERE architecture_type = 'ARM')), -- Macs
(2, "2", (SELECT architecture_id FROM architecture WHERE architecture_type = 'x86')), -- Ubuntu
(2, "1.1", (SELECT architecture_id FROM architecture WHERE architecture_type = 'x86')), -- ChromeOS
(2, "1.4", (SELECT architecture_id FROM architecture WHERE architecture_type = 'x86')), -- Microsoft Server
(6, "1.5", (SELECT architecture_id FROM architecture WHERE architecture_type = 'ARM')),-- Fuschia
(0, "0.1", (SELECT architecture_id FROM architecture WHERE architecture_type = 'POWER')), -- IBM - Note there is Power 9 and 10 required. They do not have clock speeds or specific core numbers because they are fore super computers and stacked.
(0, "0.2", (SELECT architecture_id FROM architecture WHERE architecture_type = 'POWER')),
(2, "1.2", (SELECT architecture_id FROM architecture WHERE architecture_type = 'x86')), -- Vanilla Ice Cream (Android 15) and Kali
(1, "0.2", (SELECT architecture_id FROM architecture WHERE architecture_type = 'x86')), -- Windows XP
(8, "2.8", (SELECT architecture_id FROM architecture WHERE architecture_type = 'SPARC')), -- -- Solaris
(1, "0.8", (SELECT architecture_id FROM architecture WHERE architecture_type = 'Monolithic')), -- Red Star
(4, "2", (SELECT architecture_id FROM architecture WHERE architecture_type = 'ARM')), -- Raspberry Pi
(1, "1.2", (SELECT architecture_id FROM architecture WHERE architecture_type = 'x86')); -- Kali Linux
 
COMMIT;

-- Cashton Bone
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
(128, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = '2010 or Newer')), -- ChromeOS
(1024, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'No Preference/Any Type')), -- Microsoft Windows Server 2022 Standard Version: 23H2
(0, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'ARM64')), -- Fuschia F23
(4096, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'NVIDIA A100')), -- IBM i7.5
(2048, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'NVIDIA Volta')), -- IBM AIX 7.3
(0, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'Vulkan API')), -- Android 15
(4096, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'Integrated Graphics/DirectX 8.1')), -- Windows XP (Nothing specific for Service Pack 3)
(4096, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'NVIDIA/ARM')), -- Oracle Solaris 11.4
(0, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'Unknown')), -- Red Star OS (Nothing specific for 4.0)
(16, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'Broadcom Videocore IV')), -- Rasberry Pi
(128, (SELECT gpu_architecture_id FROM gpu_architecture WHERE gpu_architecture_type = 'NVIDIA/ARM')); -- Kali Linux 2024.4
 
COMMIT;

-- Zach Pinney
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
('1358269895312840', 'Aaron Quick', 'MasterCard', 244, '2027-10-31', (SELECT zip_code_id FROM zip_code WHERE zip_code = 13579), (SELECT address_id FROM address WHERE address = '1993 Cherry Lane, Raleigh, North Carolina, 13579')),
('5123456789012345', 'John Smith', 'MASTERCARD', 321, '2027-05-15', (SELECT zip_code_id FROM zip_code WHERE zip_code = 90210), (SELECT address_id FROM address WHERE address = '123 Beverly Blvd, Beverly Hills, California, 90210')),
('4539123456789012', 'Alice J. Johnson', 'VISA', 456, '2025-11-20', (SELECT zip_code_id FROM zip_code WHERE zip_code = 10001), (SELECT address_id FROM address WHERE address = '456 7th Ave, New York, New York, 10001')),
('6011123456789012', 'Michael E. Brown', 'DISCOVER', 789, '2028-03-30', (SELECT zip_code_id FROM zip_code WHERE zip_code = 60601), (SELECT address_id FROM address WHERE address = '789 Lakeshore Dr, Chicago, Illinois, 60601')),
('371234567890123', 'Sarah Green', 'AMEX', 1234, '2026-08-14', (SELECT zip_code_id FROM zip_code WHERE zip_code = 94105), (SELECT address_id FROM address WHERE address = '987 Market St, San Francisco, California, 94105')),
('5489123456789012', 'David W. White', 'MASTERCARD', 234, '2027-09-10', (SELECT zip_code_id FROM zip_code WHERE zip_code = 75201), (SELECT address_id FROM address WHERE address = '654 Elm St, Dallas, Texas, 75201')),
('371234567890124', 'Laura A. M. Martinez', 'AMEX', 3456, '2029-01-25', (SELECT zip_code_id FROM zip_code WHERE zip_code = 33101), (SELECT address_id FROM address WHERE address = '321 Ocean Dr, Miami, Florida, 33101')),
('6011123456789013', 'Kevin H. Harris', 'DISCOVER', 654, '2025-06-30', (SELECT zip_code_id FROM zip_code WHERE zip_code = 85001), (SELECT address_id FROM address WHERE address = '741 Desert Rd, Phoenix, Arizona, 85001')),
('4539123456789013', 'Emily A. Davis', 'VISA', 987, '2026-04-05', (SELECT zip_code_id FROM zip_code WHERE zip_code = 30301), (SELECT address_id FROM address WHERE address = '852 Peachtree St, Atlanta, Georgia, 30301')),
('5123456789012346', 'Chris W. Z. Wilson', 'MASTERCARD', 543, '2028-11-12', (SELECT zip_code_id FROM zip_code WHERE zip_code = 98001), (SELECT address_id FROM address WHERE address = '369 Rainier Ave, Seattle, Washington, 98001')),
('6011123456789014', 'Rachel K. Taylor', 'DISCOVER', 321, '2027-02-28', (SELECT zip_code_id FROM zip_code WHERE zip_code = 19103), (SELECT address_id FROM address WHERE address = '147 Liberty St, Philadelphia, Pennsylvania, 19103'));

COMMIT;

-- Zach Pinney & Tam Tran
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
('Aaron', 'Quick', (SELECT credit_card_id FROM credit_card WHERE card_number = '1358269895312840')),
('Liam', 'Smith', (SELECT credit_card_id FROM credit_card WHERE card_number = '5123456789012345')),
('Emma', 'Johnson', (SELECT credit_card_id FROM credit_card WHERE card_number = '4539123456789012')),
('Olivia', 'Brown', (SELECT credit_card_id FROM credit_card WHERE card_number = '6011123456789012')),
('Noah', 'Davis', (SELECT credit_card_id FROM credit_card WHERE card_number = '371234567890123')),
('Sophia', 'Martinez', (SELECT credit_card_id FROM credit_card WHERE card_number = '5489123456789012')),
('Mason', 'Wilson', (SELECT credit_card_id FROM credit_card WHERE card_number = '371234567890124')),
('Ethan', 'Anderson', (SELECT credit_card_id FROM credit_card WHERE card_number = '6011123456789013')),
('Ava', 'Thomas', (SELECT credit_card_id FROM credit_card WHERE card_number = '4539123456789013')),
('Isabella', 'Taylor', (SELECT credit_card_id FROM credit_card WHERE card_number = '5123456789012346')),
('Rachel', 'Taylor', (SELECT credit_card_id FROM credit_card WHERE card_number = '6011123456789014'));

COMMIT;

-- Hyrum Hansen
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
		WHERE gpu_architecture_type = '2010 or Newer'))),

-- Windows Server 2022 Standard (Requires 2 Cores, 2GB LPDDR3, 16GB Storage, OpenGL 3.0 GPU)
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 2 AND speed = "1.4" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'x86')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 1 AND ram_type = 'DDR3'), 
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 32),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 1024 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'No Preference/Any Type'))),
        
-- Fushia F23 (Requires 6 Cores, 6GB LPDDR4X, 16GB Storage, ARM64)
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 6 AND speed = "1.5" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'ARM')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 6 AND ram_type = 'LPDDR4X'), 
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 0),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 0 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'ARM64'))),
        
-- IBM i 7.5 (Requires 0 Cores, 0.25GB ECC, 16GB Storage, NVIDIA A100)
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 0 AND speed = "0.1" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'POWER')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 1 AND ram_type = 'ECC'), 
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 8),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 4096 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'NVIDIA A100'))),

-- IBM AIX 7.3 (Requires 0 Cores, 0.25GB ECC, 16GB Storage, NVIDIA Volta)
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 0 AND speed = "0.2" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'POWER')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 2 AND ram_type = 'DDR4 ECC'), 
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 8),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 2048 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'NVIDIA Volta'))),
        
-- Android 15
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 2 AND speed = "1.2" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'x86')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 4 AND ram_type = 'LPDDR4X'), 
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 16),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 0 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'Vulkan API'))),
        
-- Windows XP
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 1 AND speed = "0.2" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'x86')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 1 AND ram_type = 'DDR'), 
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 2),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 4096 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'Integrated Graphics/DirectX 8.1'))),
        
-- Oracle Solaris
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 8 AND speed = "2.8" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'SPARC')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 1 AND ram_type = 'DDR4 ECC'), 
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 13),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 4096 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'NVIDIA/ARM'))),
        
-- Red Star OS
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 1 AND speed = "0.8" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'Monolithic')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 8 AND ram_type = 'DDR3'), 
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 3),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 0 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'Unknown'))),
        
-- Raspberry Pi OS
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 4 AND speed = "2" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'ARM')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 1 AND ram_type = 'LPDDR2'), 
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 8),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 16 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'Broadcom Videocore IV'))),
        
-- Kali Linux
((SELECT min_cpu_id FROM min_cpu 
	WHERE num_cores = 1 AND speed = "1.2" AND architecture_id = (SELECT architecture_id FROM architecture 
		WHERE architecture_type = 'x86')),
 (SELECT min_ram_id FROM min_ram 
	WHERE ram_size = 2 AND ram_type = 'DDR3'), 
 (SELECT min_storage_id FROM min_storage 
	WHERE storage_size = 20),
 (SELECT min_gpu_id FROM min_gpu 
	WHERE vram_min = 128 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture 
		WHERE gpu_architecture_type = 'NVIDIA/ARM')));

COMMIT;

-- Hyrum Hansen
-- 15. operating_system ----------------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT operating_system1;

INSERT INTO operating_system
(os_name, release_date, version, cost, required_specs_id, kernel_id, company_id)

VALUES
("Windows 11 Pro", "2021-10-5", "24H2", 199.99, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 2 AND speed = "1" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "x86")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 4 AND ram_type = "DDR4")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 64)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 1024 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "DirectX 12"))),
	(SELECT kernel_id FROM kernel WHERE kernel_name = "Windows NT Kernel"), 
	(SELECT company_id FROM company WHERE company_name = "Microsoft")),
    
("Windows 10 Pro", "2015-7-29", "22H2", 99.99, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 1 AND speed = "1" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "x86")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 2 AND ram_type = "DDR3")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 20)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 1024 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "DirectX 9"))), 
	(SELECT kernel_id FROM kernel WHERE kernel_name = "Windows NT Kernel"), 
	(SELECT company_id FROM company WHERE company_name = "Microsoft")),
    
("macOS Sonoma", "2023-9-26", "14.7.4", 0, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 8 AND speed = "3.2" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "ARM")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 4 AND ram_type = "LPDDR4/DDR4")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 25)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 2048 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "Apple M2"))), 
    (SELECT kernel_id FROM kernel WHERE kernel_name = "XNU (Darwin Kernel)"), 
    (SELECT company_id FROM company WHERE company_name = "Apple")),
    
("macOS Ventura", "2022-10-24", "13.6.7", 0, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 8 AND speed = "3.2" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = 'ARM'))
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 4 AND ram_type = "LPDDR4/DDR4")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 25)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 2048 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "Apple M2"))), 
    (SELECT kernel_id FROM kernel WHERE kernel_name = "XNU (Darwin Kernel)"), 
    (SELECT company_id FROM company WHERE company_name = "Apple")),
    
("Ubuntu", "2004-10-20", "24.10", 0, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 2 AND speed = "2" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "x86")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 2 AND ram_type = "DDR3")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 25)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 256 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "3D acceleration-capable GPU"))),
    (SELECT kernel_id FROM kernel WHERE kernel_name = "Linux Kernel"),
    (SELECT company_id FROM company WHERE company_name = "Canonical")),
    
("ChromeOS", "2011-6-11", "132.0", 0, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 2 AND speed = "1.1" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "x86")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 2 AND ram_type = "LPDDR3/DDR3")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 16)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 128 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "2010 or Newer"))),
    (SELECT kernel_id FROM kernel WHERE kernel_name = "Linux Kernel"), 
    (SELECT company_id FROM company WHERE company_name = "Google")),
    
("Windows Server 2022 Standard", "2021-8-18", "23H2", 1069, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 2 AND speed = "1.4" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "x86")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 1 AND ram_type = "DDR3")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 32)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 1024 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "No Preference/Any Type"))),
    (SELECT kernel_id FROM kernel WHERE kernel_name = "Windows NT Kernel"), 
    (SELECT company_id FROM company WHERE company_name = "Microsoft")),

("Fuschia F23", "2025-3-14", "In Development", 0, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 6 AND speed = "1.5" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "ARM")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 6 AND ram_type = "LPDDR4X")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 0)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 0 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "ARM64"))),
    (SELECT kernel_id FROM kernel WHERE kernel_name = "Zircon"), 
    (SELECT company_id FROM company WHERE company_name = "Google")),
    
("IBM i 7.5", "2022-5-10", "7.5", 29600, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 0 AND speed = "0.1" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "POWER")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 1 AND ram_type = "ECC")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 8)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 4096 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "NVIDIA A100"))),
    (SELECT kernel_id FROM kernel WHERE kernel_name = "TIMI"), 
    (SELECT company_id FROM company WHERE company_name = "IBM")),
    
("IBM AIX 7.3", "2021-10-10", "7.3", 50700, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 0 AND speed = "0.2" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "POWER")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 2 AND ram_type = "DDR4 ECC")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 8)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 2048 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "NVIDIA Volta"))),
    (SELECT kernel_id FROM kernel WHERE kernel_name = "MONTEREY"), 
    (SELECT company_id FROM company WHERE company_name = "IBM")),
    
("Android 15", "2024-10-15", "Vanilla Ice Cream", 0, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 2 AND speed = "1.2" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "x86")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 4 AND ram_type = "LPDDR4X")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 16)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 0 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "Vulkan API"))),
    (SELECT kernel_id FROM kernel WHERE kernel_name = "Linux Kernel"), 
    (SELECT company_id FROM company WHERE company_name = "Google")),
    
("Windows XP Pro", "2008-4-21", "Service Pack 3", 299, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 1 AND speed = "0.2" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "x86")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 1 AND ram_type = "DDR")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 2)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 4096 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "Integrated Graphics/DirectX 8.1"))),
    (SELECT kernel_id FROM kernel WHERE kernel_name = "Windows 9x Kernel"), 
    (SELECT company_id FROM company WHERE company_name = "Microsoft")),
    
("Oracle Solaris", "2018-8-28", "11.4", 0, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 8 AND speed = "2.8" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "SPARC")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 1 AND ram_type = "DDR4 ECC")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 13)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 4096 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "NVIDIA/ARM"))),
    (SELECT kernel_id FROM kernel WHERE kernel_name = "Oracle Solaris Kernel"), 
    (SELECT company_id FROM company WHERE company_name = "Oracle")),

("Red Star", "2018-1-1", "4.0", 0, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 1 AND speed = "0.8" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "Monolithic")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 8 AND ram_type = "DDR3")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 3)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 0 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "Unknown"))),
    (SELECT kernel_id FROM kernel WHERE kernel_name = "Unknown"), 
    (SELECT company_id FROM company WHERE company_name = "North Korean Government")),
    
("Raspberry Pi OS", "2023-10-1", "bookworm", 0, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 4 AND speed = "2" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "ARM")) 
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 1 AND ram_type = "LPDDR2")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 8)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 16 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "Broadcom Videocore IV"))),
    (SELECT kernel_id FROM kernel WHERE kernel_name = "Linux Kernel"), 
    (SELECT company_id FROM company WHERE company_name = "Raspberry Pi Ltd")),
    
("Kali Linux", "2024-12-1", "2024.4", 0, 
	(SELECT required_specs_id FROM required_specs 
		WHERE min_cpu_id = (SELECT min_cpu_id FROM min_cpu 
			WHERE num_cores = 1 AND speed = "1.2" AND architecture_id = (SELECT architecture_id FROM architecture 
				WHERE architecture_type = "x86")) -- all wrong
		AND min_ram_id = (SELECT min_ram_id from min_ram 
			WHERE ram_size = 2 AND ram_type = "DDR3")
		AND min_storage_id = (SELECT min_storage_id FROM min_storage
			WHERE storage_size = 20)
		AND min_gpu_id = (SELECT min_gpu_id FROM min_gpu
			WHERE vram_min = 128 AND gpu_architecture_id = (SELECT gpu_architecture_id FROM gpu_architecture
				WHERE gpu_architecture_type = "NVIDIA/ARM"))),
    (SELECT kernel_id FROM kernel WHERE kernel_name = "Linux Kernel"), 
    (SELECT company_id FROM company WHERE company_name = "Offensive Security"));


COMMIT;

-- Tam Tran
-- 16. os_order_customer ------------------------------------------------------------------
START TRANSACTION;

SAVEPOINT os_order_customer1;

INSERT INTO os_order_customer
(os_id, order_id, customer_id)
VALUES

-- ((SELECT os_id FROM operating_system WHERE os_name = 'Windows 11 Pro'), 
-- (SELECT order_id FROM orders WHERE cost = '25.5'), 
-- (SELECT customer_id FROM customer WHERE first_name = 'Tam')),

-- ((SELECT os_id FROM operating_system WHERE os_name = 'Ubuntu'),
-- (SELECT order_id FROM orders WHERE cost = '30'),
-- (SELECT customer_id FROM customer WHERE first_name = 'Andrew')),

-- ((SELECT os_id FROM operating_system WHERE os_name = 'macOS Ventura'),
-- (SELECT order_id FROM orders WHERE cost = '40'),
-- (SELECT customer_id FROM customer WHERE first_name = 'Hyrum')),

-- ((SELECT os_id FROM operating_system WHERE os_name = 'Windows 10 Pro'),
-- (SELECT order_id FROM orders WHERE cost = '50'),
-- (SELECT customer_id FROM customer WHERE first_name = 'Cashton')),

-- ((SELECT os_id FROM operating_system WHERE os_name = 'macOS Sonoma'),
-- (SELECT order_id FROM orders WHERE cost = '10'),
-- (SELECT customer_id FROM customer WHERE first_name = 'Zach')),

-- ((SELECT os_id FROM operating_system WHERE os_name = 'ChromeOS'),
-- (SELECT order_id FROM orders WHERE cost = '14.5'),
-- (SELECT customer_id FROM customer WHERE first_name = 'Aaron'));

-- the screw ups begin


((SELECT os_id FROM operating_system WHERE os_name = 'Windows 11 Pro'),
(SELECT order_id FROM orders WHERE cost = 25.5),
(SELECT customer_id FROM customer WHERE first_name = 'Tam')),

((SELECT os_id FROM operating_system WHERE os_name = 'ChromeOS'),
(SELECT order_id FROM orders WHERE cost = 30),
(SELECT customer_id FROM customer WHERE first_name = 'Andrew')),

((SELECT os_id FROM operating_system WHERE os_name = 'Windows 10 Pro'),
(SELECT order_id FROM orders WHERE cost = 40),
(SELECT customer_id FROM customer WHERE first_name = 'Hyrum')),

((SELECT os_id FROM operating_system WHERE os_name = 'Ubuntu'),
(SELECT order_id FROM orders WHERE cost = 50),
(SELECT customer_id FROM customer WHERE first_name = 'Cashton')),

((SELECT os_id FROM operating_system WHERE os_name = 'Windows Server 2022 Standard'),
(SELECT order_id FROM orders WHERE cost = 10),
(SELECT customer_id FROM customer WHERE first_name = 'Zach')),

((SELECT os_id FROM operating_system WHERE os_name = 'Fuschia F23'),
(SELECT order_id FROM orders WHERE cost = 14.5),
(SELECT customer_id FROM customer WHERE first_name = 'Aaron')),

((SELECT os_id FROM operating_system WHERE os_name = 'IBM i 7.5'),
(SELECT order_id FROM orders WHERE cost = 60),
(SELECT customer_id FROM customer WHERE first_name = 'Liam')),

((SELECT os_id FROM operating_system WHERE os_name = 'Windows XP Pro'),
(SELECT order_id FROM orders WHERE cost = 35),
(SELECT customer_id FROM customer WHERE first_name = 'Emma')),

((SELECT os_id FROM operating_system WHERE os_name = 'Red Star'),
(SELECT order_id FROM orders WHERE cost = 22.75),
(SELECT customer_id FROM customer WHERE first_name = 'Olivia')),

((SELECT os_id FROM operating_system WHERE os_name = 'Oracle Solaris'),
(SELECT order_id FROM orders WHERE cost = 100),
(SELECT customer_id FROM customer WHERE first_name = 'Noah')),

((SELECT os_id FROM operating_system WHERE os_name = 'Raspberry Pi OS'),
(SELECT order_id FROM orders WHERE cost = 75),
(SELECT customer_id FROM customer WHERE first_name = 'Sophia')),

((SELECT os_id FROM operating_system WHERE os_name = 'Kali Linux'),
(SELECT order_id FROM orders WHERE cost = 55),
(SELECT customer_id FROM customer WHERE first_name = 'Mason'));

COMMIT;

