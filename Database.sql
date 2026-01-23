CREATE DATABASE CompanyDB;

USE CompanyDB;

/* Schema helps to organise tables*/

CREATE Schema Company_schema;

CREATE TABLE Departments(
		DeptID INt PRIMARY KEY ,
		DeptName VARCHAR(50) NOT NULL,
		Location VARCHAR(50)
);

CREATE TABLE Employees(
		EmpID INT PRIMARY KEY,
        EmpName VARCHAR(50) NOT NULL,
        Salary DECIMAL(10,2),
        HireDate DATE,
        DeptID INT,
        FOREIGN KEY(DeptID) REFERENCES Departments(DeptID)
);

SHOW DATABASES;

SHOW TABLES;

DESC Departments;

DESC Employees;


		