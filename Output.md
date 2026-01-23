**Create Database:**



&nbsp;              1	22:32:08	CREATE DATABASE CompanyDB	1 row(s) affected	0.016 sec



**Use Database:**



&nbsp;		2	22:43:18	USE CompanyDB	0 row(s) affected	0.015 sec



**Create Schema:**



&nbsp;		3	23:01:21	CREATE Schema Company\_schema	1 row(s) affected	0.031 sec



**Create Department Table:** 



		4	23:04:31	CREATE TABLE Departments(

&nbsp; 						DeptID INt PRIMARY KEY,

&nbsp;    						DeptName VARCHAR(50) NOT NULL,

&nbsp;    						Location VARCHAR(50)

&nbsp;					)	0 row(s) affected	0.125 sec



**Create Employees Table:**



		8	23:14:33	CREATE TABLE Employees(

&nbsp;  					       EmpID INT PRIMARY KEY,

&nbsp;        				       EmpName VARCHAR(50) NOT NULL,

&nbsp;        				       Salary DECIMAL(10,2),

&nbsp;       				       HireDate DATE,

&nbsp;                                              DeptID INT,

&nbsp;                                              FOREIGN KEY(DeptID) REFERENCES Departments(DeptID)

&nbsp;					)	0 row(s) affected	0.125 sec

**View Database is created:**



 	12	23:34:41	SHOW DATABASES	7 row(s) returned	0.000 sec / 0.000 sec



**View Tables Created:**



 	14	23:44:19	SHOW TABLES	2 row(s) returned	0.031 sec / 0.000 sec



**Department Structure:**



 	16	23:51:46	DESC Departments	3 row(s) returned	0.000 sec / 0.000 sec



**Employee Structure:**



 	15	23:49:47	DESC Employees	5 row(s) returned	0.016 sec / 0.000 sec





**INSERT Data in Departments Table:**



&nbsp;	9	23:23:47	INSERT INTO Departments VALUES

&nbsp;  					(1,'HR','Hyderabad'),

&nbsp;        				(2,'IT','Bangalore'),

&nbsp;        				(3,'Finance','Chennai'),

&nbsp;       			 	(4,'Marketing','Mumbai')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.032 sec



**INSERT Data in Employees Table:**



&nbsp;	11	23:31:01	INSERT INTO employees VALUES

&nbsp;  				       (101,'Anita',50000,'2021-05-10',2),

&nbsp;        			       (102,'Rahul',60000,'2020-03-15',2),

&nbsp;        			       (103,'Sita',45000,'2022-07-01',1),

&nbsp;                                      (104,'Kiran',70000,'2019-01-20',3),

&nbsp;                                      (105,'Meena',NULL,'2023-02-10',4)	5 row(s) affected  Records: 5  Duplicates: 0  Warnings: 0	0.016 sec



**View all Departments:**



&nbsp;	18	00:00:45	SELECT \* FROM Employees LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec



**View all Employees:**



 	17	23:57:29	SELECT \* FROM Departments  LIMIT 0, 1000	4 row(s) returned	0.016 sec / 0.000 sec



**Employees with Salary>50000:**



&nbsp;	19	00:10:50	SELECT EmpName,Salary

&nbsp;				FROM Employees

&nbsp;				WHERE Salary>50000

&nbsp;		LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec



**Employees From IT Department:**



  **Method1:**Using DeptID



&nbsp;	22	00:16:10	SELECT \* 

&nbsp;				FROM Employees

&nbsp;				WHERE DeptID=2

&nbsp;		LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec



  **Method2:**Using DeptName(Inner Join)



&nbsp;	25	00:22:14	SELECT e.\*

&nbsp;				FROM Employees e

&nbsp;				JOIN Departments d ON e.DeptID = d.DeptID

&nbsp;				WHERE d.DeptName = 'IT'

&nbsp;				LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec

**INNER JOIN Example:**



&nbsp;	26	00:32:11	SELECT e.EmpName,d.DeptName

&nbsp;				FROM Employees e

&nbsp;				INNER JOIN Departments d

&nbsp;				ON e.DeptID=d.DeptID

&nbsp;		LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec



**Departments without Employees:**

&nbsp;	 27	17:14:33	SELECT EmpName,DeptId FROM Employees WHERE DeptID IS NULL
 LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec


Method2:(Using Joins)

&nbsp;	27	00:49:53	SELECT e.DeptID,e.EmpName

&nbsp;				FROM Employees e

&nbsp;				LEFT JOIN Departments d

&nbsp;				ON e.DeptID=d.DeptID

&nbsp;				WHERE e.DeptID IS NULL

&nbsp;		LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec



**Average Salary By Departments:**



&nbsp;	28	00:55:28	SELECT d.DeptName,AVG(e.Salary) AS AvgSalary

&nbsp;				FROM Employees e

&nbsp;				INNER JOIN Departments d

&nbsp;				ON e.DeptID=d.DeptID

&nbsp;				GROUP BY d.DeptName

&nbsp;		LIMIT 0, 1000	4 row(s) returned	0.016 sec / 0.000 sec



**Count Employees Per Department:**


&nbsp;	29	11:33:48	SELECT DeptID,COUNT(*) AS TotalEmployees

 &nbsp;				FROM Employees

&nbsp;	 			GROUP BY DeptID

&nbsp;			        HAVING COUNT(*) >1

&nbsp;	 	LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec


**Employees earning more than average salary:**(Example for SubQuery)



&nbsp;	30	01:04:37	SELECT EmpName,Salary

&nbsp;				FROM Employees 

&nbsp;				WHERE Salary>

&nbsp;				(SELECT AVG(Salary) FROM Employees)

&nbsp;		LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec

**Order employees by department, then by salary (highest first):**

&nbsp;	31	12:08:46	SELECT EmpID,EmpName,DeptID,Salary

&nbsp;				FROM Employees

&nbsp;				ORDER BY DeptID ASC,Salary DESC

&nbsp;         LIMIT 0, 1000	4 row(s) returned	0.000 sec / 0.000 sec



**Update an employee:**



&nbsp;	32	01:09:04	UPDATE Employees 

&nbsp;				SET Salary=Salary\*1.10

&nbsp;				WHERE DeptID=2	

&nbsp;		2 row(s) affected Rows matched: 2  Changed: 2  Warnings: 0	0.031 sec



**Delete employees with null salary:**



&nbsp;	33	01:24:18	DELETE e

&nbsp;				FROM Employees e

&nbsp;				JOIN (

&nbsp;    				SELECT EmpID

&nbsp;    				FROM Employees

&nbsp;    				WHERE Salary IS NULL

&nbsp;				) AS temp

&nbsp;				ON e.EmpID = temp.EmpID	

&nbsp;		1 row(s) affected	0.047 sec

