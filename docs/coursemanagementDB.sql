USE [master]
GO
/****** Object:  Database [CourseManagement]    Script Date: 8/10/2023 6:10:43 PM ******/
CREATE DATABASE [CourseManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CourseManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CourseManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CourseManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CourseManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CourseManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CourseManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CourseManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CourseManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CourseManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CourseManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [CourseManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CourseManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CourseManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CourseManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CourseManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CourseManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CourseManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CourseManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CourseManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CourseManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CourseManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CourseManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CourseManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CourseManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CourseManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CourseManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CourseManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CourseManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CourseManagement] SET  MULTI_USER 
GO
ALTER DATABASE [CourseManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CourseManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CourseManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CourseManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CourseManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CourseManagement] SET QUERY_STORE = OFF
GO
USE [CourseManagement]
GO
/****** Object:  Table [dbo].[tblAttendence]    Script Date: 8/10/2023 6:10:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAttendence](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [int] NULL,
	[DateAttendence] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__tblAtten__3214EC0741825B41] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourse]    Script Date: 8/10/2023 6:10:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NULL,
	[SemesterId] [int] NULL,
	[CourseCode] [nvarchar](50) NULL,
	[Instructor] [nvarchar](50) NULL,
	[CourseDescription] [nvarchar](max) NULL,
	[DateStart] [datetime] NULL,
	[DateEnd] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK__tblCours__3214EC07AED09985] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCourse] SET (LOCK_ESCALATION = AUTO)
GO
/****** Object:  Table [dbo].[tblSemester]    Script Date: 8/10/2023 6:10:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSemester](
	[Id] [int] NOT NULL,
	[SemesterName] [nvarchar](50) NULL,
 CONSTRAINT [PK__tblSemes__3214EC0782DFDC9C] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSession]    Script Date: 8/10/2023 6:10:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSession](
	[Id] [int] NOT NULL,
	[SessionDate] [nvarchar](50) NULL,
	[SlotStart] [time](7) NULL,
	[SlotEnd] [time](7) NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK__tblSessi__3214EC07870198A3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudent]    Script Date: 8/10/2023 6:10:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Image] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__tblStude__3214EC078775C487] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudentInCourse]    Script Date: 8/10/2023 6:10:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudentInCourse](
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK__tblStude__5E57FC83FBC5DAF0] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 8/10/2023 6:10:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](50) NULL,
 CONSTRAINT [PK__tblSubje__3214EC0766451B2A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCourse] ON 

INSERT [dbo].[tblCourse] ([Id], [SubjectId], [SemesterId], [CourseCode], [Instructor], [CourseDescription], [DateStart], [DateEnd], [Status]) VALUES (1, 2, 1, N'PRN221_3W', N'Phuonglhk', N'Advanced Cross-Platform Application Programming With .NET(PRN221)
', CAST(N'2023-08-08T00:00:00.000' AS DateTime), CAST(N'2023-08-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblCourse] ([Id], [SubjectId], [SemesterId], [CourseCode], [Instructor], [CourseDescription], [DateStart], [DateEnd], [Status]) VALUES (2, 2, 1, N'PRN221_10W', N'LongT5', N'Advanced Cross-Platform Application Programming With .NET(PRN221)
 10 Weeks', CAST(N'2023-10-23T00:00:00.000' AS DateTime), CAST(N'2023-12-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblCourse] ([Id], [SubjectId], [SemesterId], [CourseCode], [Instructor], [CourseDescription], [DateStart], [DateEnd], [Status]) VALUES (3, 3, 2, N'PRU211m_10W', N'VanVTT10', N'C# Programming and Unity(PRU211m)
', CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(N'2023-05-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[tblCourse] ([Id], [SubjectId], [SemesterId], [CourseCode], [Instructor], [CourseDescription], [DateStart], [DateEnd], [Status]) VALUES (4, 1, 1, N'MLN211_10W', N'BinhNV26', N'Political economics of Marxism – Leninism(MLN211)
', CAST(N'2023-03-20T00:00:00.000' AS DateTime), CAST(N'2023-05-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[tblCourse] ([Id], [SubjectId], [SemesterId], [CourseCode], [Instructor], [CourseDescription], [DateStart], [DateEnd], [Status]) VALUES (5, 1, 2, N'MLN122_10W', N'BinhNV26', N'Political economics of Marxism – Leninism(MLN122)
', CAST(N'2023-03-20T00:00:00.000' AS DateTime), CAST(N'2023-05-10T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[tblCourse] ([Id], [SubjectId], [SemesterId], [CourseCode], [Instructor], [CourseDescription], [DateStart], [DateEnd], [Status]) VALUES (8, 4, 1, N'PRN211_10W', N'LongTH', N'Basic Cross-Platform Application Programming With .NET(PRN211)
', CAST(N'2023-05-10T00:00:00.000' AS DateTime), CAST(N'2023-07-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[tblCourse] ([Id], [SubjectId], [SemesterId], [CourseCode], [Instructor], [CourseDescription], [DateStart], [DateEnd], [Status]) VALUES (12, 4, 1, N'PRN211_3W', N'HiepNM', N'Basic Cross-Platform Application Programming With .NET(PRN211)
', CAST(N'2023-08-10T00:00:00.000' AS DateTime), CAST(N'2023-09-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblCourse] ([Id], [SubjectId], [SemesterId], [CourseCode], [Instructor], [CourseDescription], [DateStart], [DateEnd], [Status]) VALUES (15, 4, 2, N'PRN211_10W', N'VanTTT', N'Basic Cross-Platform Application Programming With .NET(PRN211)
', CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(N'2023-06-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[tblCourse] ([Id], [SubjectId], [SemesterId], [CourseCode], [Instructor], [CourseDescription], [DateStart], [DateEnd], [Status]) VALUES (18, 1, 1, N'MLN211_3W', N'ThaoNV10', N'Political economics of Marxism – Leninism(MLN211)
', CAST(N'2023-08-01T00:00:00.000' AS DateTime), CAST(N'2023-09-01T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblCourse] OFF
GO
INSERT [dbo].[tblSemester] ([Id], [SemesterName]) VALUES (1, N'Fall2023')
INSERT [dbo].[tblSemester] ([Id], [SemesterName]) VALUES (2, N'Summer2023')
GO
INSERT [dbo].[tblSession] ([Id], [SessionDate], [SlotStart], [SlotEnd], [CourseId]) VALUES (1, N'Slot 1 - Slot 2', CAST(N'07:00:00' AS Time), CAST(N'10:15:00' AS Time), 1)
INSERT [dbo].[tblSession] ([Id], [SessionDate], [SlotStart], [SlotEnd], [CourseId]) VALUES (2, N'Slot 3 - Slot 4 ', CAST(N'10:30:00' AS Time), CAST(N'14:00:00' AS Time), 2)
GO
SET IDENTITY_INSERT [dbo].[tblStudent] ON 

INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (1, N'Trinh Huy Ngoc', N'trinhhnsa151001@fpt.edu.vn', N'https://hoahongmakeup.com/wp-content/uploads/2018/06/trang-diem-chup-anh-chan-dung-1.jpg', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (2, N'Dinh Minh Nhat', N'nhatdmse151000@fpt.edu.vn', N'https://bizweb.dktcdn.net/100/175/849/files/chup-anh-xin-visa43062503-2116011435318283-3476143098256424960-o-a5a5006a-8524-4442-b201-e1a96abd515a.jpg?v\u003d1553438614062', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (3, N'Nguyen Van A', N'anvse151002@fpt.edu.vn', N'https://inanhtuankhanh.vn/wp-content/uploads/2020/11/ok-1--scaled.jpg', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (4, N'Nguyen Duy Tan', N'tanndse151388@fpt.edu.vn', N'https://images.pexels.com/photos/4156467/pexels-photo-4156467.jpeg?auto=compress&cs=tinysrgb&w=600', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (5, N'Trần Thị Hải Hà', N'hatthse140352@fpt.edu.vn', N'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (6, N'Huỳnh Nhật Tân', N'tanhnse140399@fpt.edu.vn', N'https://plus.unsplash.com/premium_photo-1674777843203-da3ebb9fbca0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cG9ydHJhaXR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (7, N'Phạm Đức Thắng', N'thangpdse140534@fpt.edu.vn', N'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cG9ydHJhaXR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60', 0)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (8, N'Phạm Quốc Anh Khôi', N'khoipqase141009@fpt.edu.vn', N'https://plus.unsplash.com/premium_photo-1672907031609-16b4d3db8bc6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (9, N'Nguyễn Trung Tín', N'tinntse150116@fpt.edu.vn', N'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (10, N'Võ Thị Tường Duy', N'duyvttse150159@fpt.edu.vn', N'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (11, N'Phan Hoàng Trung Hiếu', N'hieuphtse151459@fpt.edu.vn', N'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (12, N'Hoàng Minh Tuấn', N'tuanhmse151471@fpt.edu.vn', N'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDF8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (13, N'Nguyễn Thành Kiên', N'khoipqase141009@fpt.edu.vn', N'https://images.unsplash.com/photo-1687360440102-78d15c3e5045?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxzZWFyY2h8NDN8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (14, N'Lê Minh Đức', N'duclmse160145@fpt.edu.vn', N'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDJ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60', 1)
INSERT [dbo].[tblStudent] ([Id], [Name], [Email], [Image], [Status]) VALUES (15, N'Vũ Thanh Tùng', N'tungvtse160146@fpt.edu.vn', N'https://images.unsplash.com/photo-1509460913899-515f1df34fea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60', 1)
SET IDENTITY_INSERT [dbo].[tblStudent] OFF
GO
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (1, 1)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (1, 2)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (1, 3)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (1, 4)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (1, 5)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (1, 8)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (1, 12)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (1, 15)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (2, 1)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (2, 2)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (2, 5)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (2, 8)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (2, 12)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (3, 1)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (3, 12)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (4, 1)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (4, 2)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (4, 12)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (5, 1)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (5, 2)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (6, 1)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (6, 2)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (6, 5)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (6, 12)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (7, 1)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (7, 8)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (8, 1)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (8, 2)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (9, 2)
INSERT [dbo].[tblStudentInCourse] ([StudentId], [CourseId]) VALUES (10, 1)
GO
SET IDENTITY_INSERT [dbo].[tblSubject] ON 

INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (1, N'MLN111')
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (2, N'PRN221')
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (3, N'PRU211')
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (4, N'PRN211')
INSERT [dbo].[tblSubject] ([Id], [SubjectName]) VALUES (5, N'PRJ301')
SET IDENTITY_INSERT [dbo].[tblSubject] OFF
GO
ALTER TABLE [dbo].[tblAttendence]  WITH CHECK ADD  CONSTRAINT [FK_tblAttendence_tblSession] FOREIGN KEY([SessionId])
REFERENCES [dbo].[tblSession] ([Id])
GO
ALTER TABLE [dbo].[tblAttendence] CHECK CONSTRAINT [FK_tblAttendence_tblSession]
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblCourse_tblSemester] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[tblSemester] ([Id])
GO
ALTER TABLE [dbo].[tblCourse] CHECK CONSTRAINT [FK_tblCourse_tblSemester]
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblCourse_tblSubject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[tblSubject] ([Id])
GO
ALTER TABLE [dbo].[tblCourse] CHECK CONSTRAINT [FK_tblCourse_tblSubject]
GO
ALTER TABLE [dbo].[tblSession]  WITH CHECK ADD  CONSTRAINT [FK_tblSession_tblCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[tblCourse] ([Id])
GO
ALTER TABLE [dbo].[tblSession] CHECK CONSTRAINT [FK_tblSession_tblCourse]
GO
ALTER TABLE [dbo].[tblStudentInCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblStudentInCourse_tblCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[tblCourse] ([Id])
GO
ALTER TABLE [dbo].[tblStudentInCourse] CHECK CONSTRAINT [FK_tblStudentInCourse_tblCourse]
GO
ALTER TABLE [dbo].[tblStudentInCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblStudentInCourse_tblStudent] FOREIGN KEY([StudentId])
REFERENCES [dbo].[tblStudent] ([Id])
GO
ALTER TABLE [dbo].[tblStudentInCourse] CHECK CONSTRAINT [FK_tblStudentInCourse_tblStudent]
GO
USE [master]
GO
ALTER DATABASE [CourseManagement] SET  READ_WRITE 
GO
