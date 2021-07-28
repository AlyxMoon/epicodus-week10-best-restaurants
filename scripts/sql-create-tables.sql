-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'restaurants'
-- 
-- ---

DROP TABLE IF EXISTS `restaurants`;
		
CREATE TABLE `restaurants` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `id_cuisine` INTEGER NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` MEDIUMTEXT NOT NULL,
  `price` INTEGER NOT NULL DEFAULT 0 COMMENT 'Will be an number 1-5, indicating average cost of eating at ',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'cuisines'
-- 
-- ---

DROP TABLE IF EXISTS `cuisines`;
		
CREATE TABLE `cuisines` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id`),
KEY (`id`)
);

-- ---
-- Table 'reviews'
-- 
-- ---

DROP TABLE IF EXISTS `reviews`;
		
CREATE TABLE `reviews` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `id_restaurant` INTEGER NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `description` MEDIUMTEXT NOT NULL,
  `stars` INTEGER NOT NULL DEFAULT 0 COMMENT 'number 1-5, indicating general happiness with the restaurant',
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `restaurants` ADD FOREIGN KEY (id_cuisine) REFERENCES `cuisines` (`id`);
ALTER TABLE `reviews` ADD FOREIGN KEY (id_restaurant) REFERENCES `restaurants` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `restaurants` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `cuisines` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `reviews` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `restaurants` (`id`,`id_cuisine`,`name`,`description`,`price`) VALUES
-- ('','','','','');
-- INSERT INTO `cuisines` (`id`,`name`,`description`) VALUES
-- ('','','');
-- INSERT INTO `reviews` (`id`,`id_restaurant`,`username`,`description`,`stars`) VALUES
-- ('','','','','');