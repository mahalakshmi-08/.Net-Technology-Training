select * from [LMS_MEMBERS];
select * from [LMS_SUPPLIERS_DETAILS];
select * from [LMS_FINE_DETAILS];
select * from [LMS_BOOK_DETAILS];
select * from [LMS_BOOK_ISSUE];

-- LMS- Joins Questions
-- 1.	Write a query to display the book title, supplier name who has supplied books to library.
select distinct l1.BOOK_TITLE, l2.SUPPLIER_NAME
from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2
on l1.SUPPLIER_ID = l2.SUPPLIER_ID;

-- 2.	Write a query to display member name and book code for the book he/she taken from the library.
select l1.MEMBER_NAME, l2.BOOK_CODE 
from LMS_MEMBERS as l1 join LMS_BOOK_ISSUE as l2
on l1.MEMBER_ID = l2.MEMBER_ID;

-- 3.	Write a query to display the book title and date when the book was taken from the library.
select l1.BOOK_TITLE, l2.DATE_ISSUE
from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2
on l1.BOOK_CODE=l2.BOOK_CODE;

-- 4.	Write a query to display the member id and the fine amount paid by the member in the library.
select l1.MEMBER_ID, l2.FINE_AMOUNT
from LMS_BOOK_ISSUE as l1 join LMS_FINE_DETAILS as l2
on l1.FINE_RANGE = l2.FINE_RANGE;

-- 5.	Write a query to display the member name and the date difference between the date return and date returned.
select distinct MEMBER_NAME, DATEDIFF(DAY,DATE_RETURN,DATE_RETURNED) as  DATEDIFFERENCE
from LMS_MEMBERS  as l1 join LMS_BOOK_ISSUE as l2
on l1.MEMBER_ID = l2.MEMBER_ID;

-- 6.	Write a query to display the book title and the member name of member who has taken book from library.
select distinct l1.BOOK_TITLE, l3.MEMBER_NAME
from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2
on l1.BOOK_CODE = l2.BOOK_CODE join LMS_MEMBERS as l3 
on l2.MEMBER_ID=l3.MEMBER_ID;

-- 7.	Write a query to display the book title, member name and the supplier name for the books taken from the library.
select distinct l2.BOOK_TITLE, l1.SUPPLIER_NAME, l4.MEMBER_NAME
from LMS_SUPPLIERS_DETAILS as l1 join LMS_BOOK_DETAILS as l2
on l1.SUPPLIER_ID = l2.SUPPLIER_ID join LMS_BOOK_ISSUE as l3
on l2.BOOK_CODE = l3.BOOK_CODE join LMS_MEMBERS as l4
on l3.MEMBER_ID = l4.MEMBER_ID;

-- 8.	Write a query to display the book title and the difference fine amount paid for the book in library.
select l1.BOOK_TITLE, l3.FINE_AMOUNT
from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2 
on l1.BOOK_CODE = l2.BOOK_CODE join LMS_FINE_DETAILS as l3
on l2.FINE_RANGE = l2.FINE_RANGE;


