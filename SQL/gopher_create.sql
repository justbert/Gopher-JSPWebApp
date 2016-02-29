-- -----------------------------------------------------
-- Schema gopher
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `gopher`;
USE `gopher`;

-- -----------------------------------------------------
-- Table `gopher`.`user_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(75) NOT NULL,
  `nameFirst` VARCHAR(50) NULL,
  `nameLast` VARCHAR(75) NULL,
  `email` VARCHAR(75) NOT NULL,
  `phoneHome` VARCHAR(20) NULL,
  `phoneWork` VARCHAR(20) NULL,
  `phoneMobile` VARCHAR(20) NULL,
  `password` CHAR(128) NULL,
  `salt` VCHAR(32) NULL,
  `joinDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userTypeId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`userTypeId`)
    REFERENCES `user_types` (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`address_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `address_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `addressLine1` VARCHAR(75) NULL,
  `addressLine2` VARCHAR(75) NULL,
  `city` VARCHAR(75) NULL,
  `province` VARCHAR(75) NULL,
  `country` VARCHAR(75) NULL,
  `zip` VARCHAR(10) NULL,
  `userId` INT UNSIGNED NOT NULL,
  `addressTypeId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`userId`)
    REFERENCES `users` (`id`),
  FOREIGN KEY (`addressTypeId`)
    REFERENCES `address_types` (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`rewards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rewards` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(150) NULL,
  `rewardValue` INT NULL,
  PRIMARY KEY (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`status_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `status_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`importance_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `importance_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`errands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `errands` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `creationDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completionDate` TIMESTAMP NULL,
  `deadline` TIMESTAMP NULL,
  `rewardId` INT UNSIGNED NOT NULL,
  `statusTypeId` INT UNSIGNED NOT NULL,
  `importanceTypeId` INT UNSIGNED NOT NULL,
  `userIdCustomer` INT UNSIGNED NOT NULL,
  `userIdGopher` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`rewardId`)
    REFERENCES `rewards` (`id`),
  FOREIGN KEY (`statusTypeId`)
    REFERENCES `status_types` (`id`),
  FOREIGN KEY (`importanceTypeId`)
    REFERENCES `importance_types` (`id`),
  FOREIGN KEY (`userIdCustomer`)
    REFERENCES `users` (`id`),
  FOREIGN KEY (`userIdGopher`)
    REFERENCES `users` (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`errand_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `errand_categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `errandId` INT UNSIGNED NOT NULL,
  `categoryId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`errandId`)
    REFERENCES `errands` (`id`),
  FOREIGN KEY (`categoryId`)
    REFERENCES `categories` (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(250) NULL,
  `startDate` TIMESTAMP NULL DEFAULT NULL,
  `completionDate` TIMESTAMP NULL DEFAULT NULL,
  `errandId` INT UNSIGNED NOT NULL,
  `addresses_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`errandId`)
    REFERENCES `errands` (`id`),
  FOREIGN KEY (`addresses_id`)
    REFERENCES `addresses` (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ratings` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ratingValue` INT NOT NULL,
  `comments` VARCHAR(150) NULL,
  `creationDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userIdRated` INT UNSIGNED NOT NULL,
  `userIdRater` INT UNSIGNED NOT NULL,
  `errandId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`userIdRated`)
    REFERENCES `users` (`id`),
  FOREIGN KEY (`userIdRater`)
    REFERENCES `users` (`id`),
  FOREIGN KEY (`errandId`)
    REFERENCES `errands` (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`notification_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notification_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
);


-- -----------------------------------------------------
-- Table `gopher`.`notifications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `message` VARCHAR(150) NULL,
  `userId` INT UNSIGNED NOT NULL,
  `notificationTypeId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`userId`)
    REFERENCES `users` (`id`),
  FOREIGN KEY (`notificationTypeId`)
    REFERENCES `notification_types` (`id`)
);
