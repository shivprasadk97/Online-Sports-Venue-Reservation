create database Project;
use Project;

create table customer(
username varchar(30) primary key,
fname varchar(30) not null,
lname varchar(30) not null,
email varchar(30) not null,
phone varchar(30) not null
);

create table login(
username varchar(30) references customer(username),
password varchar(30) not null,
primary key(username)
);
create table ground(
gid int primary key auto_increment,
type varchar(30) not null,
location varchar(30) not null,
sport varchar(30) not null,
amount varchar(30) not null);

create table review(
gid int references ground(gid),
rating int not null
);

create table registers(
rid int primary key auto_increment,
gid int references ground(gid),
peak int default 0,
bill_amt varchar(30),
username varchar(30) references customer(username),
time varchar(15),
date varchar(15)

);

insert into ground(type,sport,location,amount) values('Indoor','Badminton','Yelahanka','1500');
insert into ground(type,sport,location,amount) values('Indoor','Basketball','Yelahanka','1500');
insert into ground(type,sport,location,amount) values('Outdoor','Football','Yelahanka','500');
insert into ground(type,sport,location,amount) values('Outdoor','Cricket','Yelahanka','1200');
insert into ground(type,sport,location,amount) values('Indoor','Badminton','Hebbal','1500');
insert into ground(type,sport,location,amount) values('Indoor','Basketball','Hebbal','1000');
insert into ground(type,sport,location,amount) values('Outdoor','Football','Hebbal','1200');
insert into ground(type,sport,location,amount) values('Outdoor','Cricket','Hebbal','1300');
insert into ground(type,sport,location,amount) values('Indoor','Badminton','Kanteerava','2500');
insert into ground(type,sport,location,amount) values('Indoor','Basketball','Kanteerava','2500');
insert into ground(type,sport,location,amount) values('Outdoor','Football','Kanteerava','3500');
insert into ground(type,sport,location,amount) values('Outdoor','Cricket','Kanteerava','3300');
insert into ground(type,sport,location,amount) values('Indoor','Badminton','FSV Arena','1100');
insert into ground(type,sport,location,amount) values('Indoor','Basketball','FSV Arena','1500');
insert into ground(type,sport,location,amount) values('Outdoor','Footbsll','FSV Arena','1500');

delimiter //
CREATE TRIGGER amt_check BEFORE UPDATE ON registers
FOR EACH ROW
BEGIN
   IF NEW.time <'16:00' THEN
      SET NEW.peak=0 ;
      ELSEIF NEW.time >='16:00'  THEN
      SET NEW.peak=1;
   END IF;
END;//
delimiter ;

USE `project`;
DROP procedure IF EXISTS `new_procedure`;

DELIMITER $$
USE `project`$$
CREATE PROCEDURE `get_pwd` (IN user varchar(30),OUT pwd varchar(30))
BEGIN
	select password into pwd
    from login where username =user;
END$$

DELIMITER ;
CALL `get_reg`();
select * from registers;
select * from registers;
select * from customer;
select * from login;
