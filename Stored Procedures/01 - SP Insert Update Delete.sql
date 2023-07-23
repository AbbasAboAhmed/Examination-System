--  SP Insert Student
CREATE PROCEDURE Insert_Student 
	@Stu_id INT
	,@STu_SSN int
	,@Stu_Name VARCHAR(30)
	,@Stu_City VARCHAR(30)
AS
	INSERT INTO Student(Stu_ID, Stu_SSN, Stu_Name, Stu_City)
	VALUES (@Stu_id, @STu_SSN, @Stu_Name, @Stu_City);

GO

--SP Update
CREATE PROCEDURE Update_Student
	@Stu_id INT
	,@New_Stu_City VARCHAR(30)
AS
	Update Student
	SET Stu_City = @New_Stu_City
	WHERE Stu_ID = @Stu_id;

GO

--SP Update
CREATE PROCEDURE Delete_Student
	@Stu_id INT
AS
	DELETE FROM Student
	WHERE Stu_ID = @Stu_id;


