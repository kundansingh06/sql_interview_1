Create table Employee (Id int, Name varchar(255), Salary int, Department varchar(100));

insert into Employee (Id, Name, Salary, Department) values
                                                        (1, 'Max', '90000', 'IT') ,
                                                        (2, 'Joe', '85000', 'IT') ,
                                                        (3, 'Henry', '85000', 'HR') ,
                                                        (4, 'Will', '70000', 'IT') ,
                                                        (5, 'Janet', '69000', 'IT') ,
                                                        (6, 'Sam', '60000', 'HR') ;

select * from Employee;


-- Excluding the highest salary from the query set
select max(salary) as secondhigh_salary from Employee where
    Salary < (select max(salary) from Employee )

select max(salary) as thirdhigh_salary from Employee where
    Salary  < (select max(salary) from Employee where
        salary <(select max(salary) from Employee));

-- Using correlated subquery
SELECT e1.Salary AS SecondHighestSalary FROM Employee e1
WHERE 2-1 = (SELECT COUNT(DISTINCT e2.Salary) FROM Employee e2
             WHERE e2.Salary > e1.Salary);

select salary as thirdhigh_salary from Employee e1 where 3-1=
(select count(distinct salary ) from Employee e2 where e2.Salary> e1.Salary)

-- using TOP N
select top 1 salary from (
select top 3 salary from Employee order by salary desc) as emp order by Salary

-- using rank

WITH CTE AS(
select * , dense_rank() over (order by salary desc) as densrank from Employee)
select Salary from CTE where densrank=2;

WITH CTE AS(
    select * , dense_rank() over (order by salary desc) as densrank from Employee)
select Salary from CTE where densrank=3;
