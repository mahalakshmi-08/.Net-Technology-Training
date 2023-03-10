Select * from employee;

Select * from manager;

Select * from department;

Select * from location;

Select * from region;

Select * from Countries;

-- find Max Salary
select first_name from employee where salary=(select Max(salary) from employee);


select first_name,salary from employee where salary>(select Avg(salary) from employee);

-- 2nd highest 
select Max(salary) from employee where salary!=(select max(salary) from employee);


--2.Write a query to display the names of all states belonging to the country Canada. Display the records sorted in ascending order based on state name.(Q 2).
select state from location where country_id=(select id from Countries where name= 'Canada')order by state;


--3.	Write a query to display the first name of the managers of Accounts department. Display the records sorted in ascending order based on manager name.(Q7).
select first_name from employee where department_id =  (select id from department where  name= 'Accounts') order by first_name ;


--9.	Write a query to display the names of all countries belonging to region Europe. Display the records sorted in ascending order based on country name.(Q1)
select name from Countries where region_id = ( select id from region where name = 'Europe') order by name;

--14.	Write a query to display the first name of the managers of HR department. Display the records sorted in ascending order based on manager name(Q6)
select first_name from employee where department_id = (select id from department where name = 'HR') order by first_name;

--15.	Write a query to display the first name of all employees who are managers. Display the records sorted in ascending order based on first name.(Q5)
select first_name from employee where id IN (select employee_id from manager)ORDER BY first_name;

--how many employees are available in it department
select count(*) as emp_count from employee where department_id in (select id from department where name='IT');
select department_id, max(salary)from employee group by department_id;

--write a query to display the department id and the number of managers in the department. display the records sorted in ascending order
--based on department name.
select department_id , count(employee_id) from manager group by department_id;


--7.	Write a query to display the department name and the number of managers in the department. 
--Display the records sorted in ascending order based on department name. 
--Give an alias to the number of managers as manager_count.(Q15).
select name, count(id) as Manager_count from department group by name ;
