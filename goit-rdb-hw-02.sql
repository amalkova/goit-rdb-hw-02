-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`teachers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `teacherscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `studentsd` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `teacher_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_student_teacher_idx` (`teacher_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_teacher`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `mydb`.`teachers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_book`
    FOREIGN KEY (`id`)
    REFERENCES `mydb`.`books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client_2` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(45) NOT NULL,
  `customer_adress` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE INDEX `id_UNIQUE` (`client_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_2` (
  `order_id` INT NOT NULL DEFAULT 100,
  `client_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`, `client_id`),
  UNIQUE INDEX `id_UNIQUE` (`order_id` ASC) VISIBLE,
  INDEX `client_id_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`client_2` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product_3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product_3` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `id_UNIQUE` (`product_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `building_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_1` (
  `client_name` VARCHAR(45) NOT NULL,
  `client_adress` VARCHAR(45) NOT NULL,
  `order_date` DATETIME NOT NULL,
  `client_id` INT NOT NULL,
  `order_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`odrer_item_1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`odrer_item_1` (
  `order_id` INT NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `fk_order_id_1NF`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`order_1` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_item_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_item_2` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `quatity` INT UNSIGNED NOT NULL,
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `fk_order_id_2NF`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`order_2` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_3` (
  `order_id` INT NOT NULL DEFAULT 100,
  `client_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`, `client_id`),
  UNIQUE INDEX `id_UNIQUE` (`order_id` ASC) VISIBLE,
  UNIQUE INDEX `client_id_UNIQUE` (`client_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_item_3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_item_3` (
  `product_id` INT NULL,
  `quantity` INT NOT NULL,
  `order_id` INT NOT NULL,
  `order_item_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_item_id`),
  INDEX `fk_order_item_product3_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_id_2`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`order_3` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_item_product3`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product_3` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client_3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client_3` (
  `client_name` VARCHAR(45) NOT NULL,
  `customer_adress` VARCHAR(45) NOT NULL,
  `client_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`client_id`),
  UNIQUE INDEX `client_id_UNIQUE` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_id_3NF`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`order_3` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `mydb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view1`;
USE `mydb`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
