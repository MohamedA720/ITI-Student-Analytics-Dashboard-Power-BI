CREATE or alter PROCEDURE GetStudentsByDepartment
    @DeptID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        s.Student_ID,
        s.Stu_Name,
        s.Stu_Gender,
        s.Stu_Email,
        s.Stu_State,
        s.City,
        s.Street,
        s.Acceptance_Date,
        s.Stu_BirthDate,
        t.Track_Name,
        d.Dept_ID,
        d.Dept_Name,
        d.Dept_Supervisor,
        i.StartDate,
        i.End_Date
    FROM 
        [dbo].[Student] s
    INNER JOIN 
        [dbo].[Track] t ON s.Track_ID = t.Track_ID
    INNER JOIN 
        [dbo].[Department] d ON t.Dept_ID = d.Dept_ID
    INNER JOIN
        [dbo].[Intake] i ON s.Intake_ID = i.Intake_ID
    WHERE 
        d.Dept_ID = @DeptID
    ORDER BY 
        s.Student_ID;
END
GO
-----------------------------------------------------
CREATE or alter PROCEDURE GetStudentGradesByID
    @StudentID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        s.Student_ID,
        s.Stu_Name,
        s.Stu_Email,
        s.City,
        t.Track_Name,
        d.Dept_Name,
        c.Crs_Name,
        se.Stu_Grade,
        CASE 
            WHEN se.Stu_Grade >= 85 THEN 'Excellent'
            WHEN se.Stu_Grade >= 75 THEN 'Very Good'
            WHEN se.Stu_Grade >= 65 THEN 'Good'
            WHEN se.Stu_Grade >= 50 THEN 'Pass'
            ELSE 'Fail'
        END AS Grade_Status,
        se.Stu_Grade * 100.0 / 100 AS Grade_Percentage
    FROM 
        [dbo].[Student] s
    INNER JOIN 
        [dbo].[Track] t ON s.Track_ID = t.Track_ID
    INNER JOIN 
        [dbo].[Department] d ON t.Dept_ID = d.Dept_ID
    INNER JOIN 
        [dbo].[Stu_Exam] se ON s.Student_ID = se.Student_ID
    INNER JOIN 
        [dbo].[Exam] e ON se.Exam_ID = e.Exam_ID
    INNER JOIN 
        [dbo].[Course] c ON e.Course_ID = c.Course_ID
    WHERE 
        s.Student_ID = @StudentID
    ORDER BY 
        c.Crs_Name;

    -- Return student summary info
    
END
GO
------------------------------------------------------------------------
Create or Alter PROCEDURE GetInstructorCoursesWithStudentCount
    @Ins_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
    i.Ins_Name,
    i.Ins_Email,
    c.Course_ID,
    c.Crs_Name,
    COUNT(DISTINCT s.Student_ID) As [Total Student]
FROM
    Instructor i
    INNER JOIN Instructor_Course ic ON i.Ins_ID = ic.Ins_ID
    INNER JOIN Course c ON ic.Course_ID = c.Course_ID
    Inner JOIN topic t on c.Topic_ID = t.Topic_ID
    Inner JOIN Track_Topic tt on t.Topic_ID=tt.Topic_ID
	Inner JOIN Track k on tt.Track_ID = k.Track_ID 
	Inner JOIN Student S on k.Track_ID = s.Track_ID

WHERE
    i.Ins_ID = @Ins_ID
GROUP BY
    i.Ins_Name, i.Ins_Email, c.Course_ID, c.Crs_Name
ORDER BY
    c.Crs_Name

END
GO
-------------------------------------------------
Create or Alter PROCEDURE GetCoursesByTopic
    @Topic_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Main query: Get topics for the specified course
    SELECT 
	    
        t.Topic_Name,
        c.course_ID,
        c.Crs_Name,
        c.Crs_Difficulty
        
    FROM 
        Course c
    INNER JOIN 
        Topic t ON c.Topic_ID = t.Topic_ID
    WHERE 
        t.Topic_ID = @Topic_ID
    ORDER BY 
        c.Course_ID;

    
END
GO
--------------------------------------------------------
--Procedure for Report Questions & Student Answers:

CREATE OR ALTER PROCEDURE Stu_Question_Answer 
    @student_id INT, 
    @exam_id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- If student does not exist
    IF NOT EXISTS (SELECT 1 FROM Student WHERE Student_ID = @student_id)
    BEGIN
        SELECT 
            CAST(NULL AS VARCHAR(100)) AS Stu_Name, 
            CAST(NULL AS VARCHAR(200)) AS Qst_Header, 
            CAST(NULL AS VARCHAR(200)) AS Stu_Answer, 
            'Student does not exist' AS Message;
        RETURN;
    END

    -- If exam does not exist
    IF NOT EXISTS (SELECT 1 FROM Exam WHERE Exam_ID = @exam_id)
    BEGIN
        SELECT 
            CAST(NULL AS VARCHAR(100)) AS Stu_Name, 
            CAST(NULL AS VARCHAR(200)) AS Qst_Header, 
            CAST(NULL AS VARCHAR(200)) AS Stu_Answer, 
            'Exam does not exist' AS Message;
        RETURN;
    END

    -- If student did not take any exams
    IF NOT EXISTS (SELECT 1 FROM Student_Exam_Quest WHERE Student_ID = @student_id)
    BEGIN
        SELECT 
            (SELECT Stu_Name FROM Student WHERE Student_ID = @student_id) AS Stu_Name,
            CAST(NULL AS VARCHAR(200)) AS Qst_Header, 
            CAST(NULL AS VARCHAR(200)) AS Stu_Answer, 
            'Student did not take any exams' AS Message;
        RETURN;
    END

    -- If student did not take this exam
    IF NOT EXISTS (SELECT 1 FROM Student_Exam_Quest WHERE Student_ID = @student_id AND Exam_ID = @exam_id)
    BEGIN
        SELECT 
            (SELECT Stu_Name FROM Student WHERE Student_ID = @student_id) AS Stu_Name,
            CAST(NULL AS VARCHAR(200)) AS Qst_Header, 
            CAST(NULL AS VARCHAR(200)) AS Stu_Answer, 
            'Student did not take this exam' AS Message;
        RETURN;
    END

    -- If everything is OK, return the data
    SELECT 
        s.Stu_Name,
        q.Qst_Header, 
        sq.Stu_Answer, 
        CAST(NULL AS VARCHAR(200)) AS Message
    FROM 
        Student_Exam_Quest sq
        INNER JOIN Question q ON q.Question_ID = sq.Question_ID
        INNER JOIN Student s ON s.Student_ID = sq.Student_ID
    WHERE 
        sq.Student_ID = @student_id
        AND sq.Exam_ID = @exam_id
    ORDER BY 
        q.Question_ID;
END
-------------------------------------------------------

create or alter procedure display_exam_Q (@exam_id int) As
Begin
if exists (select * from Exam where Exam_ID=@exam_id)
begin
select Distinct r1.Question_ID,  CONVERT(VARCHAR(MAX), r1.Qst_Header) as 'Question Header',  Isnull(r2.Qst_Choice,'T&F') as 'Choice'
from 
(select q.Question_ID, q.Qst_Header from Question q join Student_Exam_Quest s on q.Question_ID = s.Question_ID where s.Exam_ID=@exam_id) As r1
left outer join
(select q.Question_ID, qc.Qst_Choice from Question q join Qst_Choices qc on q.Question_ID = qc.Question_ID) As r2
on r1.Question_ID = r2.Question_ID
Order by r1.Question_ID 
end
End

 exec display_exam_Q 201