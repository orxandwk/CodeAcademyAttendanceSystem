USE [master]
GO
/****** Object:  Database [CodeAcademyAttendanceSystem_db]    Script Date: 16.03.2018 19:45:02 ******/
CREATE DATABASE [CodeAcademyAttendanceSystem_db]
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CodeAcademyAttendanceSystem_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET  MULTI_USER 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET ENCRYPTION ON
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [CodeAcademyAttendanceSystem_db]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [CodeAcademyAttendanceSystem_db]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 16.03.2018 19:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 16.03.2018 19:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[gender_id] [int] IDENTITY(1,1) NOT NULL,
	[gender_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[gender_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Schedule]    Script Date: 16.03.2018 19:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Schedule](
	[group_schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[group_schedule_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Group_Schedule] PRIMARY KEY CLUSTERED 
(
	[group_schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Types]    Script Date: 16.03.2018 19:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Types](
	[group_types_id] [int] IDENTITY(1,1) NOT NULL,
	[group_types_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Group_Types] PRIMARY KEY CLUSTERED 
(
	[group_types_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 16.03.2018 19:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [nvarchar](50) NULL,
	[group_start_date] [date] NULL,
	[group_end_date] [date] NULL,
	[group_lesson_times_id] [int] NULL,
	[group_teacher_id] [int] NULL,
	[group_group_type_id] [int] NULL,
	[group_status] [bit] NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson_Times]    Script Date: 16.03.2018 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson_Times](
	[lesson_times_id] [int] IDENTITY(1,1) NOT NULL,
	[lesson_times_name] [nvarchar](50) NULL,
	[lesson_times_start_time] [time](7) NULL,
	[lesson_times_end_time] [time](7) NULL,
	[lesson_times_group_schedule_id] [int] NULL,
 CONSTRAINT [PK_Lesson_Times] PRIMARY KEY CLUSTERED 
(
	[lesson_times_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Qr_Codes]    Script Date: 16.03.2018 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Qr_Codes](
	[qr_codes_id] [int] IDENTITY(1,1) NOT NULL,
	[qr_codes_date] [date] NULL,
	[qr_codes_value] [nvarchar](20) NULL,
	[qr_codes_status] [bit] NULL,
	[qr_codes_group_id] [int] NULL,
 CONSTRAINT [PK_Qr_Codes] PRIMARY KEY CLUSTERED 
(
	[qr_codes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Types]    Script Date: 16.03.2018 19:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Types](
	[role_types_id] [int] IDENTITY(1,1) NOT NULL,
	[role_types_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role_Types] PRIMARY KEY CLUSTERED 
(
	[role_types_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 16.03.2018 19:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[student_email] [nvarchar](150) NULL,
	[student_password] [nvarchar](35) NULL,
	[student_name] [nvarchar](50) NULL,
	[student_surname] [nvarchar](50) NULL,
	[student_father_name] [nvarchar](50) NULL,
	[student_phone] [nvarchar](15) NULL,
	[student_group_id] [int] NULL,
	[student_gender_id] [int] NULL,
	[student_device_id] [nvarchar](30) NULL,
	[student_first_login] [bit] NULL,
	[student_status] [bit] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students_Attendance]    Script Date: 16.03.2018 19:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students_Attendance](
	[students_attendance_id] [int] IDENTITY(1,1) NOT NULL,
	[students_attendance_date] [date] NULL,
	[students_attendance_status] [bit] NULL,
	[students_attendance_sender_ip] [nvarchar](20) NULL,
	[students_attendance_student_id] [int] NULL,
 CONSTRAINT [PK_Students_Attendance] PRIMARY KEY CLUSTERED 
(
	[students_attendance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 16.03.2018 19:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[System_Settings]    Script Date: 16.03.2018 19:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_Settings](
	[system_settings_id] [int] IDENTITY(1,1) NOT NULL,
	[system_settings_academy_ip] [nvarchar](15) NULL,
	[system_settings_qr_code_available_minute] [int] NULL,
 CONSTRAINT [PK_System_Settings] PRIMARY KEY CLUSTERED 
(
	[system_settings_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher_Roles]    Script Date: 16.03.2018 19:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_Roles](
	[teacher_roles_id] [int] IDENTITY(1,1) NOT NULL,
	[teacher_roles_teacher_id] [int] NULL,
	[teacher_roles_role_types_id] [int] NULL,
 CONSTRAINT [PK_Teacher_Roles] PRIMARY KEY CLUSTERED 
(
	[teacher_roles_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 16.03.2018 19:45:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[teacher_id] [int] IDENTITY(1,1) NOT NULL,
	[teacher_email] [nvarchar](150) NULL,
	[teacher_password] [nvarchar](35) NULL,
	[teacher_name] [nvarchar](50) NULL,
	[teacher_surname] [nvarchar](50) NULL,
	[teacher_phone] [nvarchar](15) NULL,
	[teacher_photo] [nvarchar](20) NULL,
	[teacher_gender_id] [int] NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([gender_id], [gender_name]) VALUES (1, N'Kisi')
INSERT [dbo].[Genders] ([gender_id], [gender_name]) VALUES (2, N'Qadin')
SET IDENTITY_INSERT [dbo].[Genders] OFF
SET IDENTITY_INSERT [dbo].[Group_Schedule] ON 

INSERT [dbo].[Group_Schedule] ([group_schedule_id], [group_schedule_name]) VALUES (1, N'Həftə İçi')
INSERT [dbo].[Group_Schedule] ([group_schedule_id], [group_schedule_name]) VALUES (2, N'Həftə Sonu')
SET IDENTITY_INSERT [dbo].[Group_Schedule] OFF
SET IDENTITY_INSERT [dbo].[Group_Types] ON 

INSERT [dbo].[Group_Types] ([group_types_id], [group_types_name]) VALUES (1, N'Programlaşdırma')
INSERT [dbo].[Group_Types] ([group_types_id], [group_types_name]) VALUES (2, N'Dizayn')
INSERT [dbo].[Group_Types] ([group_types_id], [group_types_name]) VALUES (3, N'3D Max')
SET IDENTITY_INSERT [dbo].[Group_Types] OFF
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([group_id], [group_name], [group_start_date], [group_end_date], [group_lesson_times_id], [group_teacher_id], [group_group_type_id], [group_status]) VALUES (1, N'P306', CAST(N'2018-01-25' AS Date), CAST(N'2018-06-25' AS Date), 1, 1, 1, 1)
INSERT [dbo].[Groups] ([group_id], [group_name], [group_start_date], [group_end_date], [group_lesson_times_id], [group_teacher_id], [group_group_type_id], [group_status]) VALUES (2, N'P405', CAST(N'2018-02-15' AS Date), CAST(N'2018-07-15' AS Date), 5, 1, 1, 1)
INSERT [dbo].[Groups] ([group_id], [group_name], [group_start_date], [group_end_date], [group_lesson_times_id], [group_teacher_id], [group_group_type_id], [group_status]) VALUES (3, N'P608', CAST(N'2018-03-28' AS Date), CAST(N'2018-08-28' AS Date), 2, 2, 2, 1)
INSERT [dbo].[Groups] ([group_id], [group_name], [group_start_date], [group_end_date], [group_lesson_times_id], [group_teacher_id], [group_group_type_id], [group_status]) VALUES (4, N'P407', CAST(N'2017-04-14' AS Date), CAST(N'2018-10-14' AS Date), 2, 2, 2, 0)
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[Lesson_Times] ON 

INSERT [dbo].[Lesson_Times] ([lesson_times_id], [lesson_times_name], [lesson_times_start_time], [lesson_times_end_time], [lesson_times_group_schedule_id]) VALUES (1, N'Səhər', CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[Lesson_Times] ([lesson_times_id], [lesson_times_name], [lesson_times_start_time], [lesson_times_end_time], [lesson_times_group_schedule_id]) VALUES (2, N'Günorta', CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[Lesson_Times] ([lesson_times_id], [lesson_times_name], [lesson_times_start_time], [lesson_times_end_time], [lesson_times_group_schedule_id]) VALUES (3, N'Axşam', CAST(N'19:00:00' AS Time), CAST(N'21:30:00' AS Time), 1)
INSERT [dbo].[Lesson_Times] ([lesson_times_id], [lesson_times_name], [lesson_times_start_time], [lesson_times_end_time], [lesson_times_group_schedule_id]) VALUES (4, N'Səhər', CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time), 2)
INSERT [dbo].[Lesson_Times] ([lesson_times_id], [lesson_times_name], [lesson_times_start_time], [lesson_times_end_time], [lesson_times_group_schedule_id]) VALUES (5, N'Axşam', CAST(N'18:00:00' AS Time), CAST(N'22:00:00' AS Time), 2)
SET IDENTITY_INSERT [dbo].[Lesson_Times] OFF
SET IDENTITY_INSERT [dbo].[Qr_Codes] ON 

INSERT [dbo].[Qr_Codes] ([qr_codes_id], [qr_codes_date], [qr_codes_value], [qr_codes_status], [qr_codes_group_id]) VALUES (3, CAST(N'2018-03-16' AS Date), N'367731490', 1, 1)
SET IDENTITY_INSERT [dbo].[Qr_Codes] OFF
SET IDENTITY_INSERT [dbo].[Role_Types] ON 

INSERT [dbo].[Role_Types] ([role_types_id], [role_types_name]) VALUES (1, N'Admin')
INSERT [dbo].[Role_Types] ([role_types_id], [role_types_name]) VALUES (2, N'Teacher')
SET IDENTITY_INSERT [dbo].[Role_Types] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([student_id], [student_email], [student_password], [student_name], [student_surname], [student_father_name], [student_phone], [student_group_id], [student_gender_id], [student_device_id], [student_first_login], [student_status]) VALUES (1, N'orxan@code.edu.az', N'123', N'Orxan', N'Ferecov', N'father name', N'0555922102', 1, 1, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Students_Attendance] ON 

INSERT [dbo].[Students_Attendance] ([students_attendance_id], [students_attendance_date], [students_attendance_status], [students_attendance_sender_ip], [students_attendance_student_id]) VALUES (1, CAST(N'2018-03-16' AS Date), 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Students_Attendance] OFF
SET IDENTITY_INSERT [dbo].[Teacher_Roles] ON 

INSERT [dbo].[Teacher_Roles] ([teacher_roles_id], [teacher_roles_teacher_id], [teacher_roles_role_types_id]) VALUES (1, 1, 1)
INSERT [dbo].[Teacher_Roles] ([teacher_roles_id], [teacher_roles_teacher_id], [teacher_roles_role_types_id]) VALUES (2, 1, 2)
INSERT [dbo].[Teacher_Roles] ([teacher_roles_id], [teacher_roles_teacher_id], [teacher_roles_role_types_id]) VALUES (3, 2, 2)
SET IDENTITY_INSERT [dbo].[Teacher_Roles] OFF
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([teacher_id], [teacher_email], [teacher_password], [teacher_name], [teacher_surname], [teacher_phone], [teacher_photo], [teacher_gender_id]) VALUES (1, N'samir@code.edu.az', N'123', N'Samir', N'Kərimov', N'0552484848', N'karimovs_photo.jpg', 1)
INSERT [dbo].[Teachers] ([teacher_id], [teacher_email], [teacher_password], [teacher_name], [teacher_surname], [teacher_phone], [teacher_photo], [teacher_gender_id]) VALUES (2, N'knyaz@code.edu.az', N'123', N'Knyaz', N'Knyazov', N'0558889999', N'knyazs_photo.jpg', 1)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_principal_name]    Script Date: 16.03.2018 19:45:17 ******/
ALTER TABLE [dbo].[sysdiagrams] ADD  CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_to_Group_Types] FOREIGN KEY([group_group_type_id])
REFERENCES [dbo].[Group_Types] ([group_types_id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_to_Group_Types]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_to_Lesson_Times] FOREIGN KEY([group_lesson_times_id])
REFERENCES [dbo].[Lesson_Times] ([lesson_times_id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_to_Lesson_Times]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_to_Teachers] FOREIGN KEY([group_teacher_id])
REFERENCES [dbo].[Teachers] ([teacher_id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_to_Teachers]
GO
ALTER TABLE [dbo].[Lesson_Times]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Times_To_Group_Schedule] FOREIGN KEY([lesson_times_group_schedule_id])
REFERENCES [dbo].[Group_Schedule] ([group_schedule_id])
GO
ALTER TABLE [dbo].[Lesson_Times] CHECK CONSTRAINT [FK_Lesson_Times_To_Group_Schedule]
GO
ALTER TABLE [dbo].[Qr_Codes]  WITH CHECK ADD  CONSTRAINT [FK_Qr_Codes_to_Groups] FOREIGN KEY([qr_codes_group_id])
REFERENCES [dbo].[Groups] ([group_id])
GO
ALTER TABLE [dbo].[Qr_Codes] CHECK CONSTRAINT [FK_Qr_Codes_to_Groups]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_to_Genders] FOREIGN KEY([student_gender_id])
REFERENCES [dbo].[Genders] ([gender_id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_to_Genders]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_to_Groups] FOREIGN KEY([student_group_id])
REFERENCES [dbo].[Groups] ([group_id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_to_Groups]
GO
ALTER TABLE [dbo].[Students_Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Students_Attendance_to_Students] FOREIGN KEY([students_attendance_student_id])
REFERENCES [dbo].[Students] ([student_id])
GO
ALTER TABLE [dbo].[Students_Attendance] CHECK CONSTRAINT [FK_Students_Attendance_to_Students]
GO
ALTER TABLE [dbo].[Teacher_Roles]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Roles_to_Role_Types] FOREIGN KEY([teacher_roles_role_types_id])
REFERENCES [dbo].[Role_Types] ([role_types_id])
GO
ALTER TABLE [dbo].[Teacher_Roles] CHECK CONSTRAINT [FK_Teacher_Roles_to_Role_Types]
GO
ALTER TABLE [dbo].[Teacher_Roles]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Roles_to_Teachers] FOREIGN KEY([teacher_roles_teacher_id])
REFERENCES [dbo].[Teachers] ([teacher_id])
GO
ALTER TABLE [dbo].[Teacher_Roles] CHECK CONSTRAINT [FK_Teacher_Roles_to_Teachers]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_to_Genders] FOREIGN KEY([teacher_gender_id])
REFERENCES [dbo].[Genders] ([gender_id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_to_Genders]
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 16.03.2018 19:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 16.03.2018 19:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 16.03.2018 19:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 16.03.2018 19:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 16.03.2018 19:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 16.03.2018 19:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 16.03.2018 19:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	
GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
USE [master]
GO
ALTER DATABASE [CodeAcademyAttendanceSystem_db] SET  READ_WRITE 
GO
