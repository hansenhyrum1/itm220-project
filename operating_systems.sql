-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema operating_system
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `operating_system` ;

-- -----------------------------------------------------
-- Schema operating_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `operating_system` ;
USE `operating_system` ;

-- -----------------------------------------------------
-- Table `operating_system`.`kernel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`kernel` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`kernel` (
  `kernel_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kernel_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`kernel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`architecture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`architecture` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`architecture` (
  `architecture_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `architecture_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`architecture_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`min_cpu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`min_cpu` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`min_cpu` (
  `min_cpu_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `num_cores` INT NOT NULL,
  `speed` FLOAT NOT NULL,
  `architecture_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`min_cpu_id`),
  INDEX `fk_min_cpu_1_idx` (`architecture_id` ASC) VISIBLE,
  CONSTRAINT `fk_min_cpu_1`
    FOREIGN KEY (`architecture_id`)
    REFERENCES `operating_system`.`architecture` (`architecture_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`min_ram`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`min_ram` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`min_ram` (
  `min_ram_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ram_size` INT NOT NULL,
  `ram_type` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`min_ram_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`min_storage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`min_storage` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`min_storage` (
  `min_storage_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `storage_size` INT NOT NULL,
  PRIMARY KEY (`min_storage_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`gpu_architecture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`gpu_architecture` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`gpu_architecture` (
  `gpu_architecture_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `gpu_architecture_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`gpu_architecture_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`min_gpu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`min_gpu` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`min_gpu` (
  `min_gpu_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `vram_min` INT NOT NULL,
  `gpu_architecture_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`min_gpu_id`),
  INDEX `fk_gpu_1_idx` (`gpu_architecture_id` ASC) VISIBLE,
  CONSTRAINT `fk_gpu_1`
    FOREIGN KEY (`gpu_architecture_id`)
    REFERENCES `operating_system`.`gpu_architecture` (`gpu_architecture_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`required_specs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`required_specs` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`required_specs` (
  `required_specs_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `min_cpu_id` INT UNSIGNED NOT NULL,
  `min_ram_id` INT UNSIGNED NOT NULL,
  `min_storage_id` INT UNSIGNED NOT NULL,
  `min_gpu_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`required_specs_id`),
  INDEX `fk_required_specs_1_idx` (`min_cpu_id` ASC) VISIBLE,
  INDEX `fk_required_specs_2_idx` (`min_ram_id` ASC) VISIBLE,
  INDEX `fk_required_specs_3_idx` (`min_storage_id` ASC) VISIBLE,
  INDEX `fk_required_specs_4_idx` (`min_gpu_id` ASC) VISIBLE,
  CONSTRAINT `fk_required_specs_1`
    FOREIGN KEY (`min_cpu_id`)
    REFERENCES `operating_system`.`min_cpu` (`min_cpu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_required_specs_2`
    FOREIGN KEY (`min_ram_id`)
    REFERENCES `operating_system`.`min_ram` (`min_ram_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_required_specs_3`
    FOREIGN KEY (`min_storage_id`)
    REFERENCES `operating_system`.`min_storage` (`min_storage_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_required_specs_4`
    FOREIGN KEY (`min_gpu_id`)
    REFERENCES `operating_system`.`min_gpu` (`min_gpu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`company` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`company` (
  `company_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`operating_system`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`operating_system` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`operating_system` (
  `os_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `os_name` VARCHAR(45) NOT NULL,
  `release_date` DATE NOT NULL,
  `version` DATE NOT NULL,
  `cost` FLOAT NOT NULL,
  `required_specs_id` INT UNSIGNED NOT NULL,
  `kernel_id` INT UNSIGNED NOT NULL,
  `company_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`os_id`),
  INDEX `fk_operating_system_1_idx` (`kernel_id` ASC) VISIBLE,
  INDEX `fk_operating_system_2_idx` (`required_specs_id` ASC) VISIBLE,
  INDEX `fk_operating_system_3_idx` (`company_id` ASC) VISIBLE,
  CONSTRAINT `fk_operating_system_1`
    FOREIGN KEY (`kernel_id`)
    REFERENCES `operating_system`.`kernel` (`kernel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operating_system_2`
    FOREIGN KEY (`required_specs_id`)
    REFERENCES `operating_system`.`required_specs` (`required_specs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operating_system_3`
    FOREIGN KEY (`company_id`)
    REFERENCES `operating_system`.`company` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`zip_code`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`zip_code` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`zip_code` (
  `zip_code_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `zip_code` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`zip_code_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`address` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`address` (
  `address_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`credit_card`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`credit_card` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`credit_card` (
  `credit_card_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `card_number` VARCHAR(16) NOT NULL,
  `card_name` VARCHAR(45) NOT NULL,
  `card_type` VARCHAR(45) NOT NULL,
  `csv` VARCHAR(4) NOT NULL,
  `expiration_date` DATE NOT NULL,
  `zip_code_id` INT UNSIGNED NOT NULL,
  `address_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`credit_card_id`),
  INDEX `fk_credit_card_1_idx` (`zip_code_id` ASC) VISIBLE,
  INDEX `fk_credit_card_2_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_credit_card_1`
    FOREIGN KEY (`zip_code_id`)
    REFERENCES `operating_system`.`zip_code` (`zip_code_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_credit_card_2`
    FOREIGN KEY (`address_id`)
    REFERENCES `operating_system`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`customer` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`customer` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `credit_card_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customer_1_idx` (`credit_card_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_1`
    FOREIGN KEY (`credit_card_id`)
    REFERENCES `operating_system`.`credit_card` (`credit_card_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`order` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`order` (
  `order_id` INT UNSIGNED NOT NULL,
  `cost` FLOAT UNSIGNED NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`order_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `operating_system`.`os_order_customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `operating_system`.`os_order_customer` ;

CREATE TABLE IF NOT EXISTS `operating_system`.`os_order_customer` (
  `os_order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `os_id` INT UNSIGNED NOT NULL,
  `order_id` INT UNSIGNED NOT NULL,
  `customer_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`os_order_id`),
  INDEX `fk_os_order_customer_1_idx` (`os_id` ASC) VISIBLE,
  INDEX `fk_os_order_customer_3_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_os_order_customer_2_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_os_order_customer_1`
    FOREIGN KEY (`os_id`)
    REFERENCES `operating_system`.`operating_system` (`os_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_os_order_customer_3`
    FOREIGN KEY (`customer_id`)
    REFERENCES `operating_system`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_os_order_customer_2`
    FOREIGN KEY (`order_id`)
    REFERENCES `operating_system`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
