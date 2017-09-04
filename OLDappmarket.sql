-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 04. Sep, 2017 11:03 AM
-- Server-versjon: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `OLDappmarket`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `access_group`
--

CREATE TABLE `access_group` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `app`
--

CREATE TABLE `app` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mlab_guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  `category1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisher_org_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` enum('published','unpublished','withdrawn') COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT '0',
  `icon` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `apps_access_groups`
--

CREATE TABLE `apps_access_groups` (
  `app_id` int(11) NOT NULL,
  `access_group_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `device`
--

CREATE TABLE `device` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_version` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_access` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dataark for tabell `device`
--

INSERT INTO `device` (`id`, `user_id`, `uid`, `os`, `os_version`, `enabled`, `created_at`, `updated_at`, `last_access`) VALUES
(1, 1, 'SONY', 'Android', '18', 1, '2017-05-07 20:25:37', '2017-05-07 20:25:37', NULL),
(2, 1, 'SONTABL', 'iOS', '7.1', 1, '2017-05-07 20:25:37', '2017-05-07 20:25:37', NULL);

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `devices_versions`
--

CREATE TABLE `devices_versions` (
  `device_id` int(11) NOT NULL,
  `version_id` int(11) NOT NULL,
  `state` enum('unknown','downloaded','used','uninstalled') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `grp`
--

CREATE TABLE `grp` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `screenshot`
--

CREATE TABLE `screenshot` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `image` mediumblob,
  `mimetype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expires` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `users_access_groups`
--

CREATE TABLE `users_access_groups` (
  `user_id` int(11) NOT NULL,
  `access_group_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `users_groups`
--

CREATE TABLE `users_groups` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `usr`
--

CREATE TABLE `usr` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'user',
  `state` enum('registered','accepted','rejected','disabled') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dataark for tabell `usr`
--

INSERT INTO `usr` (`id`, `email`, `first_name`, `last_name`, `password`, `salt`, `role`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'arild@bergh.fm', 'økjølk', 'lkjlkjlkj', 'lkjlkj', 'lkjlkjlkj', 'user', 'registered', '2017-05-07 19:29:10', '2017-05-07 19:29:10', NULL),
(2, 'maia@maiaberghs.com', 'maia', 'bergh', 'passowrd', 'sdfsdf', 'superadmin', 'rejected', '2017-05-07 19:29:10', '2017-05-07 19:29:10', NULL);

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `version`
--

CREATE TABLE `version` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `superceded_by_version_id` int(11) DEFAULT NULL,
  `version` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.0.0',
  `update_notes` text COLLATE utf8_unicode_ci,
  `os` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `os_version` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `download_count` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` enum('waiting_for_file','ready','superceded') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_group`
--
ALTER TABLE `access_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `name` (`name`),
  ADD KEY `enabled` (`enabled`),
  ADD KEY `access_group_group_id` (`group_id`),
  ADD KEY `access_group_name` (`name`),
  ADD KEY `access_group_enabled` (`enabled`);

--
-- Indexes for table `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `package_id` (`package_id`),
  ADD UNIQUE KEY `mlab_guid` (`mlab_guid`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `name` (`name`),
  ADD KEY `state` (`state`),
  ADD KEY `category1` (`category1`),
  ADD KEY `category2` (`category2`),
  ADD KEY `category3` (`category3`);
ALTER TABLE `app` ADD FULLTEXT KEY `description` (`description`);
ALTER TABLE `app` ADD FULLTEXT KEY `keywords` (`keywords`);

--
-- Indexes for table `apps_access_groups`
--
ALTER TABLE `apps_access_groups`
  ADD PRIMARY KEY (`app_id`,`access_group_id`),
  ADD KEY `app_id` (`app_id`),
  ADD KEY `access_group_id` (`access_group_id`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `os` (`os`,`os_version`),
  ADD KEY `enabled` (`enabled`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `last_access` (`last_access`),
  ADD KEY `device_user_id` (`user_id`),
  ADD KEY `device_os_os_version` (`os`,`os_version`),
  ADD KEY `device_uid` (`uid`),
  ADD KEY `device_enabled` (`enabled`),
  ADD KEY `device_created_at` (`created_at`),
  ADD KEY `device_updated_at` (`updated_at`),
  ADD KEY `device_last_access` (`last_access`);

--
-- Indexes for table `devices_versions`
--
ALTER TABLE `devices_versions`
  ADD PRIMARY KEY (`device_id`,`version_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `version_id` (`version_id`),
  ADD KEY `state` (`state`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Indexes for table `grp`
--
ALTER TABLE `grp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `enabled` (`enabled`),
  ADD KEY `grp_enabled` (`enabled`);

--
-- Indexes for table `screenshot`
--
ALTER TABLE `screenshot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_id` (`app_id`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `SequelizeMeta_name_unique` (`name`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_id` (`device_id`);

--
-- Indexes for table `users_access_groups`
--
ALTER TABLE `users_access_groups`
  ADD PRIMARY KEY (`user_id`,`access_group_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `access_group_id` (`access_group_id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `usr`
--
ALTER TABLE `usr`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `last_name` (`last_name`),
  ADD KEY `first_name` (`first_name`),
  ADD KEY `role` (`role`),
  ADD KEY `state` (`state`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `deleted_at` (`deleted_at`),
  ADD KEY `usr_last_name` (`last_name`),
  ADD KEY `usr_first_name` (`first_name`),
  ADD KEY `usr_role` (`role`),
  ADD KEY `usr_state` (`state`),
  ADD KEY `usr_created_at` (`created_at`),
  ADD KEY `usr_updated_at` (`updated_at`),
  ADD KEY `usr_deleted_at` (`deleted_at`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_id` (`app_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `superceded_by_version_id` (`superceded_by_version_id`),
  ADD KEY `version` (`version`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_group`
--
ALTER TABLE `access_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app`
--
ALTER TABLE `app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `grp`
--
ALTER TABLE `grp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `screenshot`
--
ALTER TABLE `screenshot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usr`
--
ALTER TABLE `usr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `version`
--
ALTER TABLE `version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Begrensninger for dumpede tabeller
--

--
-- Begrensninger for tabell `access_group`
--
ALTER TABLE `access_group`
  ADD CONSTRAINT `access_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `grp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Begrensninger for tabell `app`
--
ALTER TABLE `app`
  ADD CONSTRAINT `app_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Begrensninger for tabell `apps_access_groups`
--
ALTER TABLE `apps_access_groups`
  ADD CONSTRAINT `apps_access_groups_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `apps_access_groups_ibfk_2` FOREIGN KEY (`access_group_id`) REFERENCES `access_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Begrensninger for tabell `device`
--
ALTER TABLE `device`
  ADD CONSTRAINT `device_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Begrensninger for tabell `devices_versions`
--
ALTER TABLE `devices_versions`
  ADD CONSTRAINT `devices_versions_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `devices_versions_ibfk_2` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Begrensninger for tabell `screenshot`
--
ALTER TABLE `screenshot`
  ADD CONSTRAINT `screenshot_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Begrensninger for tabell `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `token_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Begrensninger for tabell `users_access_groups`
--
ALTER TABLE `users_access_groups`
  ADD CONSTRAINT `users_access_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_access_groups_ibfk_2` FOREIGN KEY (`access_group_id`) REFERENCES `access_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Begrensninger for tabell `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `users_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `grp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Begrensninger for tabell `version`
--
ALTER TABLE `version`
  ADD CONSTRAINT `version_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `version_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `usr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `version_ibfk_3` FOREIGN KEY (`superceded_by_version_id`) REFERENCES `version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
