CREATE TABLE `kills` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identification number of each kill',
	`killer_name` VARCHAR(50) NOT NULL DEFAULT 'Unkown' COMMENT 'Name of the Killer',
	`killer_uid` VARCHAR(32) NULL DEFAULT NULL COMMENT 'UID of the Killer',
	`victim_name` VARCHAR(50) NOT NULL DEFAULT 'Unkown' COMMENT 'Name of the Person who died',
	`victim_uid` VARCHAR(32) NULL DEFAULT NULL COMMENT 'UID of the Victim',
	`weapon` VARCHAR(50) NOT NULL DEFAULT 'Unkown' COMMENT 'Name of the weapon/vehicle or item used to kill',
	`distance` VARCHAR(10) NOT NULL DEFAULT '0' COMMENT 'Number of distance in meters between the killer and the victim',
	`respect` VARCHAR(10) NULL DEFAULT '0' COMMENT 'Number of respect the killer earned',
	`died_at` DATETIME NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date and time the victim was killed',
	PRIMARY KEY (`id`)
)
COMMENT='Kill Feeds by GR8\r\nWith Victom, Killer, distance and gun'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=50
;
