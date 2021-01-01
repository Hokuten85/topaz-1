DROP TABLE IF EXISTS `char_mods`;
CREATE TABLE `char_mods` (
  `charid` int(10) unsigned NOT NULL,
  `modid` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`,`modid`)
)