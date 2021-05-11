CREATE TABLE accounts (
	`id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`username` varchar(50) NOT NULL,
	`fullname` varchar(50) NOT NULL,
	`email` varchar(50) NOT NULL,
	`mobile` varchar(10) NOT NULL,
	`password` varchar(255) NOT NULL,
	`cpassword` varchar(255) NOT NULL,
);

INSERT INTO `accounts`
        (`id`,`username`, `fullname`, `email`,`mobile`,`password`,`cpassword`)
        VALUES ('admin', 'admin', 'admin@gmail.com', '1234567890', 'admin', 'admin') ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
