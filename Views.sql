-- Students Grad Views
CREATE VIEW Students_Grad AS 
	SELECT 
		sx.Std_Id
		,c.Crs_Name
		,Round(SUM(sx.Std_Score) * 100 / COUNT(sx.Ex_No), 2) Student_Grad
	FROM Student_Exam_Answer sx
		LEFT JOIN Exam e
			ON sx.Ex_No = e.Ex_No
		Inner JOIN Course c
			ON  e.Crs_ID = c.Crs_ID
		Group By sx.Std_Id
			,c.Crs_Name;


-- Department Students
CREATE VIEW Department_Students AS 
WITH StdDept AS (
			     SELECT
					sc.Stu_ID
					,d.Dept_Name Depaertment
		         FROM Student_Course_Attend sc
					INNER JOIN Course c
						ON sc.Crs_ID = c.Crs_ID
					INNER JOIN Instructor i
						ON i.Crs_Id = c.Crs_ID
					LEFT JOIN Department d
						ON i.Dept_No = d.Dept_No
			     )

SELECT DISTINCT
	s.Stu_ID
	,s.Stu_Name
	,sd.Depaertment
FROM Student s 
	LEFT JOIN StdDept sd
ON s.Stu_ID = sd.Stu_ID


-- Students Enrollment In courses
CREATE VIEW Student_Enroll_Courses AS
	SELECT sc.*
	FROM Student s 
		JOIN Student_Course_Attend sc
			ON s.Stu_ID = sc.Stu_ID
	WHERE s.Stu_ID not in (
                SELECT Grd_ID
				FROM Grad_Student
				)

-- Department Topics
CREATE VIEW Department_Topic AS
	SELECT t.Topic_Id, d.Dept_Name
	FROM Topic t 
		JOIN course c
			on t.Topic_Id = c.Topic_Id
		JOIN instructor i
			on c.Crs_ID = i.Crs_Id
		JOIN Department d
			on i.Dept_No = d.Dept_No

-- Student Model Answer
GO
CREATE VIEW Students_Model_Answers AS
	SELECT q.Qus_No, q.Qus_Text, C.Choice_Text [Student Answer],
			       CASE WHEN se.Std_Score = 1 THEN 'True Answer'
				        WHEN se.Std_Score = 0 THEN 'Wrong Answer'
						END AS [Answer Correction]
    FROM Student_Exam_Answer se
		INNER JOIN Exam E
			 ON E.Ex_No = SE.Ex_No
		INNER JOIN Question Q
			ON SE.Qus_No = Q.Qus_No
		INNER JOIN Choices C
			ON Q.Qus_No = C.Qus_No AND C.Is_Correct = 1
