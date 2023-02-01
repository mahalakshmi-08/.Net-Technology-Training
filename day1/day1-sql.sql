create database inventoryManagementSystem;
 
use inventoryManagementSystem;

create table Users
(
UserId int primary key identity(1,1),
UserName varchar(50),
Password varchar(25),
FullName varchar(255),
IsActive bit,
Category varchar(50)
);

create table ProductMaster
(
ProductId int primary key identity(1,1),
ProductName varchar(50),
AvailableQty bigint
);


create table [Transaction](
TransactionId int primary key identity(1,1),
TransactionDate date,
ProductId int foreign key references ProductMaster(ProductId),
TransactionType varchar(50),
Qty int,
UpdatedBy int foreign key references Users(UserId)
);

-- add foreign key constraint

alter table[Transaction] add foreign key(UpdatedBy) references Users(UserId);

-- check contraint for transactiontype as it should accept only in/out values.
alter table [Transaction] add check (TransactionType = 'IN' or TransactionType = 'OUT');

-- updatedby column as not Null.
alter table [transaction] alter column updatedby int not null;

-- Droping a foreign key

Alter table [Transaction] drop [FK__Transacti__Updat__3C69FB99];

--Insert into values
insert into PRODUCTMASTER values('TubeLight',500);

insert into PRODUCTMASTER values('Switch',1000),('Screws',2000),('Nails',500);

insert into Users(UserName,Password,FullName,IsActive) values 
('Mathew','Mathew@111','John Mathew',1);

insert into Users(UserName,Password,FullName,IsActive) values 
('John','John@1932','John Hawat',1);

insert into Users(UserName,Password,FullName,IsActive) values 
('Bob','Bobb@32','Bob Shall',1);

insert into Users(UserName,Password,FullName,IsActive) values 
('Pinky','Pinkys@34','Pinky Bhishwas',1);

insert into Users(UserName,Password,FullName,IsActive) values 
('Shom','Shom@123','Shom Mishal',1);

select * from users;

insert into [TRANSACTION] values('10-11-2012',2,'IN',12,4),
('07-04-2012',3,'IN',15,4);

SELECT * from [Transaction];


--update command
Update Users set category='Staff' where USERID=2;
Update Users set category='Worker' where USERID=3;
Update Users set category='Doctor' where USERID=4;
Update Users set category='Staff' where USERID=5;
Update Users set category='Manager' where USERID=1;

Select * from Users;

update [Transaction] set TransactionType='In' where TransactionId=5;
update [Transaction] set TransactionType='Out' where TransactionId=7;
update [Transaction] set TransactionType='Out' where TransactionId=6;

--select statements

--select all users fullname and category
select FullName,Category from Users;

--select productName where availableQty is less than 500
select ProductName from ProductMaster where AvailableQty<500;

select * from [Transaction] where UpdatedBy=1;

--Inward transaction details
select * from [TRANSACTION] where TransactionType='In';

-- Nails product details
select * from ProductMaster where ProductName='Nails';