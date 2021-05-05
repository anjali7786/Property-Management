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

CREATE TABLE apartmentdetail (
    A_ID int NOT NULL AUTO_INCREMENT,
    id int NOT NULL,
    Aname varchar(50) NOT NULL,
    Plot_no int NOT NULL,
    Area numeric NOT NULL,
    Address varchar(100) NOT NULL,
    Landmark varchar(100) NOT NULL,
    City varchar(50) NOT NULL,
    Pincode decimal(6,0) NOT NULL,
    State varchar(50) NOT NULL,
    Country varchar(50) NOT NULL,
    Atype varchar(50) NOT NULL,
    RS varchar(4) NOT NULL,
 	Availability varchar(20) NOT NULL,
	Price numeric NOT NULL,
 	Facilities varchar(250) NOT NULL,
 	Descr varchar(500) NOT NULL,
 	image varchar(10000) NOT NULL,
    PRIMARY KEY (A_ID),
	FOREIGN KEY (id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);

Select * from accounts;
Select * from apartmentdetail;