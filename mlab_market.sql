SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `usr`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usr` ;

CREATE TABLE IF NOT EXISTS `usr` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `salt` VARCHAR(255) NULL,
  `role` VARCHAR(20) NULL DEFAULT 'user',
  `state` ENUM('registered', 'accepted', 'rejected', 'disabled'),
	`created_at` TIMESTAMP NOT NULL DEFAULT now(),
	`updated_at` TIMESTAMP NOT NULL DEFAULT now(),
	`last_access` TIMESTAMP NULL,
	`deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`email`),
  KEY (`last_name`),
	KEY (`first_name`),
	KEY (`role`),
	KEY (`state`),
	KEY (`created_at`),
	KEY (`updated_at`),
	KEY (`last_access`),
	KEY (`deleted_at`)
) ENGINE = InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `grp`
--

CREATE TABLE IF NOT EXISTS `grp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) DEFAULT '1',
	`created_at` TIMESTAMP NOT NULL DEFAULT now(),
	`updated_at` TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`),
  KEY (`enabled`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `access_grp`
-- Used to decide what apps a user can see
-- If an app belongs to no appgroups, it is public
--

CREATE TABLE IF NOT EXISTS `access_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) DEFAULT '1',
	`created_at` TIMESTAMP NOT NULL DEFAULT now(),
	`updated_at` TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (`id`),
  KEY (`group_id`),
  KEY (`name`),
  KEY (`enabled`),
  CONSTRAINT 
    FOREIGN KEY (`group_id`)
    REFERENCES `grp` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------------------------
-- Table `device`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `device` ;

CREATE TABLE IF NOT EXISTS `device` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `uid` VARCHAR(255) NULL,
	`os` VARCHAR(25) NULL,
	`os_version` VARCHAR(25) NOT NULL DEFAULT 1,
  `enabled` tinyint(1) DEFAULT '1',
	`created_at` TIMESTAMP NOT NULL DEFAULT now(),
	`updated_at` TIMESTAMP NOT NULL DEFAULT now(),
	`last_access` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
	KEY (`user_id`),
	KEY (`uid`),
	KEY (`os`, `os_version`),
	KEY (`enabled`),
	KEY (`created_at`),
	KEY (`updated_at`),
	KEY (`last_access`),
  CONSTRAINT 
    FOREIGN KEY (`user_id`)
    REFERENCES `usr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `token` ;

CREATE TABLE IF NOT EXISTS `token` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `device_id` INT NOT NULL, -- we used -1 for token linked to Mlab builder. Only allowed one at a time and hass to be short term
  `token` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL DEFAULT now(),
  `expires` TIMESTAMP NULL DEFAULT now(),
  PRIMARY KEY (`id`),
	KEY (device_id),
  KEY (expires),
  CONSTRAINT 
    FOREIGN KEY (`device_id`)
    REFERENCES `device` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




-- ***************APP TABLES ***********************

-- -----------------------------------------------------
-- Table `app`
-- user_id is the user that uploaded it initially
-- -----------------------------------------------------
DROP TABLE IF EXISTS `app` ;

CREATE TABLE IF NOT EXISTS `app` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `package_id` VARCHAR(255) NULL,
  `mlab_guid` VARCHAR(255) NULL,
  `name` VARCHAR(255) NULL,
  `description` TEXT NULL,
  `keywords` TEXT NULL,
  `category1` VARCHAR(255) NULL,
  `category2` VARCHAR(255) NULL,
  `category3` VARCHAR(255) NULL,
  `publisher_org_name` VARCHAR(255) NULL,
  `state` ENUM('published', 'unpublished', 'withdrawn'),
  `size` INT NULL DEFAULT 0,
  `icon` MEDIUMBLOB NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`package_id`),
  UNIQUE KEY (`mlab_guid`),
  KEY (`user_id`),
  KEY (`name`),
	KEY (`state`),
  FULLTEXT KEY (`description`),
	FULLTEXT KEY (`keywords`),
	KEY (`category1`),
	KEY (`category2`),
	KEY (`category3`),
  CONSTRAINT 
    FOREIGN KEY (`user_id`)
    REFERENCES `usr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------------------------
-- Table `version`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `version` ;

CREATE TABLE IF NOT EXISTS `version` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `superceded_by_version_id` INT NULL,
  `version` VARCHAR(25) NOT NULL DEFAULT "1.0.0",
  `update_notes` TEXT NULL,
	`os` VARCHAR(25) NOT NULL,
	`os_version` VARCHAR(25) NOT NULL DEFAULT 1,
  `download_count` INT NULL DEFAULT 0,
	`created_at` TIMESTAMP NOT NULL DEFAULT now(),
	`updated_at` TIMESTAMP NOT NULL DEFAULT now(),
  `state` ENUM('waiting_for_file', 'ready', 'superceded'),
  PRIMARY KEY (`id`),
  KEY (`app_id`),
  KEY (`user_id`),
  KEY (`superceded_by_version_id`),
	KEY (`version`),
	KEY (`created_at`),
	KEY (`updated_at`),
  CONSTRAINT 
    FOREIGN KEY (`app_id`)
    REFERENCES `app` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 
    FOREIGN KEY (`user_id`)
    REFERENCES `usr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 
    FOREIGN KEY (`superceded_by_version_id`)
    REFERENCES `version` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- -----------------------------------------------------
-- Table `screenshot`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `screenshot` ;

CREATE TABLE IF NOT EXISTS `screenshot` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app_id` INT NOT NULL,
  `image` MEDIUMBLOB NULL,
  `mimetype` VARCHAR(50) NULL,
  `size` INT NULL,
  PRIMARY KEY (`id`),
  KEY (`app_id`),
  CONSTRAINT 
    FOREIGN KEY (`app_id`)
    REFERENCES `app` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ************JOIN TABLES***************

--
-- Table structure for table `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY (`user_id`),
  KEY (`group_id`),
  CONSTRAINT 
    FOREIGN KEY (`user_id`)
    REFERENCES `usr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	CONSTRAINT 
    FOREIGN KEY (`group_id`)
    REFERENCES `grp` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `users_access_groups`
--

CREATE TABLE IF NOT EXISTS `users_access_groups` (
  `user_id` int(11) NOT NULL,
  `access_group_id` int(11) NOT NULL,
	`created_at` TIMESTAMP NOT NULL DEFAULT now(),
	`updated_at` TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (`user_id`,`access_group_id`),
  KEY (`user_id`),
  KEY (`access_group_id`),
  CONSTRAINT 
    FOREIGN KEY (`user_id`)
    REFERENCES `usr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	CONSTRAINT 
    FOREIGN KEY (`access_group_id`)
    REFERENCES `access_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `groups_subgroups`
--

CREATE TABLE IF NOT EXISTS `apps_access_groups` (
  `app_id` int(11) NOT NULL,
  `access_group_id` int(11) NOT NULL,
	`created_at` TIMESTAMP NOT NULL DEFAULT now(),
	`updated_at` TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (`app_id`,`access_group_id`),
  KEY (`app_id`),
  KEY (`access_group_id`),
	CONSTRAINT 
    FOREIGN KEY (`app_id`)
    REFERENCES `app` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	CONSTRAINT 
    FOREIGN KEY (`access_group_id`)
    REFERENCES `access_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `devices_versions`, this deals with downloads of apps linking to device and version of app
-- -----------------------------------------------------
DROP TABLE IF EXISTS `devices_versions` ;

CREATE TABLE IF NOT EXISTS `devices_versions` (
  `device_id` INT NOT NULL,
  `version_id` INT NOT NULL,
  `state` ENUM('unknown', 'downloaded', 'used', 'uninstalled'),
	`created_at` TIMESTAMP NOT NULL DEFAULT now(),
	`updated_at` TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (`device_id`, `version_id`),
	KEY (`device_id`),
	KEY (`version_id`),
	KEY (`state`),
	KEY (`created_at`),
	KEY (`updated_at`),
  CONSTRAINT 
    FOREIGN KEY (`device_id`)
    REFERENCES `device` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 
    FOREIGN KEY (`version_id`)
    REFERENCES `version` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
