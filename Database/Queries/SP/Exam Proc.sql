---------------------------------------------------
------------------------------------------EXAM Procedures-------------------------------------


CREATE OR ALTER   procedure [dbo].[display_exam_Q] (@exam_id int) As
Begin
if exists (select * from Exam where Exam_ID=@exam_id)
begin
select Distinct r1.Question_ID,  CONVERT(VARCHAR(MAX), r1.Qst_Header) as 'Question Header',  CONVERT(VARCHAR(MAX),r2.Qst_Choice) as 'Choice'
from 
(select q.Question_ID, q.Qst_Header from Question q join Student_Exam_Quest s on q.Question_ID = s.Question_ID where s.Exam_ID=@exam_id) As r1
left outer join
(select q.Question_ID, qc.Qst_Choice from Question q join Qst_Choices qc on q.Question_ID = qc.Question_ID) As r2
on r1.Question_ID = r2.Question_ID
Order by r1.Question_ID 
end
End;

-------------------------------------------------------------------------------------------------------------------


CREATE OR ALTER   PROCEDURE [dbo].[GenerateExam](
    @Course_ID INT,
    @Exam_Duration INT,
    @Instructor_ID INT,
    @MCQ_Count INT = 0,
    @TrueFalse_Count INT = 0
	)
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS(SELECT 1 FROM Course WHERE Course_ID = @Course_ID)
        BEGIN
            SELECT 'Course does not exist!' as message
            RETURN
        END
        
        IF NOT EXISTS(SELECT 1 FROM Instructor WHERE Ins_ID = @Instructor_ID)
        BEGIN
            SELECT 0 AS Success, N'Instructor does not exist!' AS Message
            RETURN
        END
        
        DECLARE @Available_TFQuestions INT
		DECLARE @Available_MCQuestions INT

        SELECT @Available_TFQuestions = COUNT(*) 
        FROM Question q
        WHERE q.Course_ID = @Course_ID and q.Qst_Type = 'True/False'

		SELECT @Available_MCQuestions = COUNT(*) 
        FROM Question q
        WHERE q.Course_ID = @Course_ID and q.Qst_Type = 'MCQ'
        
        IF @Available_TFQuestions < @TrueFalse_Count or @Available_MCQuestions < @MCQ_Count
        BEGIN
            SELECT 0 AS Success, N'Not enough questions exist in the database. Please lower the count of questions.' AS Message
            RETURN
        END
        
        DECLARE @New_Exam_ID INT = (SELECT ISNULL(MAX(Exam_ID), 0) + 1 FROM Exam)
        select 'Inserted new exam_ID' as message
        INSERT INTO Exam VALUES (@New_Exam_ID, @Exam_Duration, @Course_ID)
        INSERT INTO Instructor_Exam VALUES (@Instructor_ID, @New_Exam_ID)
        

IF @MCQ_Count > 0
BEGIN
	SELECT 'Inserted MCQ' as message;
    -- Insert MCQ questions for all students in the course
    INSERT INTO Student_Exam_Quest(Question_ID, Exam_ID, Student_ID, Stu_Answer, Answer_Check)
    SELECT 
        q.Question_ID,
        @New_Exam_ID,
        s.Student_ID,
        NULL, -- Student answer placeholder
        NULL  -- Answer check placeholder
    FROM (
        SELECT TOP (@MCQ_Count) *
        FROM Question
        WHERE Qst_Type = 'MCQ'
        ORDER BY NEWID()
    ) q
    JOIN Student s ON s.Track_ID IN (
        SELECT t.Track_ID
        FROM Track_Topic t
        JOIN Course c ON t.Topic_ID = c.Topic_ID
        WHERE c.Course_ID = @Course_ID
		and s.Intake_ID in (select max(Intake_ID) from Intake)
    );
    
END

        INSERT INTO STU_EXAM (Student_ID, Exam_ID)
		SELECT s.Student_ID, @New_Exam_ID
		FROM Student s
		WHERE s.Track_ID IN (
    SELECT t.Track_ID
    FROM Track_Topic t
    JOIN Course c ON t.Topic_ID = c.Topic_ID
    WHERE c.Course_ID = @Course_ID
    AND s.Intake_ID IN (SELECT MAX(Intake_ID) FROM Intake))

        IF @TrueFalse_Count > 0
BEGIN
SELECT 'Inserted True/False' as message;
    INSERT INTO Student_Exam_Quest(Question_ID, Exam_ID, Student_ID, Stu_Answer, Answer_Check)
    SELECT 
        q.Question_ID,
        @New_Exam_ID,
        s.Student_ID,
        NULL, -- Student answer placeholder
        NULL  -- Answer check placeholder
    FROM (
        SELECT TOP (@TrueFalse_Count) *
        FROM Question
        WHERE Qst_Type = 'True/False'
        ORDER BY NEWID()
    ) q
    JOIN Student s ON s.Track_ID IN (
        SELECT t.Track_ID
        FROM Track_Topic t
        JOIN Course c ON t.Topic_ID = c.Topic_ID
        WHERE c.Course_ID = @Course_ID
		and s.Intake_ID in (select max(Intake_ID) from Intake)
    );

    
END                        
        SELECT 1 AS Success, 
               N'Exam sucessfully generated!' AS Message
			   
		exec display_exam_Q @exam_id=@New_Exam_ID
    END TRY
    BEGIN CATCH
        SELECT 0 AS Success, N'Error' AS Message
    END CATCH
END;

-----------------------------------------------------------------------------------------------------

CREATE OR ALTER   procedure [dbo].[answer_question] (@student_id int, @exam_id int, @question_id int, @answer varchar(50)) As
Begin
Begin try
Begin transaction
update Student_Exam_Quest 
Set Stu_Answer = @answer
where Student_ID = @student_id and Exam_ID=@exam_id and Question_ID=@question_id
select 'Answer submitted successfully' as Message
commit transaction
End try
Begin Catch
rollback transaction;
throw;
End Catch
End;

-------------------------------------------------------------------------------------------------------

CREATE OR ALTER   procedure [dbo].[correct_exam] (@student_id int, @exam_id int) As
Begin
if exists (select 1 from Student_Exam_Quest where Student_ID=@student_id and Exam_ID=@exam_id)
begin
begin try
begin transaction
UPDATE Student_Exam_Quest
SET Answer_Check =
    CASE
        WHEN q.Qst_Type = 'True/False' THEN
            CASE
                WHEN (Student_Exam_Quest.Stu_Answer = '1' AND q.Model_Answer = 'True') THEN 1
                WHEN (Student_Exam_Quest.Stu_Answer = '2' AND q.Model_Answer = 'False') THEN 1
                ELSE 0
            END
        WHEN q.Qst_Type = 'MCQ' THEN
            CASE
                WHEN Student_Exam_Quest.Stu_Answer = q.Model_Answer THEN 1
                ELSE 0
            END
        ELSE 0
    END
FROM
    Question q
WHERE
    q.Question_ID = Student_Exam_Quest.Question_ID
    AND Student_Exam_Quest.Student_ID = @student_id
    AND Student_Exam_Quest.Exam_ID = @exam_id;

update Stu_Exam
set Stu_Grade = (select sum(convert(int, Answer_check))*100/7 from Student_Exam_Quest where Student_ID=@student_id and Exam_ID=@exam_id)
where Student_ID=@student_id and Exam_ID=@exam_id 

commit transaction
end try
begin catch
rollback transaction;
throw;
end catch
end
End;

-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-------------------------------------USER GRANTS-----------------------------------------------

GRANT SELECT, INSERT, DELETE, UPDATE ON Student TO student_user;
GRANT SELECT, INSERT, DELETE, UPDATE ON Student_Exam_Quest TO student_user;
GRANT SELECT ON Stu_Exam TO student_user;
GRANT SELECT ON Question TO student_user;
GRANT SELECT ON Qst_Choices TO student_user;
GRANT EXECUTE ON display_Exam_Q TO student_user;
GRANT SELECT ON EXAM TO student_user;
GRANT EXECUTE ON answer_question TO student_user;
GRANT EXECUTE ON correct_exam TO student_user;

GRANT EXECUTE ON GenerateExam to instructor_user;
GRANT EXECUTE ON display_exam_q to instructor_user;
GRANT EXECUTE ON UpdateIns to instructor_user;


-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

--------------FOR GENERATING AND ANSWERING EXAMS IN WEB APP------------------
select * from Exam

select DISTINCT Course_ID from Question where Course_ID=101

select * from Instructor i, Instructor_Course ic
where i.Ins_ID = ic.Ins_ID
and ic.Course_ID in (
select DISTINCT Course_ID from Question)
order by i.Ins_Name

select * from Stu_Exam where Student_ID=1

exec display_exam_Q 213

select * from Course where Course_ID = 33

select * from Student s, Track_Topic tt, Course c
where s.Track_ID=tt.Track_ID
and tt.Topic_ID=c.Topic_ID
and c.Course_ID=82
and s.Intake_ID = 33


select * from Instructor_Course where Ins_ID=6

select * from Question
where Question_ID in (585, 729, 938, 951, 1584, 1654, 1802)

select * from Question
where Question_ID in (522, 606, 689, 937, 1459, 1712, 1856)

select * from Question
where Question_ID in (361, 535, 593, 850, 950, 996, 1000)