UPDATE `quickspread`.`vi_restaurant` SET `image` = 'media/userfiles/images/restaurant/Apple-Spice.gif' WHERE `vi_restaurant`.`restaurant_id` =1 LIMIT 1 ;


UPDATE `quickspread`.`vi_restaurant` SET `image` = 'media/userfiles/images/restaurant/img.jpg' WHERE `vi_restaurant`.`restaurant_id` =2 LIMIT 1 ;


ALTER TABLE `vi_meal` ADD `type` TINYINT( 1 ) NOT NULL DEFAULT '0' COMMENT '0:general_menu, 1:catering' AFTER `category_value_id` 

ALTER TABLE `vi_meal` DROP `parent` 

ALTER TABLE `vi_meal` ADD `image` VARCHAR( 255 ) NULL AFTER `type` 


