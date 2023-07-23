CREATE PROCEDURE Student_Model_Answer
	@Stu_ID INT
	,@Ex_No INT
AS
BEGIN TRY
	IF NOT EXISTS(SELECT * FROM Student WHERE Stu_ID = @Stu_ID)
		BEGIN
			SELECT 'The Student does not exist' AS 'ErrMessage'
		END
	ELSE IF NOT EXISTS(SELECT * FROM Exam WHERE Ex_No = @Ex_No)
		BEGIN
			SELECT 'The Exam does not exist' AS 'ErrMessage'
		END
	ELSE 
		BEGIN
			-- Update Std_Score based on the student's answers
			UPDATE Student_Exam_Answer
			SET Std_Score = CASE WHEN c.Is_Correct = 1 THEN 1 ELSE 0 END
			FROM Student_Exam_Answer se
			INNER JOIN Choices C
				ON se.Qus_No = c.Qus_No
			WHERE se.Ex_No = @Ex_No AND se.Std_Id = @Stu_ID

			-- Total number of correct answers
			DECLARE @Total_Correct_Answer INT
			SELECT @Total_Correct_Answer = SUM(Std_Score)
			from Student_Exam_Answer
			WHERE Std_Id = @Stu_ID 
				AND Ex_No = @Ex_No

			-- Grade in percentage
			DECLARE @Grade_Percentage DECIMAL(5, 1);
			SELECT @Total_Correct_Answer = (@Total_Correct_Answer * 100.0) / COUNT(Qus_No)
			FROM Student_Exam_Answer
			WHERE Std_Id = @Stu_ID 
				AND Ex_No = @Ex_No;

			--return the grad Percentage
			SELECT @Grade_Percentage AS GradePercentage;

		END
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS errorMessage
END CATCH

-- Test --
GO
Student_Model_Answer @Stu_ID = 1, @Ex_No = 654321
