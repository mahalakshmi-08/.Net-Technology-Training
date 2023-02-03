select * from [LMS_MEMBERS];
select * from [LMS_SUPPLIERS_DETAILS];
select * from [LMS_FINE_DETAILS];
select * from [LMS_BOOK_DETAILS];
select * from [LMS_BOOK_ISSUE];

--SIMPLE 
-- 17. Write a query to display the member id, member name, city and member status of members with the total fine paid by them with alias name “Fine”.
select l1.MEMBER_ID, l1.MEMBER_NAME, l1.CITY, l1.MEMBERSHIP_STATUS, SUM(FINE_AMOUNT) AS 'FINE' 
from LMS_MEMBERS as l1 inner join LMS_BOOK_ISSUE as l2
on l1.MEMBER_ID = l2.MEMBER_ID join LMS_FINE_DETAILS as l3
on l2.FINE_RANGE = l3.FINE_RANGE
GROUP BY L1.MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS;

select l1.MEMBER_ID, l1.MEMBER_NAME, l1.CITY, l1.MEMBERSHIP_STATUS, FINE_AMOUNT AS 'FINE' 
from LMS_MEMBERS as l1  join LMS_BOOK_ISSUE as l2
on l1.MEMBER_ID = l2.MEMBER_ID join LMS_FINE_DETAILS as l3
on l2.FINE_RANGE = l3.FINE_RANGE
GROUP BY L1.MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS;



--AVERAGE
-- 1. Write a query to display the member id, member name of the members, book code and book title of the books taken by them.
select l3.MEMBER_ID, l3.MEMBER_NAME, l1.BOOK_CODE, l1.BOOK_TITLE
from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2
on l1.BOOK_CODE = l2.BOOK_CODE join LMS_MEMBERS as l3
on l2.MEMBER_ID = l3.MEMBER_ID;

-- 3. Write a query to display the member id, member name, fine range and fine amount of the members whose fine amount is less than 100. 
select l1.MEMBER_ID, l2.MEMBER_NAME, l3.FINE_RANGE, l3.FINE_AMOUNT
from LMS_BOOK_ISSUE as l1 join LMS_MEMBERS as l2
on l1.MEMBER_ID = l2.MEMBER_ID join LMS_FINE_DETAILS as l3
on l1.FINE_RANGE = l3.FINE_RANGE where FINE_AMOUNT<100;

--4.Write a query to display the book code, book title, publisher, edition, price and year of publication and
--sort based on year of publication, publisher and edition.
select BOOK_CODE, BOOK_TITLE, PUBLICATION, BOOK_EDITION, PRICE, year(PUBLISH_DATE) as YEAR_OF_PUBLICATION
from LMS_BOOK_DETAILS order by YEAR_OF_PUBLICATION,PUBLICATION,BOOK_EDITION ;

--5.Write a query to display the book code, book title and rack number of the books which are placed in rack 'A1' and
--sort by book title in ascending order. 
select BOOK_CODE, BOOK_TITLE, RACK_NUM
from LMS_BOOK_DETAILS where RACK_NUM = 'A1' order by BOOK_TITLE;

--6.Write a query to display the member id, member name, due date and date returned of the members who has 
--returned the books after the due date. Hint: Date_return is due date and Date_returned is actual book return date. 
select l1.MEMBER_ID, l1.MEMBER_NAME, l2.DATE_RETURN as DUE_DATE, l2.DATE_RETURNED
from LMS_MEMBERS as l1 join LMS_BOOK_ISSUE as l2
on l1.MEMBER_ID = l2.MEMBER_ID 
where DATE_RETURNED>DATE_RETURN;

--7.Write a query to display the member id, member name and date of registration who have not taken any book
SELECT l2.MEMBER_ID, l2.MEMBER_NAME, DATE_REGISTER
FROM LMS_BOOK_ISSUE as l1 right join LMS_MEMBERS as l2 
on l1.MEMBER_ID = l2.MEMBER_ID
where BOOK_CODE IS NULL;


--8. Write a Query to display the member id and member name of the members who has not paid any fine in the year 2012.
select l1.MEMBER_ID, l1.MEMBER_NAME
from LMS_MEMBERS as l1 join LMS_BOOK_ISSUE as l2
on l1.MEMBER_ID = l2.MEMBER_ID;

--10.Write a query to list the book title and supplier id for the books authored by “Herbert Schildt" and
--the book edition is 5 and supplied by supplier ‘S01’. 
select l1.BOOK_TITLE, l2.SUPPLIER_ID
from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2
on l1.SUPPLIER_ID = l2.SUPPLIER_ID 
where AUTHOR = 'Herbert Schildt' and BOOK_EDITION = 5 and l1.SUPPLIER_ID = 'S01';

--11.Write a query to display the rack number and the number of books in each rack with 
--alias name “NOOFBOOKS” and sort by rack number in ascending order.
select  RACK_NUM, count(rack_num) as NOOFBOOKS from LMS_BOOK_DETAILS where rack_num is not null group by RACK_NUM order by RACK_NUM;

--12. Write a query to display book issue number, member name, date or registration, date of expiry, book title, 
--category author, price, date of issue, date of return, actual returned date, issue status, fine amount. 
select l2.BOOK_ISSUE_NO, l3.MEMBER_NAME, l3.DATE_REGISTER, l3.DATE_EXPIRE, l1.BOOK_TITLE, l1.CATEGORY,
l1.AUTHOR, l1.PRICE, l2.DATE_ISSUE, l2.DATE_RETURN, l2.DATE_RETURNED, l4.FINE_AMOUNT
from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2
on l1.BOOK_CODE = l2.BOOK_CODE join LMS_MEMBERS as l3
on l2.MEMBER_ID = l3.MEMBER_ID join LMS_FINE_DETAILS as l4
on l2.FINE_RANGE = l4.FINE_RANGE;

--13. Write a query to display the book code, title, publish date of the books which is been published in the month of December. 
select BOOK_CODE, BOOK_TITLE, PUBLISH_DATE
from LMS_BOOK_DETAILS where month(publish_date) = 12; 

-- 15.Write a query to display book code, book name, and publisher, how old the book is. Sorted as older to newer.
select BOOK_CODE, BOOK_TITLE, PUBLICATION, DATEDIFF(YEAR, PUBLISH_DATE, '2022/12/01' ) as AgeOfbook
from LMS_BOOK_DETAILS;
