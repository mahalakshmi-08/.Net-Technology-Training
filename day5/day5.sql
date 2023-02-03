select * from LMS_BOOK_DETAILS;

select * from LMS_MEMBERS;

select * from LMS_BOOK_ISSUE;

select * from LMS_SUPPLIERS_DETAILS;

--OUTER JOINS

select l1.BOOK_CODE, l1.BOOK_TITLE, l2.supplier_name
from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2
on l1.SUPPLIER_ID = l2.SUPPLIER_ID;

select l1.BOOK_CODE, l1.BOOK_TITLE, l2.supplier_name
from LMS_BOOK_DETAILS as l1 right outer join LMS_SUPPLIERS_DETAILS as l2
on l1.SUPPLIER_ID = l2.SUPPLIER_ID;

-- To retrive the details of the members who have not taken and book
SELECT l2.MEMBER_ID, l2.MEMBER_NAME, l1.BOOK_CODE
FROM LMS_BOOK_ISSUE as l1 right join LMS_MEMBERS as l2 
on l1.MEMBER_ID = l2.MEMBER_ID
where BOOK_CODE IS NULL;


select l1.BOOK_CODE, l1.BOOK_TITLE, l2.supplier_name
from LMS_BOOK_DETAILS as l1 left outer join LMS_SUPPLIERS_DETAILS as l2
on l1.SUPPLIER_ID = l2.SUPPLIER_ID;

select l1.BOOK_CODE, l1.BOOK_TITLE, l2.supplier_name
from LMS_BOOK_DETAILS as l1 full outer join LMS_SUPPLIERS_DETAILS as l2
on l1.SUPPLIER_ID = l2.SUPPLIER_ID where l2.SUPPLIER_NAME like 's%';

--HAVING Clause
-- SELECT supplier details who have supplied maximum number of books
select count(supplier_id) from LMS_BOOK_DETAILS group by SUPPLIER_ID
having count(supplier_id)>=all
(select count(SUPPLIER_ID) from LMS_BOOK_DETAILS
group by supplier_id);


select count(supplier_id),SUPPLIER_ID from LMS_BOOK_DETAILS group by SUPPLIER_ID
having count(supplier_id)>2
select member_name,count(book_code) as noofbooks from lms_book_issue as l1 join 
lms_members as l2 on l1.member_id=l2.member_id where member_name like 'A%'
group by member_name having count(book_code)<2 order by member_name desc;


--employee_db
select * from employee;

--To display the 5th hight salary using dense rank
select * from (select first_name,salary,dense_rank() over(order by salary desc) r
from employee) as e where r=5 ;

--using corelated method
select * from employee as e1 where 2=
(select count(distinct salary) from employee e2 where e2.salary>=e1.salary);


