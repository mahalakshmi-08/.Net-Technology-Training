select * from users;


-- default constraint for category column as 'admin' 
alter table users add constraint cons DEFAULT 'Admin' for category;

insert into users (UserName,Password,FullName,IsActive) values('Shawn','shawn@123','Shawn Marshall',1);

-- check constraint for the transaction as it should accept only the IN/OUT values.
alter table [transaction] add constraint transactionType check (transactionType='in'  or transactionType='out'); 


insert into [transaction] values('07-12-2012',1,'in',12,1);

select * from [transaction];

-- for checking multiple conditions value 'in' operator
Select * from ProductMaster where AvailableQty in (500,1000);

--Username start with 'M'
select * from users where UserName like 'M%';

--second letter as 'o'
select * from users where username like '_o%';

-- funtions
select * from productMaster;

--max function
Select Max(AvailableQTY) as Highest_Quantity from productmaster;

--min function
Select min(AvailableQTY) as Lowest_Quantity from productmaster;

--Sum Function
Select Sum(AvailableQty) from ProductMaster;

--Count Function to get total rows
Select Count(*) as TotalCount from ProductMaster;

--Avg function
Select avg(AvailableQty) from productMaster;