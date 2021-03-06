USE [master]
GO
/****** Object:  Database [Expenses]    Script Date: 7/20/2019 3:44:11 PM ******/
CREATE DATABASE [Expenses]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Expenses', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Expenses.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Expenses_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Expenses_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Expenses] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Expenses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Expenses] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Expenses] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Expenses] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Expenses] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Expenses] SET ARITHABORT OFF 
GO
ALTER DATABASE [Expenses] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Expenses] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Expenses] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Expenses] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Expenses] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Expenses] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Expenses] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Expenses] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Expenses] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Expenses] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Expenses] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Expenses] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Expenses] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Expenses] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Expenses] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Expenses] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Expenses] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Expenses] SET RECOVERY FULL 
GO
ALTER DATABASE [Expenses] SET  MULTI_USER 
GO
ALTER DATABASE [Expenses] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Expenses] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Expenses] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Expenses] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Expenses] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Expenses', N'ON'
GO
ALTER DATABASE [Expenses] SET QUERY_STORE = OFF
GO
USE [Expenses]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Expenses]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/20/2019 3:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Type] [tinyint] NOT NULL,
	[Category_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Critical]    Script Date: 7/20/2019 3:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Critical](
	[Critical_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Critical_Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Critical] PRIMARY KEY CLUSTERED 
(
	[Critical_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/20/2019 3:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Feedback_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Feedback_Message] [varchar](500) NOT NULL,
	[Feedback_DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Feedback_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payables]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payables](
	[Payables_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Payables_Name] [varchar](50) NOT NULL,
	[Payables_Amount] [decimal](18, 2) NOT NULL,
	[Payables_DueDate] [date] NULL,
	[Payables_DueDay] [int] NOT NULL,
	[Payables_Type] [tinyint] NOT NULL,
 CONSTRAINT [PK_Payables] PRIMARY KEY CLUSTERED 
(
	[Payables_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tips]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tips](
	[Tips_Id] [int] IDENTITY(1,1) NOT NULL,
	[Tips_Message] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Tips] PRIMARY KEY CLUSTERED 
(
	[Tips_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Transaction_Id] [int] IDENTITY(1,1) NOT NULL,
	[Transaction_Type] [tinyint] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Transaction_Amount] [decimal](18, 2) NOT NULL,
	[Transaction_DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [varchar](50) NOT NULL,
	[User_Username] [varchar](50) NOT NULL,
	[User_Password] [varchar](50) NOT NULL,
	[User_DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Category_Id], [Category_Type], [Category_Name]) VALUES (1, 0, N'Salary')
INSERT [dbo].[Category] ([Category_Id], [Category_Type], [Category_Name]) VALUES (2, 0, N'Allowance')
INSERT [dbo].[Category] ([Category_Id], [Category_Type], [Category_Name]) VALUES (3, 1, N'Food')
INSERT [dbo].[Category] ([Category_Id], [Category_Type], [Category_Name]) VALUES (4, 1, N'Clothes')
INSERT [dbo].[Category] ([Category_Id], [Category_Type], [Category_Name]) VALUES (5, 1, N'House Bills')
INSERT [dbo].[Category] ([Category_Id], [Category_Type], [Category_Name]) VALUES (6, 1, N'Shopping')
INSERT [dbo].[Category] ([Category_Id], [Category_Type], [Category_Name]) VALUES (7, 1, N'Miscellaneous')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Critical] ON 

INSERT [dbo].[Critical] ([Critical_Id], [User_Id], [Critical_Amount]) VALUES (1, 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Critical] ([Critical_Id], [User_Id], [Critical_Amount]) VALUES (3, 1, CAST(200.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Critical] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Feedback_Id], [User_Id], [Feedback_Message], [Feedback_DateCreated]) VALUES (1, 1, N'asfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasdasdasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasdasfasfasfasdasdasfasfa
123', CAST(N'2019-07-20T14:36:30.010' AS DateTime))
INSERT [dbo].[Feedback] ([Feedback_Id], [User_Id], [Feedback_Message], [Feedback_DateCreated]) VALUES (2, 1, N'asfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasdasdasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasfasfasfasdasdasdasfasfasfasdasdasfasfa
123', CAST(N'2019-07-20T14:36:52.617' AS DateTime))
INSERT [dbo].[Feedback] ([Feedback_Id], [User_Id], [Feedback_Message], [Feedback_DateCreated]) VALUES (3, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id laoreet enim. Donec sed aliquam nunc. Ut sollicitudin turpis augue, sit amet tempus ipsum dapibus vel. Nunc ullamcorper felis vel leo laoreet auctor. Donec finibus eros non leo fermentum convallis. Integer nisl ex, tincidunt in est at, rhoncus finibus nibh. Morbi varius ultricies dolor nec euismod.

Duis vehicula neque elit, efficitur faucibus sapien sagittis quis. Fusce suscipit nisl ut lacus pulvinar, at faucibus ex facilisis. ', CAST(N'2019-07-20T14:37:30.133' AS DateTime))
INSERT [dbo].[Feedback] ([Feedback_Id], [User_Id], [Feedback_Message], [Feedback_DateCreated]) VALUES (4, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id laoreet enim. Donec sed aliquam nunc. Ut sollicitudin turpis augue, sit amet tempus ipsum dapibus vel. Nunc ullamcorper felis vel leo laoreet auctor. Donec finibus eros non leo fermentum convallis. Integer nisl ex, tincidunt in est at, rhoncus finibus nibh. Morbi varius ultricies dolor nec euismod.

Duis vehicula neque elit, efficitur faucibus sapien sagittis quis. Fusce suscipit nisl ut lacus pulvinar, at faucibus ex facilisis. ', CAST(N'2019-07-20T14:38:20.627' AS DateTime))
INSERT [dbo].[Feedback] ([Feedback_Id], [User_Id], [Feedback_Message], [Feedback_DateCreated]) VALUES (5, 1, N'send message', CAST(N'2019-07-20T15:40:50.310' AS DateTime))
INSERT [dbo].[Feedback] ([Feedback_Id], [User_Id], [Feedback_Message], [Feedback_DateCreated]) VALUES (6, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus facilisis vulputate. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ut sem porta, tincidunt metus vehicula, pellentesque metus. Donec non pellentesque orci, id bibendum ipsum. Fusce et orci at neque eleifend tincidunt. Fusce ex neque, sodales ac tempor at, rutrum quis tellus. Duis sed lorem vel orci lacinia maximus ut ut lectus. Morbi in lacus in est luctus cursus nec vetltr.12345', CAST(N'2019-07-20T15:41:19.683' AS DateTime))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Payables] ON 

INSERT [dbo].[Payables] ([Payables_Id], [User_Id], [Payables_Name], [Payables_Amount], [Payables_DueDate], [Payables_DueDay], [Payables_Type]) VALUES (18, 1, N'testing 1', CAST(10.00 AS Decimal(18, 2)), CAST(N'1800-01-01' AS Date), 23, 0)
INSERT [dbo].[Payables] ([Payables_Id], [User_Id], [Payables_Name], [Payables_Amount], [Payables_DueDate], [Payables_DueDay], [Payables_Type]) VALUES (19, 1, N'testing 2', CAST(20.00 AS Decimal(18, 2)), CAST(N'2019-07-23' AS Date), 0, 1)
INSERT [dbo].[Payables] ([Payables_Id], [User_Id], [Payables_Name], [Payables_Amount], [Payables_DueDate], [Payables_DueDay], [Payables_Type]) VALUES (20, 1, N'testing 3', CAST(30.00 AS Decimal(18, 2)), CAST(N'1800-01-01' AS Date), 24, 0)
INSERT [dbo].[Payables] ([Payables_Id], [User_Id], [Payables_Name], [Payables_Amount], [Payables_DueDate], [Payables_DueDay], [Payables_Type]) VALUES (21, 1, N'testing 3', CAST(30.00 AS Decimal(18, 2)), CAST(N'1800-01-01' AS Date), 24, 0)
SET IDENTITY_INSERT [dbo].[Payables] OFF
SET IDENTITY_INSERT [dbo].[Tips] ON 

INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (1, N'Tip one')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (2, N'Tip two')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (3, N'three')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (4, N'4')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (5, N'5')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (6, N'6')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (7, N'7')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (8, N'8')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (9, N'9')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (10, N'10')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (11, N'11')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (12, N'12')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (13, N'13')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (14, N'14')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (15, N'15')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (16, N'16')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (17, N'17')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (18, N'18')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (19, N'19')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (20, N'20')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (21, N'21')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (22, N'22')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (23, N'23')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (24, N'24')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (25, N'25')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (26, N'26')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (27, N'27')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (28, N'28')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (29, N'twenty nine')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (30, N'30')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (31, N'thirty one')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (32, N'thirty two')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (33, N'thirty 3')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (34, N'thirty 4')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (35, N'thirty 5')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (36, N'thirty 6')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (37, N'thirty 7')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (38, N'thirty 8')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (39, N'thirty 9')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (40, N'forthy')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (41, N'forthy 1')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (42, N'forthy 2')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (43, N'forthy 3')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (44, N'forthy4')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (45, N'forthy5')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (46, N'forthy6')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (47, N'forthy7')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (48, N'forthy8')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (49, N'forthy9')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (50, N'fifty')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (51, N'fifty1')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (52, N'fifty2')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (53, N'fifty3')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (54, N'fifty4')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (55, N'fifty5')
INSERT [dbo].[Tips] ([Tips_Id], [Tips_Message]) VALUES (56, N'fifty6')
SET IDENTITY_INSERT [dbo].[Tips] OFF
SET IDENTITY_INSERT [dbo].[Transaction] ON 

INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (28, 0, 1, 1, CAST(100.00 AS Decimal(18, 2)), CAST(N'2019-02-20T15:11:04.793' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (29, 0, 1, 1, CAST(500.00 AS Decimal(18, 2)), CAST(N'2019-03-20T15:11:15.477' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (30, 0, 1, 2, CAST(450.00 AS Decimal(18, 2)), CAST(N'2019-04-20T15:11:24.747' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (31, 0, 1, 2, CAST(250.00 AS Decimal(18, 2)), CAST(N'2019-05-20T15:11:33.600' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (32, 0, 1, 1, CAST(300.00 AS Decimal(18, 2)), CAST(N'2019-06-20T15:11:40.610' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (33, 0, 1, 2, CAST(350.00 AS Decimal(18, 2)), CAST(N'2019-07-20T15:11:50.897' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (34, 1, 1, 3, CAST(100.00 AS Decimal(18, 2)), CAST(N'2019-02-20T15:12:47.987' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (35, 1, 1, 4, CAST(150.00 AS Decimal(18, 2)), CAST(N'2019-03-20T15:12:56.280' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (36, 1, 1, 5, CAST(250.00 AS Decimal(18, 2)), CAST(N'2019-04-20T15:13:04.227' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (37, 1, 1, 6, CAST(200.00 AS Decimal(18, 2)), CAST(N'2019-05-20T15:13:11.987' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (38, 1, 1, 7, CAST(350.00 AS Decimal(18, 2)), CAST(N'2019-06-20T15:13:26.287' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (40, 1, 1, 4, CAST(400.00 AS Decimal(18, 2)), CAST(N'2019-07-20T15:13:42.900' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (41, 1, 1, 5, CAST(250.00 AS Decimal(18, 2)), CAST(N'2019-07-20T15:13:49.643' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (44, 0, 1, 1, CAST(50.00 AS Decimal(18, 2)), CAST(N'2018-07-20T15:22:21.563' AS DateTime))
INSERT [dbo].[Transaction] ([Transaction_Id], [Transaction_Type], [User_Id], [Category_Id], [Transaction_Amount], [Transaction_DateCreated]) VALUES (46, 1, 1, 4, CAST(50.00 AS Decimal(18, 2)), CAST(N'2020-07-20T15:23:21.853' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transaction] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_Id], [User_Name], [User_Username], [User_Password], [User_DateCreated]) VALUES (1, N'Jumarie', N'admin', N'admin', CAST(N'2019-07-13T00:18:13.760' AS DateTime))
INSERT [dbo].[User] ([User_Id], [User_Name], [User_Username], [User_Password], [User_DateCreated]) VALUES (2, N'admin', N'admin', N'ww', CAST(N'2019-07-20T11:37:21.097' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Category_Type]  DEFAULT ((0)) FOR [Category_Type]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Feedback_DateCreated]  DEFAULT (getdate()) FOR [Feedback_DateCreated]
GO
ALTER TABLE [dbo].[Payables] ADD  CONSTRAINT [DF_Payables_Payables_DueDate]  DEFAULT (getdate()) FOR [Payables_DueDate]
GO
ALTER TABLE [dbo].[Payables] ADD  CONSTRAINT [DF_Payables_Payables_DueDay]  DEFAULT ((0)) FOR [Payables_DueDay]
GO
ALTER TABLE [dbo].[Payables] ADD  CONSTRAINT [DF_Payables_Payables_Type]  DEFAULT ((0)) FOR [Payables_Type]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_Transaction_Type]  DEFAULT ((0)) FOR [Transaction_Type]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_Transaction_DateCreated]  DEFAULT (getdate()) FOR [Transaction_DateCreated]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_User_DateCreated]  DEFAULT (getdate()) FOR [User_DateCreated]
GO
ALTER TABLE [dbo].[Critical]  WITH CHECK ADD  CONSTRAINT [FK_Critical_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([User_Id])
GO
ALTER TABLE [dbo].[Critical] CHECK CONSTRAINT [FK_Critical_User]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([User_Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_User]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Category_Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Category]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([User_Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_User]
GO
/****** Object:  StoredProcedure [dbo].[Category_Get]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_Get]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [Category]
END
GO
/****** Object:  StoredProcedure [dbo].[Category_GetByType]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_GetByType]
	-- Add the parameters for the stored procedure here
	@type tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [Category]
	WHERE [Category_Type] = @type
END
GO
/****** Object:  StoredProcedure [dbo].[Critical_UpdateInsert]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Critical_UpdateInsert]
	-- Add the parameters for the stored procedure here
	@userId int,
	@amount decimal (18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Critical]
	SET [Critical_Amount] = @amount
	WHERE [User_Id] = @userId
	IF @@ROWCOUNT = 0
		INSERT INTO [Critical] ([User_Id],[Critical_Amount])
		VALUES (@userId,@amount)
END
GO
/****** Object:  StoredProcedure [dbo].[Feedback_Add]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Feedback_Add]
	-- Add the parameters for the stored procedure here
	@userId int,
	@message varchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [Feedback]
	([User_Id],[Feedback_Message])
	VALUES
	(@userId,@message)
END
GO
/****** Object:  StoredProcedure [dbo].[login_verify]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[login_verify]
	-- Add the parameters for the stored procedure here
	@username varchar(50),
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [User_Id] FROM [User]
	WHERE [User_Username] = @username
		AND [User_Password] = @password
END
GO
/****** Object:  StoredProcedure [dbo].[Payable_Add]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Payable_Add]
	-- Add the parameters for the stored procedure here
	@userId int,
	@name varchar(50),
	@amount decimal(18,2),
	@duedate date,
	@dueday int,
	@type tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [Payables]
	([User_Id],[Payables_Name],[Payables_Amount],[Payables_DueDate],[Payables_DueDay],[Payables_Type])
	VALUES
	(@userId,@name,@amount,@duedate,@dueday,@type)
END
GO
/****** Object:  StoredProcedure [dbo].[Payables_GetByUserId]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Payables_GetByUserId]
	-- Add the parameters for the stored procedure here
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [Payables]
	WHERE [User_Id] = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[Payables_GetUpcommingByUser_IdDays]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Payables_GetUpcommingByUser_IdDays]
	-- Add the parameters for the stored procedure here
	@days int,
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [Payables]
WHERE
(
	[Payables_Type] = 0
	AND [User_Id] = @userId
	AND [Payables_DueDay] >= DAY(GETDATE())
	AND [Payables_DueDay] <= DAY(GETDATE())+@days
)
OR
(
	[Payables_Type] = 1
	AND [User_Id] = @userId
	AND [Payables_DueDate] >= CONVERT(DATE,GETDATE())
	AND [Payables_DueDate] <= CONVERT(DATE,GETDATE()+@days)
)

END
GO
/****** Object:  StoredProcedure [dbo].[Tips_GetMessageById]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Tips_GetMessageById]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tips_Message]
	FROM [Tips]
	WHERE [Tips_Id] = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_Add]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transaction_Add]
	-- Add the parameters for the stored procedure here
	@type tinyint,
	@userId int,
	@categoryId int,
	@amount decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [Transaction] 
	([Transaction_Type],[User_Id],[Category_Id],[Transaction_Amount])
	VALUES
	(@type,@userId,@categoryId,@amount)
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_Delete]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transaction_Delete]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [Transaction] WHERE [Transaction_Id] = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_GetByMonthType]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transaction_GetByMonthType]
	-- Add the parameters for the stored procedure here
	@userId int,
	@type int,
	@month int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [Transaction]
	WHERE [User_Id] = @userId
		AND [Transaction_Type] = @type
		AND MONTH([Transaction_DateCreated]) > MONTH(DATEADD(MONTH,@month,GETDATE()))
		AND YEAR([Transaction_DateCreated]) = YEAR(DATEADD(MONTH,@month,GETDATE()))
	ORDER BY [Transaction_DateCreated] ASC
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_GetByUser_Id]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Transaction_GetByUser_Id]
	-- Add the parameters for the stored procedure here
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [Transaction]
	WHERE [User_Id] = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_GetByUser_IdType]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transaction_GetByUser_IdType]
	-- Add the parameters for the stored procedure here
	@userId int,
	@type tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [Transaction]
	WHERE [User_Id] = @userId
		AND [Transaction_Type] = @type
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_GetByUser_IdTypeMonth]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transaction_GetByUser_IdTypeMonth]
	-- Add the parameters for the stored procedure here
	@userId int,
	@type int,
	@month int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [Transaction]
	WHERE [User_Id] = @userId
		AND [Transaction_Type] = @type
		AND MONTH([Transaction_DateCreated]) = @month
		AND YEAR([Transaction_DateCreated]) = YEAR(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_GetByUserIdDayLimit]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transaction_GetByUserIdDayLimit]
	-- Add the parameters for the stored procedure here
	@userId int,
	@days int,
	@limit int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [Transaction]
	WHERE [User_Id] = @userId
		AND [Transaction_DateCreated] > DATEADD(DAY,@days,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_GetCriticalByUser_Id]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transaction_GetCriticalByUser_Id]
	-- Add the parameters for the stored procedure here
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Critical_Amount]
	FROM [Critical]
	WHERE [User_Id] = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_GetThisYearByUser_Id]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transaction_GetThisYearByUser_Id]
	-- Add the parameters for the stored procedure here
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [Transaction]
	WHERE [User_Id] = 1
		AND YEAR([Transaction_DateCreated]) = YEAR(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_GetTotalByUserId]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Transaction_GetTotalByUserId]
	-- Add the parameters for the stored procedure here
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM([Transaction_Amount]) - (
			SELECT SUM([Transaction_Amount])
			FROM [Transaction]
			WHERE [Transaction_Type] = 1
				AND [User_Id] = @userId
		)
	FROM [Transaction]
	WHERE [Transaction_Type] = 0
		AND [User_Id] = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_GetTotalExpenseByUser_Id]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Transaction_GetTotalExpenseByUser_Id]
	-- Add the parameters for the stored procedure here
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM([Transaction_Amount]) 
	FROM [Transaction]
	WHERE [Transaction_Type] = 1
		AND [User_Id] = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction_GetTotalIncomeByUser_Id]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Transaction_GetTotalIncomeByUser_Id]
	-- Add the parameters for the stored procedure here
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM([Transaction_Amount]) 
	FROM [Transaction]
	WHERE [Transaction_Type] = 0
		AND [User_Id] = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[User_GetById]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[User_GetById]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM [User]
	WHERE [User_Id] = @id
END
GO
/****** Object:  StoredProcedure [dbo].[User_GetNameById]    Script Date: 7/20/2019 3:44:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[User_GetNameById]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [User_Name] 
	FROM [User] 
	WHERE [User_Id] = @id
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 - Automatic Monthly, Uses DueDay
1 - Specific Date, Uses DueDate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Payables', @level2type=N'COLUMN',@level2name=N'Payables_Type'
GO
USE [master]
GO
ALTER DATABASE [Expenses] SET  READ_WRITE 
GO
