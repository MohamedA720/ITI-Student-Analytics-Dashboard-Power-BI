-------------------------------------------------------------------------------------
-----------------------------------ALL Procedures------------------------------------
-------------------------------------------------------------------------------------


------------------------------SELECT PROCEDURES--------------------------------------
-- Instructor
CREATE OR ALTER PROCEDURE get_Instructor @Ins_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Ins_ID IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Instructor WHERE Ins_ID = @Ins_ID)
				SELECT * FROM Instructor WHERE Ins_ID = @Ins_ID;
			ELSE
				SELECT 'Instructor Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;

---------------------------------------
-- Branch
CREATE OR ALTER PROCEDURE get_Branch @Branch_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Branch_ID IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Branch WHERE Branch_ID = @Branch_ID)
				SELECT * FROM Branch WHERE Branch_ID = @Branch_ID;
			ELSE
				SELECT 'Branch Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Certificate
CREATE OR ALTER PROCEDURE get_Certificate @Cert_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Cert_ID IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Certificate WHERE Cert_ID = @Cert_ID)
				SELECT * FROM Certificate WHERE Cert_ID = @Cert_ID;
			ELSE
				SELECT 'Certificate Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Course
CREATE OR ALTER PROCEDURE get_Course @Course_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Course_ID IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Course WHERE Course_ID = @Course_ID)
				SELECT * FROM Course WHERE Course_ID = @Course_ID;
			ELSE
				SELECT 'Course Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Department
CREATE OR ALTER PROCEDURE get_Department @Dept_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Dept_ID IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Department WHERE Dept_ID = @Dept_ID)
				SELECT * FROM Department WHERE Dept_ID = @Dept_ID;
			ELSE
				SELECT 'Department Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Intake
CREATE OR ALTER PROCEDURE get_Intake @Intake_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Intake_ID IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Intake WHERE Intake_ID = @Intake_ID)
				SELECT * FROM Intake WHERE Intake_ID = @Intake_ID;
			ELSE
				SELECT 'Intake Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Job_Offer
CREATE OR ALTER PROCEDURE get_Job_Offer @Offer_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Offer_ID IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Job_Offer WHERE Offer_ID = @Offer_ID)
				SELECT * FROM Job_Offer WHERE Offer_ID = @Offer_ID;
			ELSE
				SELECT 'Offer Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Topic
CREATE OR ALTER PROCEDURE get_Topic @Topic_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Topic_ID IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Topic WHERE Topic_ID = @Topic_ID)
				SELECT * FROM Topic WHERE Topic_ID = @Topic_ID;
			ELSE
				SELECT 'Topic Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Track
CREATE OR ALTER PROCEDURE get_Track @Track_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Track_ID IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Track WHERE Track_ID = @Track_ID)
				SELECT * FROM Track WHERE Track_ID = @Track_ID;
			ELSE
				SELECT 'Track Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Exam
CREATE OR ALTER PROCEDURE get_Exam @Exam_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Exam_ID IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Exam WHERE Exam_ID = @Exam_ID)
				SELECT * FROM Exam WHERE Exam_ID = @Exam_ID;
			ELSE
				SELECT 'Exam Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Ins_Phone
CREATE OR ALTER PROCEDURE get_Ins_Phone @Ins_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Ins_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Ins_Phone WHERE Ins_ID = @Ins_ID)
				SELECT * FROM Ins_Phone WHERE Ins_ID = @Ins_ID;
			ELSE
				SELECT 'Instructor Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Question
CREATE OR ALTER PROCEDURE get_Question @Question_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Question_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Question WHERE Question_ID = @Question_ID)
				SELECT * FROM Question WHERE Question_ID = @Question_ID;
			ELSE
				SELECT 'Question Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Qst_Choices
CREATE OR ALTER PROCEDURE get_Qst_Choices @Question_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Question_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Qst_Choices WHERE Question_ID = @Question_ID)
				SELECT * FROM Qst_Choices WHERE Question_ID = @Question_ID;
			ELSE
				SELECT 'Question Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Freelance
CREATE OR ALTER PROCEDURE get_Freelance @FL_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @FL_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Freelance WHERE FL_ID = @FL_ID)
				SELECT * FROM Freelance WHERE FL_ID = @FL_ID;
			ELSE
				SELECT 'Freelance Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Instructor_Exam
CREATE OR ALTER PROCEDURE get_Ins_Exam @Ins_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Ins_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Instructor_Exam WHERE Ins_ID = @Ins_ID)
				SELECT * FROM Instructor_Exam WHERE Ins_ID = @Ins_ID;
			ELSE
				SELECT 'Instructor Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Instructor_Course
CREATE OR ALTER PROCEDURE get_Ins_Course @Ins_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Ins_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Instructor_Course WHERE Ins_ID = @Ins_ID)
				SELECT * FROM Instructor_Course WHERE Ins_ID = @Ins_ID;
			ELSE
				SELECT 'Instructor Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Student
CREATE OR ALTER PROCEDURE get_Student @Student_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Student_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Student WHERE Student_ID = @Student_ID)
				SELECT * FROM Student WHERE Student_ID = @Student_ID;
			ELSE
				SELECT 'Student Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Stu_Phone
CREATE OR ALTER PROCEDURE get_Stu_Phone @Student_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Student_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Stu_Phone WHERE Student_ID = @Student_ID)
				SELECT * FROM Stu_Phone WHERE Student_ID = @Student_ID;
			ELSE
				SELECT 'Student Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Stu_Job_Off
CREATE OR ALTER PROCEDURE get_Stu_Job_Off @Student_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Student_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Stu_Job_Off WHERE Student_ID = @Student_ID)
				SELECT * FROM Stu_Job_Off WHERE Student_ID = @Student_ID;
			ELSE
				SELECT 'Student Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Student_Exam_Quest
CREATE OR ALTER PROCEDURE get_Stu_Exam_Quest @Student_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Student_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Student_Exam_Quest WHERE Student_ID = @Student_ID)
				SELECT * FROM Student_Exam_Quest WHERE Student_ID = @Student_ID;
			ELSE
				SELECT 'Student Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Stu_Certificate
CREATE OR ALTER PROCEDURE get_Stu_Certificate @Student_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Student_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Stu_Certificate WHERE Student_ID = @Student_ID)
				SELECT * FROM Stu_Certificate WHERE Student_ID = @Student_ID;
			ELSE
				SELECT 'Student Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Stu_Exam
CREATE OR ALTER PROCEDURE get_Stu_Exam @Student_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Student_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Stu_Exam WHERE Student_ID = @Student_ID)
				SELECT * FROM Stu_Exam WHERE Student_ID = @Student_ID;
			ELSE
				SELECT 'Student Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;


-------------------------------------------
-- Track_Topic
CREATE OR ALTER PROCEDURE get_Track_Topic @Track_ID INT = Null
AS
BEGIN
	BEGIN TRY
		IF @Track_ID  IS NULL
		BEGIN
		SELECT 'Please Provide a Valid ID.'
		END
		ELSE
		BEGIN
			IF EXISTS(SELECT 1 FROM Track_Topic WHERE Track_ID = @Track_ID)
				SELECT * FROM Track_Topic WHERE Track_ID = @Track_ID;
			ELSE
				SELECT 'Track Not Found.'
		END
	END TRY
	BEGIN CATCH
		SELECT 'Error has been acquired, Please Try With a Vaild ID.'
	END CATCH
END;

-----------------------------------------------------------------------------------

------------------------------UPDATE PROCEDURES------------------------------------

-- Instructor
CREATE OR ALTER PROCEDURE UpdateIns
    @Ins_ID INT,
    @Ins_Name VARCHAR(100) = NULL,
    @Ins_Gender VARCHAR(1) = NULL,
    @Ins_Email VARCHAR(200) = NULL,
    @Ins_Address VARCHAR(200) = NULL,
    @Ins_Salary INT = NULL,
    @Ins_HireDate DATE = NULL,
    @Ins_BirthDate DATE = NULL
AS
BEGIN   
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Ins_ID = @Ins_ID)
        BEGIN
            SELECT 'This Instructor is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Instructor 
        SET 
            Ins_Name = ISNULL(@Ins_Name, Ins_Name),
            Ins_Gender = ISNULL(@Ins_Gender, Ins_Gender),
            Ins_Email = ISNULL(@Ins_Email, Ins_Email),
            Ins_Address = ISNULL(@Ins_Address, Ins_Address),
            Ins_Salary = ISNULL(@Ins_Salary, Ins_Salary),
            Ins_HireDate = ISNULL(@Ins_HireDate, Ins_HireDate),
            Ins_BirthDate = ISNULL(@Ins_BirthDate, Ins_BirthDate)
        WHERE Ins_ID = @Ins_ID;

        SELECT 'Instructor Information is Updated Successfully.' AS Message;

    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Branch
CREATE OR ALTER PROCEDURE UpdateBranch
    @Branch_ID INT,
    @Branch_Name VARCHAR(100) = NULL,
    @Branch_Head VARCHAR(100) = NULL,
    @Branch_Location VARCHAR(200) = NULL,
    @Branch_Capacity INT = NULL
AS
BEGIN   
    BEGIN TRY
        IF NOT EXISTS(SELECT 1 FROM Branch WHERE Branch_ID = @Branch_ID)
        BEGIN
            SELECT 'This Branch is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Branch 
        SET 
            Branch_Name = ISNULL(@Branch_Name, Branch_Name),
            Branch_Head = ISNULL(@Branch_Head, Branch_Head),
            Branch_Location = ISNULL(@Branch_Location, Branch_Location),
            Branch_Capacity = ISNULL(@Branch_Capacity, Branch_Capacity)
        WHERE Branch_ID = @Branch_ID;

        SELECT 'Branch Information is Updated Successfully.' AS Message;
               
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Certificate
CREATE OR ALTER PROCEDURE UpdateCertificate
    @Cert_ID INT,
    @Cert_Name VARCHAR(200) = NULL,
    @Cert_Validation DATE = NULL,
    @Cert_Price DECIMAL(10,2) = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Certificate WHERE Cert_ID = @Cert_ID)
        BEGIN
            SELECT 'This Certificate is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Certificate
        SET
            Cert_Name = ISNULL(@Cert_Name, Cert_Name),
            Cert_Validation = ISNULL(@Cert_Validation, Cert_Validation),
            Cert_Price = ISNULL(@Cert_Price, Cert_Price)
        WHERE Cert_ID = @Cert_ID;

        SELECT 'Certificate Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Course
CREATE OR ALTER PROCEDURE UpdateCourse
    @Course_ID INT,
    @Crs_Name VARCHAR(200) = NULL,
    @Crs_Duration INT = NULL,
    @Crs_Description VARCHAR(MAX) = NULL,
    @Crs_Difficulty VARCHAR(50) = NULL,
    @Topic_ID INT = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Course WHERE Course_ID = @Course_ID)
        BEGIN
            SELECT 'This Course is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Course
        SET
            Crs_Name = ISNULL(@Crs_Name, Crs_Name),
            Crs_Duration = ISNULL(@Crs_Duration, Crs_Duration),
            Crs_Description = ISNULL(@Crs_Description, Crs_Description),
            Crs_Difficulty = ISNULL(@Crs_Difficulty, Crs_Difficulty),
            Topic_ID = ISNULL(@Topic_ID, Topic_ID)
        WHERE Course_ID = @Course_ID;

        SELECT 'Course Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Department
CREATE OR ALTER PROCEDURE UpdateDepartment
    @Dept_ID INT,
    @Dept_Name VARCHAR(200) = NULL,
    @Dept_Supervisor VARCHAR(200) = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Department WHERE Dept_ID = @Dept_ID)
        BEGIN
            SELECT 'This Department is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Department
        SET
            Dept_Name = ISNULL(@Dept_Name, Dept_Name),
            Dept_Supervisor = ISNULL(@Dept_Supervisor, Dept_Supervisor)
        WHERE Dept_ID = @Dept_ID;

        SELECT 'Department Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Exam
CREATE OR ALTER PROCEDURE UpdateExam
    @Exam_ID INT,
    @Exam_Duration INT = NULL,
    @Course_ID INT = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @Exam_ID)
        BEGIN
            SELECT 'This Exam is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Exam
        SET
            Exam_Duration = ISNULL(@Exam_Duration, Exam_Duration),
            Course_ID = ISNULL(@Course_ID, Course_ID)
        WHERE Exam_ID = @Exam_ID;

        SELECT 'Exam Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Freelance
CREATE OR ALTER PROCEDURE UpdateFreelance
    @FL_ID INT,
    @FL_Date DATE = NULL,
    @Client_Name VARCHAR(200) = NULL,
    @Client_Country VARCHAR(100) = NULL,
    @Price_USD DECIMAL(10,2) = NULL,
    @Student_ID INT = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Freelance WHERE FL_ID = @FL_ID)
        BEGIN
            SELECT 'This Freelance record is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Freelance
        SET
            FL_Date = ISNULL(@FL_Date, FL_Date),
            Client_Name = ISNULL(@Client_Name, Client_Name),
            Client_Country = ISNULL(@Client_Country, Client_Country),
            Price_USD = ISNULL(@Price_USD, Price_USD),
            Student_ID = ISNULL(@Student_ID, Student_ID)
        WHERE FL_ID = @FL_ID;

        SELECT 'Freelance Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Instructor_Exam
CREATE OR ALTER PROCEDURE UpdateInstructorExam
    @Old_Ins_ID INT,
    @Old_Exam_ID INT,
    @New_Ins_ID INT = NULL,
    @New_Exam_ID INT = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 FROM Instructor_Exam 
            WHERE Ins_ID = @Old_Ins_ID AND Exam_ID = @Old_Exam_ID
        )
        BEGIN
            SELECT 'This Instructor_Exam record is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Instructor_Exam
        SET
            Ins_ID = ISNULL(@New_Ins_ID, Ins_ID),
            Exam_ID = ISNULL(@New_Exam_ID, Exam_ID)
        WHERE Ins_ID = @Old_Ins_ID AND Exam_ID = @Old_Exam_ID;

        SELECT 'Instructor_Exam Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid Composite Key.' AS Message;
    END CATCH
END


-- Intake
CREATE OR ALTER PROCEDURE UpdateIntake
    @Intake_ID INT,
    @StartDate DATE = NULL,
    @End_Date DATE = NULL,
    @Intake_Type VARCHAR(50) = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Intake WHERE Intake_ID = @Intake_ID)
        BEGIN
            SELECT 'This Intake is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Intake
        SET
            StartDate = ISNULL(@StartDate, StartDate),
            End_Date = ISNULL(@End_Date, End_Date),
            Intake_Type = ISNULL(@Intake_Type, Intake_Type)
        WHERE Intake_ID = @Intake_ID;

        SELECT 'Intake Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Job_Offer
CREATE OR ALTER PROCEDURE UpdateJobOffer
    @Offer_ID INT,
    @Title VARCHAR(200) = NULL,
    @Company_Name VARCHAR(200) = NULL,
    @Company_Loc VARCHAR(100) = NULL,
    @Salary DECIMAL(18,2) = NULL,
    @Job_Type VARCHAR(50) = NULL,
    @Remotely BIT = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Job_Offer WHERE Offer_ID = @Offer_ID)
        BEGIN
            SELECT 'This Job Offer is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Job_Offer
        SET
            Title = ISNULL(@Title, Title),
            Company_Name = ISNULL(@Company_Name, Company_Name),
            Company_Loc = ISNULL(@Company_Loc, Company_Loc),
            Salary = ISNULL(@Salary, Salary),
            Job_Type = ISNULL(@Job_Type, Job_Type),
            Remotely = ISNULL(@Remotely, Remotely)
        WHERE Offer_ID = @Offer_ID;

        SELECT 'Job Offer Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Qst_Choices
CREATE OR ALTER PROCEDURE UpdateQstChoices
    @Question_ID INT,
    @Qst_Choice VARCHAR(500) = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Qst_Choices WHERE Question_ID = @Question_ID)
        BEGIN
            SELECT 'This Question Choice record is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Qst_Choices
        SET
            Qst_Choice = ISNULL(@Qst_Choice, Qst_Choice)
        WHERE Question_ID = @Question_ID;

        SELECT 'Question Choice Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Question
CREATE OR ALTER PROCEDURE UpdateStuCertificate
    @Old_Stu_ID INT,
    @Old_Cert_ID INT,
    @New_Stu_ID INT = NULL,
    @New_Cert_ID INT = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 FROM Stu_Certificate
            WHERE Student_ID = @Old_Stu_ID AND Cert_ID = @Old_Cert_ID
        )
        BEGIN
            SELECT 'This Stu_Certificate record is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Stu_Certificate
        SET
            Student_ID = ISNULL(@New_Stu_ID, Student_ID),
            Cert_ID = ISNULL(@New_Cert_ID, Cert_ID)
        WHERE Student_ID = @Old_Stu_ID AND Cert_ID = @Old_Cert_ID;

        SELECT 'Stu_Certificate Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid Composite Key.' AS Message;
    END CATCH
END


-- Stu_Exam
CREATE OR ALTER PROCEDURE UpdateStuExam
    @Old_Exam_ID INT,
    @Old_Student_ID INT,
    @New_Exam_ID INT = NULL,
    @New_Student_ID INT = NULL,
    @Stu_Grade INT = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 FROM Stu_Exam
            WHERE Exam_ID = @Old_Exam_ID AND Student_ID = @Old_Student_ID
        )
        BEGIN
            SELECT 'This Stu_Exam record is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Stu_Exam
        SET
            Exam_ID = ISNULL(@New_Exam_ID, Exam_ID),
            Student_ID = ISNULL(@New_Student_ID, Student_ID),
            Stu_Grade = ISNULL(@Stu_Grade, Stu_Grade)
        WHERE Exam_ID = @Old_Exam_ID AND Student_ID = @Old_Student_ID;

        SELECT 'Stu_Exam Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid Composite Key.' AS Message;
    END CATCH
END


-- Stu_Job_Off
CREATE OR ALTER PROCEDURE UpdateStuJobOff
    @Old_Student_ID INT,
    @Old_Offer_ID INT,
    @New_Student_ID INT = NULL,
    @New_Offer_ID INT = NULL,
    @Hire_Status VARCHAR(100) = NULL,
    @Hire_Date DATE = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 FROM Stu_Job_Off
            WHERE Student_ID = @Old_Student_ID AND Offer_ID = @Old_Offer_ID
        )
        BEGIN
            SELECT 'This Stu_Job_Off record is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Stu_Job_Off
        SET
            Student_ID = ISNULL(@New_Student_ID, Student_ID),
            Offer_ID = ISNULL(@New_Offer_ID, Offer_ID),
            Hire_Status = ISNULL(@Hire_Status, Hire_Status),
            Hire_Date = ISNULL(@Hire_Date, Hire_Date)
        WHERE Student_ID = @Old_Student_ID AND Offer_ID = @Old_Offer_ID;

        SELECT 'Stu_Job_Off Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid Composite Key.' AS Message;
    END CATCH
END


-- Stu_Phone
CREATE OR ALTER PROCEDURE UpdateStuPhone
    @Stu_ID INT,
    @Phone VARCHAR(20) = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Stu_Phone WHERE Student_ID = @Stu_ID)
        BEGIN
            SELECT 'This Student Phone record is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Stu_Phone
        SET
            Phone = ISNULL(@Phone, Phone)
        WHERE Student_ID = @Stu_ID;

        SELECT 'Student Phone Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Student
CREATE OR ALTER PROCEDURE UpdateStudent
    @Student_ID INT,
    @Stu_Name VARCHAR(200) = NULL,
    @Stu_Gender VARCHAR(10) = NULL,
    @Stu_Email VARCHAR(200) = NULL,
    @Stu_State VARCHAR(100) = NULL,
    @City VARCHAR(100) = NULL,
    @Street VARCHAR(200) = NULL,
    @Acceptance_Date DATE = NULL,
    @Stu_BirthDate DATE = NULL,
    @Stu_Linkedin VARCHAR(200) = NULL,
    @Intake_ID INT = NULL,
    @Track_ID INT = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Student WHERE Student_ID = @Student_ID)
        BEGIN
            SELECT 'This Student record is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Student
        SET
            Stu_Name = ISNULL(@Stu_Name, Stu_Name),
            Stu_Gender = ISNULL(@Stu_Gender, Stu_Gender),
            Stu_Email = ISNULL(@Stu_Email, Stu_Email),
            Stu_State = ISNULL(@Stu_State, Stu_State),
            City = ISNULL(@City, City),
            Street = ISNULL(@Street, Street),
            Acceptance_Date = ISNULL(@Acceptance_Date, Acceptance_Date),
            Stu_BirthDate = ISNULL(@Stu_BirthDate, Stu_BirthDate),
            Stu_Linkedin = ISNULL(@Stu_Linkedin, Stu_Linkedin),
            Intake_ID = ISNULL(@Intake_ID, Intake_ID),
            Track_ID = ISNULL(@Track_ID, Track_ID)
        WHERE Student_ID = @Student_ID;

        SELECT 'Student Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Student_Exam_Quest
CREATE OR ALTER PROCEDURE UpdateExamQuest
    @Question_ID INT,
    @Exam_ID INT,
    @Student_ID INT,
    @Stu_Answer VARCHAR(1000) = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 FROM Student_Exam_Quest
            WHERE Question_ID = @Question_ID
              AND Exam_ID = @Exam_ID
              AND Student_ID = @Student_ID
        )
        BEGIN
            SELECT 'This Student_Exam_Quest record is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Student_Exam_Quest
        SET
            Stu_Answer = ISNULL(@Stu_Answer, Stu_Answer)
        WHERE Question_ID = @Question_ID
          AND Exam_ID = @Exam_ID
          AND Student_ID = @Student_ID;

        SELECT 'Student_Exam_Quest Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid Composite Key.' AS Message;
    END CATCH
END

-- Topic
CREATE OR ALTER PROCEDURE UpdateTopic
    @Topic_ID INT,
    @Topic_Name VARCHAR(200) = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Topic WHERE Topic_ID = @Topic_ID)
        BEGIN
            SELECT 'This Topic record is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Topic
        SET
            Topic_Name = ISNULL(@Topic_Name, Topic_Name)
        WHERE Topic_ID = @Topic_ID;

        SELECT 'Topic Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Track
CREATE OR ALTER PROCEDURE UpdateTrack
    @Track_ID INT,
    @Track_Name VARCHAR(200) = NULL,
    @Dept_ID INT = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Track WHERE Track_ID = @Track_ID)
        BEGIN
            SELECT 'This Track record is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Track
        SET
            Track_Name = ISNULL(@Track_Name, Track_Name),
            Dept_ID = ISNULL(@Dept_ID, Dept_ID)
        WHERE Track_ID = @Track_ID;

        SELECT 'Track Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid ID.' AS Message;
    END CATCH
END


-- Track_Topic
CREATE OR ALTER PROCEDURE UpdateTrackTopic
    @Old_Track_ID INT,
    @Old_Topic_ID INT,
    @New_Track_ID INT = NULL,
    @New_Topic_ID INT = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 FROM Track_Topic
            WHERE Track_ID = @Old_Track_ID
              AND Topic_ID = @Old_Topic_ID
        )
        BEGIN
            SELECT 'This Track_Topic record is Not Found.' AS Message;
            RETURN;
        END

        UPDATE Track_Topic
        SET
            Track_ID = ISNULL(@New_Track_ID, Track_ID),
            Topic_ID = ISNULL(@New_Topic_ID, Topic_ID)
        WHERE Track_ID = @Old_Track_ID
          AND Topic_ID = @Old_Topic_ID;

        SELECT 'Track_Topic Information is Updated Successfully.' AS Message;
    END TRY
    BEGIN CATCH
        SELECT 'Error has been acquired, Please Try With a Valid Composite Key.' AS Message;
    END CATCH
END;

----------------------------------------------------------------------------------------------


---------------------------------INSERT PROCEDURES---------------------------------------

--Procedure 1: Insert new instructor

create procedure insert_new_instructor
(@name varchar(50), @gender char, @address varchar(200)=Null, 
@email varchar(200), @salary int, @BirthDate Date) As

begin
if not exists (	select 1
				from Instructor i
				where i.Ins_Name = @name
				and i.Ins_Gender = @gender
				and i.Ins_Address  in (@address, Null)
				and i.Ins_Email = @email
				and i.Ins_Salary = @salary
				and i.Ins_BirthDate = @BirthDate)
	begin
		declare @final_address varchar(200) = ISNULL(@address, 'Cairo')
		declare @id int = (select max(Ins_ID) from Instructor)
		insert into Instructor values (@id+1, @name, @gender, @final_address, @email, @salary, getDate(), Null, @BirthDate)
	end

else
	select 'Instructor already exists! No new records are inserted.'

end;


--Procedure 2: Insert phone number to existing instructor

create or alter procedure insert_phone_for_instructor (@name varchar(50), @email varchar(200), @phone varchar(11)) As

begin
BEGIN TRY
	BEGIN TRANSACTION;
		declare @id int = (select i.Ins_ID from Instructor i
						where i.Ins_Name = @name and i.Ins_Email = @email)

		INSERT INTO Ins_Phone values (@id, @phone)
	COMMIT TRANSACTION;
END TRY
   BEGIN CATCH
        ROLLBACK TRANSACTION;
		select 'Please re-check the inserted values!'
   END CATCH

end;

--Procedure 3: Inserting new Topic

create procedure insert_topic (@Topic_name varchar(50)) As
begin
if not exists (
select 1 from Topic t where t.Topic_Name=@Topic_name
)
begin
declare @id int = (select max(Topic_ID) from Topic)
Insert into Topic values (@id+1, @Topic_name)
end

else
select 'Topic already exists! No new records inserted.'
end;


--Procedure 4: Inserting new Track

create or alter procedure insert_new_track (@Track_name varchar(200), @Department varchar(50)) As
begin
if not exists (
select 1 from Track t where t.Track_Name=@Track_name
)
begin
begin try
begin transaction
declare @id int = (select max(Track_ID) from Track)
declare @dept_id int = (select Dept_ID from Department where Dept_Name = @Department)
Insert into Track values (@id+1, @Track_name, @dept_ID)
commit transaction
end try
begin catch
rollback transaction;
select 'Inserted department does not exist!'
end catch
end

else
select 'Topic already exists! No new records inserted.'
end;


--Procedure 5: Inserting new True/False question

create or alter procedure insert_new_TF_Question (@Qst_Header varchar(max), @answer varchar(50), @category varchar(100)) As
begin
if not exists 
(select 1 from Question where CAST(Qst_Header AS VARCHAR(MAX)) = @Qst_Header)
begin
begin try
begin transaction
declare @id int = (select max(Question_ID) from Question)
declare @cat_id int = (select Course_ID from Course where Crs_Name = @category)
Insert into Question values (@id+1, 'True/False', @Qst_Header, @answer, Null, @cat_id)
select 'True/False question successfully inserted!'
commit transaction
end try
begin catch
rollback transaction;
select 'Inserted question does not follow any course!'
end catch
end

else
select 'Question already exists in the questions bank'

end;




--Procedure 6: Inserting new MCQ with choices

create or alter procedure insert_new_MCQ (@Qst_Header varchar(max), @category varchar(100),
@answer varchar(50),
 @choice1 varchar(50), 
 @choice2 varchar(50), 
 @choice3 varchar(50), 
 @choice4 varchar(50)=Null) As
begin
if not exists 
(select 1 from Question where CAST(Qst_Header AS VARCHAR(MAX)) = @Qst_Header)
begin
begin try
begin transaction
declare @id int = (select max(Question_ID) from Question)
declare @cat_id int = (select Course_ID from Course where Crs_Name = @category)
Insert into Question values (@id+1, 'MCQ', @Qst_Header, @cat_id, @answer)
Insert into Qst_Choices values (@id+1, @choice1), (@id+1, @choice2), (@id+1, @choice3) 
if @choice4 is not null
Insert into Qst_Choices values (@id+1, @choice4) 

select 'MCQ question successfully inserted!'
select 'Question choices successfully inserted!'

commit transaction
end try
begin catch
rollback transaction;
select 'Inserted question does not follow any course!'
end catch
end

else
select 'Question already exists in the questions bank'

end;



--Procedure 7: Inserting new Department

create or alter procedure insert_dept (@dept_name varchar(50), @supervisor varchar(50)=Null) As
begin
if not exists (
select 1 from Department d where d.Dept_Name=@dept_name
)
begin
declare @id int = (select max(Dept_ID) from Department)
Insert into Department values (@id+1, @dept_name, @supervisor)
end

else
select 'Department already exists!'
end;


--Procedure 8: Inserting new course

create or alter procedure add_course (@crs_name varchar(100), @duration int, @difficulty varchar(50)=Null,
@Topic_name varchar(50)) As
begin
if not exists (
select 1 from Course c where c.Crs_Name = @crs_name
)
begin
begin try
begin transaction
declare @id int = (select max(Course_ID) from Course)
declare @topic_id int = (select Topic_ID from Topic where @Topic_name=Topic_Name)
Insert into Course values (@id+1, @crs_name, @duration, Null, @difficulty, @topic_id)
select 'New course is added successfully'
commit transaction;
end try
begin catch
rollback transaction;
throw;
end catch
end
else
select 'Course already exists!'
end;



--Procedure 9: Inserting new branch

create or alter procedure add_branch (@name varchar(100), @head varchar(50), @loc varchar(50), @capacity int=Null)
As
Begin
if not exists (
select 1 from Branch b where b.Branch_Name = @name and b.Branch_Location=@loc
)
begin
begin try
begin transaction
declare @id int = (select max(Branch_ID) from Branch)
Insert into Branch values (@id+1, @name, @head, @loc, @capacity)
select 'New branch is added successfully'
commit transaction;
end try
begin catch
rollback transaction;
throw;
end catch
end
else
select 'Branch already exists!'

End;



--Procedure 10: Inserting new certificate

create or alter procedure add_certificate (@name varchar(50), @validation date, @price int=100)
As
Begin
if not exists (
select 1 from Certificate c where c.Cert_Name = @name
)
begin
begin try
begin transaction
declare @id int = (select max(Cert_ID) from Certificate)
Insert into Certificate values (@id+1, @name, @validation, @price)
select 'New certificate is added successfully'
commit transaction;
end try
begin catch
rollback transaction;
throw;
end catch
end
else
select 'Certificate already exists!'

End;




--Procedure 11: Inserting new intake

create or alter procedure add_intake (@startDate date, @endDate date, @type varchar(50)) As
Begin
if not exists (
select 1 from Intake i where i.StartDate = @startDate and i.End_Date=@endDate and i.Intake_Type=@type
)
begin
declare @id int = (select max(Intake_ID) from Intake)
if @id is null
set @id = 0
Insert into Intake values (@id+1, @startDate, @endDate, @type)
select 'New intake is created successfully'
end
else
select 'Intake already exists! No new intakes are registered!'

End;


--Procedure 12: Inserting new student

create or alter procedure add_student(
@name varchar(50),
@gender varchar(6),
@email varchar(50),
@state varchar(50),
@city varchar(50),
@street varchar(50),
@bDate date,
@linkedin varchar(50) = Null,
@intake int,
@track int,
@branch int
) As

Begin
if not exists (select 1 from Student s where
s.Stu_Name = @name and s.Stu_Gender=@gender and s.Stu_Email=@email and
s.Stu_BirthDate=@bDate and s.Intake_ID=@intake and s.Track_ID=@track and s.Branch_ID=@branch)

begin
begin try
begin transaction
declare @id int = (select max(Student_ID) from Student)
if @id is null
set @id = 0
Insert into Student values (@id+1, @name, @gender, @email, @state, @city, @street, getDate(),
@bDate, @linkedin, @intake, @track, @branch)
select 'New student record is inserted successfully'
commit transaction;
end try
begin catch
rollback transaction;
select 'Insertion error! Check if intake and track already exist.'
end catch
end
else
select 'Student record already exists!'
End;


--Procedure 13: Inserting new student phone number

create or alter procedure insert_phone_for_student (@id int, @phone varchar(11)) As

begin
BEGIN TRY
	BEGIN TRANSACTION;
		INSERT INTO Stu_Phone values (@id, @phone)
		select 'New phone number entered successfully'
	COMMIT TRANSACTION;
END TRY
   BEGIN CATCH
        ROLLBACK TRANSACTION;
		select 'Please re-check the inserted values!'
   END CATCH

end;



--Procedure 14: Inserting new job offer

create or alter procedure add_job_offer(
@title varchar(50),
@company varchar(6),
@loc varchar(50),
@salary decimal(10,2),
@type varchar(20),
@Remotely bit) As

Begin
if not exists (select 1 from Job_Offer j where
j.Title=@title and j.Company_Name=@company and j.Company_Loc=@loc
and j.Salary=@salary)

begin
begin try
declare @id int = (select max(Offer_ID) from Job_Offer)
if @id is null
set @id = 0
Insert into Job_Offer values (@id+1, @title, @company, @loc, @salary, @type, @Remotely)
select 'New job offer is inserted successfully'
end try
begin catch
select 'Insertion error! Check inserted values.'
end catch
end
else
select 'Job offer record already exists!'
End;



--Procedure 15: Inserting new topic to track

create or alter procedure assign_topic_to_track (@track int, @topic int) As
Begin
begin Try
Insert into Track_Topic values (@track, @topic)
End Try
Begin catch
select 'Insertion error! Recheck if both track and topic already exist!'
End catch
End;



--Procedure 16: Assigning a job offer to a student

create or alter procedure assign_offer_to_student (@student int, @offer int, @hired bit, @hire_date date=Null) As
Begin
begin Try
begin transaction
Insert into Stu_Job_Off values (@student, @offer, @hired, @hire_date)
commit transaction;
End Try
Begin catch
rollback transaction;
select 'Insertion error! Recheck your values!'
End catch
End;


--Procedure 17: Assigning certificate to student

create or alter procedure assign_cert_to_student (@student int, @cert int) As
Begin
begin Try
Insert into Stu_certificate values (@student, @cert)
select 'Successfull insertion.'
End Try
Begin catch
select 'Insertion error! Recheck inserted values!'
End catch
End;



--Procedure 18: Assigning new freelancing gig to student
create or alter procedure add_new_fl_gig (@client varchar(50), @country varchar(50), @price decimal(10, 2), @student int)
As
BEGIN
begin try
begin transaction
declare @id int = (select isnull(max(FL_ID), 0) from Freelance)
Insert into Freelance values (@id+1, getDate(), @client, @country, @price, @student)
select 'New freelancing gig successfully assigned to student!'
commit transaction
end try
begin catch
rollback transaction;
select 'Insertion error! Please re-check inserted values!'
end catch
END;

-------------------------------------------------------------------------------------------------------

----------------------------------------DELETE Procedures----------------------------------------------

-- Instructor
CREATE OR ALTER PROCEDURE Delete_Ins
    @Ins_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Ins_ID = @Ins_ID)
    BEGIN
        SELECT 'Instructor Not Found.'
    END

    DELETE FROM Instructor WHERE Ins_ID = @Ins_ID
	DELETE FROM Ins_Phone Where Ins_ID = @Ins_ID
END;

-------------------------------------------------
-- Student
CREATE OR ALTER PROCEDURE Delete_Student
    @Student_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Student WHERE Student_ID = @Student_ID)
    BEGIN
        SELECT 'Student Not Found.'
    END

    DELETE FROM Student WHERE Student_ID = @Student_ID
	DELETE FROM Stu_Phone Where Student_ID = @Student_ID
	DELETE FROM Freelance Where Student_ID = @Student_ID
END;

-------------------------------------------------
-- Intake
CREATE OR ALTER PROCEDURE Delete_Intake
    @Intake_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Intake WHERE Intake_ID = @Intake_ID)
    BEGIN
        SELECT 'Intake Not Found.'
    END

    DELETE FROM Intake WHERE Intake_ID = @Intake_ID
END;

-------------------------------------------------
-- Branch
CREATE OR ALTER PROCEDURE Delete_Branch
    @Branch_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Branch WHERE Branch_ID = @Branch_ID)
    BEGIN
        SELECT 'Branch Not Found.'
    END

    DELETE FROM Branch WHERE Branch_ID = @Branch_ID
END;

-------------------------------------------------
-- Department
CREATE OR ALTER PROCEDURE Delete_Dept
    @Dept_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Department WHERE Dept_ID = @Dept_ID)
    BEGIN
        SELECT 'Department Not Found.'
    END

    DELETE FROM Department WHERE Dept_ID = @Dept_ID
END;

-------------------------------------------------
-- Track
CREATE OR ALTER PROCEDURE Delete_Track
    @Track_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Track WHERE Track_ID = @Track_ID)
    BEGIN
        SELECT 'Track Not Found.'
    END

    DELETE FROM Track WHERE Track_ID = @Track_ID
END;

-------------------------------------------------
-- Topic
CREATE OR ALTER PROCEDURE Delete_Topic
    @Topic_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Topic WHERE Topic_ID = @Topic_ID)
    BEGIN
        SELECT 'Topic Not Found.'
    END

    DELETE FROM Topic WHERE Topic_ID = @Topic_ID
END;

-------------------------------------------------
-- Course
CREATE OR ALTER PROCEDURE Delete_Course
    @Course_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Course WHERE Course_ID = @Course_ID)
    BEGIN
        SELECT 'Course Not Found.'
    END

    DELETE FROM Course WHERE Course_ID = @Course_ID
END;

-------------------------------------------------
-- Exam
CREATE OR ALTER PROCEDURE Delete_Exam
    @Exam_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @Exam_ID)
    BEGIN
        SELECT 'Exam Not Found.'
    END

    DELETE FROM Exam WHERE Exam_ID = @Exam_ID
END;

-------------------------------------------------
-- Question
CREATE OR ALTER PROCEDURE Delete_Question
    @Question_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Question WHERE Question_ID = @Question_ID)
    BEGIN
        SELECT 'Question Not Found.'
    END

    DELETE FROM Question WHERE Question_ID = @Question_ID
	DELETE FROM Qst_Choices WHERE Question_ID = @Question_ID
END;

-------------------------------------------------
-- Freelance
CREATE OR ALTER PROCEDURE Delete_Freelance
    @FL_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Freelance WHERE FL_ID = @FL_ID)
    BEGIN
        SELECT 'Freelance Not Found.'
    END

    DELETE FROM Freelance WHERE FL_ID = @FL_ID
END;

-------------------------------------------------
-- Certificate
CREATE OR ALTER PROCEDURE Delete_Certificate
    @Cert_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Certificate WHERE Cert_ID = @Cert_ID)
    BEGIN
        SELECT 'Certificate Not Found.'
    END

    DELETE FROM Certificate WHERE Cert_ID = @Cert_ID
END;

-------------------------------------------------
-- Job_Offer
CREATE OR ALTER PROCEDURE Delete_Job_Offer
    @Offer_ID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Job_Offer WHERE Offer_ID = @Offer_ID)
    BEGIN
        SELECT 'Job_Offer Not Found.'
    END

    DELETE FROM Job_Offer WHERE Offer_ID = @Offer_ID
END;

-------------------------------------------------

--------------------------------------------------------------------------------------------------------
------------------------------------------TRIGGERS------------------------------------------------------
-- Instructor
CREATE OR ALTER TRIGGER Prevent_Delete_All_Ins
ON Instructor
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all instructors at once.'
    END
    DELETE FROM Instructor
    WHERE Ins_ID IN (SELECT Ins_ID FROM deleted)
END

---------------------------------------------------
-- Student
CREATE OR ALTER TRIGGER Prevent_Delete_All_Stu
ON Student
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all Students at once.'
    END
    DELETE FROM Student
    WHERE Student_ID IN (SELECT Student_ID FROM deleted)
END

---------------------------------------------------
-- Intake
CREATE OR ALTER TRIGGER Prevent_Delete_All_Intake
ON Intake
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all Intakes at once.'
    END
    DELETE FROM Intake
    WHERE Intake_ID IN (SELECT Intake_ID FROM deleted)
END

---------------------------------------------------
-- Branch
CREATE OR ALTER TRIGGER Prevent_Delete_All_Branch
ON Branch
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all Branches at once.'
    END
    DELETE FROM Branch
    WHERE Branch_ID IN (SELECT Branch_ID FROM deleted)
END

---------------------------------------------------
-- Department
CREATE OR ALTER TRIGGER Prevent_Delete_All_Dep
ON Department
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all Departments at once.'
    END
    DELETE FROM Department
    WHERE Dept_ID IN (SELECT Dept_ID FROM deleted)
END

---------------------------------------------------
-- Track
CREATE OR ALTER TRIGGER Prevent_Delete_All_Track
ON Track
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all Tracks at once.'
    END
    DELETE FROM Track
    WHERE Track_ID IN (SELECT Track_ID FROM deleted)
END

---------------------------------------------------
-- Topic
CREATE OR ALTER TRIGGER Prevent_Delete_All_Topic
ON Topic
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all Topics at once.'
    END
    DELETE FROM Topic
    WHERE Topic_ID IN (SELECT Topic_ID FROM deleted)
END

---------------------------------------------------
-- Course
CREATE OR ALTER TRIGGER Prevent_Delete_All_Courses
ON Course
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all Courses at once.'
    END
    DELETE FROM Course
    WHERE Course_ID IN (SELECT Course_ID FROM deleted)
END

---------------------------------------------------
-- Exam
CREATE OR ALTER TRIGGER Prevent_Delete_All_Exams
ON Exam
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all Exams at once.'
    END
    DELETE FROM Exam
    WHERE Exam_ID IN (SELECT Exam_ID FROM deleted)
END

---------------------------------------------------
-- Question
CREATE OR ALTER TRIGGER Prevent_Delete_All_Questions
ON Question
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all Questions at once.'
    END
    DELETE FROM Question
    WHERE Question_ID IN (SELECT Question_ID FROM deleted)
END

---------------------------------------------------
-- Freelance
CREATE OR ALTER TRIGGER Prevent_Delete_All_Freelances
ON Freelance
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all Freelances at once.'
    END
    DELETE FROM Freelance
    WHERE FL_ID IN (SELECT FL_ID FROM deleted)
END

---------------------------------------------------
-- Certificate
CREATE OR ALTER TRIGGER Prevent_Delete_All_Certificates
ON Certificate
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all Certificates at once.'
    END
    DELETE FROM Certificate
    WHERE Cert_ID IN (SELECT Cert_ID FROM deleted)
END

---------------------------------------------------
-- Job_Offer
CREATE OR ALTER TRIGGER Prevent_Delete_All_Job_Offers
ON Job_Offer
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        SELECT 'You are not allowed to delete all Job_Offers at once.'
    END
    DELETE FROM Job_Offer
    WHERE Offer_ID IN (SELECT Offer_ID FROM deleted)
END

