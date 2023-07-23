CREATE PROCEDURE  Generate_Exam
	@EX_No INT
	,@Crs_ID INT
	,@Ex_Duration INT
	,@Num_of_Questions INT
	,@Num_of_MCQ_Questions INT
AS 
BEGIN TRY 
	IF NOT EXISTS (SELECT * FROM Course WHERE Crs_ID = @Crs_ID)
		BEGIN 
			SELECT 'The courese does not exsit' AS 'Error message'
		END
	ELSE
		BEGIN
			-- Generate Exam
			INSERT INTO Exam (Ex_No, Ex_Date, Ex_Duration, Crs_Id)
			VALUES (@EX_No, GETDATE(), @Ex_Duration, @Crs_ID)
			

			-- Select True/False Question
			INSERT INTO Exam_Question (Ex_No, Qus_No)
			SELECT TOP (@Num_of_MCQ_Questions) @EX_No, Q.Qus_No
			FROM Question Q
			WHERE Q.Crs_ID = @Crs_ID AND Qus_Type = 't/f'
			ORDER BY NEWID()

			 -- Select Multiple Choice questions related to the same course
            INSERT INTO Exam_Question (Ex_No, Qus_No)
            SELECT TOP (@Num_of_MCQ_Questions) @Ex_No, Q.Qus_No
            FROM Question Q
            WHERE Q.Crs_ID = @Crs_ID AND Q.Qus_Type = 'mcq'
            ORDER BY NEWID();
    
            -- Select exam model
            SELECT Q.* 
            FROM Exam_Question eq, Question Q, Exam E
			WHERE eq.Ex_No = E.Ex_No AND eq.Qus_No = Q.Qus_No AND eq.Ex_No = @Ex_No
        END
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS errorMessage
END CATCH

GenerateAnExam @Ex_No = 13574, @Crs_ID = 112, @Ex_Duration = 15, @Num_TF_Questions = 5, @Num_MCQ_Questions = 10