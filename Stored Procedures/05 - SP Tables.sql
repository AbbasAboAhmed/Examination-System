-- SPs 

CREATE PROCEDURE Select_Topic
AS
BEGIN
    SELECT *
	FROM Topic
END

-- Insert into topic
CREATE PROCEDURE Insert_Topic
@Topic_ID INT
,@Topic_Name VARCHAR(20)
AS
BEGIN
	INSERT INTO Topic(Topic_ID, Topic_Name)
	VALUES(@Topic_ID, @Topic_Name)
END

-- Update into topic
CREATE PROCEDURE Update_Topic
@Topic_ID INT
,@Topic_Name VARCHAR(20)
AS
BEGIN
	UPDATE Topic
	SET Topic_ID = @Topic_ID
		,Topic_Name =  @Topic_Name
END

-- Delete topic
CREATE PROCEDURE Delete_Topic
@Topic_ID INT
AS
BEGIN
	DELETE Topic
	WHERE Topic_ID = @Topic_ID
END


--- Course table

--SELECT SP
GO
CREATE PROCEDURE Select_Course
AS
BEGIN
    SELECT *
	FROM Course
END

--INSERT SP
GO
CREATE PROCEDURE Insert_Cousre
    @Crs_Id INT,
	@Crs_Name VARCHAR(20),
	@Topic_Id INT
AS
BEGIN
    INSERT INTO Course
	VALUES(@Crs_Id,@Crs_Name, @Topic_Id)
END

--UPDATE SP
GO
CREATE PROCEDURE Update_Course
    @Crs_Id INT,
    @New_Topic_Id INT
AS
BEGIN
    UPDATE Course
	SET Topic_Id = @New_Topic_Id
	WHERE Crs_Id = @Crs_Id
END

----- SP DELETE
GO
CREATE PROCEDURE Delete_Course
    @Crs_Id INT
AS
BEGIN
    DELETE FROM Course
	WHERE Crs_ID = @Crs_Id
END

--Question table 

--SELECT SP
GO
CREATE PROCEDURE Select_Question
AS
BEGIN
    SELECT *
	FROM Question
END

--INSERT SP
GO
CREATE PROCEDURE Insert_Question
    @Qus_No INT,
	@Choice_Text VARCHAR(200),
    @Qus_Type VARCHAR(10),
	@Crs_ID INT
AS
BEGIN
    INSERT INTO Question
	VALUES(@Qus_No, @Choice_Text, @Qus_Type, @Crs_ID)
END

--UPDATE SP
GO
CREATE PROCEDURE Update_Question
    @Qus_No INT,
    @New_Crs_Id INT
AS
BEGIN
    UPDATE Question
	SET Crs_ID = @New_Crs_Id
	WHERE Qus_No = @Qus_No
END

--DELETE SP
GO
CREATE PROCEDURE Delete_Question
    @Qus_No INT
AS
BEGIN
    DELETE FROM Question
	WHERE Qus_No = @Qus_No
END

--Choices table

-- SELECT SP
GO
CREATE PROCEDURE Select_Choices
AS
BEGIN
    SELECT *
	FROM Choices
END

--INSERT SP
GO
CREATE PROCEDURE Insert_Choices
    @Choice_Id INT,
	@Choice_Text VARCHAR(200),
    @Is_Correct INT,
	@Qus_No INT
AS
BEGIN
    INSERT INTO Choices
	VALUES(@Choice_Id, @Choice_Text, @Is_Correct, @Qus_No)
END

--UPDATE SP
GO
CREATE PROCEDURE Update_Choices
    @Choice_Id INT,
    @New_Choice_Text VARCHAR(200)
AS
BEGIN
    UPDATE Choices
	SET Choice_Text = @New_Choice_Text
	WHERE Choice_Id = @Choice_Id
END

--DELETE SP
GO
CREATE PROCEDURE Delete_Choices
    @Choice_Id INT
AS
BEGIN
    DELETE FROM Choices
	WHERE Choice_Id = @Choice_Id
END

--Department table

--SELECT SP
GO
CREATE PROCEDURE Select_Department
AS
BEGIN
    SELECT *
	FROM Department
END

--INSERT SP
GO
CREATE PROCEDURE Insert_Department
    @Dept_No INT,
	@Dept_Name VARCHAR(20),
	@Dept_Location VARCHAR(20),
    @Mngr_Id INT
AS
BEGIN
    INSERT INTO Department
	VALUES(@Dept_No, @Dept_Name, @Dept_Location, @Mngr_Id)
END

--UPDATE SP
GO
CREATE PROCEDURE Update_Department
    @Dept_No INT,
    @New_Mngr_Id INT
AS
BEGIN
    UPDATE Department
	SET Mngr_Id = @New_Mngr_Id
	WHERE Dept_No = @Dept_No
END

--DELETE SP
GO
CREATE PROCEDURE Delete_Department
    @Dept_No INT
AS
BEGIN
    DELETE FROM Department
	WHERE Dept_No = @Dept_No
END

--Instructor table

--SELECT SP
GO
CREATE PROCEDURE SelectInstructor
AS
BEGIN
    SELECT *
	FROM Instructor
END

----- SP INSERT
GO
CREATE PROCEDURE InsertInstructor
    @Ins_ID INT,
	@Ins_Name VARCHAR(30),
	@Ins_Gender VARCHAR(20),
	@Ins_DOB VARCHAR(20),
	@Ins_City VARCHAR(30),
	@Ins_Street VARCHAR(30),
	@Ins_Email VARCHAR(50),
	@Ins_Salary INT,
	@Crs_Id INT,
	@Dept_No INT
AS
BEGIN
    INSERT INTO Instructor
	VALUES(@Ins_ID, @Ins_Name, @Ins_Gender, @Ins_DOB, @Ins_City, @Ins_Street, @Ins_Email, @Ins_Salary, @Crs_Id, @Dept_No)
END

----- SP UPDATE
GO
CREATE PROCEDURE UpdateInstructor
    @Ins_ID INT,
    @New_Ins_Salary INT
AS
BEGIN
    UPDATE Instructor
	SET Ins_Salary = @New_Ins_Salary
	WHERE Ins_ID = @Ins_ID
END

----- SP DELETE
GO
CREATE PROCEDURE DeleteInstructor
    @Ins_ID INT
AS
BEGIN
    DELETE FROM Instructor
	WHERE Ins_ID = @Ins_ID
END

----- Std_Phone table -----

----- SP SELECT
GO
CREATE PROCEDURE SelectStd_Phone
AS
BEGIN
    SELECT *
	FROM Student_Phone
END

----- SP INSERT
GO
CREATE PROCEDURE InsertStd_Phone
    @Std_ID INT,
    @Std_Phone INT
AS
BEGIN
 	INSERT INTO Student_Phone
    VALUES(@Std_ID, @Std_Phone)
    
END

----- SP UPDATE
GO
CREATE PROCEDURE UpdateStd_Phone
    @Std_ID INT,
    @Std_Phone INT,
    @New_Std_Phone INT
AS
BEGIN
    UPDATE Student_Phone
	SET Std_PhoneNo = @New_Std_Phone
	WHERE Stu_ID = @Std_ID AND Std_PhoneNo = @Std_Phone
END

----- SP DELETE
GO
CREATE PROCEDURE DeleteStd_Phone
    @Std_ID INT,
    @Std_PhoneNo INT
AS
BEGIN
    DELETE FROM Student_Phone
	WHERE Stu_ID = @Std_ID AND Std_PhoneNo = @Std_PhoneNo
END

--Student table 

----- SP SELECT
GO
CREATE PROCEDURE SelectStudent
AS
BEGIN
    SELECT *
	FROM Student
END

----- SP INSERT
GO
CREATE PROCEDURE InsertStudent
    @Std_ID INT,
    @Std_SSN INT,
    @Std_Name VARCHAR(20),
	@Std_City VARCHAR(20)
AS
BEGIN
    INSERT INTO Student (Stu_ID, Stu_Name, Stu_SSN, Stu_City)
	VALUES(@Std_ID, @Std_Name,@Std_SSN,@Std_City)
END

----- SP UPDATE
GO
CREATE PROCEDURE UpdateStudent
    @Std_ID INT,
	@New_Std_City VARCHAR(20)
AS
BEGIN
    UPDATE Student
	SET Stu_City = @New_Std_City
	WHERE Stu_ID = @Std_ID
END

----- SP DELETE
GO
CREATE PROCEDURE DeleteStudent
    @Std_ID INT
AS
BEGIN
    DELETE FROM Student
	WHERE Stu_ID = @Std_ID
END

----- Std_Feedback table

-- SP SELECT
GO
CREATE PROCEDURE SelectStd_Feedback
AS
BEGIN
    SELECT *
 FROM Student_Feedback
END

----- SP INSERT
GO
CREATE PROCEDURE InsertStd_Feedback
    @FD_Id INT,
    @Std_ID INT,
    @Crs_Material_helpful INT,
    @Crs_Contant INT
AS
BEGIN
    INSERT INTO Student_Feedback(FD_Id, Std_ID, Crs_Material_helpful, Crs_Contant)
 VALUES(@FD_Id, @Std_ID, @Crs_Material_helpful, @Crs_Contant)
END

----- SP UPDATE
GO
CREATE PROCEDURE UpdateStd_Feedback
    @FD_Id INT,
    @Std_ID INT,
    @New_Crs_Material_helpful INT
AS
BEGIN
    UPDATE Student_Feedback
 SET Crs_Material_helpful = @New_Crs_Material_helpful
 WHERE FD_Id = @FD_Id AND Std_ID = @Std_ID
END

----- SP DELETE
GO
CREATE PROCEDURE DeleteStd_Feedback
    @FD_Id INT,
    @Std_ID INT
AS
BEGIN
    DELETE FROM Student_Feedback
 WHERE FD_Id = @FD_Id AND Std_ID = @Std_ID
END


----- Std_CrsAttend table -----

----- SP SELECT
GO
CREATE PROCEDURE SelectStd_CrsAttend
AS
BEGIN
    SELECT *
	FROM Student_Course_Attend
END

----- SP INSERT
GO
CREATE PROCEDURE InsertStd_CrsAttend
	@Std_ID INT,
    @Crs_ID INT,
    @AttndStatus INT
AS
BEGIN
    INSERT INTO Student_Course_Attend
	VALUES(@Std_ID, @Crs_ID, @AttndStatus)
END

----- SP UPDATE
GO
CREATE PROCEDURE UpdateStd_CrsAttend
    @Std_ID INT,
    @Crs_ID INT,
    @New_AttndStatus INT
AS
BEGIN
    UPDATE Student_Course_Attend
	SET AttndStatus = @New_AttndStatus
	WHERE Stu_ID = @Std_ID AND Crs_ID = @Crs_ID
END

----- SP DELETE
GO
CREATE PROCEDURE DeleteStd_CrsAttend
    @Std_ID INT,
	@Crs_ID INT
AS
BEGIN
    DELETE FROM Student_Course_Attend
	WHERE Stu_ID = @Std_ID AND Crs_ID = @Crs_ID
END

----- Std_OnlineCrs table -----

----- SP SELECT
GO
CREATE PROCEDURE SelectStd_OnlineCrs
AS
BEGIN
    SELECT *
	FROM Student_Online_Courses
END

----- SP INSERT
GO
CREATE PROCEDURE InsertStd_OnlineCrs
    @OCrs_Id INT,
    @Std_ID INT,
    @CertURL VARCHAR(80)
AS
BEGIN
    INSERT INTO Student_Online_Courses (OCrs_ID, Std_ID, Cert_URL)
	VALUES(@OCrs_Id, @Std_ID, @CertURL)
END

----- SP UPDATE
GO
CREATE PROCEDURE UpdateStd_OnlineCrs
    @OCrs_Id INT,
    @Std_ID INT,
    @New_CertURL VARCHAR(80)
AS
BEGIN
    UPDATE Student_Online_Courses
	SET Cert_URL= @New_CertURL
	WHERE OCrs_Id = @OCrs_Id AND Std_ID = @Std_ID
END

----- SP DELETE
GO
CREATE PROCEDURE DeleteStd_OnlineCrs
    @OCrs_Id INT,
    @Std_ID INT
AS
BEGIN
    DELETE FROM Student_Online_Courses
	WHERE OCrs_Id = @OCrs_Id AND Std_ID = @Std_ID
END

----- Online_Crs table -----

----- SP SELECT
GO
CREATE PROCEDURE SelectOnline_Crs
AS
BEGIN
    SELECT *
	FROM Student_Online_Courses
END

----- SP INSERT
GO
CREATE PROCEDURE InsertOnline_Crs
    @CrsID INT,
	@CourseTitle VARCHAR(20),
	@Cost VARCHAR(20)

AS
BEGIN
    INSERT INTO Student_Online_Courses
	VALUES(@CrsID, @CourseTitle, @Cost)
END

----- SP UPDATE
GO
CREATE PROCEDURE UpdateOnline_Crs
    @CrsID INT,
    @New_Crs_Name VARCHAR(20)
AS
BEGIN
    UPDATE Student_Online_Courses
	SET Cert_URL= @New_Crs_Name
	WHERE OCrs_Id= @CrsID
END

----- SP DELETE
GO
CREATE PROCEDURE DeleteOnline_Crs
    @CrsID INT
AS
BEGIN
    DELETE FROM Student_Online_Courses
	WHERE OCrs_Id = @CrsID
END

----- Intake table 

-- SP SELECT
GO
CREATE PROCEDURE SelectIntake
AS
BEGIN
    SELECT *
	FROM Intake
END

----- SP INSERT
GO
CREATE PROCEDURE InsertIntake
   @Int_Name  VARCHAR(30), 
   @Int_BranchName VARCHAR(30)
AS
BEGIN
    INSERT INTO Intake (Int_Name ,Int_BranchName)
	VALUES (@Int_Name, @Int_BranchName)
END

----- SP UPDATE
GO
CREATE PROCEDURE UpdateIntake
    @Int_Name VARCHAR(30),
	@New_Int_BranchName VARCHAR(30)
AS
BEGIN
    UPDATE Intake
	SET Int_BranchName = @New_Int_BranchName
	WHERE Int_Name = @Int_Name
END

----- SP DELETE 
GO
CREATE PROCEDURE DeleteIntake
    @Int_Name  VARCHAR(30)
AS
BEGIN
    DELETE FROM Intake
	WHERE Int_Name = @Int_Name
END

----- Grad_Std table -----

-- SP SELECT
GO
CREATE PROCEDURE SelectGrad_Std
AS
BEGIN
    SELECT *
	FROM Grad_Student
END

-- SP INSERT
GO
CREATE PROCEDURE InsertGrad_Std
    @Grd_ID INT,
	@GSts_HiringStatus INT,
	@Std_ID INT

AS
BEGIN
    INSERT INTO Grad_Student(Grd_ID, GStd_HiringStatus, Stu_ID)
	VALUES(@Grd_ID, @GSts_HiringStatus, @Std_ID)
END

-- SP UPDATE
GO
CREATE PROCEDURE UpdateGrad_Std
    @Grd_ID INT,
	@New_GStd_HiringStatus INT
AS
BEGIN
    UPDATE Grad_Student
	SET GStd_HiringStatus = @New_GStd_HiringStatus
	WHERE Grd_ID = @Grd_ID 
END

-- SP DELETE
GO
CREATE PROCEDURE DeleteGrad_Std
    @Grd_ID INT
AS
BEGIN
    DELETE FROM Grad_Student
	WHERE Grd_ID = @Grd_ID
END

----- Ins_Phone table -----

----- SP SELECT
GO
CREATE PROCEDURE SelectIns_Phone
AS
BEGIN
    SELECT *
	FROM Instructor_Phone
END

----- SP INSERT
GO
CREATE PROCEDURE InsertIns_Phone
    @Ins_ID INT,
    @Ins_PhoneNo INT
AS
BEGIN
 	INSERT INTO Instructor_Phone
    VALUES(@Ins_ID, @Ins_PhoneNo)
    
END

----- SP UPDATE
GO
CREATE PROCEDURE UpdateIns_Phone
    @Ins_ID INT,
    @Ins_PhoneNo INT,
    @New_Ins_PhoneNo INT
AS
BEGIN
    UPDATE Instructor_Phone
	SET Ins_Phone_No = @New_Ins_PhoneNo
	WHERE Ins_ID = @Ins_ID AND Ins_Phone_No= @Ins_PhoneNo
END

----- SP DELETE
GO
CREATE PROCEDURE DeleteIns_Phone
    @Ins_ID INT,
    @Ins_PhoneNo INT
AS
BEGIN
    DELETE FROM Instructor_Phone
	WHERE Ins_ID = @Ins_ID AND Ins_Phone_No = @Ins_PhoneNo
END