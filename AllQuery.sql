create database exam_system;
use exam_system;
------------------table student------------------------
create table student (
    st_id int primary key,
    st_fname varchar(255),
    st_lname varchar(255),
    age int,
    city varchar(255)
);
------------------table instructor------------------------

create table instructor (
    ins_id int primary key,
    ins_fname varchar(255),
    ins_lname varchar(255),
    age int,
    salary decimal(10,2),
    city varchar(255),
    street varchar(255)
);
------------------table courses------------------------

create table courses (
    course_id int primary key,
    course_name varchar(255),
    course_description text
);
------------------table student_course------------------------

create table student_course (
    id int primary key ,
    student_id int,
    course_id int,
    foreign key (student_id) references student(st_id),
    foreign key (course_id) references courses(course_id)
);
------------------table instructor_courses------------------------

create table instructor_courses (
    id int primary key ,
    course_id int,
    ins_id int,
    foreign key (course_id) references courses(course_id),
    foreign key (ins_id) references instructor(ins_id)
);
------------------table exam------------------------

create table exam (
    exam_id int primary key,
    total_point int,
    start_time datetime,
    end_time datetime,
    duration int,
    course_id int,
    ins_id int,
    foreign key (course_id) references courses(course_id),
    foreign key (ins_id) references instructor(ins_id)
);
------------------table topic------------------------

create table topic (
    topic_id int primary key,
    topic_name varchar(255),
    course_id int,
    foreign key (course_id) references courses(course_id)
);
------------------table question------------------------

CREATE TABLE question (
    question_id INT PRIMARY KEY,
    question_type VARCHAR(10) NOT NULL,
    question_point INT,
    qus_text TEXT,
    exam_id INT,
    question_answer VARCHAR(250),
    FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
    CONSTRAINT chk_question_type CHECK (question_type IN ('mcq', 'true_false'))
);
------------------table choice------------------------

create table choice (
    id int primary key ,
    name varchar(255),
    question_id int,
    foreign key (question_id) references question(question_id)
);


CREATE TABLE choice (
    choice_id INT PRIMARY KEY IDENTITY(1,1),
    question_id INT,
    choice_text VARCHAR(250) NOT NULL,
    FOREIGN KEY (question_id) REFERENCES question(question_id),
    CHECK (
        (SELECT question_type FROM question WHERE question.question_id = choice.question_id) = 'mcq'
    )
);Msg 1046, Level 15, State 1, Line 96
Subqueries are not allowed in this context. Only scalar expressions are allowed.
------------------table student_exam------------------------

create table student_exam (
    id int primary key ,
    exam_id int,
    student_id int,
    grade int,
    foreign key (exam_id) references exam(exam_id),
    foreign key (student_id) references student(st_id)
);
------------------table student_answer------------------------

create table student_answer (
    id int primary key ,
    answer_text varchar(255),
    student_id int,
    question_id int,
    exam_id int,
    foreign key (student_id) references student(st_id),
    foreign key (question_id) references question(question_id),
    foreign key (exam_id) references exam(exam_id)
);
--Here's an updated **INSERT** .  

---

--### *Adding Students (Including Alaa and Amira)*  
--sql

INSERT INTO student (st_id, st_fname, st_lname, age, city) VALUES
(1, 'Ahmed', 'Khaled', 22, 'Cairo'),
(2, 'Mona', 'Mohamed', 21, 'Giza'),
(3, 'Ali', 'Saeed', 23, 'Alexandria'),
(4, 'Alaa', 'Hassan', 24, 'Cairo'),
(5, 'Amira', 'Ahmed', 22, 'Giza');


---

--### *Adding Courses (Including C# and Java)*  
--sql
INSERT INTO courses(course_id, course_name, course_description) VALUES
(1, 'SQL Basics', 'Introduction to Databases and SQL'),
(2, 'OOP with Java', 'Object-Oriented Programming with Java'),
(3, 'Web Development', 'Basics of HTML, CSS, and JavaScript'),
(4, 'C# Programming', 'Fundamentals of C# and .NET Framework'),
(5, 'Advanced Java', 'Deep dive into Java programming and frameworks');


---

--### *Enrolling Students in Courses (Including Alaa and Amira)*  
--sql
INSERT INTO student_course (student_id, course_id) VALUES
(1, 1), -- Ahmed -> SQL
(1, 2), -- Ahmed -> OOP with Java
(2, 1), -- Mona -> SQL
(2, 3), -- Mona -> Web Dev
(3, 2), -- Ali -> OOP with Java
(4, 4), -- Alaa -> C#
(4, 5), -- Alaa -> Advanced Java
(5, 4), -- Amira -> C#
(5, 2); -- Amira -> OOP with Java


---

--### *Assigning Instructors to New Courses (C# and Java)*  
--sql
INSERT INTO instructor (ins_id, ins_fname, ins_lname, age, salary, city, street) VALUES
(4, 'Mohamed', 'Ibrahim', 36, 16000.00, 'Cairo', 'Tahrir Street'),
(5, 'Sara', 'Youssef', 34, 15500.00, 'Giza', 'Nile Street');

--sql
INSERT INTO instructor_courses (course_id, ins_id) VALUES
(4, 4), -- Mohamed teaches C#
(5, 5); -- Sara teaches Advanced Java


---

--### *Adding Exams for New Courses (C# and Java)*  
--sql
INSERT INTO exam (exam_id, total_point, start_time, end_time, duration, course_id, ins_id) VALUES
(3, 100, '2025-05-10 10:00:00', '2025-05-10 12:00:00', 120, 4, 4), -- C# Exam
(4, 100, '2025-05-15 09:00:00', '2025-05-15 11:00:00', 120, 5, 5); -- Advanced Java Exam


---

--### *Adding Topics for New Courses*  
--sql
INSERT INTO topic (topic_id, topic_name, course_id) VALUES
(4, 'C# Basics', 4),
(5, 'LINQ in C#', 4),
(6, 'Java Streams', 5),
(7, 'Multithreading in Java', 5);


---

--### *Adding Questions for New Exams*  
--sql
INSERT INTO question (question_id, question_type, question_point, qus_text, exam_id, question_answer) VALUES
(4, 'mcq', 10, 'What is the main data type for a string in C#?', 3, 'string'),
(5, 'true_false', 5, 'C# supports multiple inheritance.', 3, 'False'),
(6, 'mcq', 10, 'Which Java feature allows running multiple threads?', 4, 'Multithreading');


---

--### *Adding Choices for New Questions*  
--sql
INSERT INTO choice (name, question_id) VALUES
('string', 4),
('char', 4),
('var', 4),
('True', 5),
('False', 5),
('Encapsulation', 6),
('Multithreading', 6),
('Polymorphism', 6);


---

--### *Assigning Grades for Alaa and Amira in New Exams*  
--sql
INSERT INTO student_exam (exam_id, student_id, grade) VALUES
(3, 4, 85), -- Alaa in C#
(3, 5, 90), -- Amira in C#
(4, 4, 88), -- Alaa in Java
(4, 5, 92); -- Amira in Java


---

--### *Adding Student Answers for New Questions*  
--sql
INSERT INTO student_answer (answer_text, student_id, question_id, exam_id) VALUES
('string', 4, 4, 3),
('False', 4, 5, 3),
('Multithreading', 5, 6, 4);

-- SP for student
create Proc InsertIntoStudents  @Fname varchar(10),@Lname varchar(10),@age int ,@city varchar(10)
as
begin
insert into student
values(@Fname,@Lname,@age,@city)
end

exec InsertIntoStudents "Alaa", "Mohamed" ,23,"Sohag"

create proc UpdateStudentName @id int , @newName varchar(10)
as
begin
update student
set st_fname = @newName
where st_id = @id
end

exec UpdateStudentName 6 , "Sara"

create proc DeleteStudent @id int
as
begin
delete 
from student
where st_id = @id
end

exec DeleteStudent 6

create proc SelectStudents
as
begin
select * from student
end

exec SelectStudents

--- SP For Exam
create proc InsertIntoExam @totalPoints int , @duration int ,@courseId int, @insId int
as
begin
insert into exam
values(@totalPoints , @duration , @courseId , @insId)
end

exec InsertIntoExam 100 , 120 , 4 , 4

create proc deleteExam @id int
as
begin
delete 
from exam
where exam_id =@id
end

exec deleteExam 5

create proc SeletAllExams
as
select * from exam

exec SeletAllExams


---SP for instructor


create proc insertIntoInstructor @fname varchar(10) ,@Lname varchar(10),@age int ,@salary int ,@city varchar(10) ,@street varchar(15)
as
insert into instructor
values(@fname,@Lname,@age,@salary,@city,@street)


create proc deleteInsrtuctor @id int
as
delete 
from instructor 
where ins_id = @id

create proc selectAllInstructor
as
select * from instructor

--- SP For courses

create proc selectAllCourses
as
select * from courses

create proc InsertIntoCourses @courseName varchar(25) , @courseDesc varchar(50)
as
insert into courses
values(@courseName , @courseDesc)

create proc deleteCourse @id int
as
delete
from courses
where course_id = @id

---- SP For question

create proc selectAllQuestions
as
select * from question

create proc AddQuestion @Qtype varchar(10) , @Qpoint int ,@Qtext varchar(100) , @examID int ,@Qanswer varchar(20) 
as
insert into question
values(@Qtype,@Qpoint,@Qtext,@examID,@Qanswer)


create proc deleteQuestion @id int
as
delete from 
question
where question_id = @id

---Proc for topic

create proc selectAllTopics
as
select * from topic

create proc InsertIntoTopic @TopicName varchar(20) , @courseId int
as
insert into topic
values(@TopicName ,@courseId)

create proc deleteTopic @id int
as
delete from topic
where topic_id = @id

----Proc for choice
create proc selectAllChoices
as
select * from choice

create proc insertChoice @Choicename varchar(20) , @question_Id int
as
insert into choice
values(@Choicename , @question_Id)

create proc deleteChoice @id int
as
delete
from choice
where id =@id

ALTER TABLE Student
ADD DepartmentID INT;

ALTER TABLE Student
ADD CONSTRAINT FK_Student_Department
FOREIGN KEY (DepartmentID) REFERENCES Department(DeptNo);



ALTER TABLE courses
ADD DepartmentID INT;

ALTER TABLE courses
ADD CONSTRAINT FK_course_Department
FOREIGN KEY (DepartmentID) REFERENCES Department(DeptNo);


---- Report 1

create or alter proc SelectStudentsBelongToDept @deptId int
as
select concat(s.st_fname , s.st_lname ) as 'Full Name' , c.course_name  , stEx.grade , dept.DeptName
from student s , courses c , student_course stCrs
, student_exam stEx , Department dept
where s.st_id = stCrs.student_id
and c.course_id = stCrs.course_id 
and stEx.student_id = s.st_id 
and stEx.courseid = stCrs.course_id
and dept.DeptNo = s.DepartmentID
and s.DepartmentId =@deptId

exec SelectStudentsBelongToDept 4


----- Report 2

create or alter proc StudentGradeInAllCourses @stdId int
as
select  concat(s.st_fname ,' ', s.st_lname ) as 'Full Name' , c.course_name , stEx.grade
from student s , student_exam stEx , student_course stCrs , courses c 
where s.st_id = stEx.student_id 
and stEx.courseID = c.course_id
and s.st_id = stCrs.student_id 
and c.course_id = stCrs.course_id
and s.st_id = @stdId

StudentGradeInAllCourses 3


------ Report 3

create proc GetCoursesTeachsByIns @insID int
as
select i.ins_fname 'Instructor Name' , c.course_name , count(s.st_id) 'Stdents Count'
from instructor_courses insC join instructor i
on insC.ins_id = i.ins_id
join courses c
on c.course_id = insC.course_id
join student_course sc
on sc.course_id = c.course_id
join student s
on s.st_id = sc.student_id
where i.ins_id = @insID
group by i.ins_fname , c.course_name

exec GetCoursesTeachsByIns 4


------- Report 4
create proc CoursesTopics @crsID int
as
select t.topic_name , c.course_name
from courses c join topic t
on t.course_id = c.course_id
where c.course_id = @crsID

CoursesTopics 4

------- Report 5
create proc ExamsQuestion @examID INT
as
select e.exam_id, q.qus_text
from exam e join question q
on e.exam_id = q.exam_id
where e.exam_id = @examID

ExamsQuestion 6

-------- Report 6
create or alter proc QuestionsWithStdAnswers @examID int , @stdID int
as
select s.st_fname , q.qus_text , sa.answer_text
from student s join student_exam se 
on se.student_id = s.st_id
join exam e 
on e.exam_id = se.exam_id
join student_answer sa
on s.st_id = sa.student_id 
join question q
on q.question_id = sa.question_id 
where e.exam_id = @examID and sa.student_id = @stdID

exec QuestionsWithStdAnswers 3 , 5

---------- First SP  ExamGeneration-----

create or alter proc ExamGeneration @courseName varchar(10) , @QueNumbers int , @examNo int output
as

--select top(@QueNumbers) q.qus_text 
--from question q ,courses c
--where c.course_name = @courseName
--order by newId()

declare @coID int , @insID int
select  @coID = c.course_id
from courses c
where c.course_name = @courseName

select @insID = i.ins_id
from instructor i, courses c, instructor_courses ic
where i.ins_id = ic.ins_id and c.course_id = ic.course_id and c.course_name = @courseName 




insert into exam
values(100,120,@coID,@insID)

 select @examNo = exam_id
from exam , courses c
where c.course_name = @courseName 


INSERT INTO student_exam (exam_id, student_id, grade, courseID)
SELECT @examNo, sc.student_id, 0, @coID
FROM student_course sc
where sc.course_id = @coID

insert into student_answer(student_id , question_id , exam_id)
select  s.st_id , q.question_id , @examNo from 
(select top(@QueNumbers) q.question_id , q.exam_id , c.course_id
from question q ,courses c
where c.course_name = @courseName
order by newId()) q 
join student_course sc
on sc.course_id = q.course_id
join student s
on s.st_id = sc.student_id

insert into question(question_type , question_point , qus_text , exam_id , question_answer)
select q.question_type , q.question_point , q.qus_text ,@examNo, q.question_answer
from (select top(@QueNumbers) q.question_type , q.question_point , q.qus_text , q.question_answer
from question q ,courses c
where c.course_name = @courseName
order by newId()) q


declare @x int
exec ExamGeneration 'SQL Basics' , 3 , @examNo = @x output
select @x

--------- Second SP    AnswerExam----
CREATE OR ALTER PROCEDURE AnswerExam  
    @studentID INT,  
    @examID INT,  
    @questionID INT,  
    @answerText VARCHAR(255)  
AS  
BEGIN  
    
    DECLARE @correctAnswer VARCHAR(255);  
    DECLARE @questionPoint INT;  
 SELECT @correctAnswer = question_answer, @questionPoint = question_point  
    FROM question  
    WHERE question_id = @questionID;
	select @correctAnswer , @questionPoint


	DECLARE @isCorrect int = 0;  
IF @answerText = @correctAnswer  
        SET @isCorrect = 1;

UPDATE student_answer  
    SET answer_text = @answerText
    WHERE student_id = @studentID AND question_id = @questionID;


	IF @isCorrect = 1  
    BEGIN  
        UPDATE student_exam  
        SET grade = grade + @questionPoint  
        WHERE student_id = @studentID AND exam_id = @examID
    END
end

exec AnswerExam 4 , 18 , 11 , 'Internal'
exec AnswerExam 4 , 18 , 4 , 'string'
exec AnswerExam 4 , 18 , 12 , 'true'



------Third SP   ExamCorrection---
create proc ExamCorrection @examID int , @StdID int 
as
begin

SELECT * 
FROM student_answer 
WHERE student_id = 4 AND exam_id = 18;

	SELECT sa.question_id, sa.answer_text, q.question_answer  
FROM student_answer sa  
JOIN question q ON sa.question_id = q.question_id 
WHERE sa.student_id = 4 AND sa.exam_id = 18;



---GetTotalStudentScore---
CREATE PROCEDURE GetTotalStudentScore @StdID INT  
AS  
BEGIN  
    

    DECLARE @TotalQuestions INT, @CorrectAnswers INT, @ScorePercentage DECIMAL(5,2);

    SELECT 
        @TotalQuestions = COUNT(q.question_id),
        @CorrectAnswers = SUM(CASE WHEN sa.answer_text = q.question_answer THEN 1 ELSE 0 END)
    FROM student_answer sa
    JOIN question q ON sa.question_id = q.question_id
    WHERE sa.student_id = @StdID;

    SET @ScorePercentage = CASE 
        WHEN @TotalQuestions > 0 
        THEN CAST(@CorrectAnswers * 100.0 / @TotalQuestions AS DECIMAL(5,2))
        ELSE 0 
    END;

    SELECT 
        @StdID AS StudentID,
        @TotalQuestions AS TotalQuestions,
        @CorrectAnswers AS CorrectAnswers,
        @ScorePercentage AS ScorePercentage;
END;

GetTotalStudentScore 4