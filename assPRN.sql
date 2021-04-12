use master
drop database BookStore
create database BookStore
use BookStore

create table Account(
	accountId Varchar(15) primary key,
	password Varchar(20) not null,
	phone varchar(20) not null,
	fullname varchar(50) not null,
	address varchar(20),
	status bit not null,
	role bit not null,
)

create table Book(
	bookID Int identity(1,1) primary key,
	name varchar(20),
	author varchar(20),
	yearOfPublice int,
	category varchar(20),
	price float,
	quantity int,
	image varchar(100),
	status bit
)

create table OrderHeader (
	orderId int identity(1,1) primary key,
	customerName varchar(50),
	contactPerson varchar(100),
	address varchar(100),
	tel varchar(15),
	paymentType varchar(50),
	description varchar(100),
	totalValue float not null,
	registerDate date
)

create table OrderDetail(
	orderId int references OrderHeader(orderId),
	bookId int references Book(bookID),
	primary key(orderId, bookId),
	quantity int not null,
	price float not null,

)

insert into Account values ('admin','admin','0123456789','Vo Nhut Thanh Long','Q9',1,1)

insert into Account values ('admin1','admin','0123456789','Le Minh Tuan','Q9',1,1)

insert into Account values ('admin2','admin','0123456789','Vo Nhi Thanh Long','Q9',1,1)

insert into Book(name,author,yearOfPublice,category,price,quantity,image,status)
			values ('Java Web','BGD','2016','IT',20000,3,'Restfulljavaweb.jpg',1)
insert into Book(name,author,yearOfPublice,category,price,quantity,image,status)
			values ('Cookish ','John Weely','2016','Cooking',20000,3,'Cookish.jpg',1)
insert into Book(name,author,yearOfPublice,category,price,quantity,image,status)
			values ('Java Servlet and JSP','Ethic Kalin','2016','IT',60000,3,'Javaservletsandjsp.jpg',1)
insert into Book(name,author,yearOfPublice,category,price,quantity,image,status)
			values ('Hot Pot','Elly Kont','2016','IT',20000,3,'stepbystep.jpg',1)
insert into Book(name,author,yearOfPublice,category,price,quantity,image,status)
			values ('Data and Sollution','Le Minh Hoang','2012','IT',200000,3,'GTVLT.png',1)
insert into Book(name,author,yearOfPublice,category,price,quantity,image,status)
			values ('Java OOP','Alexander Moflit','2013','IT',30000,3,'java.png',1)
insert into Book(name,author,yearOfPublice,category,price,quantity,image,status)
			values ('PHP','Winth Scar','2015','IT',50000,3,'PHPJS.jpg',1)