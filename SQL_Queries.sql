//Example-1

Create Employee Table:
CREATE TABLE Employee (
 EmpId int,
 Name varchar(255),
 ManagerId int,
 DOJ DATETIME,
 City varchar(255),
 PRIMARY KEY (EmpId)
 );

Create Salary Table:

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

1. Write an SQL query to fetch the EmpID and Name of all the employees working under Manager with id- “876”.

SELECT empid, name, managerid from Employee
where managerid= 876;

2. Write an SQL query to fetch the different salaries available from the Salary table.

SELECT DISTINCT(Salary) from Salary;


