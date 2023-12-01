CREATE DATABAse  company;
USE company;

CREATE TABLE `employee` (
	`employee_id` int NOT NULL,
	`user_name` varchar(30) NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`position` varchar(15) NOT NULL,
	`employment_date` DATE NOT NULL,
	`departament_id` int NOT NULL,
	`manager_id` int NOT NULL,
	`rate` FLOAT NOT NULL,
	`bonus` FLOAT NOT NULL,
	PRIMARY KEY (`employee_id`)
);

CREATE TABLE `department` (
	`department_id` int NOT NULL,
	`department_name` varchar(30) NOT NULL,
	`city` varchar(30) NOT NULL,
	`street` varchar(40) NOT NULL,
	`building_namber` int(3) NOT NULL,
	PRIMARY KEY (`department_id`)
);

CREATE TABLE `product` (
	`product_id` int NOT NULL,
	`product_name` varchar(40) NOT NULL,
	`product_description` varchar(150) NOT NULL,
	`category` varchar(15) NOT NULL,
	`manufacture` varchar(30) NOT NULL,
	`product_type` varchar(15) NOT NULL,
	`amount` int NOT NULL,
	`price` FLOAT NOT NULL,
	PRIMARY KEY (`product_id`)
);

CREATE TABLE `customer` (
	`customer_id` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`gender` varchar(1) NOT NULL,
	`birt_date` DATE NOT NULL,
	`phone_number` int(12) NOT NULL,
	`discount` int(2) NOT NULL,
	`email` varchar(50) NOT NULL,
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `orders` (
	`orders_id` int NOT NULL,
	`employee_id` int NOT NULL,
	`product_id` int NOT NULL,
	`customer_id` int NOT NULL,
	`transaction_type` int NOT NULL,
	`transaction_moment` DATETIME NOT NULL,
	`amount` int NOT NULL,
	PRIMARY KEY (`orders_id`)
);

ALTER TABLE `employee` ADD CONSTRAINT `employee_fk0` FOREIGN KEY (`departament_id`) REFERENCES `department`(`department_id`);

ALTER TABLE `employee` ADD CONSTRAINT `employee_fk1` FOREIGN KEY (`manager_id`) REFERENCES `employee`(`employee_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk2` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);






