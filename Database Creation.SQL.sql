	-- Create the database
CREATE DATABASE	Examination_System;

----------------------------------------------------------------------------------
		-- Create table 
CREATE TABLE Intake
(
  Int_Name VARCHAR(30) PRIMARY KEY
  ,Int_BranchName VARCHAR(30)
  ,Int_StartDate DATE
  ,Int_EndDate DATE
)

BULK INSERT Intake
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Intake.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)


----------------------------------------------------------------------------------
		-- Create table 
CREATE TABLE Topic
(
	Topic_ID INT PRIMARY KEY
	,Topic_Name VARCHAR(30)
)


	-- Import data from file
BULK INSERT Topic
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Topic.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)


----------------------------------------------------------------------------------
		-- Create table 
CREATE TABLE Course
(
	Crs_ID INT PRIMARY KEY
	,Crs_Name VARCHAR(30)
	,Topic_ID INT FOREIGN KEY REFERENCES Topic(Topic_ID) ON UPDATE CASCADE ON DELETE CASCADE
)

	-- Import data from file
BULK INSERT Course
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Course.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)


----------------------------------------------------------------------------------
	-- Create table 
CREATE TABLE Student
(
	Stu_ID INT PRIMARY KEY
	,Stu_Name VARCHAR(30)
	,Stu_Gender VARCHAR(30)
	,Stu_SSN INT
	,Stu_Age INT
	,Stu_Email VARCHAR(150)
	,Stu_City VARCHAR(150)
	,Stu_Street VARCHAR(150)
	,Stu_ZipCode INT
	,Stu_UniGradeYrar INT
	,Stu_EventStatus INT
	,Stu_FreelancingSTatus INT
	,Stu_DiseaseName VARCHAR(150)
	,Stu_EmCName VARCHAR(150)
	,Stu_EmCPhoneNO INT
	,Int_Name VARCHAR(30) FOREIGN KEY REFERENCES Intake (Int_Name) ON UPDATE CASCADE  ON DELETE CASCADE
)

	-- Import data from file
BULK INSERT Student
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Student.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)


----------------------------------------------------------------------------------
		-- Create table 
CREATE TABLE Question 
(
    Qus_No INT PRIMARY KEY
	,Qus_Text VARCHAR(400)
	,Qus_Type VARCHAR(30)
	,Crs_ID INT FOREIGN KEY REFERENCES Course(Crs_ID) ON UPDATE CASCADE  ON DELETE CASCADE
)

	-- Import data from file
BULK INSERT Question
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Question.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)


	----------------------------------------------------------------------------------
		-- Create table 
CREATE TABLE Choices 
(
    Choice_Id INT PRIMARY KEY
	,Choice_Text VARCHAR(300)
	,Is_Correct INT
	,Qus_No INT FOREIGN KEY REFERENCES Question(Qus_No) ON UPDATE CASCADE  ON DELETE CASCADE
)

	-- Import data from file
BULK INSERT Choices
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Choices.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)


----------------------------------------------------------------------------------
		-- Create table 
CREATE TABLE Instructor 
(
    Ins_ID INT PRIMARY KEY
	,Ins_Name VARCHAR(30)
	,Ins_Gender VARCHAR(20)
	,Ins_DOB VARCHAR(20)
	,Ins_City VARCHAR(30)
	,Ins_Street VARCHAR(30)
	,Ins_Email VARCHAR(150)
	,Ins_Salary INT
	,Dept_No INT FOREIGN KEY REFERENCES Department(Dept_No) 
	,Crs_Id INT FOREIGN KEY REFERENCES Course(Crs_Id) ON UPDATE CASCADE  ON DELETE CASCADE
)



	-- Import data from file
BULK INSERT Instructor
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Instructor.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)


----------------------------------------------------------------------------------
		-- Create table 
CREATE TABLE Department
(
	Dept_No INT PRIMARY KEY
	,Dept_Name VARCHAR(30)
	,Dept_Location VARCHAR(30)
	,Mngr_Id INT FOREIGN KEY REFERENCES Instructor(Ins_ID) ON UPDATE CASCADE  ON DELETE CASCADE
)

	-- Import data from file
BULK INSERT Department
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Department.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)


----------------------------------------------------------------------------------
		-- Create table
CREATE TABLE Student_Feedback 
(
	  FD_Id  INT PRIMARY KEY 
	  ,Crs_Material_helpful INT
	  ,Crs_Contant INT
	  ,Crs_well_organised INT
	  ,Crs_Suitable_References INT
	  ,Inst_ClassTime INT
	  ,Inst_Responce_Qus INT
	  ,Inst_Explanation INT
	  ,Inst_GiveClearEx INT
	  ,Std_ID INT FOREIGN KEY REFERENCES Student(Stu_ID) ON UPDATE CASCADE  ON DELETE CASCADE
)

	-- Import data from file
BULK INSERT  Student_Feedback 
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Student Feedback.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)


	----------------------------------------------------------------------------------
		-- Create table
CREATE TABLE Student_Phone
(    
     Stu_ID INT FOREIGN KEY REFERENCES Student(Stu_ID) ON UPDATE CASCADE  ON DELETE CASCADE
    ,Std_PhoneNo INT
	,PRIMARY KEY (Stu_ID ,Std_PhoneNo)
)

	-- Import data from file
BULK INSERT  Student_Phone 
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Student Phone.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)


----------------------------------------------------------------------------------
		-- Create table
CREATE TABLE Student_Course_Attend
(   
    Stu_ID INT FOREIGN KEY REFERENCES Student(Stu_ID) ON UPDATE CASCADE  ON DELETE CASCADE
    ,Crs_ID INT FOREIGN KEY REFERENCES Course(Crs_ID) ON UPDATE CASCADE  ON DELETE CASCADE
    ,AttndStatus INT
    ,PRIMARY KEY (Stu_ID ,Crs_ID)
)

	-- Import data from file
BULK INSERT  Student_Course_Attend
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Student Course Attend.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)

----------------------------------------------------------------------------------
		-- Create table
CREATE TABLE Online_Courses
(
	  Crs_ID  INT PRIMARY KEY
	  ,Course_Title VARCHAR(200)
	  ,Cost VARCHAR(50)
)

	-- Import data from file
BULK INSERT Online_Courses
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Online Course.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)


----------------------------------------------------------------------------------
		-- Create table
CREATE TABLE Student_Online_Courses 
(
  Std_ID INT FOREIGN KEY REFERENCES Student(Stu_ID) ON UPDATE CASCADE  ON DELETE CASCADE
  ,OCrs_Id INT FOREIGN KEY REFERENCES Online_Courses(Crs_ID) ON UPDATE CASCADE  ON DELETE CASCADE
  ,OCrs_Start_Date VARCHAR(20)
  ,OCrs_Cert_Date VARCHAR(20)
  ,Cert_URL VARCHAR(150)
  ,PRIMARY KEY (OCrs_Id ,Std_ID)
)


	-- Import data from file
BULK INSERT Student_Online_Courses 
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Student Online Courses.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)


----------------------------------------------------------------------------------
		-- Create table
CREATE TABLE Grad_Student
(
  Grd_ID INT PRIMARY KEY 
  ,GStd_HiringStatus INT
  ,GStd_CompanyName VARCHAR(50)
  ,GStd_PositionTitle VARCHAR(30)
  ,GStd_Salary INT
  ,GStd_CertUrl VARCHAR(100)
  ,Stu_ID INT FOREIGN KEY REFERENCES Student(Stu_ID) ON UPDATE CASCADE  ON DELETE CASCADE
)


	-- Import data from file
BULK INSERT Grad_Student 
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Grad Student.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)

----------------------------------------------------------------------------------
		-- Create table
CREATE TABLE Exam 
(
    Ex_No INT PRIMARY KEY
	,Ex_Date VARCHAR(20)
	,Ex_Duration INT
	,Crs_Id INT FOREIGN KEY REFERENCES Course(Crs_Id) ON UPDATE CASCADE  ON DELETE CASCADE
)

	-- Import data from file
BULK INSERT Exam 
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Exam.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)

----------------------------------------------------------------------------------
		-- Create table
CREATE TABLE Student_Exam_Answer 
(
    Std_Id INT FOREIGN KEY REFERENCES Student(Stu_ID)
	,Ex_No INT FOREIGN KEY REFERENCES Exam(Ex_No)
	,Qus_No INT FOREIGN KEY REFERENCES Question(Qus_No)
	,Std_Ans INT
    ,Std_Score INT
    ,PRIMARY KEY (Std_Id, Ex_No, Qus_No)
)

	-- Import data from file
BULK INSERT Student_Exam_Answer
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Student Exam Answer.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)

----------------------------------------------------------------------------------
		-- Create table
CREATE TABLE Exam_Question
(
	 Ex_No INT FOREIGN KEY REFERENCES Exam(Ex_No)
	 ,Qus_No INT FOREIGN KEY REFERENCES Question(Qus_No)
	 ,PRIMARY KEY (Ex_No, Qus_No)
)

	-- Import data from file
BULK INSERT Exam_Question
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Exam Question.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)

----------------------------------------------------------------------------------
		-- Create table
CREATE TABLE Instructor_Phone 
(   
    Ins_ID INT FOREIGN KEY REFERENCES Instructor(Ins_ID)
    ,Ins_Phone_No INT 
	,PRIMARY KEY (Ins_ID ,Ins_Phone_No)
)


	-- Import data from file
BULK INSERT Instructor_Phone
FROM "E:\00 - Learning\2 - ITI\Examination System\Data\Instructor Phone.CSV"
WITH
	(
	FORMAT  = 'CSV'
	)

