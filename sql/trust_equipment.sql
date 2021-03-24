DROP TABLE IF EXISTS `trust_equipment`;
CREATE TABLE `trust_equipment` (
  `charid` INT(10) unsigned NOT NULL,
  `trustid` INT(10) unsigned NOT NULL,
  `equipslotid` TINYINT(2) NOT NULL DEFAULT '0',
  `itemid` SMALLINT(5) unsigned NOT NULL DEFAULT '0',
  `quantity` INT(10) unsigned NOT NULL DEFAULT '0',
  `extra` blob(24) DEFAULT NULL,
  PRIMARY KEY (`charid`,`trustid`,`equipslotid`, `itemid`)
)
