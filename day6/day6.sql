Select * from LMS_BOOK_DETAILS;
Select * from LMS_SUPPLIERS_DETAILS;
Select * from LMS_MEMBERS;
Select * from lms_book_issue;


--Display the booktitle, supplier name who has supplied the books and the member name who has taken the book from the library''
Select   l1.BOOK_TITLE,l2.SUPPLIER_NAME,l4.MEMBER_NAME  
from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2 
on l1.SUPPLIER_ID=l2.SUPPLIER_ID
join LMS_BOOK_ISSUE as l3 on l3.BOOK_CODE=l1.BOOK_CODE join 
LMS_MEMBERS as l4 on l4.MEMBER_ID=l3.MEMBER_ID;


--Stored Procedures

Alter proc usp_FetchBookDetails
AS
Begin
Select   l1.BOOK_TITLE,l2.SUPPLIER_NAME,l4.MEMBER_NAME  
from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2 
on l1.SUPPLIER_ID=l2.SUPPLIER_ID
join LMS_BOOK_ISSUE as l3 on l3.BOOK_CODE=l1.BOOK_CODE join 
LMS_MEMBERS as l4 on l4.MEMBER_ID=l3.MEMBER_ID;
END

execute usp_FetchBookDetails;

insert into lms_fine_details values('R12',325);




Alter proc usp_AddFine
(@fr char(5), @fa int)
AS
Begin
insert into LMS_FINE_DETAILS values(@fr,@fa);
Select * from lms_fine_details;
END

execute usp_AddFine 'R10',300

Alter table lms_fine_details drop column c1;

--Stored Procedures for DDL

create proc usp_DDL
As
BEGIN
Alter table lms_fine_details add  c1 int
END

--views
--Creating the View -Virtual table 

Create View vw_Book_details
AS
Select   l1.BOOK_TITLE,l2.SUPPLIER_NAME,l4.MEMBER_NAME  
from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2 
on l1.SUPPLIER_ID=l2.SUPPLIER_ID
join LMS_BOOK_ISSUE as l3 on l3.BOOK_CODE=l1.BOOK_CODE join 
LMS_MEMBERS as l4 on l4.MEMBER_ID=l3.MEMBER_ID;

Select * from vw_Book_details where supplier_name like 'S%';


--Triggers

Select * from lms_fine_details;

--Create trigger
Create trigger trg_InsertFine
on lms_fine_details
FOR insert As
BEGIN
print 'A New Row added '
END

--update trigger
Create trigger trg_UpdateFine
on lms_fine_details
FOR update As
BEGIN
print 'A  Row updated in Fine Details table '
END

--for delete trigger
Create trigger trg_DeleteFine
on lms_fine_details
FOR delete As
BEGIN
Rollback--undo changes
print 'Not Allowed to delete'
END

Delete from LMS_FINE_DETAILS where fine_range='R11';

--enabling the triggers
Enable trigger trg_DeleteFine on lms_fine_details;

update lms_fine_details set fine_amount=350 where fine_range='R12'
