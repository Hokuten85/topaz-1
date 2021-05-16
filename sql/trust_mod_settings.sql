DROP TABLE IF EXISTS `trust_mod_settings`;
CREATE TABLE `trust_mod_settings` (
  `job` TINYINT(2) unsigned NOT NULL,
  `modId` SMALLINT(5) unsigned NOT NULL,
  `setting` TINYINT(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`job`.`modId`)
)
