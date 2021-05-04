CREATE DATABASE property_management;
USE property_management; 
CREATE TABLE  accounts (
  	  id int NOT NULL AUTO_INCREMENT,
  	  username varchar(50) NOT NULL,
      fullname varchar(50) NOT NULL,
      email varchar(50) NOT NULL,
      mobile varchar(10) NOT NULL,
	  password varchar(255) NOT NULL,
 	  cpassword varchar(255) NOT NULL,
      PRIMARY KEY (id)
); 