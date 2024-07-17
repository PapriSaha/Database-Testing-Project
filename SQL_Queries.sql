///Example-1

CREATE TABLE Employee (
 EmpId int,
 Name varchar(255),
 ManagerId int,
 DOJ DATETIME,
 City varchar(255),
 PRIMARY KEY (EmpId)
 );

CREATE TABLE Salary (
 EmpId int,
 Project varchar(255),
 Salary int,
 Variable int,
 PRIMARY KEY (EmpId)
 );

INSERT INTO Employee VALUES
 (121, 'John', 321, '2016/1/31', 'hyd'),
 (321, 'David', 986, '2018/1/30', 'Chennai'),
 (421, 'Scott', 876, '2020/11/27', 'Mumbai');

INSERT INTO Salary VALUES
 (121, 'P1', 20000, 0),
 (321, 'P2', 35000, 1000),
 (421, 'P1', 50000, 3000);

//1. Write an SQL query to fetch the EmpID and Name of all the employees working under Manager with id- “876”.

SELECT empid, name, managerid from Employee
where managerid= 876;

//2. Write an SQL query to fetch the different salaries available from the Salary table.

SELECT DISTINCT(Salary) from Salary;

//3. Write an SQL query to fetch Scott’s EmpId, Date of Joining, and the city he lives in from the Employee table.

SELECT name, empid, doj,city from Employee
where name='Scott'

//4. Write an SQL query to fetch the count of employees.working in Project ‘P2’.

SELECT COUNT(*) FROM Salary 
WHERE Project = 'P2';

//5. Write an SQL query to find the maximum, minimum, and average salary of the employees.

SELECT max(Salary) AS MaximumSalary, 
min(Salary) AS MinimumSalary,
avg(Salary) AS AverageSalary
FROM Salary;

//6. Write an SQL query to find the employees id whose salary lies in the range of 30000 and 50000.

SELECT empid, salary from Salary
where Salary between 30000 and 50000;

//7. Write an SQL query to fetch those employees who live in Mumbai and work under the manager with ManagerId 876.

SELECT EmpId, City, ManagerId FROM Employee WHERE City='Mumbai' AND ManagerID='876';

//8. Write an SQL query to fetch all those employees who work on Project other than P1.

SELECT * FROM Salary WHERE project <>'P1'

//Another way

SELECT * FROM Salary where NOT project = 'P1'

//9. Write an SQL query to fetch the EmpID, Name, City, and Salary of employees by joining the Employee and Salary tables on the EmpID field.

SELECT Employee.empid, Employee.name, Employee.City, Salary.salary from Employee
Join Salary
On Employee.EmpId= Salary.EmpId

//10. Write an SQL query to display the total salary of all employees.

SELECT sum(salary) as TotalSalary from Salary

//11. Write an SQL query to sort the names in alphabetical order but in a ascending way from the employee table.

SELECT * FROM Employee order by name ASC

//12. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.

SELECT EmpId, Salary + Variable as TotalSalary FROM Salary;

//13. Write an SQL query to fetch those employees whose name begins with any two characters, followed by a text ‘’vi” and ending with any sequence of characters.

SELECT Name FROM Employee WHERE name like '__vi%';

//14. Write an SQL query to fetch those employees whose name has the letter ‘’o”.

SELECT Name from Employee where name like '%o%';

//15. Write an SQL query to show the salary of the employees with empid and name who work in Mumbai.

SELECT e.empid, e.name, s.Salary from Salary s 
left JOIN Employee e 
ON s.empid= e.EmpId
where city='Mumbai'

//16. Write an SQL query to show who works under which project

SELECT e.name, s.project from Salary s 
right JOIN Employee e 
ON s.empid= e.EmpId

//17. Write an SQL query to fetch the names of employees who joined before 2018.

SELECT e.EmpId, e.Name, e.DOJ from Employee e
where doj< '2018-01-01'

//18. Write an SQL query to fetch the highest salary in each project.

SELECT Project, MAX(Salary) AS MaxSalary 
FROM Salary 
GROUP BY Project;

//19. Write an SQL query to fetch the employee details along with their total salary (Salary + Variable) if the total salary is more than 25000.

SELECT e.EmpId, e.Name, e.City, (s.Salary + s.Variable) AS TotalSalary FROM Employee e 
JOIN Salary s 
ON e.EmpId = s.EmpId 
WHERE (s.Salary + s.Variable) > 25000;

//20. Write an SQL query to fetch the number of employees working in each city.

SELECT City, COUNT(*) AS EmployeeCount FROM Employee 
GROUP BY City;

//21. Write an SQL query to fetch the employee details who have the same joining date as Scott.

SELECT e.EmpId, e.Name, e.ManagerId, e.DOJ, e.City 
FROM Employee e 
WHERE e.DOJ = (SELECT DOJ FROM Employee WHERE Name = 'Scott');

//22. Write an SQL query to fetch the second highest salary from the Salary table.

SELECT MAX(Salary) AS SecondHighestSalary 
FROM Salary 
WHERE Salary < (SELECT MAX(Salary) FROM Salary);



///Example-2

CREATE TABLE LOCATION (
 LOCATION_ID INT,
 REGIONAL_GROUP varchar(255),
 PRIMARY KEY (LOCATION_ID)
 );

CREATE TABLE DEPARTMENT (
 DEPARTMENT_ID INT,
 NAME varchar(255),
 LOCATION_ID INT,
 PRIMARY KEY (DEPARTMENT_ID),
 FOREIGN KEY (LOCATION_ID) REFERENCES LOCATION(LOCATION_ID)
 );

CREATE TABLE JOB(
 JOB_ID INT,
 FUNCTION_JOB varchar(255),
 PRIMARY KEY (JOB_ID)
 );

CREATE TABLE EMPLOYEE (
 EMPLOYEE_ID int,
 LAST_NAME varchar(255),
 FIRST_NAME varchar(255),
 MIDDLE_NAME varchar(255),
 JOB_ID INT,
 MANAGER_ID INT,
 HIRE_DATE DATETIME,
 SALARY INT,
 COMM INT,
 DEPARTMENT_ID INT,
 PRIMARY KEY (EMPLOYEE_ID),
 FOREIGN KEY (JOB_ID) REFERENCES JOB(JOB_ID),
 FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT(DEPARTMENT_ID)
 );

INSERT INTO LOCATION VALUES
 (122, 'NEW YORK'),
 (123, 'DALLAS'),
 (124, 'CHICAGO'),
 (167, 'BOSTON');

INSERT INTO DEPARTMENT VALUES
 (10, 'ACCOUNTING', 122),
 (20, 'RESEARCH', 124),
 (30, 'SALES', 123),
 (40, 'OPERATIONS', 167);

 INSERT INTO JOB VALUES
 (667, 'CLERK'),
 (668, 'STAFF'),
 (669, 'ANALYST'),
 (670, 'SALESPERSION'),
 (671, 'MANAGER'),
 (672, 'PRESIDENT');

 INSERT INTO EMPLOYEE VALUES
 (7369, 'SMITH', 'JOHN', 'Q', 667, 7902, '1984-12-17', 800, NULL, 20),
 (7499, 'ALLEN', 'KEVIN', 'J', 670, 7698, '1985-02-20', 1600, 300, 30),
 (7505, 'DOYLE', 'JEAN', 'K', 671, 7839, '1985-04-4', 2850, NULL, 30),
 (7506, 'DENNIS', 'LYNN', 'S', 671, 7839, '1985-05-15', 2750, NULL, 30),
 (7507, 'BAKER', 'LESLIE', 'D', 671, 7839, '1985-06-10', 2200, NULL, 40),
 (7521, 'WARK', 'CYNTHIA', 'D', 670, 7698, '1985-02-22', 1250, NULL, 40);


// 1. List out the employees who are not receiving the commission.
  
SELECT * from EMPLOYEE 
where COMM is NULL;

//2. List out the employees who are working in department 30 and draw the salaries of more than 1500.

SELECT * from Employee 
where department_id= 30 AND salary > 1500

//3. List out the employee id, name in descending order based on the salary column.

SELECT employee_id, first_name, salary from Employee 
order by salary DESC

//4. How many employees, who are working in different departments, are wise in the organization.

SELECT department_id, COUNT(*) as TotalEmployee_Department from EMPLOYEE
GROUP BY department_id;

//5. List out the department id having at least 3 employees.

SELECT department_id, COUNT(*) as NumberOfEmployees from EMPLOYEE
GROUP BY department_id having count(*)>=3;

//6. Display the employees who are working in the Research department.

SELECT * from Employee 
where department_id IN (select department_id from DEPARTMENT where name= 'Research')

//7. Display the employees who got the maximum salary.

SELECT * from Employee 
where salary= (select max(salary) from Employee)

//8. Display the employees who are working in “Boston”.

SELECT * from EMPLOYEE 
where DEPARTMENT_ID = (select DEPARTMENT_ID from DEPARTMENT 
where LOCATION_ID = (select LOCATION_ID from LOCATION where REGIONAL_GROUP= 'BOSTON'))

//Another way

SELECT * FROM EMPLOYEE e
JOIN Department d 
ON e.DEPARTMENT_ID = d.department_id
JOIN Location l 
ON d.LOCATION_ID = l.Location_id where l.regional_group='BOSTON'

//9. Update the employees’ salaries, who are working as Manager on the basis of 10%.

UPDATE EMPLOYEE 
set salary = salary + (salary * 10/100)
where job_id=(SELECT job_id from JOB
WHERE[Function_Job] = 'MANAGER');

 
SELECT first_name, job_id, salary from EMPLOYEE
where job_id=(SELECT job_id from JOB
WHERE[Function_Job] = 'MANAGER')

//10. Delete the employees who are working in the Operations department.

DELETE from EMPLOYEE
where department_id = (SELECT department_id from DEPARTMENT
where name = 'OPERATIONS');

Select e.employee_id, e.first_name, e.department_id, d.name from EMPLOYEE e
Join DEPARTMENT d 
On e.department_id= d.department_id;

//11. Insert the employees who belong to the previous deleted 'OPERATIONS' department from a backup source into Employee table.

INSERT INTO EMPLOYEE (employee_id, last_name, first_name, middle_name, job_id, manager_id, hire_date, salary, comm, department_id)
SELECT e.employee_id, e.last_name, e.first_name, e.middle_name, e.job_id, e.manager_id, e.hire_date, e.salary, e.comm, e.department_id
FROM Backup_EMPLOYEES e
JOIN DEPARTMENT d 
ON e.department_id = d.department_id
WHERE d.name = 'OPERATIONS';

//12. Write an SQL query to fetch all the DepartmentID’s which are present in either of the tables- ‘Employee’ and ‘Department’.

SELECT department_id from EMPLOYEE
UNION 
SELECT department_id from DEPARTMENT

SELECT department_id from EMPLOYEE
UNION ALL
SELECT department_id from DEPARTMENT


//13. Write an SQL query to fetch common records between two tables.

SELECT department_id from EMPLOYEE
INTERSECT
SELECT department_id from DEPARTMENT


//14. Write an SQL query to fetch records that are present in one table but not in another table.

SELECT job_id from Employee 
MINUS 
SELECT job_id from JOB

//15. Create a table from the existing table (only structure without data).

SELECT * INTO JOB_NEW
FROM JOB
WHERE 1 = 0;

//16. Write an SQL query to find the current date.

select getdate() as CurrentDate;



///Example-3

Create table Products ( 
  product_id INT IDENTITY (1,1) PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  brand_id INT NOT NULL,
  category_id INT NOT NULL,
  model_year SMALLINT NOT NULL,
  list_price DECIMAL(10,2) NOT NULL,
  );
  
  CREATE TABLE product_audits(
    change_id INT IDENTITY PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DEC(10,2) NOT NULL,
    updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    CHECK(operation ='INS' or operation='DEL')
    );
    
 //Trigger Creation

    CREATE TRIGGER trg_product_audit
    ON Products
    AFTER INSERT, DELETE
    AS
    BEGIN
    SET NOCOUNT ON;
    INSERT INTO product_audits(
      product_id,
      product_name,
      brand_id,
      category_id,
      model_year,
      list_price,
      updated_at,
      operation)
 SELECT
      i.product_id,
      product_name,
      brand_id,
      category_id,
      model_year,
      i.list_price,
      GETDATE(),
      'INS'
 FROM
      inserted i
      
   UNION ALL
   SELECT 
      d.product_id,
      product_name,
      brand_id,
      category_id,
      model_year,
      d.list_price,
      GETDATE(),
      'DEL'
  FROM
  deleted d;
END


//Insert Products

INSERT Into products(
  product_name,
  brand_id,
  category_id,
  model_year,
  list_price
)
VALUES(
  'Test product',
  1,
  1,
  2018,
  599
);

//Show Products

select * from products

//DELETE Products 

delete from Products
where product_id=1

//Show Product_audits Table

select * from product_audits

//To show how many triggers in database table

SELECT 
   name,
   is_instead_of_trigger 
FROM
    sys.triggers
WHERE
 type='TR';

























