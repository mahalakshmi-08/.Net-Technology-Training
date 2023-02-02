select * from LMS_BOOK_DETAILS;

select * from LMS_MEMBERS;

select * from LMS_BOOK_ISSUE;

select * from LMS_SUPPLIERS_DETAILS;

--JOINS

--Display book_code, book_title, supplier name of the books in library
select l1.BOOK_CODE, l1.BOOK_TITLE, l2.supplier_name
from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2
on l1.SUPPLIER_ID = l2.SUPPLIER_ID;

-- display booktitle and memberid who has taken books from library
select distinct BOOK_TITLE, l2.MEMBER_ID
from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2
on l1.BOOK_CODE = l2.BOOK_CODE;

--display bookname,membername who has taken book from library
select distinct l1.BOOK_TITLE,l3.MEMBER_NAME
from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2 
on l1.BOOK_CODE = l2.BOOK_CODE join LMS_MEMBERS as l3
on l2.MEMBER_ID = l3.MEMBER_ID;


--display supplier_id and number of book supplied byeach supplier
select supplier_id, count(book_code) as NumberOfBooks from LMS_BOOK_DETAILS where SUPPLIER_ID is not null group by SUPPLIER_ID;

--display supplier_name and number of books supplied by each supplier
select supplier_name, count(book_code) as NumberOfBooks 
from LMS_BOOK_DETAILS as b join LMS_SUPPLIERS_DETAILS as s
on b.SUPPLIER_ID = s.SUPPLIER_ID group by s.SUPPLIER_NAME;

--Employee table 

--display employee name, department name and the state location
select e.first_name,d.name as Department, l.state
from employee as e join department as d
on e.department_id=d.id join location as l
on l.id = d.location_id;


--display department id and number of employees in each department
select department_id, count(id) as CountOfEmployee from employee group by department_id;

--display department name and number of employees in each department
select d.name, count(*) as CountOfEmployee 
from employee as e join department as d
on e.department_id = d.id
group by name;


