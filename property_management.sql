CREATE DATABASE property_management;
USE property_management;
CREATE TABLE accounts (
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
	Pincode decimal(6, 0) NOT NULL,
	State varchar(50) NOT NULL,
	Country varchar(50) NOT NULL,
	Atype varchar(50) NOT NULL,
	RS varchar(4) NOT NULL,
	Availability varchar(20) NOT NULL,
	Price numeric NOT NULL,
	Facilities varchar(250) NOT NULL,
	Descr varchar(500) NOT NULL,
	image varchar(10000) NOT NULL,
	rating decimal(10,2) NOT NULL,
	PRIMARY KEY (A_ID),
	FOREIGN KEY (id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE roomdetail(
	R_ID int NOT NULL AUTO_INCREMENT,
	id int NOT NULL,
	Bname varchar(100) NOT NULL,
	Room_no INT NOT NULL,
	Area numeric NOT NULL,
	Address varchar(100) NOT NULL,
	Landmark varchar(100) NOT NULL,
	City varchar(50) NOT NULL,
	Pincode decimal(6, 0) NOT NULL,
	State varchar(50) NOT NULL,
	Country varchar(50) NOT NULL,
	Availability varchar(20) NOT NULL,
	Rent numeric NOT NULL,
	Facilities varchar(250) NOT NULL,
	Descr varchar(500) NOT NULL,
	image varchar(10000) NOT NULL,
	rating decimal(10,2) NOT NULL,
	PRIMARY KEY (R_ID),
	FOREIGN KEY (id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE projectdetail(
	P_ID int NOT NULL AUTO_INCREMENT,
	id int NOT NULL,
	Pname varchar(50) NOT NULL,
	Flattype varchar(300) NOT NULL,
	Address varchar(100) NOT NULL,
	Features varchar(200) NOT NULL,
	City varchar(50) NOT NULL,
	Pincode decimal(6, 0) NOT NULL,
	State varchar(50) NOT NULL,
	Country varchar(50) NOT NULL,
	Availability varchar(20) NOT NULL,
	Facilities varchar(250) NOT NULL,
	Descr varchar(500) NOT NULL,
	image varchar(10000) NOT NULL,
	rating decimal(10,2) NOT NULL,
	PRIMARY KEY (P_ID),
	FOREIGN KEY (id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Buy_propertyapt(
	A_ID int(110) NOT NULL,
	id int not null,
	Age int NOT NULL,
	Address varchar(100) NOT NULL,
	Landmark varchar(100) NOT NULL,
	City varchar(50) NOT NULL,
	Pincode decimal(6, 0) NOT NULL,
	State varchar(50) NOT NULL,
	Occupation varchar(50) NOT NULL,
	Status varchar(50) NOT NULL,
	primary key(A_ID, id),
	foreign key(A_ID) references apartmentdetail(A_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key(id) references accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Buy_propertyroom(
    R_ID int(110) NOT NULL,
    id int not null,
    Age int NOT NULL,
    Address varchar(100) NOT NULL,
    Landmark varchar(100) NOT NULL,
    City varchar(50) NOT NULL,
    Pincode decimal(6,0) NOT NULL,
    State varchar(50) NOT NULL,
    Occupation varchar(50) NOT NULL,
    Status varchar(50) NOT NULL,
    primary key(R_ID,id),
    foreign key(R_ID) references roomdetail(R_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(id) references accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE book_meet_apt(
	A_ID int NOT NULL,
	id int NOT NULL,
	Address varchar(100) NOT NULL,
	Landmark varchar(200) NOT NULL,
	City varchar(50) NOT NULL,
	Pincode decimal(6, 0) NOT NULL,
	State varchar(50) NOT NULL,
	Country varchar(50) NOT NULL,
	Occupation varchar(20) NOT NULL,
	Slot varchar(250) NOT NULL,
	booking_date date NOT null,
	PRIMARY KEY (A_ID, id),
	FOREIGN KEY (id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (A_ID) REFERENCES apartmentdetail(A_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE accept_meet_apt(
	Ac_id int not null unique auto_increment,
	A_ID int NOT NULL,
	id int NOT NULL,
	buyer_id int NOT NULL,
	Address varchar(100) NOT NULL,
	Landmark varchar(200) NOT NULL,
	City varchar(50) NOT NULL,
	Pincode decimal(6, 0) NOT NULL,
	State varchar(50) NOT NULL,
	Country varchar(50) NOT NULL,
	booking_date date NOT null,
	starttime time not null,
	endtime time not null,
	PRIMARY KEY (Ac_id),
	FOREIGN KEY (id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (buyer_id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (A_ID) REFERENCES apartmentdetail(A_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE book_meet_room(
	R_ID int NOT NULL,
	id int NOT NULL,
	Address varchar(100) NOT NULL,
	Landmark varchar(200) NOT NULL,
	City varchar(50) NOT NULL,
	Pincode decimal(6, 0) NOT NULL,
	State varchar(50) NOT NULL,
	Country varchar(50) NOT NULL,
	Occupation varchar(20) NOT NULL,
	Slot varchar(250) NOT NULL,
	booking_date date NOT null,
	PRIMARY KEY (R_ID, id),
	FOREIGN KEY (id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (R_ID) REFERENCES roomdetail(R_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE accept_meet_room(
	Ac_id int not null unique auto_increment,
	R_ID int NOT NULL,
	id int NOT NULL,
	buyer_id int NOT NULL,
	Address varchar(100) NOT NULL,
	Landmark varchar(200) NOT NULL,
	City varchar(50) NOT NULL,
	Pincode decimal(6, 0) NOT NULL,
	State varchar(50) NOT NULL,
	Country varchar(50) NOT NULL,
	booking_date date NOT null,
	starttime time not null,
	endtime time not null,
	PRIMARY KEY (Ac_id),
	FOREIGN KEY (id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (buyer_id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (R_ID) REFERENCES roomdetail(R_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE book_meet_project(
	P_ID int NOT NULL,
	id int NOT NULL,
	Address varchar(100) NOT NULL,
	Landmark varchar(200) NOT NULL,
	City varchar(50) NOT NULL,
	Pincode decimal(6, 0) NOT NULL,
	State varchar(50) NOT NULL,
	Country varchar(50) NOT NULL,
	Occupation varchar(20) NOT NULL,
	Slot varchar(250) NOT NULL,
	booking_date date NOT null,
	PRIMARY KEY (P_ID, id),
	FOREIGN KEY (id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (P_ID) REFERENCES projectdetail(P_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE accept_meet_project(
	Ac_id int not null unique auto_increment,
	P_ID int NOT NULL,
	id int NOT NULL,
	buyer_id int NOT NULL,
	Address varchar(100) NOT NULL,
	Landmark varchar(200) NOT NULL,
	City varchar(50) NOT NULL,
	Pincode decimal(6, 0) NOT NULL,
	State varchar(50) NOT NULL,
	Country varchar(50) NOT NULL,
	booking_date date NOT null,
	starttime time not null,
	endtime time not null,
	PRIMARY KEY (Ac_id),
	FOREIGN KEY (id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (buyer_id) REFERENCES accounts(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (P_ID) REFERENCES projectdetail(P_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE complaintsapartment (
	C_ID int NOT NULL AUTO_INCREMENT,
	A_ID int NOT NULL,
	Aname varchar(50) NOT NULL,
	Complaint varchar(250) NOT NULL,
	Flag int(1) DEFAULT 0,
	PRIMARY KEY (C_ID),
	FOREIGN KEY (A_ID) REFERENCES apartmentdetail(A_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE complaintsroom(
	C_ID int NOT NULL AUTO_INCREMENT,
	R_ID int NOT NULL,
	Room_no varchar(50) NOT NULL,
	Complaint varchar(250) NOT NULL,
	Flag int(1) DEFAULT 0,
	PRIMARY KEY (C_ID),
	FOREIGN KEY (R_ID) REFERENCES roomdetail(R_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE complaintsbuilder (
	C_ID int NOT NULL AUTO_INCREMENT,
	P_ID int NOT NULL,
	Pname varchar(50) NOT NULL,
	Complaint varchar(250) NOT NULL,
	Flag int(1) DEFAULT 0,
	PRIMARY KEY (C_ID),
	FOREIGN KEY (P_ID) REFERENCES projectdetail(P_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE saveapartment(
    A_ID int NOT NULL,
    id int not null,
    primary key(A_ID,id),
    foreign key(A_ID) references apartmentdetail(A_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(id) references accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE saveroom(
    R_ID int NOT NULL,
    id int not null,
    primary key(R_ID,id),
    foreign key(R_ID) references roomdetail(R_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(id) references accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE saveproject(
    P_ID int NOT NULL,
    id int not null,
    primary key(P_ID,id),
    foreign key(P_ID) references projectdetail(P_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(id) references accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);

Create table contactus
(
	M_ID int(110) NOT NULL auto_increment,
	fname varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	message varchar(200) NOT NULL,
    primary key(M_ID)
);

CREATE TABLE follow1(
    id1 int not null,
    id2 int not null,
    primary key(id1,id2),
    foreign key(id1) references accounts(id) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(id2) references accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE follow2(
    id1 int not null,
    id2 int not null,
    primary key(id1,id2),
    foreign key(id1) references accounts(id) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(id2) references accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Buy_project(
	P_ID int(110) NOT NULL,
	id int not null,
	Age int NOT NULL,
	Address varchar(100) NOT NULL,
	Landmark varchar(100) NOT NULL,
	City varchar(50) NOT NULL,
	Pincode decimal(6, 0) NOT NULL,
	State varchar(50) NOT NULL,
	Occupation varchar(50) NOT NULL,
	Status varchar(50) NOT NULL,
	primary key(P_ID, id),
	foreign key(P_ID) references projectdetail(P_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key(id) references accounts(id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE approvedapart (
X_ID int NOT NULL AUTO_INCREMENT,
A_ID int NOT NULL,
Aname varchar(50) NOT NULL,
Applicant varchar(50) NOT NULL,
email varchar(50) NOT NULL,
mobile varchar(10) NOT NULL,
Flag int(1) DEFAULT 0,
FOREIGN KEY (A_ID) REFERENCES apartmentdetail(A_ID) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (X_ID)
);
CREATE TABLE approvedroom (
X_ID int NOT NULL AUTO_INCREMENT,
R_ID int NOT NULL,
Room_no varchar(50) NOT NULL,
Applicant varchar(50) NOT NULL,
email varchar(50) NOT NULL,
mobile varchar(10) NOT NULL,
Flag int(1) DEFAULT 0,
FOREIGN KEY (R_ID) REFERENCES roomdetail(R_ID) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (X_ID)
);
CREATE TABLE approvedproject (
X_ID int NOT NULL AUTO_INCREMENT,
P_ID int NOT NULL,
Pname varchar(50) NOT NULL,
Applicant varchar(50) NOT NULL,
email varchar(50) NOT NULL,
mobile varchar(10) NOT NULL,
Flag int(1) DEFAULT 0,
FOREIGN KEY (P_ID) REFERENCES projectdetail(P_ID) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (X_ID)
);


CREATE TABLE ratings_apt (
X_ID int NOT NULL AUTO_INCREMENT,
A_ID int NOT NULL,
Aname varchar(50) NOT NULL,
rating decimal(10,2) NOT NULL,
FOREIGN KEY (A_ID) REFERENCES apartmentdetail(A_ID) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (X_ID)
);

CREATE TABLE ratings_room (
X_ID int NOT NULL AUTO_INCREMENT,
R_ID int NOT NULL,
Room_no int NOT NULL,
rating decimal(10,2) NOT NULL,
FOREIGN KEY (R_ID) REFERENCES roomdetail(R_ID) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (X_ID)
);

CREATE TABLE ratings_project (
X_ID int NOT NULL AUTO_INCREMENT,
P_ID int NOT NULL,
Pname varchar(50) NOT NULL,
rating decimal(10,2) NOT NULL,
FOREIGN KEY (P_ID) REFERENCES projectdetail(P_ID) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (X_ID)
);

Select * from accounts;
Select * from apartmentdetail;
Select * from roomdetail;
Select * from projectdetail;
select * from book_meet_project;
select * from book_meet_room;
select * from book_meet_apt;
select * from accept_meet_apt;
select * from contactus;
select * from Buy_project;
