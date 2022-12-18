create database payroll;
use payroll;

/*Write a query to create an employee table and a department table.*/
create table department(
		dept_id char(10),
        dept_name varchar(20),
        location varchar(20),
        manager_id char(5),
        elocation_id char(5));

create table  employee(
		emp_id char(10),
        first_name varchar(20),
        last_name varchar(20),
        job_id char(10),
        salary int,
        manager_id char(5),
        dept_id char(10));
        
/*Write a query to create a view of the employee and department tables.*/
create view employee_view as
select emp_id, first_name, last_name, job_id, salary, manager_id, dept_id
from employee;

create view department_view as
select * from department;

/* first name and last name of the employees from the employee table and an SQL basics view table 
if the employee’s salary in the SQL basics table is greater than the salary in the employee table.*/
select * 
from employee as emp
inner join employee_view  as emp2
on emp.emp_id = emp2.emp_id
where emp2.salary < emp.salary;

/*Write a query to change the delimiter to //*/
delimiter \\
delimiter;

/*Write a query to create a stored procedure using an employee table if the salary is greater than or equal to 250000.*/
delimiter //
create procedure emp_sal()
begin
select * from employee
where salary >= 250000;
end //
delimiter;

/*Write a query to execute the stored procedure*/
call emp_sal; 

/*reate a stored procedure with one parameter using ORDER BY salary in descending order*/
delimiter //
create procedure sal_order()
begin
select * from employee
order by salary desc;
end //

/*Execute the stored procedure.*/
call sal_order();