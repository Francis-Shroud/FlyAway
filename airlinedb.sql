create database airline;
use airline;

CREATE TABLE airports (
  a_code VARCHAR(3) PRIMARY KEY,
  a_name VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL
);

select * from airports;
  
CREATE TABLE airlines (
  code VARCHAR(3) PRIMARY KEY,
  name VARCHAR(50) NOT NULL);
  
  select * from airlines;
  
CREATE TABLE flights (
F_id varchar(10) PRIMARY KEY,
airline_code VARCHAR(3) NOT NULL,
source_code VARCHAR(3) NOT NULL,
destination_code VARCHAR(3) NOT NULL,
price float NOT NULL,
seats int not null, 
FOREIGN KEY (airline_code) REFERENCES airlines(code),
FOREIGN KEY (source_code) REFERENCES airports(a_code),
FOREIGN KEY (destination_code) REFERENCES airports(a_code));
  
select * from flights;
  
select airline_code, source_code, destination_code, price, seats from flights where (source_code="DEL" AND destination_code="NGP");

select BookingsPerDay.bdate, flights.F_id, flights.airline_code, flights.source_code, flights.destination_code, flights.price, flights.seats
from flights 
join BookingsPerDay on flights.airline_code = BookingsPerDay.airline_code
where (source_code="BOM" AND destination_code="NAG" AND bdate="2023-04-03");
  
Create table PassengerReg(
P_id int  primary key auto_increment, 
airline_code varchar(3),
Pname varchar(40) not null, 
gender  varchar(6), 
age int, 
passportno  varchar(20),
FOREIGN KEY (airline_code) REFERENCES airlines(code));

select * from PassengerReg;

select * from PassengerReg where airline_code="6E";


Create table BookingsPerDay(
id int auto_increment primary key, 
airline_code  VARCHAR(3) not null, 
bdate   date, 
noofbookings   int, 
booked int,
FOREIGN KEY (airline_code) REFERENCES airlines(code));

select * from BookingsPerDay;


Create table PassengerTravelDetails(
sno int auto_increment  primary key, 
P_id int not null, 
traveldate  date, 
traveltime time, 
airline_code VARCHAR(3) NOT NULL,
source_code VARCHAR(3) NOT NULL,
destination_code VARCHAR(3) NOT NULL,
F_id varchar(10) not null, 
FOREIGN KEY (airline_code) REFERENCES airlines(code),
FOREIGN KEY (source_code) REFERENCES airports(a_code),
FOREIGN KEY (destination_code) REFERENCES airports(a_code),
FOREIGN KEY (F_id) REFERENCES flights(f_id), 
FOREIGN KEY (P_id) REFERENCES PassengerReg(P_id));

select * from PassengerTravelDetails;

Create table Payments(
payid int auto_increment primary key, 
P_id  int not null, 
Amount  float not null, 
TransactionType  varchar(20), 
TransDate datetime,
FOREIGN KEY (P_id) REFERENCES PassengerReg(P_id));

select * from Payments;

create table Adminlogin(
id int  primary key,
logid varchar(50) ,
logpass varchar (50)
);
 
select * from Adminlogin;