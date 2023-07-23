-- SP Exam Answer
CREATE PROCEDURE Save_Student_Exam_Answer
	@Ex_No INT
	,@Stu_ID INT
	,@Qus_No INT
	,@Std_Ans INT
AS
BEGIN TRY
	IF NOT EXISTS(SELECT * FROM Exam WHERE Ex_No = @Ex_No)
		BEGIN
			SELECT 'The Exam does not exist' AS 'ErrMessage'
		END
	ELSE IF NOT EXISTS(SELECT * FROM Question WHERE Qus_No = @Qus_No)
		BEGIN
			SELECT 'The question does not exist' AS 'ErrMessage'
		END
	ELSE IF NOT EXISTS(SELECT * FROM Student WHERE Stu_ID = @Stu_ID)
		BEGIN
			SELECT 'The Student does not exist' AS 'ErrMessage'
		END
	ELSE
		BEGIN
			INSERT INTO Student_Exam_Answer (StD_ID, Ex_No, Qus_No, Std_Ans)
			VALUES(@Ex_No, @Stu_ID, @Qus_No, @Std_Ans)
		END
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage
END CATCH;

-- Test
Save_Student_Exam_Answer @Ex_No = 123456, @Stu_ID = 1, @Qus_No = 21, @Std_Ans = 2

