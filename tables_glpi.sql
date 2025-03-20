-- MySQL dump 10.13  Distrib 8.4.0, for Linux (x86_64)
--
-- Host: localhost    Database: glpi
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `glpi_agents`
--

DROP TABLE IF EXISTS `glpi_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `deviceid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agenttypes_id` int unsigned NOT NULL,
  `last_contact` timestamp NULL DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked` tinyint NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int unsigned NOT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote_addr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `threads_networkdiscovery` int NOT NULL DEFAULT '1' COMMENT 'Number of threads for Network discovery',
  `threads_networkinventory` int NOT NULL DEFAULT '1' COMMENT 'Number of threads for Network inventory',
  `timeout_networkdiscovery` int NOT NULL DEFAULT '0' COMMENT 'Network Discovery task timeout (disabled by default)',
  `timeout_networkinventory` int NOT NULL DEFAULT '0' COMMENT 'Network Inventory task timeout (disabled by default)',
  `use_module_wake_on_lan` tinyint NOT NULL DEFAULT '0',
  `use_module_computer_inventory` tinyint NOT NULL DEFAULT '0',
  `use_module_esx_remote_inventory` tinyint NOT NULL DEFAULT '0',
  `use_module_remote_inventory` tinyint NOT NULL DEFAULT '0',
  `use_module_network_inventory` tinyint NOT NULL DEFAULT '0',
  `use_module_network_discovery` tinyint NOT NULL DEFAULT '0',
  `use_module_package_deployment` tinyint NOT NULL DEFAULT '0',
  `use_module_collect_data` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deviceid` (`deviceid`),
  KEY `name` (`name`),
  KEY `agenttypes_id` (`agenttypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_agenttypes`
--

DROP TABLE IF EXISTS `glpi_agenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_agenttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_alerts`
--

DROP TABLE IF EXISTS `glpi_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_alerts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0' COMMENT 'see define.php ALERT_* constant',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`type`),
  KEY `type` (`type`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_apiclients`
--

DROP TABLE IF EXISTS `glpi_apiclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_apiclients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `ipv4_range_start` bigint DEFAULT NULL,
  `ipv4_range_end` bigint DEFAULT NULL,
  `ipv6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_token_date` timestamp NULL DEFAULT NULL,
  `dolog_method` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_applianceenvironments`
--

DROP TABLE IF EXISTS `glpi_applianceenvironments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_applianceenvironments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_appliances`
--

DROP TABLE IF EXISTS `glpi_appliances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_appliances` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `appliancetypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `applianceenvironments_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `externalidentifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_helpdesk_visible` tinyint NOT NULL DEFAULT '1',
  `pictures` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`externalidentifier`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `is_deleted` (`is_deleted`),
  KEY `appliancetypes_id` (`appliancetypes_id`),
  KEY `locations_id` (`locations_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `applianceenvironments_id` (`applianceenvironments_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id` (`groups_id`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `states_id` (`states_id`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_appliances_items`
--

DROP TABLE IF EXISTS `glpi_appliances_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_appliances_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `appliances_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`appliances_id`,`items_id`,`itemtype`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_appliances_items_relations`
--

DROP TABLE IF EXISTS `glpi_appliances_items_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_appliances_items_relations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `appliances_items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `appliances_items_id` (`appliances_items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_appliancetypes`
--

DROP TABLE IF EXISTS `glpi_appliancetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_appliancetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `externalidentifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `externalidentifier` (`externalidentifier`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_authldapreplicates`
--

DROP TABLE IF EXISTS `glpi_authldapreplicates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_authldapreplicates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `authldaps_id` int unsigned NOT NULL DEFAULT '0',
  `host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int NOT NULL DEFAULT '389',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeout` int NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `authldaps_id` (`authldaps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_authldaps`
--

DROP TABLE IF EXISTS `glpi_authldaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_authldaps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basedn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rootdn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int NOT NULL DEFAULT '389',
  `condition` text COLLATE utf8mb4_unicode_ci,
  `login_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'uid',
  `sync_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_tls` tinyint NOT NULL DEFAULT '0',
  `group_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_condition` text COLLATE utf8mb4_unicode_ci,
  `group_search_type` int NOT NULL DEFAULT '0',
  `group_member_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email1_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realname_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_dn` tinyint NOT NULL DEFAULT '1',
  `time_offset` int NOT NULL DEFAULT '0' COMMENT 'in seconds',
  `deref_option` int NOT NULL DEFAULT '0',
  `title_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_condition` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `rootdn_passwd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_number_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email2_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email3_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email4_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responsible_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagesize` int NOT NULL DEFAULT '0',
  `ldap_maxlimit` int NOT NULL DEFAULT '0',
  `can_support_pagesize` tinyint NOT NULL DEFAULT '0',
  `picture_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `inventory_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tls_certfile` text COLLATE utf8mb4_unicode_ci,
  `tls_keyfile` text COLLATE utf8mb4_unicode_ci,
  `use_bind` tinyint NOT NULL DEFAULT '1',
  `timeout` int NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `is_default` (`is_default`),
  KEY `is_active` (`is_active`),
  KEY `date_creation` (`date_creation`),
  KEY `sync_field` (`sync_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_authmails`
--

DROP TABLE IF EXISTS `glpi_authmails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_authmails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connect_string` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_autoupdatesystems`
--

DROP TABLE IF EXISTS `glpi_autoupdatesystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_autoupdatesystems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_blacklistedmailcontents`
--

DROP TABLE IF EXISTS `glpi_blacklistedmailcontents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_blacklistedmailcontents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_blacklists`
--

DROP TABLE IF EXISTS `glpi_blacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_blacklists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_budgets`
--

DROP TABLE IF EXISTS `glpi_budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_budgets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `budgettypes_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `is_template` (`is_template`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `locations_id` (`locations_id`),
  KEY `budgettypes_id` (`budgettypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_budgettypes`
--

DROP TABLE IF EXISTS `glpi_budgettypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_budgettypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_businesscriticities`
--

DROP TABLE IF EXISTS `glpi_businesscriticities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_businesscriticities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `businesscriticities_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`businesscriticities_id`,`name`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_cables`
--

DROP TABLE IF EXISTS `glpi_cables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_cables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `itemtype_endpoint_a` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemtype_endpoint_b` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id_endpoint_a` int unsigned NOT NULL DEFAULT '0',
  `items_id_endpoint_b` int unsigned NOT NULL DEFAULT '0',
  `socketmodels_id_endpoint_a` int unsigned NOT NULL DEFAULT '0',
  `socketmodels_id_endpoint_b` int unsigned NOT NULL DEFAULT '0',
  `sockets_id_endpoint_a` int unsigned NOT NULL DEFAULT '0',
  `sockets_id_endpoint_b` int unsigned NOT NULL DEFAULT '0',
  `cablestrands_id` int unsigned NOT NULL DEFAULT '0',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `cabletypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item_endpoint_a` (`itemtype_endpoint_a`,`items_id_endpoint_a`),
  KEY `item_endpoint_b` (`itemtype_endpoint_b`,`items_id_endpoint_b`),
  KEY `items_id_endpoint_b` (`items_id_endpoint_b`),
  KEY `items_id_endpoint_a` (`items_id_endpoint_a`),
  KEY `socketmodels_id_endpoint_a` (`socketmodels_id_endpoint_a`),
  KEY `socketmodels_id_endpoint_b` (`socketmodels_id_endpoint_b`),
  KEY `sockets_id_endpoint_a` (`sockets_id_endpoint_a`),
  KEY `sockets_id_endpoint_b` (`sockets_id_endpoint_b`),
  KEY `cablestrands_id` (`cablestrands_id`),
  KEY `states_id` (`states_id`),
  KEY `complete` (`entities_id`,`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `cabletypes_id` (`cabletypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_cablestrands`
--

DROP TABLE IF EXISTS `glpi_cablestrands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_cablestrands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_cabletypes`
--

DROP TABLE IF EXISTS `glpi_cabletypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_cabletypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_calendars`
--

DROP TABLE IF EXISTS `glpi_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_calendars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `cache_duration` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_calendars_holidays`
--

DROP TABLE IF EXISTS `glpi_calendars_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_calendars_holidays` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `holidays_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`calendars_id`,`holidays_id`),
  KEY `holidays_id` (`holidays_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_calendarsegments`
--

DROP TABLE IF EXISTS `glpi_calendarsegments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_calendarsegments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `day` tinyint NOT NULL DEFAULT '1' COMMENT 'numer of the day based on date(w)',
  `begin` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendars_id` (`calendars_id`),
  KEY `day` (`day`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_cartridgeitems`
--

DROP TABLE IF EXISTS `glpi_cartridgeitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_cartridgeitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `cartridgeitemtypes_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `alarm_threshold` int NOT NULL DEFAULT '10',
  `stock_target` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `cartridgeitemtypes_id` (`cartridgeitemtypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `alarm_threshold` (`alarm_threshold`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_cartridgeitems_printermodels`
--

DROP TABLE IF EXISTS `glpi_cartridgeitems_printermodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_cartridgeitems_printermodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cartridgeitems_id` int unsigned NOT NULL DEFAULT '0',
  `printermodels_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`printermodels_id`,`cartridgeitems_id`),
  KEY `cartridgeitems_id` (`cartridgeitems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_cartridgeitemtypes`
--

DROP TABLE IF EXISTS `glpi_cartridgeitemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_cartridgeitemtypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_cartridges`
--

DROP TABLE IF EXISTS `glpi_cartridges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_cartridges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `cartridgeitems_id` int unsigned NOT NULL DEFAULT '0',
  `printers_id` int unsigned NOT NULL DEFAULT '0',
  `date_in` date DEFAULT NULL,
  `date_use` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `pages` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cartridgeitems_id` (`cartridgeitems_id`),
  KEY `printers_id` (`printers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_certificates`
--

DROP TABLE IF EXISTS `glpi_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_certificates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificatetypes_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_certificatetypes (id)',
  `dns_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dns_suffix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_users (id)',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_groups (id)',
  `locations_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_locations (id)',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_manufacturers (id)',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `is_autosign` tinyint NOT NULL DEFAULT '0',
  `date_expiration` date DEFAULT NULL,
  `states_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to states (id)',
  `command` text COLLATE utf8mb4_unicode_ci,
  `certificate_request` text COLLATE utf8mb4_unicode_ci,
  `certificate_item` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `certificatetypes_id` (`certificatetypes_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `states_id` (`states_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_certificates_items`
--

DROP TABLE IF EXISTS `glpi_certificates_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_certificates_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `certificates_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to various tables, according to itemtype (id)',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'see .class.php file',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`certificates_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_certificatetypes`
--

DROP TABLE IF EXISTS `glpi_certificatetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_certificatetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changecosts`
--

DROP TABLE IF EXISTS `glpi_changecosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changecosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int NOT NULL DEFAULT '0',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `changes_id` (`changes_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changes`
--

DROP TABLE IF EXISTS `glpi_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `users_id_recipient` int unsigned NOT NULL DEFAULT '0',
  `users_id_lastupdater` int unsigned NOT NULL DEFAULT '0',
  `urgency` int NOT NULL DEFAULT '1',
  `impact` int NOT NULL DEFAULT '1',
  `priority` int NOT NULL DEFAULT '1',
  `itilcategories_id` int unsigned NOT NULL DEFAULT '0',
  `impactcontent` longtext COLLATE utf8mb4_unicode_ci,
  `controlistcontent` longtext COLLATE utf8mb4_unicode_ci,
  `rolloutplancontent` longtext COLLATE utf8mb4_unicode_ci,
  `backoutplancontent` longtext COLLATE utf8mb4_unicode_ci,
  `checklistcontent` longtext COLLATE utf8mb4_unicode_ci,
  `global_validation` int NOT NULL DEFAULT '1',
  `validation_percent` int NOT NULL DEFAULT '0',
  `actiontime` int NOT NULL DEFAULT '0',
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `waiting_duration` int NOT NULL DEFAULT '0',
  `close_delay_stat` int NOT NULL DEFAULT '0',
  `solve_delay_stat` int NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `date_mod` (`date_mod`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `time_to_resolve` (`time_to_resolve`),
  KEY `global_validation` (`global_validation`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `date_creation` (`date_creation`),
  KEY `locations_id` (`locations_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changes_groups`
--

DROP TABLE IF EXISTS `glpi_changes_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changes_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changes_items`
--

DROP TABLE IF EXISTS `glpi_changes_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changes_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changes_problems`
--

DROP TABLE IF EXISTS `glpi_changes_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changes_problems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`problems_id`),
  KEY `problems_id` (`problems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changes_suppliers`
--

DROP TABLE IF EXISTS `glpi_changes_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changes_suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `suppliers_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `use_notification` tinyint NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changes_tickets`
--

DROP TABLE IF EXISTS `glpi_changes_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changes_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changes_users`
--

DROP TABLE IF EXISTS `glpi_changes_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changes_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `use_notification` tinyint NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changetasks`
--

DROP TABLE IF EXISTS `glpi_changetasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changetasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `taskcategories_id` int unsigned NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_editor` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `actiontime` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int unsigned NOT NULL DEFAULT '0',
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  `is_private` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `changes_id` (`changes_id`),
  KEY `state` (`state`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `tasktemplates_id` (`tasktemplates_id`),
  KEY `is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changetemplatehiddenfields`
--

DROP TABLE IF EXISTS `glpi_changetemplatehiddenfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changetemplatehiddenfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changetemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changetemplatemandatoryfields`
--

DROP TABLE IF EXISTS `glpi_changetemplatemandatoryfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changetemplatemandatoryfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changetemplates_id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changetemplatepredefinedfields`
--

DROP TABLE IF EXISTS `glpi_changetemplatepredefinedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changetemplatepredefinedfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `changetemplates_id` (`changetemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changetemplates`
--

DROP TABLE IF EXISTS `glpi_changetemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changetemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_changevalidations`
--

DROP TABLE IF EXISTS `glpi_changevalidations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_changevalidations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_validate` int unsigned NOT NULL DEFAULT '0',
  `comment_submission` text COLLATE utf8mb4_unicode_ci,
  `comment_validation` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '2',
  `submission_date` timestamp NULL DEFAULT NULL,
  `validation_date` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `users_id` (`users_id`),
  KEY `users_id_validate` (`users_id_validate`),
  KEY `changes_id` (`changes_id`),
  KEY `submission_date` (`submission_date`),
  KEY `validation_date` (`validation_date`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_clusters`
--

DROP TABLE IF EXISTS `glpi_clusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_clusters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to states (id)',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `clustertypes_id` int unsigned NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_deleted` (`is_deleted`),
  KEY `states_id` (`states_id`),
  KEY `clustertypes_id` (`clustertypes_id`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_clustertypes`
--

DROP TABLE IF EXISTS `glpi_clustertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_clustertypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_computerantiviruses`
--

DROP TABLE IF EXISTS `glpi_computerantiviruses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_computerantiviruses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `computers_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `antivirus_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_uptodate` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `date_expiration` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `antivirus_version` (`antivirus_version`),
  KEY `signature_version` (`signature_version`),
  KEY `is_active` (`is_active`),
  KEY `is_uptodate` (`is_uptodate`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`),
  KEY `computers_id` (`computers_id`),
  KEY `date_expiration` (`date_expiration`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_computermodels`
--

DROP TABLE IF EXISTS `glpi_computermodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_computermodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8mb4_unicode_ci,
  `picture_rear` text COLLATE utf8mb4_unicode_ci,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_computers`
--

DROP TABLE IF EXISTS `glpi_computers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_computers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `networks_id` int unsigned NOT NULL DEFAULT '0',
  `computermodels_id` int unsigned NOT NULL DEFAULT '0',
  `computertypes_id` int unsigned NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `last_boot` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `computermodels_id` (`computermodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `computertypes_id` (`computertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_computers_items`
--

DROP TABLE IF EXISTS `glpi_computers_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_computers_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to various table, according to itemtype (ID)',
  `computers_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_computertypes`
--

DROP TABLE IF EXISTS `glpi_computertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_computertypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_computervirtualmachines`
--

DROP TABLE IF EXISTS `glpi_computervirtualmachines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_computervirtualmachines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `computers_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `virtualmachinestates_id` int unsigned NOT NULL DEFAULT '0',
  `virtualmachinesystems_id` int unsigned NOT NULL DEFAULT '0',
  `virtualmachinetypes_id` int unsigned NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vcpu` int NOT NULL DEFAULT '0',
  `ram` int unsigned DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `virtualmachinestates_id` (`virtualmachinestates_id`),
  KEY `virtualmachinesystems_id` (`virtualmachinesystems_id`),
  KEY `vcpu` (`vcpu`),
  KEY `ram` (`ram`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `uuid` (`uuid`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `virtualmachinetypes_id` (`virtualmachinetypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_configs`
--

DROP TABLE IF EXISTS `glpi_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_configs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `context` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`context`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_consumableitems`
--

DROP TABLE IF EXISTS `glpi_consumableitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_consumableitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `consumableitemtypes_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `alarm_threshold` int NOT NULL DEFAULT '10',
  `stock_target` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `consumableitemtypes_id` (`consumableitemtypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `alarm_threshold` (`alarm_threshold`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `otherserial` (`otherserial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_consumableitemtypes`
--

DROP TABLE IF EXISTS `glpi_consumableitemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_consumableitemtypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_consumables`
--

DROP TABLE IF EXISTS `glpi_consumables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_consumables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `consumableitems_id` int unsigned NOT NULL DEFAULT '0',
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_in` (`date_in`),
  KEY `date_out` (`date_out`),
  KEY `consumableitems_id` (`consumableitems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_contacts`
--

DROP TABLE IF EXISTS `glpi_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_contacts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contacttypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `usertitles_id` int unsigned NOT NULL DEFAULT '0',
  `address` text COLLATE utf8mb4_unicode_ci,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `contacttypes_id` (`contacttypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `usertitles_id` (`usertitles_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_contacts_suppliers`
--

DROP TABLE IF EXISTS `glpi_contacts_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_contacts_suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `suppliers_id` int unsigned NOT NULL DEFAULT '0',
  `contacts_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`suppliers_id`,`contacts_id`),
  KEY `contacts_id` (`contacts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_contacttypes`
--

DROP TABLE IF EXISTS `glpi_contacttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_contacttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_contractcosts`
--

DROP TABLE IF EXISTS `glpi_contractcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_contractcosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contracts_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `contracts_id` (`contracts_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_contracts`
--

DROP TABLE IF EXISTS `glpi_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_contracts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contracttypes_id` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `begin_date` date DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '0',
  `notice` int NOT NULL DEFAULT '0',
  `periodicity` int NOT NULL DEFAULT '0',
  `billing` int NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `accounting_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `week_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `week_end_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_saturday` tinyint NOT NULL DEFAULT '0',
  `sunday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `sunday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_sunday` tinyint NOT NULL DEFAULT '0',
  `max_links_allowed` int NOT NULL DEFAULT '0',
  `alert` int NOT NULL DEFAULT '0',
  `renewal` int NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_template` tinyint NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `begin_date` (`begin_date`),
  KEY `name` (`name`),
  KEY `contracttypes_id` (`contracttypes_id`),
  KEY `locations_id` (`locations_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_template` (`is_template`),
  KEY `use_sunday` (`use_sunday`),
  KEY `use_saturday` (`use_saturday`),
  KEY `alert` (`alert`),
  KEY `states_id` (`states_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_contracts_items`
--

DROP TABLE IF EXISTS `glpi_contracts_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_contracts_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contracts_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`contracts_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_contracts_suppliers`
--

DROP TABLE IF EXISTS `glpi_contracts_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_contracts_suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `suppliers_id` int unsigned NOT NULL DEFAULT '0',
  `contracts_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`suppliers_id`,`contracts_id`),
  KEY `contracts_id` (`contracts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_contracttypes`
--

DROP TABLE IF EXISTS `glpi_contracttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_contracttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_crontasklogs`
--

DROP TABLE IF EXISTS `glpi_crontasklogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_crontasklogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `crontasks_id` int unsigned NOT NULL,
  `crontasklogs_id` int unsigned NOT NULL COMMENT 'id of ''start'' event',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` int NOT NULL COMMENT '0:start, 1:run, 2:stop',
  `elapsed` float NOT NULL COMMENT 'time elapsed since start',
  `volume` int NOT NULL COMMENT 'for statistics',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'message',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `crontasks_id` (`crontasks_id`),
  KEY `crontasklogs_id_state` (`crontasklogs_id`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_crontasks`
--

DROP TABLE IF EXISTS `glpi_crontasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_crontasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'task name',
  `frequency` int NOT NULL COMMENT 'second between launch',
  `param` int DEFAULT NULL COMMENT 'task specify parameter',
  `state` int NOT NULL DEFAULT '1' COMMENT '0:disabled, 1:waiting, 2:running',
  `mode` int NOT NULL DEFAULT '1' COMMENT '1:internal, 2:external',
  `allowmode` int NOT NULL DEFAULT '3' COMMENT '1:internal, 2:external, 3:both',
  `hourmin` int NOT NULL DEFAULT '0',
  `hourmax` int NOT NULL DEFAULT '24',
  `logs_lifetime` int NOT NULL DEFAULT '30' COMMENT 'number of days',
  `lastrun` timestamp NULL DEFAULT NULL COMMENT 'last run date',
  `lastcode` int DEFAULT NULL COMMENT 'last run return code',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`name`),
  KEY `name` (`name`),
  KEY `mode` (`mode`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Task run by internal / external cron.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_dashboards_dashboards`
--

DROP TABLE IF EXISTS `glpi_dashboards_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_dashboards_dashboards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'core',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `name` (`name`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_dashboards_filters`
--

DROP TABLE IF EXISTS `glpi_dashboards_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_dashboards_filters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `dashboards_dashboards_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `filter` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `dashboards_dashboards_id` (`dashboards_dashboards_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_dashboards_items`
--

DROP TABLE IF EXISTS `glpi_dashboards_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_dashboards_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `dashboards_dashboards_id` int unsigned NOT NULL,
  `gridstack_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `x` int DEFAULT NULL,
  `y` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `card_options` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `dashboards_dashboards_id` (`dashboards_dashboards_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_dashboards_rights`
--

DROP TABLE IF EXISTS `glpi_dashboards_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_dashboards_rights` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `dashboards_dashboards_id` int unsigned NOT NULL,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`dashboards_dashboards_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_databaseinstancecategories`
--

DROP TABLE IF EXISTS `glpi_databaseinstancecategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_databaseinstancecategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_databaseinstances`
--

DROP TABLE IF EXISTS `glpi_databaseinstances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_databaseinstances` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `port` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `size` int NOT NULL DEFAULT '0',
  `databaseinstancetypes_id` int unsigned NOT NULL DEFAULT '0',
  `databaseinstancecategories_id` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `is_onbackup` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_helpdesk_visible` tinyint NOT NULL DEFAULT '1',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_lastboot` timestamp NULL DEFAULT NULL,
  `date_lastbackup` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `databaseinstancetypes_id` (`databaseinstancetypes_id`),
  KEY `databaseinstancecategories_id` (`databaseinstancecategories_id`),
  KEY `locations_id` (`locations_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `states_id` (`states_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `is_active` (`is_active`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_databaseinstancetypes`
--

DROP TABLE IF EXISTS `glpi_databaseinstancetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_databaseinstancetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_databases`
--

DROP TABLE IF EXISTS `glpi_databases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_databases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `size` int NOT NULL DEFAULT '0',
  `databaseinstances_id` int unsigned NOT NULL DEFAULT '0',
  `is_onbackup` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_update` timestamp NULL DEFAULT NULL,
  `date_lastbackup` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `databaseinstances_id` (`databaseinstances_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_datacenters`
--

DROP TABLE IF EXISTS `glpi_datacenters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_datacenters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_dcrooms`
--

DROP TABLE IF EXISTS `glpi_dcrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_dcrooms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `vis_cols` int DEFAULT NULL,
  `vis_rows` int DEFAULT NULL,
  `blueprint` text COLLATE utf8mb4_unicode_ci,
  `datacenters_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `datacenters_id` (`datacenters_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicebatteries`
--

DROP TABLE IF EXISTS `glpi_devicebatteries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicebatteries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `voltage` int DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `devicebatterytypes_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicebatterymodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicebatterymodels_id` (`devicebatterymodels_id`),
  KEY `devicebatterytypes_id` (`devicebatterytypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicebatterymodels`
--

DROP TABLE IF EXISTS `glpi_devicebatterymodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicebatterymodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicebatterytypes`
--

DROP TABLE IF EXISTS `glpi_devicebatterytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicebatterytypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicecameramodels`
--

DROP TABLE IF EXISTS `glpi_devicecameramodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicecameramodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicecameras`
--

DROP TABLE IF EXISTS `glpi_devicecameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicecameras` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flashunit` tinyint NOT NULL DEFAULT '0',
  `lensfacing` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orientation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `focallength` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sensorsize` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicecameramodels_id` int unsigned DEFAULT NULL,
  `support` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicecameramodels_id` (`devicecameramodels_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicecasemodels`
--

DROP TABLE IF EXISTS `glpi_devicecasemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicecasemodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicecases`
--

DROP TABLE IF EXISTS `glpi_devicecases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicecases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicecasetypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicecasemodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicecasetypes_id` (`devicecasetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicecasemodels_id` (`devicecasemodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicecasetypes`
--

DROP TABLE IF EXISTS `glpi_devicecasetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicecasetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicecontrolmodels`
--

DROP TABLE IF EXISTS `glpi_devicecontrolmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicecontrolmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicecontrols`
--

DROP TABLE IF EXISTS `glpi_devicecontrols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicecontrols` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_raid` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `interfacetypes_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicecontrolmodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicecontrolmodels_id` (`devicecontrolmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicedrivemodels`
--

DROP TABLE IF EXISTS `glpi_devicedrivemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicedrivemodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicedrives`
--

DROP TABLE IF EXISTS `glpi_devicedrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicedrives` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_writer` tinyint NOT NULL DEFAULT '1',
  `speed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `interfacetypes_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicedrivemodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicedrivemodels_id` (`devicedrivemodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicefirmwaremodels`
--

DROP TABLE IF EXISTS `glpi_devicefirmwaremodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicefirmwaremodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicefirmwares`
--

DROP TABLE IF EXISTS `glpi_devicefirmwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicefirmwares` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicefirmwaretypes_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicefirmwaremodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicefirmwaremodels_id` (`devicefirmwaremodels_id`),
  KEY `devicefirmwaretypes_id` (`devicefirmwaretypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicefirmwaretypes`
--

DROP TABLE IF EXISTS `glpi_devicefirmwaretypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicefirmwaretypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicegenericmodels`
--

DROP TABLE IF EXISTS `glpi_devicegenericmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicegenericmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicegenerics`
--

DROP TABLE IF EXISTS `glpi_devicegenerics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicegenerics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicegenerictypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `devicegenericmodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicegenerictypes_id` (`devicegenerictypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicegenericmodels_id` (`devicegenericmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicegenerictypes`
--

DROP TABLE IF EXISTS `glpi_devicegenerictypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicegenerictypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicegraphiccardmodels`
--

DROP TABLE IF EXISTS `glpi_devicegraphiccardmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicegraphiccardmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicegraphiccards`
--

DROP TABLE IF EXISTS `glpi_devicegraphiccards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicegraphiccards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interfacetypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `memory_default` int NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicegraphiccardmodels_id` int unsigned DEFAULT NULL,
  `chipset` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `chipset` (`chipset`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicegraphiccardmodels_id` (`devicegraphiccardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_deviceharddrivemodels`
--

DROP TABLE IF EXISTS `glpi_deviceharddrivemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_deviceharddrivemodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_deviceharddrives`
--

DROP TABLE IF EXISTS `glpi_deviceharddrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_deviceharddrives` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rpm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interfacetypes_id` int unsigned NOT NULL DEFAULT '0',
  `cache` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `capacity_default` int NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `deviceharddrivemodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `deviceharddrivemodels_id` (`deviceharddrivemodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicememories`
--

DROP TABLE IF EXISTS `glpi_devicememories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicememories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequence` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `size_default` int NOT NULL DEFAULT '0',
  `devicememorytypes_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicememorymodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicememorytypes_id` (`devicememorytypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicememorymodels_id` (`devicememorymodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicememorymodels`
--

DROP TABLE IF EXISTS `glpi_devicememorymodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicememorymodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicememorytypes`
--

DROP TABLE IF EXISTS `glpi_devicememorytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicememorytypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicemotherboardmodels`
--

DROP TABLE IF EXISTS `glpi_devicemotherboardmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicemotherboardmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicemotherboards`
--

DROP TABLE IF EXISTS `glpi_devicemotherboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicemotherboards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chipset` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicemotherboardmodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicemotherboardmodels_id` (`devicemotherboardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicenetworkcardmodels`
--

DROP TABLE IF EXISTS `glpi_devicenetworkcardmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicenetworkcardmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicenetworkcards`
--

DROP TABLE IF EXISTS `glpi_devicenetworkcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicenetworkcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bandwidth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `mac_default` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicenetworkcardmodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicenetworkcardmodels_id` (`devicenetworkcardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicepcimodels`
--

DROP TABLE IF EXISTS `glpi_devicepcimodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicepcimodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicepcis`
--

DROP TABLE IF EXISTS `glpi_devicepcis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicepcis` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `devicenetworkcardmodels_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicepcimodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicenetworkcardmodels_id` (`devicenetworkcardmodels_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicepcimodels_id` (`devicepcimodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicepowersupplies`
--

DROP TABLE IF EXISTS `glpi_devicepowersupplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicepowersupplies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `power` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_atx` tinyint NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicepowersupplymodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicepowersupplymodels_id` (`devicepowersupplymodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicepowersupplymodels`
--

DROP TABLE IF EXISTS `glpi_devicepowersupplymodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicepowersupplymodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_deviceprocessormodels`
--

DROP TABLE IF EXISTS `glpi_deviceprocessormodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_deviceprocessormodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_deviceprocessors`
--

DROP TABLE IF EXISTS `glpi_deviceprocessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_deviceprocessors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequence` int NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `frequency_default` int NOT NULL DEFAULT '0',
  `nbcores_default` int DEFAULT NULL,
  `nbthreads_default` int DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `deviceprocessormodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `deviceprocessormodels_id` (`deviceprocessormodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicesensormodels`
--

DROP TABLE IF EXISTS `glpi_devicesensormodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicesensormodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicesensors`
--

DROP TABLE IF EXISTS `glpi_devicesensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicesensors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicesensortypes_id` int unsigned NOT NULL DEFAULT '0',
  `devicesensormodels_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicesensortypes_id` (`devicesensortypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicesensormodels_id` (`devicesensormodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicesensortypes`
--

DROP TABLE IF EXISTS `glpi_devicesensortypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicesensortypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicesimcards`
--

DROP TABLE IF EXISTS `glpi_devicesimcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicesimcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `voltage` int DEFAULT NULL,
  `devicesimcardtypes_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `allow_voip` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `devicesimcardtypes_id` (`devicesimcardtypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicesimcardtypes`
--

DROP TABLE IF EXISTS `glpi_devicesimcardtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicesimcardtypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicesoundcardmodels`
--

DROP TABLE IF EXISTS `glpi_devicesoundcardmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicesoundcardmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_devicesoundcards`
--

DROP TABLE IF EXISTS `glpi_devicesoundcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_devicesoundcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicesoundcardmodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicesoundcardmodels_id` (`devicesoundcardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_displaypreferences`
--

DROP TABLE IF EXISTS `glpi_displaypreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_displaypreferences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num` int NOT NULL DEFAULT '0',
  `rank` int NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`itemtype`,`num`),
  KEY `rank` (`rank`),
  KEY `num` (`num`),
  KEY `itemtype` (`itemtype`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_documentcategories`
--

DROP TABLE IF EXISTS `glpi_documentcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_documentcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `documentcategories_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`documentcategories_id`,`name`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_documents`
--

DROP TABLE IF EXISTS `glpi_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'for display and transfert',
  `filepath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'file storage path',
  `documentcategories_id` int unsigned NOT NULL DEFAULT '0',
  `mime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `sha1sum` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_blacklisted` tinyint NOT NULL DEFAULT '0',
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `tickets_id` (`tickets_id`),
  KEY `users_id` (`users_id`),
  KEY `documentcategories_id` (`documentcategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `sha1sum` (`sha1sum`),
  KEY `tag` (`tag`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_documents_items`
--

DROP TABLE IF EXISTS `glpi_documents_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_documents_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `documents_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned DEFAULT '0',
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`documents_id`,`itemtype`,`items_id`,`timeline_position`),
  KEY `item` (`itemtype`,`items_id`,`entities_id`,`is_recursive`),
  KEY `users_id` (`users_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_documenttypes`
--

DROP TABLE IF EXISTS `glpi_documenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_documenttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_uploadable` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`ext`),
  KEY `name` (`name`),
  KEY `is_uploadable` (`is_uploadable`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_domainrecords`
--

DROP TABLE IF EXISTS `glpi_domainrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_domainrecords` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `data_obj` text COLLATE utf8mb4_unicode_ci,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `domains_id` int unsigned NOT NULL DEFAULT '0',
  `domainrecordtypes_id` int unsigned NOT NULL DEFAULT '0',
  `ttl` int NOT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `domains_id` (`domains_id`),
  KEY `domainrecordtypes_id` (`domainrecordtypes_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_mod` (`date_mod`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_domainrecordtypes`
--

DROP TABLE IF EXISTS `glpi_domainrecordtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_domainrecordtypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fields` text COLLATE utf8mb4_unicode_ci,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_domainrelations`
--

DROP TABLE IF EXISTS `glpi_domainrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_domainrelations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_domains`
--

DROP TABLE IF EXISTS `glpi_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_domains` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `domaintypes_id` int unsigned NOT NULL DEFAULT '0',
  `date_expiration` timestamp NULL DEFAULT NULL,
  `date_domaincreation` timestamp NULL DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `domaintypes_id` (`domaintypes_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_mod` (`date_mod`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_template` (`is_template`),
  KEY `is_active` (`is_active`),
  KEY `date_expiration` (`date_expiration`),
  KEY `date_domaincreation` (`date_domaincreation`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_domains_items`
--

DROP TABLE IF EXISTS `glpi_domains_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_domains_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `domains_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domainrelations_id` int unsigned NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`domains_id`,`itemtype`,`items_id`),
  KEY `domainrelations_id` (`domainrelations_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_domaintypes`
--

DROP TABLE IF EXISTS `glpi_domaintypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_domaintypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_dropdowntranslations`
--

DROP TABLE IF EXISTS `glpi_dropdowntranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_dropdowntranslations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`language`,`field`),
  KEY `language` (`language`),
  KEY `field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_enclosuremodels`
--

DROP TABLE IF EXISTS `glpi_enclosuremodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_enclosuremodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8mb4_unicode_ci,
  `picture_rear` text COLLATE utf8mb4_unicode_ci,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_enclosures`
--

DROP TABLE IF EXISTS `glpi_enclosures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_enclosures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enclosuremodels_id` int unsigned DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `orientation` tinyint DEFAULT NULL,
  `power_supplies` tinyint NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to states (id)',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `enclosuremodels_id` (`enclosuremodels_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `states_id` (`states_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_entities`
--

DROP TABLE IF EXISTS `glpi_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_entities` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned DEFAULT '0',
  `completename` text COLLATE utf8mb4_unicode_ci,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL DEFAULT '0',
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_email_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noreply_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noreply_email_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `replyto_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `replyto_email_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_subject_tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_dn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authldaps_id` int unsigned NOT NULL DEFAULT '0',
  `mail_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_ldapfilter` text COLLATE utf8mb4_unicode_ci,
  `mailing_signature` text COLLATE utf8mb4_unicode_ci,
  `cartridges_alert_repeat` int NOT NULL DEFAULT '-2',
  `consumables_alert_repeat` int NOT NULL DEFAULT '-2',
  `use_licenses_alert` int NOT NULL DEFAULT '-2',
  `send_licenses_alert_before_delay` int NOT NULL DEFAULT '-2',
  `use_certificates_alert` int NOT NULL DEFAULT '-2',
  `send_certificates_alert_before_delay` int NOT NULL DEFAULT '-2',
  `certificates_alert_repeat_interval` int NOT NULL DEFAULT '-2',
  `use_contracts_alert` int NOT NULL DEFAULT '-2',
  `send_contracts_alert_before_delay` int NOT NULL DEFAULT '-2',
  `use_infocoms_alert` int NOT NULL DEFAULT '-2',
  `send_infocoms_alert_before_delay` int NOT NULL DEFAULT '-2',
  `use_reservations_alert` int NOT NULL DEFAULT '-2',
  `use_domains_alert` int NOT NULL DEFAULT '-2',
  `send_domains_alert_close_expiries_delay` int NOT NULL DEFAULT '-2',
  `send_domains_alert_expired_delay` int NOT NULL DEFAULT '-2',
  `autoclose_delay` int NOT NULL DEFAULT '-2',
  `autopurge_delay` int NOT NULL DEFAULT '-10',
  `notclosed_delay` int NOT NULL DEFAULT '-2',
  `calendars_strategy` tinyint NOT NULL DEFAULT '-2',
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `auto_assign_mode` int NOT NULL DEFAULT '-2',
  `tickettype` int NOT NULL DEFAULT '-2',
  `max_closedate` timestamp NULL DEFAULT NULL,
  `inquest_config` int NOT NULL DEFAULT '-2',
  `inquest_rate` int NOT NULL DEFAULT '0',
  `inquest_delay` int NOT NULL DEFAULT '-10',
  `inquest_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autofill_warranty_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-2',
  `autofill_use_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-2',
  `autofill_buy_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-2',
  `autofill_delivery_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-2',
  `autofill_order_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-2',
  `tickettemplates_strategy` tinyint NOT NULL DEFAULT '-2',
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `changetemplates_strategy` tinyint NOT NULL DEFAULT '-2',
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `problemtemplates_strategy` tinyint NOT NULL DEFAULT '-2',
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `entities_strategy_software` tinyint NOT NULL DEFAULT '-2',
  `entities_id_software` int unsigned NOT NULL DEFAULT '0',
  `default_contract_alert` int NOT NULL DEFAULT '-2',
  `default_infocom_alert` int NOT NULL DEFAULT '-2',
  `default_cartridges_alarm_threshold` int NOT NULL DEFAULT '-2',
  `default_consumables_alarm_threshold` int NOT NULL DEFAULT '-2',
  `delay_send_emails` int NOT NULL DEFAULT '-2',
  `is_notif_enable_default` int NOT NULL DEFAULT '-2',
  `inquest_duration` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autofill_decommission_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-2',
  `suppliers_as_private` int NOT NULL DEFAULT '-2',
  `anonymize_support_agents` int NOT NULL DEFAULT '-2',
  `display_users_initials` int NOT NULL DEFAULT '-2',
  `contracts_strategy_default` tinyint NOT NULL DEFAULT '-2',
  `contracts_id_default` int unsigned NOT NULL DEFAULT '0',
  `enable_custom_css` int NOT NULL DEFAULT '-2',
  `custom_css_code` text COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `altitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transfers_strategy` tinyint NOT NULL DEFAULT '-2',
  `transfers_id` int unsigned NOT NULL DEFAULT '0',
  `agent_base_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`name`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `tickettemplates_id` (`tickettemplates_id`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `problemtemplates_id` (`problemtemplates_id`),
  KEY `transfers_id` (`transfers_id`),
  KEY `authldaps_id` (`authldaps_id`),
  KEY `calendars_id` (`calendars_id`),
  KEY `entities_id_software` (`entities_id_software`),
  KEY `contracts_id_default` (`contracts_id_default`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_entities_knowbaseitems`
--

DROP TABLE IF EXISTS `glpi_entities_knowbaseitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_entities_knowbaseitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_entities_reminders`
--

DROP TABLE IF EXISTS `glpi_entities_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_entities_reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_entities_rssfeeds`
--

DROP TABLE IF EXISTS `glpi_entities_rssfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_entities_rssfeeds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_events`
--

DROP TABLE IF EXISTS `glpi_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `level` (`level`),
  KEY `item` (`type`,`items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_fieldblacklists`
--

DROP TABLE IF EXISTS `glpi_fieldblacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_fieldblacklists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_fieldunicities`
--

DROP TABLE IF EXISTS `glpi_fieldunicities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_fieldunicities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `fields` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `action_refuse` tinyint NOT NULL DEFAULT '0',
  `action_notify` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores field unicity criterias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_filesystems`
--

DROP TABLE IF EXISTS `glpi_filesystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_filesystems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_fqdns`
--

DROP TABLE IF EXISTS `glpi_fqdns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_fqdns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fqdn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `fqdn` (`fqdn`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_groups`
--

DROP TABLE IF EXISTS `glpi_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `ldap_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_value` text COLLATE utf8mb4_unicode_ci,
  `ldap_group_dn` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  `is_requester` tinyint NOT NULL DEFAULT '1',
  `is_watcher` tinyint NOT NULL DEFAULT '1',
  `is_assign` tinyint NOT NULL DEFAULT '1',
  `is_task` tinyint NOT NULL DEFAULT '1',
  `is_notify` tinyint NOT NULL DEFAULT '1',
  `is_itemgroup` tinyint NOT NULL DEFAULT '1',
  `is_usergroup` tinyint NOT NULL DEFAULT '1',
  `is_manager` tinyint NOT NULL DEFAULT '1',
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `ldap_field` (`ldap_field`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `ldap_value` (`ldap_value`(200)),
  KEY `ldap_group_dn` (`ldap_group_dn`(200)),
  KEY `groups_id` (`groups_id`),
  KEY `is_requester` (`is_requester`),
  KEY `is_watcher` (`is_watcher`),
  KEY `is_assign` (`is_assign`),
  KEY `is_notify` (`is_notify`),
  KEY `is_itemgroup` (`is_itemgroup`),
  KEY `is_usergroup` (`is_usergroup`),
  KEY `is_manager` (`is_manager`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_groups_knowbaseitems`
--

DROP TABLE IF EXISTS `glpi_groups_knowbaseitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_groups_knowbaseitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `no_entity_restriction` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_groups_problems`
--

DROP TABLE IF EXISTS `glpi_groups_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_groups_problems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_groups_reminders`
--

DROP TABLE IF EXISTS `glpi_groups_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_groups_reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `no_entity_restriction` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_groups_rssfeeds`
--

DROP TABLE IF EXISTS `glpi_groups_rssfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_groups_rssfeeds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `no_entity_restriction` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_groups_tickets`
--

DROP TABLE IF EXISTS `glpi_groups_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_groups_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_groups_users`
--

DROP TABLE IF EXISTS `glpi_groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_groups_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `is_manager` tinyint NOT NULL DEFAULT '0',
  `is_userdelegate` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`groups_id`),
  KEY `groups_id` (`groups_id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_manager` (`is_manager`),
  KEY `is_userdelegate` (`is_userdelegate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_holidays`
--

DROP TABLE IF EXISTS `glpi_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_holidays` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_perpetual` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `is_perpetual` (`is_perpetual`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_imageformats`
--

DROP TABLE IF EXISTS `glpi_imageformats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_imageformats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_imageresolutions`
--

DROP TABLE IF EXISTS `glpi_imageresolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_imageresolutions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_video` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `is_video` (`is_video`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_impactcompounds`
--

DROP TABLE IF EXISTS `glpi_impactcompounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_impactcompounds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_impactcontexts`
--

DROP TABLE IF EXISTS `glpi_impactcontexts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_impactcontexts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `positions` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `zoom` float NOT NULL DEFAULT '0',
  `pan_x` float NOT NULL DEFAULT '0',
  `pan_y` float NOT NULL DEFAULT '0',
  `impact_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `depends_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `impact_and_depends_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `show_depends` tinyint NOT NULL DEFAULT '1',
  `show_impact` tinyint NOT NULL DEFAULT '1',
  `max_depth` int NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_impactitems`
--

DROP TABLE IF EXISTS `glpi_impactitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_impactitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `impactcontexts_id` int unsigned NOT NULL DEFAULT '0',
  `is_slave` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `source` (`itemtype`,`items_id`),
  KEY `parent_id` (`parent_id`),
  KEY `impactcontexts_id` (`impactcontexts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_impactrelations`
--

DROP TABLE IF EXISTS `glpi_impactrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_impactrelations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype_source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `items_id_source` int unsigned NOT NULL DEFAULT '0',
  `itemtype_impacted` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `items_id_impacted` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype_source`,`items_id_source`,`itemtype_impacted`,`items_id_impacted`),
  KEY `impacted_asset` (`itemtype_impacted`,`items_id_impacted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_infocoms`
--

DROP TABLE IF EXISTS `glpi_infocoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_infocoms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `buy_date` date DEFAULT NULL,
  `use_date` date DEFAULT NULL,
  `warranty_duration` int NOT NULL DEFAULT '0',
  `warranty_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suppliers_id` int unsigned NOT NULL DEFAULT '0',
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `immo_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `warranty_value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `sink_time` int NOT NULL DEFAULT '0',
  `sink_type` int NOT NULL DEFAULT '0',
  `sink_coeff` float NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `bill` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budgets_id` int unsigned NOT NULL DEFAULT '0',
  `alert` int NOT NULL DEFAULT '0',
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `inventory_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `decommission_date` timestamp NULL DEFAULT NULL,
  `businesscriticities_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `buy_date` (`buy_date`),
  KEY `alert` (`alert`),
  KEY `budgets_id` (`budgets_id`),
  KEY `suppliers_id` (`suppliers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `businesscriticities_id` (`businesscriticities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_interfacetypes`
--

DROP TABLE IF EXISTS `glpi_interfacetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_interfacetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_ipaddresses`
--

DROP TABLE IF EXISTS `glpi_ipaddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_ipaddresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` tinyint unsigned DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `binary_0` int unsigned NOT NULL DEFAULT '0',
  `binary_1` int unsigned NOT NULL DEFAULT '0',
  `binary_2` int unsigned NOT NULL DEFAULT '0',
  `binary_3` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `mainitems_id` int unsigned NOT NULL DEFAULT '0',
  `mainitemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `binary` (`binary_0`,`binary_1`,`binary_2`,`binary_3`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  KEY `mainitem` (`mainitemtype`,`mainitems_id`,`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_ipaddresses_ipnetworks`
--

DROP TABLE IF EXISTS `glpi_ipaddresses_ipnetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_ipaddresses_ipnetworks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ipaddresses_id` int unsigned NOT NULL DEFAULT '0',
  `ipnetworks_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`ipaddresses_id`,`ipnetworks_id`),
  KEY `ipnetworks_id` (`ipnetworks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_ipnetworks`
--

DROP TABLE IF EXISTS `glpi_ipnetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_ipnetworks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `ipnetworks_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  `addressable` tinyint NOT NULL DEFAULT '0',
  `version` tinyint unsigned DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_0` int unsigned NOT NULL DEFAULT '0',
  `address_1` int unsigned NOT NULL DEFAULT '0',
  `address_2` int unsigned NOT NULL DEFAULT '0',
  `address_3` int unsigned NOT NULL DEFAULT '0',
  `netmask` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `netmask_0` int unsigned NOT NULL DEFAULT '0',
  `netmask_1` int unsigned NOT NULL DEFAULT '0',
  `netmask_2` int unsigned NOT NULL DEFAULT '0',
  `netmask_3` int unsigned NOT NULL DEFAULT '0',
  `gateway` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_0` int unsigned NOT NULL DEFAULT '0',
  `gateway_1` int unsigned NOT NULL DEFAULT '0',
  `gateway_2` int unsigned NOT NULL DEFAULT '0',
  `gateway_3` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `network_definition` (`entities_id`,`address`,`netmask`),
  KEY `address` (`address_0`,`address_1`,`address_2`,`address_3`),
  KEY `netmask` (`netmask_0`,`netmask_1`,`netmask_2`,`netmask_3`),
  KEY `gateway` (`gateway_0`,`gateway_1`,`gateway_2`,`gateway_3`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `ipnetworks_id` (`ipnetworks_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_ipnetworks_vlans`
--

DROP TABLE IF EXISTS `glpi_ipnetworks_vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_ipnetworks_vlans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ipnetworks_id` int unsigned NOT NULL DEFAULT '0',
  `vlans_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`ipnetworks_id`,`vlans_id`),
  KEY `vlans_id` (`vlans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_clusters`
--

DROP TABLE IF EXISTS `glpi_items_clusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_clusters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `clusters_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`clusters_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicebatteries`
--

DROP TABLE IF EXISTS `glpi_items_devicebatteries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicebatteries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicebatteries_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturing_date` date DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `real_capacity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicebatteries_id` (`devicebatteries_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicecameras`
--

DROP TABLE IF EXISTS `glpi_items_devicecameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicecameras` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicecameras_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `items_id` (`items_id`),
  KEY `devicecameras_id` (`devicecameras_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicecameras_imageformats`
--

DROP TABLE IF EXISTS `glpi_items_devicecameras_imageformats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicecameras_imageformats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_devicecameras_id` int unsigned NOT NULL DEFAULT '0',
  `imageformats_id` int unsigned NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `items_devicecameras_id` (`items_devicecameras_id`),
  KEY `imageformats_id` (`imageformats_id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicecameras_imageresolutions`
--

DROP TABLE IF EXISTS `glpi_items_devicecameras_imageresolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicecameras_imageresolutions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_devicecameras_id` int unsigned NOT NULL DEFAULT '0',
  `imageresolutions_id` int unsigned NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `items_devicecameras_id` (`items_devicecameras_id`),
  KEY `imageresolutions_id` (`imageresolutions_id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicecases`
--

DROP TABLE IF EXISTS `glpi_items_devicecases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicecases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicecases_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicecases_id` (`devicecases_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicecontrols`
--

DROP TABLE IF EXISTS `glpi_items_devicecontrols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicecontrols` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicecontrols_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicecontrols_id` (`devicecontrols_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicedrives`
--

DROP TABLE IF EXISTS `glpi_items_devicedrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicedrives` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicedrives_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicedrives_id` (`devicedrives_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicefirmwares`
--

DROP TABLE IF EXISTS `glpi_items_devicefirmwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicefirmwares` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicefirmwares_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicefirmwares_id` (`devicefirmwares_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicegenerics`
--

DROP TABLE IF EXISTS `glpi_items_devicegenerics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicegenerics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicegenerics_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicegenerics_id` (`devicegenerics_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicegraphiccards`
--

DROP TABLE IF EXISTS `glpi_items_devicegraphiccards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicegraphiccards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicegraphiccards_id` int unsigned NOT NULL DEFAULT '0',
  `memory` int NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicegraphiccards_id` (`devicegraphiccards_id`),
  KEY `specificity` (`memory`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_deviceharddrives`
--

DROP TABLE IF EXISTS `glpi_items_deviceharddrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_deviceharddrives` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceharddrives_id` int unsigned NOT NULL DEFAULT '0',
  `capacity` int NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `busID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `deviceharddrives_id` (`deviceharddrives_id`),
  KEY `specificity` (`capacity`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicememories`
--

DROP TABLE IF EXISTS `glpi_items_devicememories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicememories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicememories_id` int unsigned NOT NULL DEFAULT '0',
  `size` int NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `busID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicememories_id` (`devicememories_id`),
  KEY `specificity` (`size`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicemotherboards`
--

DROP TABLE IF EXISTS `glpi_items_devicemotherboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicemotherboards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicemotherboards_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicemotherboards_id` (`devicemotherboards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicenetworkcards`
--

DROP TABLE IF EXISTS `glpi_items_devicenetworkcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicenetworkcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicenetworkcards_id` int unsigned NOT NULL DEFAULT '0',
  `mac` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicenetworkcards_id` (`devicenetworkcards_id`),
  KEY `specificity` (`mac`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicepcis`
--

DROP TABLE IF EXISTS `glpi_items_devicepcis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicepcis` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicepcis_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicepcis_id` (`devicepcis_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicepowersupplies`
--

DROP TABLE IF EXISTS `glpi_items_devicepowersupplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicepowersupplies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicepowersupplies_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicepowersupplies_id` (`devicepowersupplies_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_deviceprocessors`
--

DROP TABLE IF EXISTS `glpi_items_deviceprocessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_deviceprocessors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceprocessors_id` int unsigned NOT NULL DEFAULT '0',
  `frequency` int NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `nbcores` int DEFAULT NULL,
  `nbthreads` int DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `busID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `deviceprocessors_id` (`deviceprocessors_id`),
  KEY `specificity` (`frequency`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `nbcores` (`nbcores`),
  KEY `nbthreads` (`nbthreads`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicesensors`
--

DROP TABLE IF EXISTS `glpi_items_devicesensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicesensors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicesensors_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicesensors_id` (`devicesensors_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicesimcards`
--

DROP TABLE IF EXISTS `glpi_items_devicesimcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicesimcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to various table, according to itemtype (id)',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `devicesimcards_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `lines_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `pin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pin2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `puk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `puk2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `msin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `devicesimcards_id` (`devicesimcards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `states_id` (`states_id`),
  KEY `locations_id` (`locations_id`),
  KEY `lines_id` (`lines_id`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_devicesoundcards`
--

DROP TABLE IF EXISTS `glpi_items_devicesoundcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_devicesoundcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `devicesoundcards_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicesoundcards_id` (`devicesoundcards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_disks`
--

DROP TABLE IF EXISTS `glpi_items_disks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_disks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mountpoint` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesystems_id` int unsigned NOT NULL DEFAULT '0',
  `totalsize` int NOT NULL DEFAULT '0',
  `freesize` int NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `encryption_status` int NOT NULL DEFAULT '0',
  `encryption_tool` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encryption_algorithm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encryption_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `device` (`device`),
  KEY `mountpoint` (`mountpoint`),
  KEY `totalsize` (`totalsize`),
  KEY `freesize` (`freesize`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `filesystems_id` (`filesystems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_enclosures`
--

DROP TABLE IF EXISTS `glpi_items_enclosures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_enclosures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `enclosures_id` int unsigned NOT NULL,
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int unsigned NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`,`items_id`),
  KEY `relation` (`enclosures_id`,`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_kanbans`
--

DROP TABLE IF EXISTS `glpi_items_kanbans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_kanbans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int unsigned DEFAULT NULL,
  `users_id` int unsigned NOT NULL,
  `state` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`users_id`),
  KEY `users_id` (`users_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_operatingsystems`
--

DROP TABLE IF EXISTS `glpi_items_operatingsystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_operatingsystems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operatingsystems_id` int unsigned NOT NULL DEFAULT '0',
  `operatingsystemversions_id` int unsigned NOT NULL DEFAULT '0',
  `operatingsystemservicepacks_id` int unsigned NOT NULL DEFAULT '0',
  `operatingsystemarchitectures_id` int unsigned NOT NULL DEFAULT '0',
  `operatingsystemkernelversions_id` int unsigned NOT NULL DEFAULT '0',
  `license_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licenseid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operatingsystemeditions_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `install_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`items_id`,`itemtype`,`operatingsystems_id`,`operatingsystemarchitectures_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `operatingsystems_id` (`operatingsystems_id`),
  KEY `operatingsystemservicepacks_id` (`operatingsystemservicepacks_id`),
  KEY `operatingsystemversions_id` (`operatingsystemversions_id`),
  KEY `operatingsystemarchitectures_id` (`operatingsystemarchitectures_id`),
  KEY `operatingsystemkernelversions_id` (`operatingsystemkernelversions_id`),
  KEY `operatingsystemeditions_id` (`operatingsystemeditions_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_problems`
--

DROP TABLE IF EXISTS `glpi_items_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_problems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_projects`
--

DROP TABLE IF EXISTS `glpi_items_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_projects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_racks`
--

DROP TABLE IF EXISTS `glpi_items_racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_racks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `racks_id` int unsigned NOT NULL,
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int unsigned NOT NULL,
  `position` int NOT NULL,
  `orientation` tinyint DEFAULT NULL,
  `bgcolor` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hpos` tinyint NOT NULL DEFAULT '0',
  `is_reserved` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`,`items_id`,`is_reserved`),
  KEY `relation` (`racks_id`,`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_remotemanagements`
--

DROP TABLE IF EXISTS `glpi_items_remotemanagements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_remotemanagements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `remoteid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_softwarelicenses`
--

DROP TABLE IF EXISTS `glpi_items_softwarelicenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_softwarelicenses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `softwarelicenses_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `softwarelicenses_id` (`softwarelicenses_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_softwareversions`
--

DROP TABLE IF EXISTS `glpi_items_softwareversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_softwareversions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `softwareversions_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted_item` tinyint NOT NULL DEFAULT '0',
  `is_template_item` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `date_install` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`softwareversions_id`),
  KEY `softwareversions_id` (`softwareversions_id`),
  KEY `computers_info` (`entities_id`,`is_template_item`,`is_deleted_item`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted_item` (`is_deleted_item`),
  KEY `is_template_item` (`is_template_item`),
  KEY `date_install` (`date_install`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_items_tickets`
--

DROP TABLE IF EXISTS `glpi_items_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_items_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_itilcategories`
--

DROP TABLE IF EXISTS `glpi_itilcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_itilcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `itilcategories_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8mb4_unicode_ci,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL DEFAULT '0',
  `knowbaseitemcategories_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  `is_helpdeskvisible` tinyint NOT NULL DEFAULT '1',
  `tickettemplates_id_incident` int unsigned NOT NULL DEFAULT '0',
  `tickettemplates_id_demand` int unsigned NOT NULL DEFAULT '0',
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `is_incident` int NOT NULL DEFAULT '1',
  `is_request` int NOT NULL DEFAULT '1',
  `is_problem` int NOT NULL DEFAULT '1',
  `is_change` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `tickettemplates_id_incident` (`tickettemplates_id_incident`),
  KEY `tickettemplates_id_demand` (`tickettemplates_id_demand`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `problemtemplates_id` (`problemtemplates_id`),
  KEY `is_incident` (`is_incident`),
  KEY `is_request` (`is_request`),
  KEY `is_problem` (`is_problem`),
  KEY `is_change` (`is_change`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_itilfollowups`
--

DROP TABLE IF EXISTS `glpi_itilfollowups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_itilfollowups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_editor` int unsigned NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint NOT NULL DEFAULT '0',
  `requesttypes_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  `sourceitems_id` int unsigned NOT NULL DEFAULT '0',
  `sourceof_items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `is_private` (`is_private`),
  KEY `requesttypes_id` (`requesttypes_id`),
  KEY `sourceitems_id` (`sourceitems_id`),
  KEY `sourceof_items_id` (`sourceof_items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_itilfollowuptemplates`
--

DROP TABLE IF EXISTS `glpi_itilfollowuptemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_itilfollowuptemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `requesttypes_id` int unsigned NOT NULL DEFAULT '0',
  `is_private` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `requesttypes_id` (`requesttypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_itils_projects`
--

DROP TABLE IF EXISTS `glpi_itils_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_itils_projects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`projects_id`),
  KEY `projects_id` (`projects_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_itilsolutions`
--

DROP TABLE IF EXISTS `glpi_itilsolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_itilsolutions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `solutiontypes_id` int unsigned NOT NULL DEFAULT '0',
  `solutiontype_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_approval` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id_editor` int unsigned NOT NULL DEFAULT '0',
  `users_id_approval` int unsigned NOT NULL DEFAULT '0',
  `user_name_approval` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `itilfollowups_id` int unsigned DEFAULT NULL COMMENT 'Followup reference on reject or approve a solution',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `users_id_approval` (`users_id_approval`),
  KEY `status` (`status`),
  KEY `itilfollowups_id` (`itilfollowups_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_knowbaseitemcategories`
--

DROP TABLE IF EXISTS `glpi_knowbaseitemcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_knowbaseitemcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `knowbaseitemcategories_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8mb4_unicode_ci,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL DEFAULT '0',
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`knowbaseitemcategories_id`,`name`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_knowbaseitems`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_knowbaseitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci,
  `answer` longtext COLLATE utf8mb4_unicode_ci,
  `is_faq` tinyint NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `view` int NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `begin_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `is_faq` (`is_faq`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  FULLTEXT KEY `fulltext` (`name`,`answer`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `answer` (`answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_knowbaseitems_comments`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_knowbaseitems_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `parent_comment_id` int unsigned DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `parent_comment_id` (`parent_comment_id`),
  KEY `users_id` (`users_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_knowbaseitems_items`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_knowbaseitems_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`knowbaseitems_id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_knowbaseitems_knowbaseitemcategories`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_knowbaseitemcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_knowbaseitems_knowbaseitemcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL DEFAULT '0',
  `knowbaseitemcategories_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_knowbaseitems_profiles`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_knowbaseitems_profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL DEFAULT '0',
  `profiles_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `no_entity_restriction` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_knowbaseitems_revisions`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_knowbaseitems_revisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL,
  `revision` int NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `answer` longtext COLLATE utf8mb4_unicode_ci,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`knowbaseitems_id`,`revision`,`language`),
  KEY `revision` (`revision`),
  KEY `users_id` (`users_id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_knowbaseitems_users`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_knowbaseitems_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_knowbaseitemtranslations`
--

DROP TABLE IF EXISTS `glpi_knowbaseitemtranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_knowbaseitemtranslations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `answer` longtext COLLATE utf8mb4_unicode_ci,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`knowbaseitems_id`,`language`),
  KEY `users_id` (`users_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  FULLTEXT KEY `fulltext` (`name`,`answer`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `answer` (`answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_lineoperators`
--

DROP TABLE IF EXISTS `glpi_lineoperators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_lineoperators` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `mcc` int DEFAULT NULL,
  `mnc` int DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`mcc`,`mnc`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_lines`
--

DROP TABLE IF EXISTS `glpi_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_lines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `caller_num` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `caller_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `lineoperators_id` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `linetypes_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `users_id` (`users_id`),
  KEY `lineoperators_id` (`lineoperators_id`),
  KEY `groups_id` (`groups_id`),
  KEY `linetypes_id` (`linetypes_id`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_linetypes`
--

DROP TABLE IF EXISTS `glpi_linetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_linetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_links`
--

DROP TABLE IF EXISTS `glpi_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `open_window` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_links_itemtypes`
--

DROP TABLE IF EXISTS `glpi_links_itemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_links_itemtypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `links_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`links_id`),
  KEY `links_id` (`links_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_locations`
--

DROP TABLE IF EXISTS `glpi_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8mb4_unicode_ci,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `altitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`locations_id`,`name`),
  KEY `locations_id` (`locations_id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_lockedfields`
--

DROP TABLE IF EXISTS `glpi_lockedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_lockedfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `field` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_global` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`field`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_global` (`is_global`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_logs`
--

DROP TABLE IF EXISTS `glpi_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype_link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `linked_action` int NOT NULL DEFAULT '0' COMMENT 'see define.php HISTORY_* constant',
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `id_search_option` int NOT NULL DEFAULT '0' COMMENT 'see search.constant.php for value',
  `old_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `itemtype_link` (`itemtype_link`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `id_search_option` (`id_search_option`)
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_mailcollectors`
--

DROP TABLE IF EXISTS `glpi_mailcollectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_mailcollectors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesize_max` int NOT NULL DEFAULT '2097152',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `passwd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refused` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `errors` int NOT NULL DEFAULT '0',
  `use_mail_date` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `requester_field` int NOT NULL DEFAULT '0',
  `add_cc_to_observer` tinyint NOT NULL DEFAULT '0',
  `collect_only_unread` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_manuallinks`
--

DROP TABLE IF EXISTS `glpi_manuallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_manuallinks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(8096) COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_window` tinyint NOT NULL DEFAULT '1',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `items_id` (`items_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_manufacturers`
--

DROP TABLE IF EXISTS `glpi_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_manufacturers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_monitormodels`
--

DROP TABLE IF EXISTS `glpi_monitormodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_monitormodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8mb4_unicode_ci,
  `picture_rear` text COLLATE utf8mb4_unicode_ci,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_monitors`
--

DROP TABLE IF EXISTS `glpi_monitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_monitors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` decimal(5,2) NOT NULL DEFAULT '0.00',
  `have_micro` tinyint NOT NULL DEFAULT '0',
  `have_speaker` tinyint NOT NULL DEFAULT '0',
  `have_subd` tinyint NOT NULL DEFAULT '0',
  `have_bnc` tinyint NOT NULL DEFAULT '0',
  `have_dvi` tinyint NOT NULL DEFAULT '0',
  `have_pivot` tinyint NOT NULL DEFAULT '0',
  `have_hdmi` tinyint NOT NULL DEFAULT '0',
  `have_displayport` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `monitortypes_id` int unsigned NOT NULL DEFAULT '0',
  `monitormodels_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_global` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `monitormodels_id` (`monitormodels_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `monitortypes_id` (`monitortypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_monitortypes`
--

DROP TABLE IF EXISTS `glpi_monitortypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_monitortypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkaliases`
--

DROP TABLE IF EXISTS `glpi_networkaliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkaliases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `networknames_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fqdns_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `networknames_id` (`networknames_id`),
  KEY `fqdns_id` (`fqdns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkequipmentmodels`
--

DROP TABLE IF EXISTS `glpi_networkequipmentmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkequipmentmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8mb4_unicode_ci,
  `picture_rear` text COLLATE utf8mb4_unicode_ci,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkequipments`
--

DROP TABLE IF EXISTS `glpi_networkequipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkequipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ram` int unsigned DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `networks_id` int unsigned NOT NULL DEFAULT '0',
  `networkequipmenttypes_id` int unsigned NOT NULL DEFAULT '0',
  `networkequipmentmodels_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `sysdescr` text COLLATE utf8mb4_unicode_ci,
  `cpu` int NOT NULL DEFAULT '0',
  `uptime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `snmpcredentials_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `networkequipmentmodels_id` (`networkequipmentmodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `networkequipmenttypes_id` (`networkequipmenttypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `snmpcredentials_id` (`snmpcredentials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkequipmenttypes`
--

DROP TABLE IF EXISTS `glpi_networkequipmenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkequipmenttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkinterfaces`
--

DROP TABLE IF EXISTS `glpi_networkinterfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkinterfaces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networknames`
--

DROP TABLE IF EXISTS `glpi_networknames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networknames` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `fqdns_id` int unsigned NOT NULL DEFAULT '0',
  `ipnetworks_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `FQDN` (`name`,`fqdns_id`),
  KEY `fqdns_id` (`fqdns_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `ipnetworks_id` (`ipnetworks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkportaggregates`
--

DROP TABLE IF EXISTS `glpi_networkportaggregates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkportaggregates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `networkports_id_list` text COLLATE utf8mb4_unicode_ci COMMENT 'array of associated networkports_id',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkportaliases`
--

DROP TABLE IF EXISTS `glpi_networkportaliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkportaliases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `networkports_id_alias` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `networkports_id_alias` (`networkports_id_alias`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkportconnectionlogs`
--

DROP TABLE IF EXISTS `glpi_networkportconnectionlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkportconnectionlogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT NULL,
  `connected` tinyint NOT NULL DEFAULT '0',
  `networkports_id_source` int unsigned NOT NULL DEFAULT '0',
  `networkports_id_destination` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `networkports_id_source` (`networkports_id_source`),
  KEY `networkports_id_destination` (`networkports_id_destination`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkportdialups`
--

DROP TABLE IF EXISTS `glpi_networkportdialups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkportdialups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkportethernets`
--

DROP TABLE IF EXISTS `glpi_networkportethernets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkportethernets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `items_devicenetworkcards_id` int unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'T, LX, SX',
  `speed` int NOT NULL DEFAULT '10' COMMENT 'Mbit/s: 10, 100, 1000, 10000',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `type` (`type`),
  KEY `speed` (`speed`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkportfiberchannels`
--

DROP TABLE IF EXISTS `glpi_networkportfiberchannels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkportfiberchannels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `items_devicenetworkcards_id` int unsigned NOT NULL DEFAULT '0',
  `networkportfiberchanneltypes_id` int unsigned NOT NULL DEFAULT '0',
  `wwn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `speed` int NOT NULL DEFAULT '10' COMMENT 'Mbit/s: 10, 100, 1000, 10000',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `type` (`networkportfiberchanneltypes_id`),
  KEY `wwn` (`wwn`),
  KEY `speed` (`speed`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkportfiberchanneltypes`
--

DROP TABLE IF EXISTS `glpi_networkportfiberchanneltypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkportfiberchanneltypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkportlocals`
--

DROP TABLE IF EXISTS `glpi_networkportlocals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkportlocals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkportmetrics`
--

DROP TABLE IF EXISTS `glpi_networkportmetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkportmetrics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `ifinbytes` bigint NOT NULL DEFAULT '0',
  `ifinerrors` bigint NOT NULL DEFAULT '0',
  `ifoutbytes` bigint NOT NULL DEFAULT '0',
  `ifouterrors` bigint NOT NULL DEFAULT '0',
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id`,`date`),
  KEY `date` (`date`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkports`
--

DROP TABLE IF EXISTS `glpi_networkports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `logical_number` int NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instantiation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mac` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `ifmtu` int NOT NULL DEFAULT '0',
  `ifspeed` bigint NOT NULL DEFAULT '0',
  `ifinternalstatus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifconnectionstatus` int NOT NULL DEFAULT '0',
  `iflastchange` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifinbytes` bigint NOT NULL DEFAULT '0',
  `ifinerrors` bigint NOT NULL DEFAULT '0',
  `ifoutbytes` bigint NOT NULL DEFAULT '0',
  `ifouterrors` bigint NOT NULL DEFAULT '0',
  `ifstatus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifdescr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifalias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `portduplex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trunk` tinyint NOT NULL DEFAULT '0',
  `lastup` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `mac` (`mac`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkports_networkports`
--

DROP TABLE IF EXISTS `glpi_networkports_networkports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkports_networkports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id_1` int unsigned NOT NULL DEFAULT '0',
  `networkports_id_2` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id_1`,`networkports_id_2`),
  KEY `networkports_id_2` (`networkports_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkports_vlans`
--

DROP TABLE IF EXISTS `glpi_networkports_vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkports_vlans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `vlans_id` int unsigned NOT NULL DEFAULT '0',
  `tagged` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id`,`vlans_id`),
  KEY `vlans_id` (`vlans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkporttypes`
--

DROP TABLE IF EXISTS `glpi_networkporttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkporttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `value_decimal` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_importable` tinyint NOT NULL DEFAULT '0',
  `instantiation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `value_decimal` (`value_decimal`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_importable` (`is_importable`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networkportwifis`
--

DROP TABLE IF EXISTS `glpi_networkportwifis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networkportwifis` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `items_devicenetworkcards_id` int unsigned NOT NULL DEFAULT '0',
  `wifinetworks_id` int unsigned NOT NULL DEFAULT '0',
  `networkportwifis_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'only useful in case of Managed node',
  `version` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'a, a/b, a/b/g, a/b/g/n, a/b/g/n/y',
  `mode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ad-hoc, managed, master, repeater, secondary, monitor, auto',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `essid` (`wifinetworks_id`),
  KEY `version` (`version`),
  KEY `mode` (`mode`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `networkportwifis_id` (`networkportwifis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_networks`
--

DROP TABLE IF EXISTS `glpi_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_networks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_notepads`
--

DROP TABLE IF EXISTS `glpi_notepads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_notepads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_lastupdater` int unsigned NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_notifications`
--

DROP TABLE IF EXISTS `glpi_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `allow_response` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `itemtype` (`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_notifications_notificationtemplates`
--

DROP TABLE IF EXISTS `glpi_notifications_notificationtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_notifications_notificationtemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `notifications_id` int unsigned NOT NULL DEFAULT '0',
  `mode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'See Notification_NotificationTemplate::MODE_* constants',
  `notificationtemplates_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`notifications_id`,`mode`,`notificationtemplates_id`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`),
  KEY `mode` (`mode`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_notificationtargets`
--

DROP TABLE IF EXISTS `glpi_notificationtargets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_notificationtargets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `notifications_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `items` (`type`,`items_id`),
  KEY `notifications_id` (`notifications_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_notificationtemplates`
--

DROP TABLE IF EXISTS `glpi_notificationtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_notificationtemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `css` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemtype` (`itemtype`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_notificationtemplatetranslations`
--

DROP TABLE IF EXISTS `glpi_notificationtemplatetranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_notificationtemplatetranslations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `notificationtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_notimportedemails`
--

DROP TABLE IF EXISTS `glpi_notimportedemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_notimportedemails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailcollectors_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `messageid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` int NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `mailcollectors_id` (`mailcollectors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_objectlocks`
--

DROP TABLE IF EXISTS `glpi_objectlocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_objectlocks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Type of locked object',
  `items_id` int unsigned NOT NULL COMMENT 'RELATION to various tables, according to itemtype (ID)',
  `users_id` int unsigned NOT NULL COMMENT 'id of the locker',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`,`items_id`),
  KEY `users_id` (`users_id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_olalevelactions`
--

DROP TABLE IF EXISTS `glpi_olalevelactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_olalevelactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `olalevels_id` int unsigned NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `olalevels_id` (`olalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_olalevelcriterias`
--

DROP TABLE IF EXISTS `glpi_olalevelcriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_olalevelcriterias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `olalevels_id` int unsigned NOT NULL DEFAULT '0',
  `criteria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` int NOT NULL DEFAULT '0' COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `olalevels_id` (`olalevels_id`),
  KEY `condition` (`condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_olalevels`
--

DROP TABLE IF EXISTS `glpi_olalevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_olalevels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `olas_id` int unsigned NOT NULL DEFAULT '0',
  `execution_time` int NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `match` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `olas_id` (`olas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_olalevels_tickets`
--

DROP TABLE IF EXISTS `glpi_olalevels_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_olalevels_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `olalevels_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`olalevels_id`),
  KEY `olalevels_id` (`olalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_olas`
--

DROP TABLE IF EXISTS `glpi_olas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_olas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `number_time` int NOT NULL,
  `use_ticket_calendar` tinyint NOT NULL DEFAULT '0',
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `definition_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_of_working_day` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `slms_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `calendars_id` (`calendars_id`),
  KEY `slms_id` (`slms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_operatingsystemarchitectures`
--

DROP TABLE IF EXISTS `glpi_operatingsystemarchitectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_operatingsystemarchitectures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_operatingsystemeditions`
--

DROP TABLE IF EXISTS `glpi_operatingsystemeditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_operatingsystemeditions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_operatingsystemkernels`
--

DROP TABLE IF EXISTS `glpi_operatingsystemkernels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_operatingsystemkernels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_operatingsystemkernelversions`
--

DROP TABLE IF EXISTS `glpi_operatingsystemkernelversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_operatingsystemkernelversions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `operatingsystemkernels_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `operatingsystemkernels_id` (`operatingsystemkernels_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_operatingsystems`
--

DROP TABLE IF EXISTS `glpi_operatingsystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_operatingsystems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_operatingsystemservicepacks`
--

DROP TABLE IF EXISTS `glpi_operatingsystemservicepacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_operatingsystemservicepacks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_operatingsystemversions`
--

DROP TABLE IF EXISTS `glpi_operatingsystemversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_operatingsystemversions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_passivedcequipmentmodels`
--

DROP TABLE IF EXISTS `glpi_passivedcequipmentmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_passivedcequipmentmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8mb4_unicode_ci,
  `picture_rear` text COLLATE utf8mb4_unicode_ci,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_passivedcequipments`
--

DROP TABLE IF EXISTS `glpi_passivedcequipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_passivedcequipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passivedcequipmentmodels_id` int unsigned DEFAULT NULL,
  `passivedcequipmenttypes_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to states (id)',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `passivedcequipmentmodels_id` (`passivedcequipmentmodels_id`),
  KEY `passivedcequipmenttypes_id` (`passivedcequipmenttypes_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `states_id` (`states_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_passivedcequipmenttypes`
--

DROP TABLE IF EXISTS `glpi_passivedcequipmenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_passivedcequipmenttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_pcivendors`
--

DROP TABLE IF EXISTS `glpi_pcivendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_pcivendors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `vendorid` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceid` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`vendorid`,`deviceid`),
  KEY `deviceid` (`deviceid`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_pdumodels`
--

DROP TABLE IF EXISTS `glpi_pdumodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_pdumodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `max_power` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8mb4_unicode_ci,
  `picture_rear` text COLLATE utf8mb4_unicode_ci,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  `is_rackable` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_rackable` (`is_rackable`),
  KEY `product_number` (`product_number`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_pdus`
--

DROP TABLE IF EXISTS `glpi_pdus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_pdus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdumodels_id` int unsigned DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'RELATION to states (id)',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `pdutypes_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `pdumodels_id` (`pdumodels_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `states_id` (`states_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `pdutypes_id` (`pdutypes_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_pdus_plugs`
--

DROP TABLE IF EXISTS `glpi_pdus_plugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_pdus_plugs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plugs_id` int unsigned NOT NULL DEFAULT '0',
  `pdus_id` int unsigned NOT NULL DEFAULT '0',
  `number_plugs` int DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugs_id` (`plugs_id`),
  KEY `pdus_id` (`pdus_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_pdus_racks`
--

DROP TABLE IF EXISTS `glpi_pdus_racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_pdus_racks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `racks_id` int unsigned NOT NULL DEFAULT '0',
  `pdus_id` int unsigned NOT NULL DEFAULT '0',
  `side` int DEFAULT '0',
  `position` int NOT NULL,
  `bgcolor` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `racks_id` (`racks_id`),
  KEY `pdus_id` (`pdus_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_pdutypes`
--

DROP TABLE IF EXISTS `glpi_pdutypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_pdutypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_pendingreasons`
--

DROP TABLE IF EXISTS `glpi_pendingreasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_pendingreasons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `followup_frequency` int NOT NULL DEFAULT '0',
  `followups_before_resolution` int NOT NULL DEFAULT '0',
  `itilfollowuptemplates_id` int unsigned NOT NULL DEFAULT '0',
  `solutiontemplates_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `itilfollowuptemplates_id` (`itilfollowuptemplates_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `solutiontemplates_id` (`solutiontemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_pendingreasons_items`
--

DROP TABLE IF EXISTS `glpi_pendingreasons_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_pendingreasons_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pendingreasons_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `followup_frequency` int NOT NULL DEFAULT '0',
  `followups_before_resolution` int NOT NULL DEFAULT '0',
  `bump_count` int NOT NULL DEFAULT '0',
  `last_bump_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`items_id`,`itemtype`),
  KEY `pendingreasons_id` (`pendingreasons_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_peripheralmodels`
--

DROP TABLE IF EXISTS `glpi_peripheralmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_peripheralmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8mb4_unicode_ci,
  `picture_rear` text COLLATE utf8mb4_unicode_ci,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_peripherals`
--

DROP TABLE IF EXISTS `glpi_peripherals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_peripherals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `peripheraltypes_id` int unsigned NOT NULL DEFAULT '0',
  `peripheralmodels_id` int unsigned NOT NULL DEFAULT '0',
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_global` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `peripheralmodels_id` (`peripheralmodels_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `peripheraltypes_id` (`peripheraltypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_peripheraltypes`
--

DROP TABLE IF EXISTS `glpi_peripheraltypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_peripheraltypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_phonemodels`
--

DROP TABLE IF EXISTS `glpi_phonemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_phonemodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `picture_front` text COLLATE utf8mb4_unicode_ci,
  `picture_rear` text COLLATE utf8mb4_unicode_ci,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_phonepowersupplies`
--

DROP TABLE IF EXISTS `glpi_phonepowersupplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_phonepowersupplies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_phones`
--

DROP TABLE IF EXISTS `glpi_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_phones` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `phonetypes_id` int unsigned NOT NULL DEFAULT '0',
  `phonemodels_id` int unsigned NOT NULL DEFAULT '0',
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonepowersupplies_id` int unsigned NOT NULL DEFAULT '0',
  `number_line` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_headset` tinyint NOT NULL DEFAULT '0',
  `have_hp` tinyint NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_global` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `phonemodels_id` (`phonemodels_id`),
  KEY `phonepowersupplies_id` (`phonepowersupplies_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `phonetypes_id` (`phonetypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_phonetypes`
--

DROP TABLE IF EXISTS `glpi_phonetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_phonetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_planningeventcategories`
--

DROP TABLE IF EXISTS `glpi_planningeventcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_planningeventcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_planningexternalevents`
--

DROP TABLE IF EXISTS `glpi_planningexternalevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_planningexternalevents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `planningexternaleventtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '1',
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_guests` text COLLATE utf8mb4_unicode_ci,
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `rrule` text COLLATE utf8mb4_unicode_ci,
  `state` int NOT NULL DEFAULT '0',
  `planningeventcategories_id` int unsigned NOT NULL DEFAULT '0',
  `background` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `name` (`name`),
  KEY `planningexternaleventtemplates_id` (`planningexternaleventtemplates_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date` (`date`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `state` (`state`),
  KEY `planningeventcategories_id` (`planningeventcategories_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_planningexternaleventtemplates`
--

DROP TABLE IF EXISTS `glpi_planningexternaleventtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_planningexternaleventtemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `duration` int NOT NULL DEFAULT '0',
  `before_time` int NOT NULL DEFAULT '0',
  `rrule` text COLLATE utf8mb4_unicode_ci,
  `state` int NOT NULL DEFAULT '0',
  `planningeventcategories_id` int unsigned NOT NULL DEFAULT '0',
  `background` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `state` (`state`),
  KEY `planningeventcategories_id` (`planningeventcategories_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_planningrecalls`
--

DROP TABLE IF EXISTS `glpi_planningrecalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_planningrecalls` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `before_time` int NOT NULL DEFAULT '-10',
  `when` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`users_id`),
  KEY `users_id` (`users_id`),
  KEY `before_time` (`before_time`),
  KEY `when` (`when`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_plugins`
--

DROP TABLE IF EXISTS `glpi_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_plugins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `directory` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int NOT NULL DEFAULT '0' COMMENT 'see define.php PLUGIN_* constant',
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homepage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`directory`),
  KEY `name` (`name`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_plugs`
--

DROP TABLE IF EXISTS `glpi_plugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_plugs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_printerlogs`
--

DROP TABLE IF EXISTS `glpi_printerlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_printerlogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `printers_id` int unsigned NOT NULL,
  `total_pages` int NOT NULL DEFAULT '0',
  `bw_pages` int NOT NULL DEFAULT '0',
  `color_pages` int NOT NULL DEFAULT '0',
  `rv_pages` int NOT NULL DEFAULT '0',
  `prints` int NOT NULL DEFAULT '0',
  `bw_prints` int NOT NULL DEFAULT '0',
  `color_prints` int NOT NULL DEFAULT '0',
  `copies` int NOT NULL DEFAULT '0',
  `bw_copies` int NOT NULL DEFAULT '0',
  `color_copies` int NOT NULL DEFAULT '0',
  `scanned` int NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `faxed` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`printers_id`,`date`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_printermodels`
--

DROP TABLE IF EXISTS `glpi_printermodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_printermodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `picture_front` text COLLATE utf8mb4_unicode_ci,
  `picture_rear` text COLLATE utf8mb4_unicode_ci,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_printers`
--

DROP TABLE IF EXISTS `glpi_printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_printers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `have_serial` tinyint NOT NULL DEFAULT '0',
  `have_parallel` tinyint NOT NULL DEFAULT '0',
  `have_usb` tinyint NOT NULL DEFAULT '0',
  `have_wifi` tinyint NOT NULL DEFAULT '0',
  `have_ethernet` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `memory_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `networks_id` int unsigned NOT NULL DEFAULT '0',
  `printertypes_id` int unsigned NOT NULL DEFAULT '0',
  `printermodels_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_global` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `init_pages_counter` int NOT NULL DEFAULT '0',
  `last_pages_counter` int NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `sysdescr` text COLLATE utf8mb4_unicode_ci,
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `snmpcredentials_id` int unsigned NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `printermodels_id` (`printermodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `printertypes_id` (`printertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `last_pages_counter` (`last_pages_counter`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `snmpcredentials_id` (`snmpcredentials_id`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_printers_cartridgeinfos`
--

DROP TABLE IF EXISTS `glpi_printers_cartridgeinfos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_printers_cartridgeinfos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `printers_id` int unsigned NOT NULL,
  `property` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `printers_id` (`printers_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_printertypes`
--

DROP TABLE IF EXISTS `glpi_printertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_printertypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_problemcosts`
--

DROP TABLE IF EXISTS `glpi_problemcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_problemcosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int NOT NULL DEFAULT '0',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `problems_id` (`problems_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_problems`
--

DROP TABLE IF EXISTS `glpi_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_problems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `users_id_recipient` int unsigned NOT NULL DEFAULT '0',
  `users_id_lastupdater` int unsigned NOT NULL DEFAULT '0',
  `urgency` int NOT NULL DEFAULT '1',
  `impact` int NOT NULL DEFAULT '1',
  `priority` int NOT NULL DEFAULT '1',
  `itilcategories_id` int unsigned NOT NULL DEFAULT '0',
  `impactcontent` longtext COLLATE utf8mb4_unicode_ci,
  `causecontent` longtext COLLATE utf8mb4_unicode_ci,
  `symptomcontent` longtext COLLATE utf8mb4_unicode_ci,
  `actiontime` int NOT NULL DEFAULT '0',
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `waiting_duration` int NOT NULL DEFAULT '0',
  `close_delay_stat` int NOT NULL DEFAULT '0',
  `solve_delay_stat` int NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `date_mod` (`date_mod`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `time_to_resolve` (`time_to_resolve`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `date_creation` (`date_creation`),
  KEY `locations_id` (`locations_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_problems_suppliers`
--

DROP TABLE IF EXISTS `glpi_problems_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_problems_suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `suppliers_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `use_notification` tinyint NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_problems_tickets`
--

DROP TABLE IF EXISTS `glpi_problems_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_problems_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_problems_users`
--

DROP TABLE IF EXISTS `glpi_problems_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_problems_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `use_notification` tinyint NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_problemtasks`
--

DROP TABLE IF EXISTS `glpi_problemtasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_problemtasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `taskcategories_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_editor` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `actiontime` int NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int unsigned NOT NULL DEFAULT '0',
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  `is_private` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `problems_id` (`problems_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `state` (`state`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `tasktemplates_id` (`tasktemplates_id`),
  KEY `is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_problemtemplatehiddenfields`
--

DROP TABLE IF EXISTS `glpi_problemtemplatehiddenfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_problemtemplatehiddenfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problemtemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_problemtemplatemandatoryfields`
--

DROP TABLE IF EXISTS `glpi_problemtemplatemandatoryfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_problemtemplatemandatoryfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problemtemplates_id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_problemtemplatepredefinedfields`
--

DROP TABLE IF EXISTS `glpi_problemtemplatepredefinedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_problemtemplatepredefinedfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `problemtemplates_id` (`problemtemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_problemtemplates`
--

DROP TABLE IF EXISTS `glpi_problemtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_problemtemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_profilerights`
--

DROP TABLE IF EXISTS `glpi_profilerights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_profilerights` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `profiles_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rights` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`profiles_id`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_profiles`
--

DROP TABLE IF EXISTS `glpi_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interface` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'helpdesk',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `helpdesk_hardware` int NOT NULL DEFAULT '0',
  `helpdesk_item_type` text COLLATE utf8mb4_unicode_ci,
  `ticket_status` text COLLATE utf8mb4_unicode_ci COMMENT 'json encoded array of from/dest allowed status change',
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `problem_status` text COLLATE utf8mb4_unicode_ci COMMENT 'json encoded array of from/dest allowed status change',
  `create_ticket_on_login` tinyint NOT NULL DEFAULT '0',
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `change_status` text COLLATE utf8mb4_unicode_ci COMMENT 'json encoded array of from/dest allowed status change',
  `managed_domainrecordtypes` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `interface` (`interface`),
  KEY `is_default` (`is_default`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `tickettemplates_id` (`tickettemplates_id`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `problemtemplates_id` (`problemtemplates_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_profiles_reminders`
--

DROP TABLE IF EXISTS `glpi_profiles_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_profiles_reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int unsigned NOT NULL DEFAULT '0',
  `profiles_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `no_entity_restriction` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_profiles_rssfeeds`
--

DROP TABLE IF EXISTS `glpi_profiles_rssfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_profiles_rssfeeds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int unsigned NOT NULL DEFAULT '0',
  `profiles_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `no_entity_restriction` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_profiles_users`
--

DROP TABLE IF EXISTS `glpi_profiles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_profiles_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `profiles_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '1',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `is_default_profile` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `users_id` (`users_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_projectcosts`
--

DROP TABLE IF EXISTS `glpi_projectcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_projectcosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `projects_id` (`projects_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_projects`
--

DROP TABLE IF EXISTS `glpi_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_projects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '1',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  `projectstates_id` int unsigned NOT NULL DEFAULT '0',
  `projecttypes_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `percent_done` int NOT NULL DEFAULT '0',
  `auto_percent_done` tinyint NOT NULL DEFAULT '0',
  `show_on_global_gantt` tinyint NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `projecttemplates_id` int unsigned NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `code` (`code`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `projects_id` (`projects_id`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttypes_id` (`projecttypes_id`),
  KEY `priority` (`priority`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `show_on_global_gantt` (`show_on_global_gantt`),
  KEY `date_creation` (`date_creation`),
  KEY `projecttemplates_id` (`projecttemplates_id`),
  KEY `is_template` (`is_template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_projectstates`
--

DROP TABLE IF EXISTS `glpi_projectstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_projectstates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_finished` (`is_finished`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_projecttasklinks`
--

DROP TABLE IF EXISTS `glpi_projecttasklinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_projecttasklinks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projecttasks_id_source` int unsigned NOT NULL,
  `source_uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `projecttasks_id_target` int unsigned NOT NULL,
  `target_uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint NOT NULL DEFAULT '0',
  `lag` smallint DEFAULT '0',
  `lead` smallint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `projecttasks_id_source` (`projecttasks_id_source`),
  KEY `projecttasks_id_target` (`projecttasks_id_target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_projecttasks`
--

DROP TABLE IF EXISTS `glpi_projecttasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_projecttasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  `projecttasks_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `planned_duration` int NOT NULL DEFAULT '0',
  `effective_duration` int NOT NULL DEFAULT '0',
  `projectstates_id` int unsigned NOT NULL DEFAULT '0',
  `projecttasktypes_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `percent_done` int NOT NULL DEFAULT '0',
  `auto_percent_done` tinyint NOT NULL DEFAULT '0',
  `is_milestone` tinyint NOT NULL DEFAULT '0',
  `projecttasktemplates_id` int unsigned NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `projects_id` (`projects_id`),
  KEY `projecttasks_id` (`projecttasks_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttasktypes_id` (`projecttasktypes_id`),
  KEY `projecttasktemplates_id` (`projecttasktemplates_id`),
  KEY `is_template` (`is_template`),
  KEY `is_milestone` (`is_milestone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_projecttasks_tickets`
--

DROP TABLE IF EXISTS `glpi_projecttasks_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_projecttasks_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `projecttasks_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`projecttasks_id`),
  KEY `projects_id` (`projecttasks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_projecttaskteams`
--

DROP TABLE IF EXISTS `glpi_projecttaskteams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_projecttaskteams` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projecttasks_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projecttasks_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_projecttasktemplates`
--

DROP TABLE IF EXISTS `glpi_projecttasktemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_projecttasktemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  `projecttasks_id` int unsigned NOT NULL DEFAULT '0',
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `planned_duration` int NOT NULL DEFAULT '0',
  `effective_duration` int NOT NULL DEFAULT '0',
  `projectstates_id` int unsigned NOT NULL DEFAULT '0',
  `projecttasktypes_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `percent_done` int NOT NULL DEFAULT '0',
  `is_milestone` tinyint NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `projects_id` (`projects_id`),
  KEY `projecttasks_id` (`projecttasks_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttasktypes_id` (`projecttasktypes_id`),
  KEY `is_milestone` (`is_milestone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_projecttasktypes`
--

DROP TABLE IF EXISTS `glpi_projecttasktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_projecttasktypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_projectteams`
--

DROP TABLE IF EXISTS `glpi_projectteams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_projectteams` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_projecttypes`
--

DROP TABLE IF EXISTS `glpi_projecttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_projecttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_queuednotifications`
--

DROP TABLE IF EXISTS `glpi_queuednotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_queuednotifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `notificationtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `sent_try` int NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL,
  `send_time` timestamp NULL DEFAULT NULL,
  `sent_time` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `sender` text COLLATE utf8mb4_unicode_ci,
  `sendername` text COLLATE utf8mb4_unicode_ci,
  `recipient` text COLLATE utf8mb4_unicode_ci,
  `recipientname` text COLLATE utf8mb4_unicode_ci,
  `replyto` text COLLATE utf8mb4_unicode_ci,
  `replytoname` text COLLATE utf8mb4_unicode_ci,
  `headers` text COLLATE utf8mb4_unicode_ci,
  `body_html` longtext COLLATE utf8mb4_unicode_ci,
  `body_text` longtext COLLATE utf8mb4_unicode_ci,
  `messageid` text COLLATE utf8mb4_unicode_ci,
  `documents` text COLLATE utf8mb4_unicode_ci,
  `mode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'See Notification_NotificationTemplate::MODE_* constants',
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`,`notificationtemplates_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `entities_id` (`entities_id`),
  KEY `sent_try` (`sent_try`),
  KEY `create_time` (`create_time`),
  KEY `send_time` (`send_time`),
  KEY `sent_time` (`sent_time`),
  KEY `mode` (`mode`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_rackmodels`
--

DROP TABLE IF EXISTS `glpi_rackmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_rackmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_racks`
--

DROP TABLE IF EXISTS `glpi_racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_racks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rackmodels_id` int unsigned DEFAULT NULL,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `racktypes_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `depth` int DEFAULT NULL,
  `number_units` int DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `dcrooms_id` int unsigned NOT NULL DEFAULT '0',
  `room_orientation` int NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bgcolor` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_power` int NOT NULL DEFAULT '0',
  `mesured_power` int NOT NULL DEFAULT '0',
  `max_weight` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `rackmodels_id` (`rackmodels_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `racktypes_id` (`racktypes_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `dcrooms_id` (`dcrooms_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_racktypes`
--

DROP TABLE IF EXISTS `glpi_racktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_racktypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_recurrentchanges`
--

DROP TABLE IF EXISTS `glpi_recurrentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_recurrentchanges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `begin_date` timestamp NULL DEFAULT NULL,
  `periodicity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_before` int NOT NULL DEFAULT '0',
  `next_creation_date` timestamp NULL DEFAULT NULL,
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `next_creation_date` (`next_creation_date`),
  KEY `calendars_id` (`calendars_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_refusedequipments`
--

DROP TABLE IF EXISTS `glpi_refusedequipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_refusedequipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mac` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rules_id` int unsigned NOT NULL DEFAULT '0',
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agents_id` int unsigned NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `agents_id` (`agents_id`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `rules_id` (`rules_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_registeredids`
--

DROP TABLE IF EXISTS `glpi_registeredids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_registeredids` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'USB, PCI ...',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `device_type` (`device_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_reminders`
--

DROP TABLE IF EXISTS `glpi_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `is_planned` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `state` int NOT NULL DEFAULT '0',
  `begin_view_date` timestamp NULL DEFAULT NULL,
  `end_view_date` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `name` (`name`),
  KEY `date` (`date`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `users_id` (`users_id`),
  KEY `is_planned` (`is_planned`),
  KEY `state` (`state`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_reminders_users`
--

DROP TABLE IF EXISTS `glpi_reminders_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_reminders_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_remindertranslations`
--

DROP TABLE IF EXISTS `glpi_remindertranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_remindertranslations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `text` longtext COLLATE utf8mb4_unicode_ci,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`reminders_id`,`language`),
  KEY `users_id` (`users_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_requesttypes`
--

DROP TABLE IF EXISTS `glpi_requesttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_requesttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_helpdesk_default` tinyint NOT NULL DEFAULT '0',
  `is_followup_default` tinyint NOT NULL DEFAULT '0',
  `is_mail_default` tinyint NOT NULL DEFAULT '0',
  `is_mailfollowup_default` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `is_ticketheader` tinyint NOT NULL DEFAULT '1',
  `is_itilfollowup` tinyint NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_helpdesk_default` (`is_helpdesk_default`),
  KEY `is_followup_default` (`is_followup_default`),
  KEY `is_mail_default` (`is_mail_default`),
  KEY `is_mailfollowup_default` (`is_mailfollowup_default`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`),
  KEY `is_ticketheader` (`is_ticketheader`),
  KEY `is_itilfollowup` (`is_itilfollowup`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_reservationitems`
--

DROP TABLE IF EXISTS `glpi_reservationitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_reservationitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `is_active` (`is_active`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_reservations`
--

DROP TABLE IF EXISTS `glpi_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_reservations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reservationitems_id` int unsigned NOT NULL DEFAULT '0',
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `group` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `users_id` (`users_id`),
  KEY `resagroup` (`reservationitems_id`,`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_rssfeeds`
--

DROP TABLE IF EXISTS `glpi_rssfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_rssfeeds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `refresh_rate` int NOT NULL DEFAULT '86400',
  `max_items` int NOT NULL DEFAULT '20',
  `have_error` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `users_id` (`users_id`),
  KEY `date_mod` (`date_mod`),
  KEY `have_error` (`have_error`),
  KEY `is_active` (`is_active`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_rssfeeds_users`
--

DROP TABLE IF EXISTS `glpi_rssfeeds_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_rssfeeds_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_ruleactions`
--

DROP TABLE IF EXISTS `glpi_ruleactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_ruleactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rules_id` int unsigned NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'VALUE IN (assign, regex_result, append_regex_result, affectbyip, affectbyfqdn, affectbymac)',
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rules_id` (`rules_id`),
  KEY `field_value` (`field`(50),`value`(50))
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_rulecriterias`
--

DROP TABLE IF EXISTS `glpi_rulecriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_rulecriterias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rules_id` int unsigned NOT NULL DEFAULT '0',
  `criteria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` int NOT NULL DEFAULT '0' COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rules_id` (`rules_id`),
  KEY `condition` (`condition`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_rulematchedlogs`
--

DROP TABLE IF EXISTS `glpi_rulematchedlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_rulematchedlogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rules_id` int unsigned DEFAULT NULL,
  `agents_id` int unsigned NOT NULL DEFAULT '0',
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agents_id` (`agents_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `rules_id` (`rules_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_rulerightparameters`
--

DROP TABLE IF EXISTS `glpi_rulerightparameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_rulerightparameters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_rules`
--

DROP TABLE IF EXISTS `glpi_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `sub_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ranking` int NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `match` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` int NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `sub_type` (`sub_type`),
  KEY `date_mod` (`date_mod`),
  KEY `is_recursive` (`is_recursive`),
  KEY `condition` (`condition`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_savedsearches`
--

DROP TABLE IF EXISTS `glpi_savedsearches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_savedsearches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int NOT NULL DEFAULT '0' COMMENT 'see SavedSearch:: constants',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `is_private` tinyint NOT NULL DEFAULT '1',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `query` text COLLATE utf8mb4_unicode_ci,
  `last_execution_time` int DEFAULT NULL,
  `do_count` tinyint NOT NULL DEFAULT '2' COMMENT 'Do or do not count results on list display see SavedSearch::COUNT_* constants',
  `last_execution_date` timestamp NULL DEFAULT NULL,
  `counter` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `type` (`type`),
  KEY `itemtype` (`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id` (`users_id`),
  KEY `is_private` (`is_private`),
  KEY `is_recursive` (`is_recursive`),
  KEY `last_execution_time` (`last_execution_time`),
  KEY `last_execution_date` (`last_execution_date`),
  KEY `do_count` (`do_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_savedsearches_alerts`
--

DROP TABLE IF EXISTS `glpi_savedsearches_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_savedsearches_alerts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `savedsearches_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `operator` tinyint NOT NULL,
  `value` int NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `frequency` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`savedsearches_id`,`operator`,`value`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_savedsearches_users`
--

DROP TABLE IF EXISTS `glpi_savedsearches_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_savedsearches_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `savedsearches_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`itemtype`),
  KEY `savedsearches_id` (`savedsearches_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_slalevelactions`
--

DROP TABLE IF EXISTS `glpi_slalevelactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_slalevelactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slalevels_id` int unsigned NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slalevels_id` (`slalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_slalevelcriterias`
--

DROP TABLE IF EXISTS `glpi_slalevelcriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_slalevelcriterias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slalevels_id` int unsigned NOT NULL DEFAULT '0',
  `criteria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` int NOT NULL DEFAULT '0' COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slalevels_id` (`slalevels_id`),
  KEY `condition` (`condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_slalevels`
--

DROP TABLE IF EXISTS `glpi_slalevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_slalevels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slas_id` int unsigned NOT NULL DEFAULT '0',
  `execution_time` int NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `match` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `slas_id` (`slas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_slalevels_tickets`
--

DROP TABLE IF EXISTS `glpi_slalevels_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_slalevels_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `slalevels_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`slalevels_id`),
  KEY `slalevels_id` (`slalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_slas`
--

DROP TABLE IF EXISTS `glpi_slas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_slas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `number_time` int NOT NULL,
  `use_ticket_calendar` tinyint NOT NULL DEFAULT '0',
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `definition_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_of_working_day` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `slms_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `calendars_id` (`calendars_id`),
  KEY `slms_id` (`slms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_slms`
--

DROP TABLE IF EXISTS `glpi_slms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_slms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `use_ticket_calendar` tinyint NOT NULL DEFAULT '0',
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `calendars_id` (`calendars_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_snmpcredentials`
--

DROP TABLE IF EXISTS `glpi_snmpcredentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_snmpcredentials` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snmpversion` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `community` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authentication` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_passphrase` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encryption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priv_passphrase` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `snmpversion` (`snmpversion`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_socketmodels`
--

DROP TABLE IF EXISTS `glpi_socketmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_socketmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_sockets`
--

DROP TABLE IF EXISTS `glpi_sockets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_sockets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socketmodels_id` int unsigned NOT NULL DEFAULT '0',
  `wiring_side` tinyint DEFAULT '1',
  `itemtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `socketmodels_id` (`socketmodels_id`),
  KEY `location_name` (`locations_id`,`name`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `networkports_id` (`networkports_id`),
  KEY `wiring_side` (`wiring_side`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_softwarecategories`
--

DROP TABLE IF EXISTS `glpi_softwarecategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_softwarecategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `softwarecategories_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `softwarecategories_id` (`softwarecategories_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_softwarelicenses`
--

DROP TABLE IF EXISTS `glpi_softwarelicenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_softwarelicenses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `softwares_id` int unsigned NOT NULL DEFAULT '0',
  `softwarelicenses_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `number` int NOT NULL DEFAULT '0',
  `softwarelicensetypes_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `softwareversions_id_buy` int unsigned NOT NULL DEFAULT '0',
  `softwareversions_id_use` int unsigned NOT NULL DEFAULT '0',
  `expire` date DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `is_valid` tinyint NOT NULL DEFAULT '1',
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `is_helpdesk_visible` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_overquota` tinyint NOT NULL DEFAULT '0',
  `pictures` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `expire` (`expire`),
  KEY `softwareversions_id_buy` (`softwareversions_id_buy`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  KEY `softwareversions_id_use` (`softwareversions_id_use`),
  KEY `date_mod` (`date_mod`),
  KEY `softwares_id_expire_number` (`softwares_id`,`expire`,`number`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `users_id` (`users_id`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `groups_id` (`groups_id`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_creation` (`date_creation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `states_id` (`states_id`),
  KEY `allow_overquota` (`allow_overquota`),
  KEY `softwarelicenses_id` (`softwarelicenses_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_softwarelicensetypes`
--

DROP TABLE IF EXISTS `glpi_softwarelicensetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_softwarelicensetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `softwarelicensetypes_id` int unsigned NOT NULL DEFAULT '0',
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_softwares`
--

DROP TABLE IF EXISTS `glpi_softwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_softwares` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_update` tinyint NOT NULL DEFAULT '0',
  `softwares_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_helpdesk_visible` tinyint NOT NULL DEFAULT '1',
  `softwarecategories_id` int unsigned NOT NULL DEFAULT '0',
  `is_valid` tinyint NOT NULL DEFAULT '1',
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_update` (`is_update`),
  KEY `softwarecategories_id` (`softwarecategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `softwares_id` (`softwares_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_softwareversions`
--

DROP TABLE IF EXISTS `glpi_softwareversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_softwareversions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `softwares_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `operatingsystems_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `arch` (`arch`),
  KEY `softwares_id` (`softwares_id`),
  KEY `states_id` (`states_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `operatingsystems_id` (`operatingsystems_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_solutiontemplates`
--

DROP TABLE IF EXISTS `glpi_solutiontemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_solutiontemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `solutiontypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_solutiontypes`
--

DROP TABLE IF EXISTS `glpi_solutiontypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_solutiontypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_ssovariables`
--

DROP TABLE IF EXISTS `glpi_ssovariables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_ssovariables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_states`
--

DROP TABLE IF EXISTS `glpi_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  `is_visible_computer` tinyint NOT NULL DEFAULT '1',
  `is_visible_monitor` tinyint NOT NULL DEFAULT '1',
  `is_visible_networkequipment` tinyint NOT NULL DEFAULT '1',
  `is_visible_peripheral` tinyint NOT NULL DEFAULT '1',
  `is_visible_phone` tinyint NOT NULL DEFAULT '1',
  `is_visible_printer` tinyint NOT NULL DEFAULT '1',
  `is_visible_softwareversion` tinyint NOT NULL DEFAULT '1',
  `is_visible_softwarelicense` tinyint NOT NULL DEFAULT '1',
  `is_visible_line` tinyint NOT NULL DEFAULT '1',
  `is_visible_certificate` tinyint NOT NULL DEFAULT '1',
  `is_visible_rack` tinyint NOT NULL DEFAULT '1',
  `is_visible_passivedcequipment` tinyint NOT NULL DEFAULT '1',
  `is_visible_enclosure` tinyint NOT NULL DEFAULT '1',
  `is_visible_pdu` tinyint NOT NULL DEFAULT '1',
  `is_visible_cluster` tinyint NOT NULL DEFAULT '1',
  `is_visible_contract` tinyint NOT NULL DEFAULT '1',
  `is_visible_appliance` tinyint NOT NULL DEFAULT '1',
  `is_visible_databaseinstance` tinyint NOT NULL DEFAULT '1',
  `is_visible_cable` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`states_id`,`name`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_visible_computer` (`is_visible_computer`),
  KEY `is_visible_monitor` (`is_visible_monitor`),
  KEY `is_visible_networkequipment` (`is_visible_networkequipment`),
  KEY `is_visible_peripheral` (`is_visible_peripheral`),
  KEY `is_visible_phone` (`is_visible_phone`),
  KEY `is_visible_printer` (`is_visible_printer`),
  KEY `is_visible_softwareversion` (`is_visible_softwareversion`),
  KEY `is_visible_softwarelicense` (`is_visible_softwarelicense`),
  KEY `is_visible_line` (`is_visible_line`),
  KEY `is_visible_certificate` (`is_visible_certificate`),
  KEY `is_visible_rack` (`is_visible_rack`),
  KEY `is_visible_passivedcequipment` (`is_visible_passivedcequipment`),
  KEY `is_visible_enclosure` (`is_visible_enclosure`),
  KEY `is_visible_pdu` (`is_visible_pdu`),
  KEY `is_visible_cluster` (`is_visible_cluster`),
  KEY `is_visible_contract` (`is_visible_contract`),
  KEY `is_visible_appliance` (`is_visible_appliance`),
  KEY `is_visible_databaseinstance` (`is_visible_databaseinstance`),
  KEY `is_visible_cable` (`is_visible_cable`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_suppliers`
--

DROP TABLE IF EXISTS `glpi_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suppliertypes_id` int unsigned NOT NULL DEFAULT '0',
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `pictures` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `suppliertypes_id` (`suppliertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_suppliers_tickets`
--

DROP TABLE IF EXISTS `glpi_suppliers_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_suppliers_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `suppliers_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `use_notification` tinyint NOT NULL DEFAULT '1',
  `alternative_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_suppliertypes`
--

DROP TABLE IF EXISTS `glpi_suppliertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_suppliertypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_taskcategories`
--

DROP TABLE IF EXISTS `glpi_taskcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_taskcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `taskcategories_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8mb4_unicode_ci,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8mb4_unicode_ci,
  `sons_cache` longtext COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `is_helpdeskvisible` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `knowbaseitemcategories_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_tasktemplates`
--

DROP TABLE IF EXISTS `glpi_tasktemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_tasktemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `taskcategories_id` int unsigned NOT NULL DEFAULT '0',
  `actiontime` int NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `state` int NOT NULL DEFAULT '0',
  `is_private` tinyint NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_private` (`is_private`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_ticketcosts`
--

DROP TABLE IF EXISTS `glpi_ticketcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_ticketcosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int NOT NULL DEFAULT '0',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `tickets_id` (`tickets_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_ticketrecurrents`
--

DROP TABLE IF EXISTS `glpi_ticketrecurrents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_ticketrecurrents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `begin_date` timestamp NULL DEFAULT NULL,
  `periodicity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_before` int NOT NULL DEFAULT '0',
  `next_creation_date` timestamp NULL DEFAULT NULL,
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `tickettemplates_id` (`tickettemplates_id`),
  KEY `next_creation_date` (`next_creation_date`),
  KEY `calendars_id` (`calendars_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_tickets`
--

DROP TABLE IF EXISTS `glpi_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `takeintoaccountdate` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id_lastupdater` int unsigned NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `users_id_recipient` int unsigned NOT NULL DEFAULT '0',
  `requesttypes_id` int unsigned NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `urgency` int NOT NULL DEFAULT '1',
  `impact` int NOT NULL DEFAULT '1',
  `priority` int NOT NULL DEFAULT '1',
  `itilcategories_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `global_validation` int NOT NULL DEFAULT '1',
  `slas_id_ttr` int unsigned NOT NULL DEFAULT '0',
  `slas_id_tto` int unsigned NOT NULL DEFAULT '0',
  `slalevels_id_ttr` int unsigned NOT NULL DEFAULT '0',
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `time_to_own` timestamp NULL DEFAULT NULL,
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `sla_waiting_duration` int NOT NULL DEFAULT '0',
  `ola_waiting_duration` int NOT NULL DEFAULT '0',
  `olas_id_tto` int unsigned NOT NULL DEFAULT '0',
  `olas_id_ttr` int unsigned NOT NULL DEFAULT '0',
  `olalevels_id_ttr` int unsigned NOT NULL DEFAULT '0',
  `ola_tto_begin_date` timestamp NULL DEFAULT NULL,
  `ola_ttr_begin_date` timestamp NULL DEFAULT NULL,
  `internal_time_to_resolve` timestamp NULL DEFAULT NULL,
  `internal_time_to_own` timestamp NULL DEFAULT NULL,
  `waiting_duration` int NOT NULL DEFAULT '0',
  `close_delay_stat` int NOT NULL DEFAULT '0',
  `solve_delay_stat` int NOT NULL DEFAULT '0',
  `takeintoaccount_delay_stat` int NOT NULL DEFAULT '0',
  `actiontime` int NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `validation_percent` int NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `request_type` (`requesttypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `takeintoaccountdate` (`takeintoaccountdate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `global_validation` (`global_validation`),
  KEY `slas_id_tto` (`slas_id_tto`),
  KEY `slas_id_ttr` (`slas_id_ttr`),
  KEY `time_to_resolve` (`time_to_resolve`),
  KEY `time_to_own` (`time_to_own`),
  KEY `olas_id_tto` (`olas_id_tto`),
  KEY `olas_id_ttr` (`olas_id_ttr`),
  KEY `slalevels_id_ttr` (`slalevels_id_ttr`),
  KEY `internal_time_to_resolve` (`internal_time_to_resolve`),
  KEY `internal_time_to_own` (`internal_time_to_own`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `type` (`type`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `name` (`name`),
  KEY `locations_id` (`locations_id`),
  KEY `date_creation` (`date_creation`),
  KEY `ola_waiting_duration` (`ola_waiting_duration`),
  KEY `olalevels_id_ttr` (`olalevels_id_ttr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_tickets_contracts`
--

DROP TABLE IF EXISTS `glpi_tickets_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_tickets_contracts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `contracts_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`contracts_id`),
  KEY `contracts_id` (`contracts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_tickets_tickets`
--

DROP TABLE IF EXISTS `glpi_tickets_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_tickets_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id_1` int unsigned NOT NULL DEFAULT '0',
  `tickets_id_2` int unsigned NOT NULL DEFAULT '0',
  `link` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id_1`,`tickets_id_2`),
  KEY `tickets_id_2` (`tickets_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_tickets_users`
--

DROP TABLE IF EXISTS `glpi_tickets_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_tickets_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `use_notification` tinyint NOT NULL DEFAULT '1',
  `alternative_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_ticketsatisfactions`
--

DROP TABLE IF EXISTS `glpi_ticketsatisfactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_ticketsatisfactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `date_begin` timestamp NULL DEFAULT NULL,
  `date_answered` timestamp NULL DEFAULT NULL,
  `satisfaction` int DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_tickettasks`
--

DROP TABLE IF EXISTS `glpi_tickettasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_tickettasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `taskcategories_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_editor` int unsigned NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint NOT NULL DEFAULT '0',
  `actiontime` int NOT NULL DEFAULT '0',
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `state` int NOT NULL DEFAULT '1',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int unsigned NOT NULL DEFAULT '0',
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  `sourceitems_id` int unsigned NOT NULL DEFAULT '0',
  `sourceof_items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `tickets_id` (`tickets_id`),
  KEY `is_private` (`is_private`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `state` (`state`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `tasktemplates_id` (`tasktemplates_id`),
  KEY `sourceitems_id` (`sourceitems_id`),
  KEY `sourceof_items_id` (`sourceof_items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_tickettemplatehiddenfields`
--

DROP TABLE IF EXISTS `glpi_tickettemplatehiddenfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_tickettemplatehiddenfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_tickettemplatemandatoryfields`
--

DROP TABLE IF EXISTS `glpi_tickettemplatemandatoryfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_tickettemplatemandatoryfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_tickettemplatepredefinedfields`
--

DROP TABLE IF EXISTS `glpi_tickettemplatepredefinedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_tickettemplatepredefinedfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `tickettemplates_id` (`tickettemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_tickettemplates`
--

DROP TABLE IF EXISTS `glpi_tickettemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_tickettemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_ticketvalidations`
--

DROP TABLE IF EXISTS `glpi_ticketvalidations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_ticketvalidations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_validate` int unsigned NOT NULL DEFAULT '0',
  `comment_submission` text COLLATE utf8mb4_unicode_ci,
  `comment_validation` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '2',
  `submission_date` timestamp NULL DEFAULT NULL,
  `validation_date` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_validate` (`users_id_validate`),
  KEY `tickets_id` (`tickets_id`),
  KEY `submission_date` (`submission_date`),
  KEY `validation_date` (`validation_date`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_transfers`
--

DROP TABLE IF EXISTS `glpi_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_transfers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keep_ticket` int NOT NULL DEFAULT '0',
  `keep_networklink` int NOT NULL DEFAULT '0',
  `keep_reservation` int NOT NULL DEFAULT '0',
  `keep_history` int NOT NULL DEFAULT '0',
  `keep_device` int NOT NULL DEFAULT '0',
  `keep_infocom` int NOT NULL DEFAULT '0',
  `keep_dc_monitor` int NOT NULL DEFAULT '0',
  `clean_dc_monitor` int NOT NULL DEFAULT '0',
  `keep_dc_phone` int NOT NULL DEFAULT '0',
  `clean_dc_phone` int NOT NULL DEFAULT '0',
  `keep_dc_peripheral` int NOT NULL DEFAULT '0',
  `clean_dc_peripheral` int NOT NULL DEFAULT '0',
  `keep_dc_printer` int NOT NULL DEFAULT '0',
  `clean_dc_printer` int NOT NULL DEFAULT '0',
  `keep_supplier` int NOT NULL DEFAULT '0',
  `clean_supplier` int NOT NULL DEFAULT '0',
  `keep_contact` int NOT NULL DEFAULT '0',
  `clean_contact` int NOT NULL DEFAULT '0',
  `keep_contract` int NOT NULL DEFAULT '0',
  `clean_contract` int NOT NULL DEFAULT '0',
  `keep_software` int NOT NULL DEFAULT '0',
  `clean_software` int NOT NULL DEFAULT '0',
  `keep_document` int NOT NULL DEFAULT '0',
  `clean_document` int NOT NULL DEFAULT '0',
  `keep_cartridgeitem` int NOT NULL DEFAULT '0',
  `clean_cartridgeitem` int NOT NULL DEFAULT '0',
  `keep_cartridge` int NOT NULL DEFAULT '0',
  `keep_consumable` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `keep_disk` int NOT NULL DEFAULT '0',
  `keep_certificate` int NOT NULL DEFAULT '0',
  `clean_certificate` int NOT NULL DEFAULT '0',
  `lock_updated_fields` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_unmanageds`
--

DROP TABLE IF EXISTS `glpi_unmanageds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_unmanageds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `networks_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `sysdescr` text COLLATE utf8mb4_unicode_ci,
  `agents_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted` tinyint NOT NULL DEFAULT '0',
  `hub` tinyint NOT NULL DEFAULT '0',
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snmpcredentials_id` int unsigned NOT NULL DEFAULT '0',
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `date_creation` (`date_creation`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `agents_id` (`agents_id`),
  KEY `snmpcredentials_id` (`snmpcredentials_id`),
  KEY `users_id_tech` (`users_id_tech`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_usbvendors`
--

DROP TABLE IF EXISTS `glpi_usbvendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_usbvendors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `vendorid` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceid` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`vendorid`,`deviceid`),
  KEY `deviceid` (`deviceid`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_usercategories`
--

DROP TABLE IF EXISTS `glpi_usercategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_usercategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_useremails`
--

DROP TABLE IF EXISTS `glpi_useremails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_useremails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`email`),
  KEY `email` (`email`),
  KEY `is_default` (`is_default`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_users`
--

DROP TABLE IF EXISTS `glpi_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_last_update` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `language` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'see define.php CFG_GLPI[language] array',
  `use_mode` int NOT NULL DEFAULT '0',
  `list_limit` int DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `auths_id` int unsigned NOT NULL DEFAULT '0',
  `authtype` int NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_sync` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `profiles_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `usertitles_id` int unsigned NOT NULL DEFAULT '0',
  `usercategories_id` int unsigned NOT NULL DEFAULT '0',
  `date_format` int DEFAULT NULL,
  `number_format` int DEFAULT NULL,
  `names_format` int DEFAULT NULL,
  `csv_delimiter` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_ids_visible` tinyint DEFAULT NULL,
  `use_flat_dropdowntree` tinyint DEFAULT NULL,
  `use_flat_dropdowntree_on_search_result` tinyint DEFAULT NULL,
  `show_jobs_at_login` tinyint DEFAULT NULL,
  `priority_1` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority_2` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority_3` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority_4` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority_5` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority_6` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `followup_private` tinyint DEFAULT NULL,
  `task_private` tinyint DEFAULT NULL,
  `default_requesttypes_id` int unsigned DEFAULT NULL,
  `password_forget_token` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_forget_token_date` timestamp NULL DEFAULT NULL,
  `user_dn` text COLLATE utf8mb4_unicode_ci,
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_count_on_tabs` tinyint DEFAULT NULL,
  `refresh_views` int DEFAULT NULL,
  `set_default_tech` tinyint DEFAULT NULL,
  `personal_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_token_date` timestamp NULL DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token_date` timestamp NULL DEFAULT NULL,
  `cookie_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookie_token_date` timestamp NULL DEFAULT NULL,
  `display_count_on_home` int DEFAULT NULL,
  `notification_to_myself` tinyint DEFAULT NULL,
  `duedateok_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duedatewarning_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duedatecritical_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duedatewarning_less` int DEFAULT NULL,
  `duedatecritical_less` int DEFAULT NULL,
  `duedatewarning_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duedatecritical_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_options` text COLLATE utf8mb4_unicode_ci,
  `is_deleted_ldap` tinyint NOT NULL DEFAULT '0',
  `pdffont` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `begin_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `keep_devices_when_purging_item` tinyint DEFAULT NULL,
  `privatebookmarkorder` longtext COLLATE utf8mb4_unicode_ci,
  `backcreated` tinyint DEFAULT NULL,
  `task_state` int DEFAULT NULL,
  `palette` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_layout` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fold_menu` tinyint DEFAULT NULL,
  `fold_search` tinyint DEFAULT NULL,
  `savedsearches_pinned` text COLLATE utf8mb4_unicode_ci,
  `timeline_order` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itil_layout` text COLLATE utf8mb4_unicode_ci,
  `richtext_layout` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `set_default_requester` tinyint DEFAULT NULL,
  `lock_autolock_mode` tinyint DEFAULT NULL,
  `lock_directunlock_notification` tinyint DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `highcontrast_css` tinyint DEFAULT '0',
  `plannings` text COLLATE utf8mb4_unicode_ci,
  `sync_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_supervisor` int unsigned NOT NULL DEFAULT '0',
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_dashboard_central` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_dashboard_assets` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_dashboard_helpdesk` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_dashboard_mini_ticket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_central_tab` tinyint DEFAULT '0',
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeline_action_btn_layout` tinyint DEFAULT '0',
  `timeline_date_format` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicityloginauth` (`name`,`authtype`,`auths_id`),
  KEY `firstname` (`firstname`),
  KEY `realname` (`realname`),
  KEY `entities_id` (`entities_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `locations_id` (`locations_id`),
  KEY `usertitles_id` (`usertitles_id`),
  KEY `usercategories_id` (`usercategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `authitem` (`authtype`,`auths_id`),
  KEY `is_deleted_ldap` (`is_deleted_ldap`),
  KEY `date_creation` (`date_creation`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `sync_field` (`sync_field`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id_supervisor` (`users_id_supervisor`),
  KEY `auths_id` (`auths_id`),
  KEY `default_requesttypes_id` (`default_requesttypes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_usertitles`
--

DROP TABLE IF EXISTS `glpi_usertitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_usertitles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_virtualmachinestates`
--

DROP TABLE IF EXISTS `glpi_virtualmachinestates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_virtualmachinestates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_virtualmachinesystems`
--

DROP TABLE IF EXISTS `glpi_virtualmachinesystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_virtualmachinesystems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_virtualmachinetypes`
--

DROP TABLE IF EXISTS `glpi_virtualmachinetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_virtualmachinetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_vlans`
--

DROP TABLE IF EXISTS `glpi_vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_vlans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `tag` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `tag` (`tag`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_vobjects`
--

DROP TABLE IF EXISTS `glpi_vobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_vobjects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glpi_wifinetworks`
--

DROP TABLE IF EXISTS `glpi_wifinetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glpi_wifinetworks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `essid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ad-hoc, access_point',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `essid` (`essid`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-16 11:56:25
