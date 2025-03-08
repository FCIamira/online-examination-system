USE [master]
GO
/****** Object:  Database [exam_system]    Script Date: 3/8/2025 8:47:03 PM ******/
CREATE DATABASE [exam_system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LastOne_Data', FILENAME = N'G:\all task in iti\advancedDB\project_db\LastOne.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LastOne_Log', FILENAME = N'G:\all task in iti\advancedDB\project_db\LastOne.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [exam_system] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [exam_system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [exam_system] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [exam_system] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [exam_system] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [exam_system] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [exam_system] SET ARITHABORT OFF 
GO
ALTER DATABASE [exam_system] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [exam_system] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [exam_system] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [exam_system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [exam_system] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [exam_system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [exam_system] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [exam_system] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [exam_system] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [exam_system] SET  DISABLE_BROKER 
GO
ALTER DATABASE [exam_system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [exam_system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [exam_system] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [exam_system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [exam_system] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [exam_system] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [exam_system] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [exam_system] SET RECOVERY FULL 
GO
ALTER DATABASE [exam_system] SET  MULTI_USER 
GO
ALTER DATABASE [exam_system] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [exam_system] SET DB_CHAINING OFF 
GO
ALTER DATABASE [exam_system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [exam_system] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [exam_system] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [exam_system] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'exam_system', N'ON'
GO
ALTER DATABASE [exam_system] SET QUERY_STORE = ON
GO
ALTER DATABASE [exam_system] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [exam_system]
GO
/****** Object:  Table [dbo].[choice]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[choice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[question_id] [int] NULL,
 CONSTRAINT [PK__choice__3213E83F3FFE2137] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [varchar](255) NULL,
	[course_description] [text] NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK__courses__8F1EF7AE283ADE8C] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DeptNo] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [varchar](10) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DeptNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[total_point] [int] NULL,
	[start_time]  AS (format(getdate(),'yyyy-MM-dd hh:mm tt')),
	[end_time]  AS (format(dateadd(minute,(120),getdate()),'yyyy-MM-dd hh:mm tt')),
	[duration] [int] NULL,
	[course_id] [int] NULL,
	[ins_id] [int] NULL,
 CONSTRAINT [PK__exam__9C8C7BE9FB9F838F] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[ins_id] [int] IDENTITY(1,1) NOT NULL,
	[ins_fname] [varchar](255) NULL,
	[ins_lname] [varchar](255) NULL,
	[age] [int] NULL,
	[salary] [decimal](10, 2) NULL,
	[city] [varchar](255) NULL,
	[street] [varchar](255) NULL,
 CONSTRAINT [PK__instruct__9CB72D20A130B046] PRIMARY KEY CLUSTERED 
(
	[ins_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor_courses]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor_courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[ins_id] [int] NULL,
 CONSTRAINT [PK__instruct__3213E83F201FD738] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[question_type] [varchar](10) NOT NULL,
	[question_point] [int] NULL,
	[qus_text] [text] NULL,
	[exam_id] [int] NULL,
	[question_answer] [varchar](250) NULL,
 CONSTRAINT [PK__question__2EC21549D166D382] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[st_id] [int] IDENTITY(1,1) NOT NULL,
	[st_fname] [varchar](255) NULL,
	[st_lname] [varchar](255) NULL,
	[age] [int] NULL,
	[city] [varchar](255) NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK__student__A85E81CF50896D1E] PRIMARY KEY CLUSTERED 
(
	[st_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_answer]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[answer_text] [varchar](255) NULL,
	[student_id] [int] NULL,
	[question_id] [int] NULL,
	[exam_id] [int] NULL,
 CONSTRAINT [PK__student___3213E83F6927256B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_course]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[course_id] [int] NULL,
 CONSTRAINT [PK__student___3213E83FCD82172D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_exam]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_exam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exam_id] [int] NULL,
	[student_id] [int] NULL,
	[grade] [int] NULL,
	[courseID] [int] NULL,
 CONSTRAINT [PK__student___3213E83FD5EBE93D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[topic]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topic](
	[topic_id] [int] IDENTITY(1,1) NOT NULL,
	[topic_name] [varchar](255) NULL,
	[course_id] [int] NULL,
 CONSTRAINT [PK__topic__D5DAA3E9D8F61957] PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[choice]  WITH CHECK ADD  CONSTRAINT [FK__choice__question__4AB81AF0] FOREIGN KEY([question_id])
REFERENCES [dbo].[question] ([question_id])
GO
ALTER TABLE [dbo].[choice] CHECK CONSTRAINT [FK__choice__question__4AB81AF0]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_course_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DeptNo])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_course_Department]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [FK__exam__course_id__4BAC3F29] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [FK__exam__course_id__4BAC3F29]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [FK__exam__ins_id__4CA06362] FOREIGN KEY([ins_id])
REFERENCES [dbo].[instructor] ([ins_id])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [FK__exam__ins_id__4CA06362]
GO
ALTER TABLE [dbo].[instructor_courses]  WITH CHECK ADD  CONSTRAINT [FK__instructo__cours__4D94879B] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[instructor_courses] CHECK CONSTRAINT [FK__instructo__cours__4D94879B]
GO
ALTER TABLE [dbo].[instructor_courses]  WITH CHECK ADD  CONSTRAINT [FK__instructo__ins_i__4E88ABD4] FOREIGN KEY([ins_id])
REFERENCES [dbo].[instructor] ([ins_id])
GO
ALTER TABLE [dbo].[instructor_courses] CHECK CONSTRAINT [FK__instructo__ins_i__4E88ABD4]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK__question__exam_i__4F7CD00D] FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([exam_id])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK__question__exam_i__4F7CD00D]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DeptNo])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[student_answer]  WITH CHECK ADD  CONSTRAINT [FK__student_a__exam___52593CB8] FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([exam_id])
GO
ALTER TABLE [dbo].[student_answer] CHECK CONSTRAINT [FK__student_a__exam___52593CB8]
GO
ALTER TABLE [dbo].[student_answer]  WITH CHECK ADD  CONSTRAINT [FK__student_a__quest__5165187F] FOREIGN KEY([question_id])
REFERENCES [dbo].[question] ([question_id])
GO
ALTER TABLE [dbo].[student_answer] CHECK CONSTRAINT [FK__student_a__quest__5165187F]
GO
ALTER TABLE [dbo].[student_answer]  WITH CHECK ADD  CONSTRAINT [FK__student_a__stude__5070F446] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([st_id])
GO
ALTER TABLE [dbo].[student_answer] CHECK CONSTRAINT [FK__student_a__stude__5070F446]
GO
ALTER TABLE [dbo].[student_course]  WITH CHECK ADD  CONSTRAINT [FK__student_c__cours__5441852A] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[student_course] CHECK CONSTRAINT [FK__student_c__cours__5441852A]
GO
ALTER TABLE [dbo].[student_course]  WITH CHECK ADD  CONSTRAINT [FK__student_c__stude__534D60F1] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([st_id])
GO
ALTER TABLE [dbo].[student_course] CHECK CONSTRAINT [FK__student_c__stude__534D60F1]
GO
ALTER TABLE [dbo].[student_exam]  WITH CHECK ADD  CONSTRAINT [FK__student_e__exam___5535A963] FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([exam_id])
GO
ALTER TABLE [dbo].[student_exam] CHECK CONSTRAINT [FK__student_e__exam___5535A963]
GO
ALTER TABLE [dbo].[student_exam]  WITH CHECK ADD  CONSTRAINT [FK__student_e__stude__5629CD9C] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([st_id])
GO
ALTER TABLE [dbo].[student_exam] CHECK CONSTRAINT [FK__student_e__stude__5629CD9C]
GO
ALTER TABLE [dbo].[student_exam]  WITH CHECK ADD  CONSTRAINT [FK_course_Exam] FOREIGN KEY([courseID])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[student_exam] CHECK CONSTRAINT [FK_course_Exam]
GO
ALTER TABLE [dbo].[topic]  WITH CHECK ADD  CONSTRAINT [FK__topic__course_id__571DF1D5] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[topic] CHECK CONSTRAINT [FK__topic__course_id__571DF1D5]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [chk_question_type] CHECK  (([question_type]='true_false' OR [question_type]='mcq'))
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [chk_question_type]
GO
/****** Object:  StoredProcedure [dbo].[AddQuestion]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddQuestion] @Qtype varchar(10) , @Qpoint int ,@Qtext varchar(100) , @examID int ,@Qanswer varchar(20) 
as
insert into question
values(@Qtype,@Qpoint,@Qtext,@examID,@Qanswer)
GO
/****** Object:  StoredProcedure [dbo].[AnswerExam]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AnswerExam]  
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
GO
/****** Object:  StoredProcedure [dbo].[CoursesTopics]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CoursesTopics] @crsID int
as
select t.topic_name , c.course_name
from courses c join topic t
on t.course_id = c.course_id
where c.course_id = @crsID
GO
/****** Object:  StoredProcedure [dbo].[deleteChoice]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteChoice] @id int
as
delete
from choice
where id =@id
GO
/****** Object:  StoredProcedure [dbo].[deleteCourse]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteCourse] @id int
as
delete
from courses
where course_id = @id
GO
/****** Object:  StoredProcedure [dbo].[deleteExam]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteExam] @id int
as
begin
delete 
from exam
where exam_id =@id
end
GO
/****** Object:  StoredProcedure [dbo].[deleteInsrtuctor]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteInsrtuctor] @id int
as
delete 
from instructor 
where ins_id = @id
GO
/****** Object:  StoredProcedure [dbo].[deleteQuestion]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[deleteQuestion] @id int
as
delete from 
question
where question_id = @id
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteStudent] @id int
as
begin
delete 
from student
where st_id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[deleteTopic]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteTopic] @id int
as
delete from topic
where topic_id = @id
GO
/****** Object:  StoredProcedure [dbo].[ExamCorrection]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExamCorrection] @StdID INT  ,@examid int
AS  
BEGIN  
    SET NOCOUNT ON;

    DECLARE @ExamResults TABLE (
        ExamID INT,
        TotalQuestions INT,
        CorrectAnswers INT,
        ScorePercentage DECIMAL(5,2)
    );

    INSERT INTO @ExamResults (ExamID, TotalQuestions, CorrectAnswers, ScorePercentage)
    SELECT 
        sa.exam_id AS ExamID,
        COUNT(q.question_id) AS TotalQuestions,
        SUM(CASE WHEN sa.answer_text = q.question_answer THEN 1 ELSE 0 END) AS CorrectAnswers,
        CAST(SUM(CASE WHEN sa.answer_text = q.question_answer THEN 1 ELSE 0 END) * 100.0 
             / COUNT(q.question_id) AS DECIMAL(5,2)) AS ScorePercentage
    FROM student_answer sa
    JOIN question q ON sa.question_id = q.question_id
    WHERE sa.student_id = @StdID --and sa.exam_id=@examID
    GROUP BY sa.exam_id;

    SELECT * FROM @ExamResults;
END;


EXEC GetStudentScores @StdID = 4 ,@examid=18;
GO
/****** Object:  StoredProcedure [dbo].[ExamGeneration]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[ExamGeneration] @courseName varchar(10) , @QueNumbers int , @examNo int output
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
GO
/****** Object:  StoredProcedure [dbo].[ExamsQuestion]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ExamsQuestion] @examID INT
as
select e.exam_id, q.qus_text
from exam e join question q
on e.exam_id = q.exam_id
where e.exam_id = @examID
GO
/****** Object:  StoredProcedure [dbo].[GetCoursesTeachsByIns]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetCoursesTeachsByIns] @insID int
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
GO
/****** Object:  StoredProcedure [dbo].[GetTotalStudentScore]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTotalStudentScore] @StdID INT  
AS  
BEGIN  
    SET NOCOUNT ON;

    -- حساب إجمالي عدد الأسئلة وإجمالي عدد الإجابات الصحيحة لكل الامتحانات
    DECLARE @TotalQuestions INT, @CorrectAnswers INT, @ScorePercentage DECIMAL(5,2);

    SELECT 
        @TotalQuestions = COUNT(q.question_id),
        @CorrectAnswers = SUM(CASE WHEN sa.answer_text = q.question_answer THEN 1 ELSE 0 END)
    FROM student_answer sa
    JOIN question q ON sa.question_id = q.question_id
    WHERE sa.student_id = @StdID;

    -- حساب النسبة المئوية
    SET @ScorePercentage = CASE 
        WHEN @TotalQuestions > 0 
        THEN CAST(@CorrectAnswers * 100.0 / @TotalQuestions AS DECIMAL(5,2))
        ELSE 0 
    END;

    -- إرجاع النتيجة
    SELECT 
        @StdID AS StudentID,
        @TotalQuestions AS TotalQuestions,
        @CorrectAnswers AS CorrectAnswers,
        @ScorePercentage AS ScorePercentage;
END;
GO
/****** Object:  StoredProcedure [dbo].[insertChoice]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertChoice] @Choicename varchar(20) , @question_Id int
as
insert into choice
values(@Choicename , @question_Id)
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoCourses]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertIntoCourses] @courseName varchar(25) , @courseDesc varchar(50)
as
insert into courses
values(@courseName , @courseDesc)
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoExam]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertIntoExam] @totalPoints int , @duration int ,@courseId int, @insId int
as
begin
insert into exam
values(@totalPoints , @duration , @courseId , @insId)
end
GO
/****** Object:  StoredProcedure [dbo].[insertIntoInstructor]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertIntoInstructor] @fname varchar(10) ,@Lname varchar(10),@age int ,@salary int ,@city varchar(10) ,@street varchar(15)
as
insert into instructor
values(@fname,@Lname,@age,@salary,@city,@street)
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoStudents]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[InsertIntoStudents]  @Fname varchar(10),@Lname varchar(10),@age int ,@city varchar(10)
as
begin
insert into student
values(@Fname,@Lname,@age,@city)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoTopic]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertIntoTopic] @TopicName varchar(20) , @courseId int
as
insert into topic
values(@TopicName ,@courseId)
GO
/****** Object:  StoredProcedure [dbo].[QuestionsWithStdAnswers]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[QuestionsWithStdAnswers] @examID int , @stdID int
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
GO
/****** Object:  StoredProcedure [dbo].[selectAllChoices]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectAllChoices]
as
select * from choice
GO
/****** Object:  StoredProcedure [dbo].[selectAllCourses]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectAllCourses]
as
select * from courses
GO
/****** Object:  StoredProcedure [dbo].[selectAllInstructor]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectAllInstructor]
as
select * from instructor
GO
/****** Object:  StoredProcedure [dbo].[selectAllQuestions]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectAllQuestions]
as
select * from question
GO
/****** Object:  StoredProcedure [dbo].[selectAllTopics]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectAllTopics]
as
select * from topic
GO
/****** Object:  StoredProcedure [dbo].[SelectStudents]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SelectStudents]
as
begin
select * from student
end
GO
/****** Object:  StoredProcedure [dbo].[SelectStudentsBelongToDept]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[SelectStudentsBelongToDept] @deptId int
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
GO
/****** Object:  StoredProcedure [dbo].[SeletAllExams]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SeletAllExams]
as
select * from exam
GO
/****** Object:  StoredProcedure [dbo].[StudentGradeInAllCourses]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[StudentGradeInAllCourses] @stdId int
as
select  concat(s.st_fname ,' ', s.st_lname ) as 'Full Name' , c.course_name , stEx.grade
from student s , student_exam stEx , student_course stCrs , courses c 
where s.st_id = stEx.student_id 
and stEx.courseID = c.course_id
and s.st_id = stCrs.student_id 
and c.course_id = stCrs.course_id
and s.st_id = @stdId
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudentName]    Script Date: 3/8/2025 8:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateStudentName] @id int , @newName varchar(10)
as
begin
update student
set st_fname = @newName
where st_id = @id
end
GO
USE [master]
GO
ALTER DATABASE [exam_system] SET  READ_WRITE 
GO
