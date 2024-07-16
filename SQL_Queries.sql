//Example-1

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

//Example-2

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













