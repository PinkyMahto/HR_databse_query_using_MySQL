select * from hr.employees;
# Write a query to display the names (first_name, last_name) using alias name “First Name","Last Name" 
select first_name as 'first name',last_name as 'last name'
from hr.employees;
# Write a query to get unique department ID from employee table
select distinct department_ID from employees;
# Write a query to get all employee details from the employee table order by first name,descending 
select * from employees
order by first_name DESC;
# Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary)
select first_name,last_name,salary,salary*.15 PF 
from employees;
# Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary 
select employee_ID,first_name,last_name,salary
from employees
order by salary;
# Write a query to get the total salaries payable to employees
select sum(salary)
from employees;
# Write a query to get the maximum and minimum salary and  number of employees from employees table
select count(*) from employees;
select max(salary),min(salary)
from employees; 
# Write a query to get the average salary and number of employees in the employees table 
select avg(salary), count(*) from employees;
# Write a query to get the number of jobs available in the employees table
select count(distinct job_id) from employees;
# Write a query get all first name from employees table in upper case 
select upper(first_name) 
from employees;
# Write a query to get the first 3 characters of first name from employees table 
select substring(first_name,1,3)
from employees;
# Write a query to get first name from employees table after removing white spaces from both side 
select trim(first_name)
from employees;
# Write a query to get the length of the employee names (first_name, last_name) from employees table 
select first_name,last_name,length(first_name)+length(last_name) as 'length of names'
from employees;
# Write a query to check if the first_name fields of the employees table contains numbers 
select * from hr.employees
where first_name regexp'[0,9]';
# Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000
select first_name,last_name,salary
from employees
where salary not between 10000 and 15000;
# Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order 
select first_name,last_name,department_id
from employees
where department_id in(30,100)
order by department_id;
# Write a query to display the name (first_name, last_name) and salary for all employees 
# whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100 
select first_name,last_name,salary
from employees
where salary not between 10000 and 15000 and department_id in(30,100);
# Write a query to display the name (first_name, last_name) and hire date for all employees
# who were hired in 1987 
select first_name,last_name,hire_date
from employees
having year(hire_date) like '1987%';
# Write a query to display the first_name of all employees who have both "a" and "b" in their first name 
select first_name 
from employees
where first_name like '%a%'and first_name like '%b%';
# Write a query to display the last name, job, and salary for all employees whose job is that
# of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000 
select last_name,job_id,salary
from employees
where job_id in ('Programmer' or 'Shipping Clerk') and salary not in (4500,10000,15000);
# Write a query to display the last name of employees whose names have exactly 6 characters
select last_name
from employees
where last_name like '______';
# Write a query to display the last name of employees having 'e' as the third character 
select last_name
from employees
where last_name like '__e%';
# Write a query to get the job_id and related employee's id partial output of the query
select job_id, employee_id 
from employees
group by job_id;
# Write a query to update the portion of the phone_number in the employees table, within the
# phone number the substring '124' will be replaced by '999' 
update employees
set phone_number = replace(phone_number,'124','999')
where phone_number like '%124%'; 
# Write a query to get the details of the employees where the length of the first name greater than or equal to 8 
select *from employees
having length(first_name) >= 8;
# Write a query to append '@example.com' to email field 
update employees
set email = concat(email,'@gmail.com');
# Write a query to extract the last 4 character of phone numbers 
select right(phone_number,4)
from employees;
# Write a query to get the last word of the street address
select street_address, substring_index(replace(replace(replace(street_address,',',' '),')',' '),'(',' '),' ',-1)
as 'last_word_of_street_address'
from locations;
# Write a query to get the locations that have minimum street length 
select*from locations
where length(street_address) <= (select min(length(street_address)) from locations);
# Write a query to display the first word from those job titles which contains more than one words 
select job_title, substring(job_title,'1',instr(job_title,' ')-1)
from jobs;
# Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position
select first_name,last_name 
from employees
where instr(last_name,'c')>2;
# Write a query that displays the first name and the length of the first name for all
# employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an
# appropriate label. Sort the results by the employees' first names 
select first_name,length(first_name)
from employees
where first_name like '%J%' or first_name like '%M%' or first_name like '%A%'
order by first_name;
# Write a query to display the first name and salary for all employees. Format the salary to
# be 10 characters long, left-padded with the $ symbol. Label the column SALARY
select first_name,lpad(salary,10,'$')
from employees;
# Write a query to display the first eight characters of the employees' first names and
# indicates the amounts of their salaries with '$' sign. Each '$' sign signifies a thousand
# dollars. Sort the data in descending order of salary 
select left(first_name,8),repeat('$',floor(salary/1000))'salary($)',salary
from employees
order by salary DESC;
# Write a query to display the employees with their code, first name, last name and hire
# date who hired either on seventh day of any month or seventh month in any year
select employee_id,first_name,last_name,hire_date
from employees
where position('07'in date_format(hire_date, '%d %n %y'))>0; 



