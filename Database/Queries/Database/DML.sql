CREATE DATABASE EXAMINATION_SYSTEM

create table Instructor (
Ins_ID int primary key,
Ins_Name varchar(100),
Ins_Gender char,
Ins_Address varchar(200),
Ins_Email varchar(200),
Ins_Salary int,
Ins_HireDate Date,
Ins_LeaveDate Date,
Ins_BirthDate Date)


create table Ins_Phone (
Ins_ID int,
Phone varchar(11),

Primary key (Ins_ID, Phone),
Constraint fk_Ins_phone Foreign Key (Ins_ID) References Instructor (Ins_ID),
CONSTRAINT chk_PhoneFormat CHECK (Phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));



create table Topic (
Topic_ID int primary key,
Topic_Name varchar(50))



create table Course (
Course_ID int primary key,
Crs_Name varchar(100),
Crs_Duration int,
Crs_Description varchar(100),
Crs_Difficulty varchar(50),
Topic_ID int Not Null,

constraint fk_Crs_Topic Foreign Key (Topic_ID) References Topic (Topic_ID))



create table Instructor_Course (
Ins_ID int,
Course_ID int,

Primary Key (Ins_ID, Course_ID),
Foreign Key (Ins_ID) References Instructor (Ins_ID),
Foreign Key (Course_ID) References Course (Course_ID))



create table Exam (
Exam_ID int primary key,
Exam_Duration int,
Course_ID int Not Null,

constraint fk_Crs_Exam Foreign Key (Course_ID) References Course (Course_ID))



create table Instructor_Exam (
Ins_ID int,
Exam_ID int,

Primary Key (Ins_ID, Exam_ID),
Foreign Key (Ins_ID) References Instructor (Ins_ID),
Foreign Key (Exam_ID) References Exam (Exam_ID))



CREATE TABLE Question (
    Question_ID INT PRIMARY KEY ,
    Qst_Type VARCHAR(50) NOT NULL,
    Qst_Header TEXT NOT NULL,
	  Course_ID Int,
    Model_Answer VARCHAR(50) NOT NULL,

    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
        ON DELETE CASCADE
)

CREATE TABLE Qst_Choices (
    Question_ID INT,
    Qst_Choice VARCHAR(200) NOT NULL,
    PRIMARY KEY (Question_ID, Qst_Choice),
    FOREIGN KEY (Question_ID) REFERENCES Question(Question_ID)
      
)


CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL,
    Dept_Supervisor VARCHAR(50)
)

CREATE TABLE Track (
    Track_ID INT PRIMARY KEY,
    Track_Name VARCHAR(100) NOT NULL,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
       
)

CREATE TABLE Track_Topic (
    Track_ID INT,
    Topic_ID INT,
    PRIMARY KEY (Track_ID, Topic_ID),
    FOREIGN KEY (Track_ID) REFERENCES Track(Track_ID),
    FOREIGN KEY (Topic_ID) REFERENCES Topic(Topic_ID)
        
)

CREATE TABLE Branch (
    Branch_ID INT PRIMARY KEY,
    Branch_Name VARCHAR(100) NOT NULL,
    Branch_Head VARCHAR(50),
    Branch_Location VARCHAR(200),
    Branch_Capacity INT
)

CREATE TABLE Intake (
    Intake_ID INT PRIMARY KEY,
    StartDate DATE NOT NULL,
    End_Date DATE,
    Intake_Type VARCHAR(50)
)


CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Stu_Name VARCHAR(50) NOT NULL,
    Stu_Gender VARCHAR(6) NOT NULL CHECK (Stu_Gender IN ('Male', 'Female')),
    Stu_Email VARCHAR(50) UNIQUE NOT NULL,
    Stu_State VARCHAR(50),
    City VARCHAR(50),
    Street VARCHAR(50),
    Acceptance_Date DATE,
    Stu_BirthDate DATE,
    Stu_Linkedin VARCHAR(50),
    Intake_ID INT,
    Track_ID INT,
	  Branch_ID INT,
    FOREIGN KEY (Intake_ID) REFERENCES Intake(Intake_ID),
    FOREIGN KEY (Track_ID) REFERENCES Track(Track_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
)

CREATE TABLE Student_Exam_Quest (
    Question_ID INT NOT NULL,
    Exam_ID INT NOT NULL,
    Student_ID INT NOT NULL,
    Stu_Answer VARCHAR(50),
    Answer_Check BIT,
    PRIMARY KEY (Question_ID, Exam_ID, Student_ID),
    FOREIGN KEY (Question_ID) REFERENCES Question(Question_ID),
    FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
        
)

CREATE TABLE Stu_Exam (
    Exam_ID INT NOT NULL,
    Student_ID INT NOT NULL,
    Stu_Grade INT,
    PRIMARY KEY (Exam_ID, Student_ID),
    FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
        
)


CREATE TABLE Stu_Phone (
    Student_ID INT NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (Student_ID, Phone),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    CONSTRAINT chk_PhoneFormat1 CHECK (Phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
        
)

CREATE TABLE Freelance (
    FL_ID INT PRIMARY KEY,
    FL_Date DATE,
    Client_Name VARCHAR(50),
    Client_Country VARCHAR(50),
    Price_USD DECIMAL(10,2),
    Student_ID INT,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
        
)
CREATE TABLE Certificate (
    Cert_ID INT PRIMARY KEY,
    Cert_Name VARCHAR(50) NOT NULL,
    Cert_Validation DATE,
    Cert_Price DECIMAL(8,2)
)

CREATE TABLE Stu_Certificate (
    Student_ID INT NOT NULL,
    Cert_ID INT NOT NULL,
    PRIMARY KEY (Student_ID, Cert_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Cert_ID) REFERENCES Certificate(Cert_ID)
        
)

CREATE TABLE Job_Offer (
    Offer_ID INT PRIMARY KEY,
    Title VARCHAR(50) NOT NULL,
    Company_Name VARCHAR(50) NOT NULL,
    Company_Loc VARCHAR(50),
    Salary DECIMAL(10,2),
    Job_Type VARCHAR(20),
    Remotely BIT 
)

CREATE TABLE Stu_Job_Off (
    Student_ID INT NOT NULL,
    Offer_ID INT NOT NULL,
    Hire_Status BIT,
    Hire_Date DATE,
    PRIMARY KEY (Student_ID, Offer_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Offer_ID) REFERENCES Job_Offer(Offer_ID)
        
)