USE [master]
GO
/****** Object:  Database [UniversityDB]    Script Date: 9/15/2019 8:29:31 AM ******/
CREATE DATABASE [UniversityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityDB]
GO
/****** Object:  Table [dbo].[ClassRoomAllocation]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassRoomAllocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[FromTime] [time](7) NOT NULL,
	[ToTime] [time](7) NOT NULL,
 CONSTRAINT [PK_ClassRoomAllocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [decimal](18, 0) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssign]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Day] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Deparment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNo] [varchar](50) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_EnrollCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Result](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNo] [varchar](50) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Grade] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
	[Date] [date] NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RegistrationNo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditLimit] [decimal](18, 0) NOT NULL,
	[RemainingCredit] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[StudentViewModel]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[StudentViewModel] as  select s.Id StudentId,s.Name StudentName,s.Email,d.Name departmentName,c.Id CourseId,c.Code CourseCode,c.Name CourseName,s.RegistrationNo from Student s join EnrollCourse eco on s.RegistrationNo = eco.RegistrationNo join Course c on eco.CourseId = c.id
 join Department d on s.DepartmentId=d.Id




GO
/****** Object:  View [dbo].[StudentWithDept]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[StudentWithDept] as select s.Id StudentId,s.Name StudentName,s.Email,d.Name DepartmentName,d.Id DepartmentId from student s join Department d on s.DepartmentId =d.Id
GO
/****** Object:  View [dbo].[ViewModel]    Script Date: 9/15/2019 8:29:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[ViewModel] as Select c.DepartmentId,t.Name TeacherName,c.Code CourseCode,c.Name CourseName,s.Name SemesterName from CourseAssign ca join Teacher t on ca.TeacherId = t.Id  right join Course c on ca.CourseId =c.Id 
join Semester s on c.SemesterId = s.Id




GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1, N'EEE-1011', N'Basic Electronics', CAST(3 AS Decimal(18, 0)), N'Introduce to Basic Electronics Device', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (2, N'EEE-1012', N'Machine', CAST(3 AS Decimal(18, 0)), N'Basic of Machine', 1, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (3, N'BBA-1011', N'Banking System', CAST(3 AS Decimal(18, 0)), N'Introduce to Banking System', 2, 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssign] ON 

INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (1, 1, 1, 1)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (2, 1, 2, 2)
SET IDENTITY_INSERT [dbo].[CourseAssign] OFF
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([Id], [Day]) VALUES (1, N'Saturday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (2, N'Sunday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (3, N'Monday')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name], [Code]) VALUES (1, N'Electrical & Electronics Engineering', N'EEE')
INSERT [dbo].[Department] ([Id], [Name], [Code]) VALUES (2, N'Banking And Business Administration ', N'BBA')
INSERT [dbo].[Department] ([Id], [Name], [Code]) VALUES (3, N'English Language And Literature', N'ELL')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [Name]) VALUES (1, N'Associate Professor')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (2, N'Asistent Professor')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (3, N'Teacher')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (4, N'Asistent Teacher')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (5, N'Adjunct Feculty Member')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([Id], [Name]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditLimit], [RemainingCredit]) VALUES (1, N'Hasan Mehedi', N'Bowalkhali, Chittagong', N'hasan123@gmail.com', N'01457845781', 3, 1, CAST(20 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditLimit], [RemainingCredit]) VALUES (2, N'Iqram Hamim', N'Oxizen,Chittagong', N'hamim@mail.com', N'01457845745', 2, 1, CAST(21 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course]    Script Date: 9/15/2019 8:29:31 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Course] ON [dbo].[Course]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course_1]    Script Date: 9/15/2019 8:29:31 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Course_1] ON [dbo].[Course]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Student]    Script Date: 9/15/2019 8:29:31 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Student] ON [dbo].[Student]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Teacher]    Script Date: 9/15/2019 8:29:31 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Teacher] ON [dbo].[Teacher]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassRoomAllocation]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoomAllocation_Day] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day] ([Id])
GO
ALTER TABLE [dbo].[ClassRoomAllocation] CHECK CONSTRAINT [FK_ClassRoomAllocation_Day]
GO
ALTER TABLE [dbo].[ClassRoomAllocation]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoomAllocation_Deparment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[ClassRoomAllocation] CHECK CONSTRAINT [FK_ClassRoomAllocation_Deparment]
GO
ALTER TABLE [dbo].[ClassRoomAllocation]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoomAllocation_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[ClassRoomAllocation] CHECK CONSTRAINT [FK_ClassRoomAllocation_Room]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Deparment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Deparment]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Semester] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Semester]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Deparment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Deparment]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Teacher]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Course]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
USE [master]
GO
ALTER DATABASE [UniversityDB] SET  READ_WRITE 
GO
