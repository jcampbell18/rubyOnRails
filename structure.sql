SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `invoicing` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `invoicing`;

CREATE TABLE `access_levels` (
  `access_level_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bid_status` (
  `bid_status_id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bids` (
  `bid_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `project_site_id` int(10) NOT NULL,
  `sku_id` int(10) NOT NULL,
  `bid_date` date NOT NULL,
  `description` mediumtext NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `bid_status_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `changelogs` (
  `changelog_id` int(10) NOT NULL,
  `changelog_category_id` int(10) NOT NULL,
  `timestamp` date NOT NULL,
  `description` varchar(250) NOT NULL,
  `complete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `changelog_categories` (
  `changelog_category_id` int(10) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `companies` (
  `company_id` int(10) NOT NULL,
  `company_category_id` int(10) NOT NULL,
  `business_name` varchar(75) NOT NULL,
  `contact_name` varchar(75) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state_id` int(2) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `fax` varchar(14) NOT NULL,
  `email` varchar(45) NOT NULL,
  `website` varchar(50) NOT NULL,
  `logo_image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `company_categories` (
  `company_category_id` int(10) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `expenses` (
  `expense_id` int(10) NOT NULL,
  `invoice_id` int(10) NULL,
  `company_id` int(10) NULL,
  `expense_category_id` int(10) NOT NULL,
  `vehicle_id` int(10) NULL,
  `pdate` date NOT NULL,
  `name` varchar(200) NOT NULL,
  `quantity` int(4) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `tax_included` tinyint(1) NOT NULL,
  `tax` decimal(12,5) NOT NULL,
  `total` decimal(12,5) NOT NULL,
  `receipt_reference` varchar(100) NOT NULL,
  `receipt_image` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `expense_categories` (
  `expense_category_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `invoices` (
  `invoice_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `sku_id` int(10) NOT NULL,
  `project_site_id` int(10) NOT NULL,
  `bid_id` int(10) NULL,
  `term_id` int(10) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` mediumtext NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `receipts` tinyint(1) NOT NULL,
  `images` tinyint(1) NOT NULL,
  `image_links` mediumtext NOT NULL,
  `mileage_id` int(10) NOT NULL,
  `loan_amount` decimal(8,2) NOT NULL,
  `loan_paid` tinyint(1) NOT NULL DEFAULT 0,
  `interest_amount` decimal(8,2) NOT NULL,
  `interest_paid` tinyint(1) NOT NULL DEFAULT 0,
  `complete` tinyint(1) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `paid_checknum` varchar(50) NOT NULL,
  `paid_date` date NOT NULL,
  `project_cost` decimal(8,2) NOT NULL,
  `save_tax` decimal(8,2) NOT NULL,
  `actual_net` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mileage` (
  `mileage_id` int(10) NOT NULL,
  `project_site_id` int(10) NULL,
  `vehicle_id` int(10) NOT NULL,
  `invoice_id1` int(10) NULL,
  `invoice_id2` int(10) NULL,
  `invoice_id3` int(10) NULL,
  `drive_date` date NOT NULL,
  `start_mileage` varchar(10) NOT NULL,
  `end_mileage` varchar(10) NOT NULL,
  `subtotal` varchar(10) NOT NULL,
  `notes` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `project_sites` (
  `project_site_id` int(10) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state_id` int(2) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `access_code` varchar(10) NOT NULL,
  `map_link` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sku` (
  `sku_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `states` (
  `state_id` int(2) NOT NULL,
  `name` varchar(75) NOT NULL,
  `abbreviation` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `terms` (
  `term_id` int(10) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(128) NOT NULL,
  `access_level_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `phone_extension` varchar(6) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vehicles` (
  `vehicle_id` int(10) NOT NULL,
  `man_year` year(4) NOT NULL,
  `make` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `submodel` varchar(45) NOT NULL,
  `engine` varchar(150) NOT NULL,
  `notes` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `access_levels`
  ADD PRIMARY KEY (`access_level_id`);

ALTER TABLE `bid_status`
  ADD PRIMARY KEY (`bid_status_id`);

ALTER TABLE `bids`
  ADD PRIMARY KEY (`bid_id`),
  ADD KEY `ix_company_id` (`company_id`),
  ADD KEY `ix_project_site_id` (`project_site_id`),
  ADD KEY `ix_sku_id` (`sku_id`),
  ADD KEY `ix_bid_status_id` (`bid_status_id`);

ALTER TABLE `changelogs`
  ADD PRIMARY KEY (`changelog_id`),
  ADD KEY `ix_changelog_category_id` (`changelog_category_id`);

ALTER TABLE `changelog_categories`
  ADD PRIMARY KEY (`changelog_category_id`);

ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `ix_company_category_id` (`company_category_id`),
  ADD KEY `ix_state_id` (`state_id`);

ALTER TABLE `company_categories`
  ADD PRIMARY KEY (`company_category_id`);

ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `ix_invoice_id` (`invoice_id`),
  ADD KEY `ix_company_id` (`company_id`),
  ADD KEY `ix_expense_category_id` (`expense_category_id`),
  ADD KEY `ix_vehicle_id` (`vehicle_id`);

ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`expense_category_id`);

ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `ix_company_id` (`company_id`),
  ADD KEY `ix_project_site_id` (`project_site_id`),
  ADD KEY `ix_sku_id` (`sku_id`),
  ADD KEY `ix_bid_id` (`bid_id`),
  ADD KEY `ix_term_id` (`term_id`),
  ADD KEY `ix_mileage_id` (`mileage_id`);

ALTER TABLE `mileage`
  ADD PRIMARY KEY (`mileage_id`),
  ADD KEY `ix_project_site_id` (`project_site_id`),
  ADD KEY `ix_vehicle_id` (`vehicle_id`),
  ADD KEY `ix_invoice_id1` (`invoice_id1`),
  ADD KEY `ix_invoice_id2` (`invoice_id2`),
  ADD KEY `ix_invoice_id3` (`invoice_id3`);

ALTER TABLE `project_sites`
  ADD PRIMARY KEY (`project_site_id`),
  ADD KEY `ix_state_id` (`state_id`);

ALTER TABLE `sku`
  ADD PRIMARY KEY (`sku_id`);

ALTER TABLE `states`
  ADD PRIMARY KEY (`state_id`);

ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `ix_access_level_id` (`access_level_id`),
  ADD KEY `ix_company_id` (`company_id`);

ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicle_id`);


ALTER TABLE `access_levels`
  MODIFY `access_level_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bid_status`
  MODIFY `bid_status_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bids`
  MODIFY `bid_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `changelogs`
  MODIFY `changelog_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `changelog_categories`
  MODIFY `changelog_category_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `companies`
  MODIFY `company_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `company_categories`
  MODIFY `company_category_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `expenses`
  MODIFY `expense_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `expense_categories`
  MODIFY `expense_category_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `invoices`
  MODIFY `invoice_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `mileage`
  MODIFY `mileage_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sku`
  MODIFY `sku_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `terms`
  MODIFY `term_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `vehicles`
  MODIFY `vehicle_id` int(10) NOT NULL AUTO_INCREMENT;


ALTER TABLE `bids`
  ADD CONSTRAINT `fk_company_id2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_project_site_id` FOREIGN KEY (`project_site_id`) REFERENCES `project_sites` (`project_site_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`sku_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bid_status_id` FOREIGN KEY (`bid_status_id`) REFERENCES `bid_status` (`bid_status_id`) ON UPDATE CASCADE;

ALTER TABLE `changelogs`
  ADD CONSTRAINT `fk_changelog_category_id` FOREIGN KEY (`changelog_category_id`) REFERENCES `changelog_categories` (`changelog_category_id`) ON UPDATE CASCADE;

ALTER TABLE `companies`
  ADD CONSTRAINT `fk_company_category_id` FOREIGN KEY (`company_category_id`) REFERENCES `company_categories` (`company_category_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_state_id2` FOREIGN KEY (`state_id`) REFERENCES `states` (`state_id`) ON UPDATE CASCADE;

ALTER TABLE `expenses`
  ADD CONSTRAINT `fk_company_id4` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_expense_category_id` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`expense_category_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_invoice_id4` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vehicle_id2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON UPDATE CASCADE;

ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_bid_id` FOREIGN KEY (`bid_id`) REFERENCES `bids` (`bid_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_company_id3` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_project_site_id2` FOREIGN KEY (`project_site_id`) REFERENCES `project_sites` (`project_site_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sku_id1` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`sku_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_term_id` FOREIGN KEY (`term_id`) REFERENCES `terms` (`term_id`) ON UPDATE CASCADE;

ALTER TABLE `mileage`
  ADD CONSTRAINT `fk_invoice_id1` FOREIGN KEY (`invoice_id1`) REFERENCES `invoices` (`invoice_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_invoice_id2` FOREIGN KEY (`invoice_id3`) REFERENCES `invoices` (`invoice_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_invoice_id3` FOREIGN KEY (`invoice_id2`) REFERENCES `invoices` (`invoice_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_project_site_id3` FOREIGN KEY (`project_site_id`) REFERENCES `project_sites` (`project_site_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON UPDATE CASCADE;

ALTER TABLE `project_sites`
  ADD CONSTRAINT `fk_state_id` FOREIGN KEY (`state_id`) REFERENCES `states` (`state_id`) ON UPDATE CASCADE;

ALTER TABLE `users`
  ADD CONSTRAINT `fk_access_level_id` FOREIGN KEY (`access_level_id`) REFERENCES `access_levels` (`access_level_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
