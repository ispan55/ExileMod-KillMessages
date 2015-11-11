CREATE TABLE `kills` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identification number of each kill',
	`killer` VARCHAR(50) NOT NULL DEFAULT 'Unkown' COMMENT 'Name of the Killer',
	`victim` VARCHAR(50) NOT NULL DEFAULT 'Unkown' COMMENT 'Name of the Person who died',
	`weapon` VARCHAR(50) NOT NULL DEFAULT 'Unkown' COMMENT 'Name of the weapon/vehicle or item used to kill',
	`distance` VARCHAR(10) NOT NULL DEFAULT '0' COMMENT 'Number of distance in meters between the killer and the victim',
	`died_at` DATETIME NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date and time the victim was killed',
	PRIMARY KEY (`id`)
)
COMMENT='Kill Feeds by GR8\r\nWith Victom, Killer, distance and weapon'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
