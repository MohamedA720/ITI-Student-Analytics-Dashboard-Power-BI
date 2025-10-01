-------------Galaxy Schema-------------

Create Database Examination_DWH;

---------------Fact Tables---------------
CREATE TABLE Fact_Student_Exam (
    Fact_ID INT IDENTITY(1,1) PRIMARY KEY,
    Student_ID INT,
    Exam_ID INT,
    Track_ID INT,
    Course_ID INT,
    Grade INT,
    Exam_Date DATE,
    Instructor_ID INT
);

CREATE TABLE Fact_Question_Response (
    Fact_ID INT IDENTITY(1,1) PRIMARY KEY,
    Student_ID INT,
    Question_ID INT,
    Exam_ID INT,
    Answer VARCHAR(100),
    Is_Correct BIT,
    Exam_Date DATE
);

CREATE TABLE Fact_Freelance_Project (
    FL_ID INT PRIMARY KEY,
    Student_ID INT,
    Price_USD DECIMAL(10,2),
    Country_Name VARCHAR(100),
    FL_Date DATE
);

CREATE TABLE Fact_Job_Offer (
		Fact_ID INT IDENTITY(1,1) PRIMARY KEY,
    Offer_ID INT,
    Student_ID INT,
    Hire_Status BIT,
    Salary DECIMAL(10,2),
    Job_Type VARCHAR(20),
    Remotely BIT,
    Hire_Date DATE
);

CREATE TABLE Fact_Student_Certificate (
    Fact_ID INT IDENTITY(1,1) PRIMARY KEY,
    Student_ID INT,
    Cert_ID INT,
    Obtained_Date DATE
);

---------------Dim Tables---------------
CREATE TABLE Dim_Student (
    Student_ID INT PRIMARY KEY,
    Full_Name VARCHAR(100),
    Gender VARCHAR(10),
    Email VARCHAR(100),
    BirthDate DATE,
    City VARCHAR(50),
    Street VARCHAR(50),
    LinkedIn VARCHAR(100),
    Track_ID INT,
    Branch_ID INT,
    Intake_ID INT,
    Acceptance_Date DATE
);


CREATE TABLE Dim_Exam (
    Exam_ID INT PRIMARY KEY,
    Exam_Duration INT,
    Course_ID INT,
    Instructor_ID INT
);

CREATE TABLE Dim_Question (
    Question_ID INT PRIMARY KEY,
    Qst_Type VARCHAR(50),
    Qst_Header VARCHAR(MAX),
    Model_Answer VARCHAR(100),
    Course_ID INT
);

CREATE TABLE Dim_Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Duration INT,
    Description VARCHAR(100),
    Difficulty VARCHAR(50),
    Topic_ID INT,
    Instructor_ID INT
);

CREATE TABLE Dim_Topic (
    Topic_ID INT PRIMARY KEY,
    Topic_Name VARCHAR(100)
);

CREATE TABLE Dim_Track (
    Track_ID INT PRIMARY KEY,
    Track_Name VARCHAR(100),
    Dept_ID INT
);

CREATE TABLE Dim_Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    Dept_Supervisor VARCHAR(100)
);

CREATE TABLE Dim_Branch (
    Branch_ID INT PRIMARY KEY,
    Branch_Name VARCHAR(100),
    Location VARCHAR(200),
    Capacity INT
);

CREATE TABLE Dim_Certificate (
    Cert_ID INT PRIMARY KEY,
    Cert_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Validation INT
);

CREATE TABLE Dim_Job (
    Offer_ID INT PRIMARY KEY,
    Title VARCHAR(50),
    Company_Name VARCHAR(50),
    Location VARCHAR(100),
    Job_Type VARCHAR(20),
    Remotely BIT
);

CREATE TABLE Dim_Country (
    Country_ID INT PRIMARY KEY IDENTITY(1,1),
    Country_Name VARCHAR(100)
);

CREATE TABLE Dim_Instructor (
    Instructor_ID INT PRIMARY KEY,
    Full_Name VARCHAR(100),
    Gender VARCHAR(10),
    Birth_Date DATE,
    Email VARCHAR(200),
    Address VARCHAR(200),
    Hire_Date DATE,
    Leave_Date DATE,
    Salary INT
);

CREATE TABLE Dim_Intake (
    Intake_ID INT PRIMARY KEY,
    Intake_Type VARCHAR(50),
    Start_Date DATE,
    End_Date DATE
);