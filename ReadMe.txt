1. Project Title:

	Employee Department SQL Project

2. Project Objective:

	This project is created to practice and demonstrate SQL concepts using company database with two related tables
		Employees
		Departments

	CRUD Operations

	        CREATE: INSERT INTO[New Data]
		READ:   SELECT[Retrieve or view data]
	   	UPDATE: UPDATE[Modify existing Data]
		DELETE: DELETE[Remove Data]

	This project is designed to prepare for SQL Interview and for hands-on learning


3. Tools and Technologies Used:

	Tool: MySQL 8.0 CE
	Technology: SQL

4. Database Description:

	The CompanyDB contains two tables:
		
		Departments: Stores department details

		Employees: Stores employee details linked to department
		
	Relationship: One department can have many employees
		      One employee belongs to one department only
		      Department ID is used as a foreign Key in employees table  

5. Table Structure:

	5.1 Departments Table: This table stores department information

		Column Name	  Data TYpe	       Description
		DeptID	  	  int	       	       Primary Key	
		DeptName  	  varchar(50)  	       Department Name(NOT NULL)	
		Location          varchar(50)  	       Place of department

	    SQL Query:CREATE TABLE Department(DeptID INt PRIMARY KEY,
					      DeptName VARCHAR(50) NOT NULL
				              Location VARCHAR(50)
					      );

	5.2 Employees Table: This table stores employee information

		Column Name	   Data Type	      Description
		EmpID	  	   int	              Primary Key
		EmpName	           varchar(50)	      Employee Name	
		Salary	           decimal(10,2)      Employee Salary
		HireDate           date	              Employee Hired On which Date
		DeptID	           int	              Foreign Key(Departments)

	   SQL Query:CREATE TABLE Employees(EmpID INT PRIMARY KEY,
					    EmpName VARCHAR(50) NOT NULL,
                                            Salary DECIMAL(10,2),
				            HireDate DATE,
					    DeptID INT,
					    FOREIGN KEY(DeptID) REFERENCES Departments(DeptID)
					    );

6.Insert sample data:

		6.1 Insert Department sample data

			SQL Query:INSERT INTO Departments VALUES

  				   (1,'HR','Hyderabad'),

        			   (2,'IT','Bangalore'),

        			   (3,'Finance','Chennai'),

       			 	   (4,'Marketing','Mumbai');

	       6.1 Insert Employee sample data 

			SQL Query:INSERT INTO employees VALUES

  				       (101,'Anita',50000,'2021-05-10',2),

     			       	       (102,'Rahul',60000,'2020-03-15',2),

        			       (103,'Sita',45000,'2022-07-01',1),

                                       (104,'Kiran',70000,'2019-01-20',3),

                                       (105,'Meena',NULL,'2023-02-10',4);

7. Sample Queries:

	7.A. SELECT Clause:

		7.A.1 View all Departments: Displays all records in department table

			SQL Query: SELECT * FROM Departments;

		7.A.2 View all Employees: Displays all records in employee table

			SQL Query: SELECT * FROM Employees;

	7.B. WHERE Clause:

		7.B.1 Employees with salary greater than 50000

			SQL Query: SELECT EmpName,Salary
				   FROM Employees
  			           WHERE Salary>50000;

		7.B.2 Employees from IT Department

			Method1:Using DeptID

				SQL Query: SELECT * 
					   FROM Employees
 					   WHERE DeptID=2;
 			Method2:Using DeptName

				SQL Query: SELECT e.*
					   FROM Employees e
					   Departments d ON e.DeptID = d.DeptID
					   WHERE d.DeptName = 'IT';

		7.B.3 Joins
		
			Inner Join: Employees with Department Names
			
					SQL Query: SELECT e.EmpName,d.DeptName
		    				  FROM Employees e
						  INNER JOIN Departments d
						  ON e.DeptID=d.DeptID;

			LEFT JOIN: Department with no Employees

					SQL Query: SELECT EmpName,DeptId FROM Employees WHERE DeptID IS NULL;


					Method2:Using Joins
						   SELECT e.DeptID,e.EmpName
					           FROM Employees e
					           LEFT JOIN Department d
					           ON e.DeptID=d.DeptID
				                   WHERE e.DeptID IS NULL;


	7.C Aggregate Functions: 

			7.C.1 GROUP BY Clause: Average Salary Per Department

					SQL Query: SELECT d.DeptName,AVG(e.Salary) AS AvgSalary
				                   FROM Employees e
				                   INNER JOIN Departments d
			                           e.DeptID=d.DeptID
				                   GROUP BY d.DeptName;

	               7.C.2 HAVING Clause: Display Departments with more than 1 Employee

				SQL Query: SELECT DeptID,COUNT(*) AS TotalEmployees
 				           FROM Employees
 				           GROUP BY DeptID
				           HAVING COUNT(*) >1

	7.D ORDER BY Clause: Order employees by department, then by salary (highest first)

				SQL Query: SELECT EmpID,EmpName,DeptID,Salary
					   FROM Employees
					   ORDER BY DeptID ASC,Salary DESC;

	7.E Sub Query: Display Employees earning more than average salary

			  SQL Query: SELECT EmpName,Salary
				     FROM Employees 
				     WHERE Salary>
				     (SELECT AVG(Salary) FROM Employees);

		
8.Update Employee Salary for a Department:

		SQL Query: UPDATE Employees 
			   SET Salary=Salary*1.10
			    WHERE DeptID=2;

9.Delete Employees with NULL Salary:

	SQL Query: DELETE e
		   FROM Employees e
		   JOIN (SELECT EmpID
		   FROM Employees
		   WHERE Salary IS NULL
                   ) AS temp
		   ON e.EmpID = temp.EmpID

10.Output Documentation: 1.Query results are saved in Output.md file			
			 2.Tabular Formats are saved in ResultImages Excel file

