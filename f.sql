USE [master]
GO
/****** Object:  Database [FH]    Script Date: 7/2/2021 10:25:06 AM ******/
CREATE DATABASE [FH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FH] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FH] SET ARITHABORT OFF 
GO
ALTER DATABASE [FH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FH] SET  MULTI_USER 
GO
ALTER DATABASE [FH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FH] SET QUERY_STORE = OFF
GO
USE [FH]
GO
/****** Object:  Table [dbo].[AccountInfo]    Script Date: 7/2/2021 10:25:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [int] NOT NULL,
	[Phone] [int] NOT NULL,
	[Address] [int] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
 CONSTRAINT [PK_RegInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 7/2/2021 10:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Thana] [nchar](10) NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
	[Advertiser_id] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adds]    Script Date: 7/2/2021 10:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Discription] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[advertiser_id] [int] NOT NULL,
	[Category_id] [int] NOT NULL,
	[Shop_id] [int] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Address_id] [int] NOT NULL,
 CONSTRAINT [PK_adds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/2/2021 10:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Add_PID] [int] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/2/2021 10:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountInfo] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Comments] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email]    Script Date: 7/2/2021 10:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address_id] [int] NOT NULL,
 CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 7/2/2021 10:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Address_id] [int] NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewInfo]    Script Date: 7/2/2021 10:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountInfo] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Offer] [nchar](10) NOT NULL,
	[Commnentinfo] [int] NOT NULL,
	[DescriptionInfo] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 7/2/2021 10:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountInfo] [int] NOT NULL,
	[ReviewInfo] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Discription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccountInfo] ON 

INSERT [dbo].[AccountInfo] ([ID], [Type], [Name], [Password], [Email], [Phone], [Address], [Gender], [DOB]) VALUES (1, N'Advertiser', N'Jasun', N'123', 1, 1, 1, N'male', CAST(N'1998-08-17' AS Date))
INSERT [dbo].[AccountInfo] ([ID], [Type], [Name], [Password], [Email], [Phone], [Address], [Gender], [DOB]) VALUES (4, N'Advertiser', N'a', N'123', 1, 1, 1, N'male', CAST(N'1990-12-11' AS Date))
SET IDENTITY_INSERT [dbo].[AccountInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([ID], [Country], [City], [Thana], [Area], [Advertiser_id]) VALUES (1, N'Bangladesh', N'Dhaka', N'Gulsan    ', N'Gulsan-1', 1)
INSERT [dbo].[Address] ([ID], [Country], [City], [Thana], [Area], [Advertiser_id]) VALUES (4, N'Bangladesh', N'Magura', N'Magura    ', N'College Para', 4)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[adds] ON 

INSERT [dbo].[adds] ([ID], [Date], [Discription], [Name], [Price], [advertiser_id], [Category_id], [Shop_id], [Image], [Address_id]) VALUES (1, CAST(N'2021-01-01' AS Date), N'Indian', N'R15', 525000, 1, 3, 0, N'~/Content/upload/95114653R15.jpg', 1)
INSERT [dbo].[adds] ([ID], [Date], [Discription], [Name], [Price], [advertiser_id], [Category_id], [Shop_id], [Image], [Address_id]) VALUES (2, CAST(N'0001-01-01' AS Date), N'Indian', N'Suzuki', 325000, 1, 3, 0, N'~/Content/upload/1679247670suzuki.png', 1)
INSERT [dbo].[adds] ([ID], [Date], [Discription], [Name], [Price], [advertiser_id], [Category_id], [Shop_id], [Image], [Address_id]) VALUES (3, CAST(N'0001-01-01' AS Date), N'Indian', N'Honda CBR', 490000, 1, 3, 0, N'~/Content/upload/1177220819honda cbr.jpg', 1)
INSERT [dbo].[adds] ([ID], [Date], [Discription], [Name], [Price], [advertiser_id], [Category_id], [Shop_id], [Image], [Address_id]) VALUES (4, CAST(N'0001-01-01' AS Date), N'Indian', N'XSR', 535000, 1, 3, 0, N'~/Content/upload/1257809530Yamaha-XSR.jpg', 1)
SET IDENTITY_INSERT [dbo].[adds] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [Add_PID], [Image]) VALUES (1, N'Phones', 1, N'~/Content/upload/546229320Phones.jpg')
INSERT [dbo].[Category] ([ID], [Name], [Add_PID], [Image]) VALUES (2, N'Cars', 1, N'~/Content/upload/664845925cars.jpg')
INSERT [dbo].[Category] ([ID], [Name], [Add_PID], [Image]) VALUES (3, N'Bikes', 1, N'~/Content/upload/1754653339Bike.jpg')
INSERT [dbo].[Category] ([ID], [Name], [Add_PID], [Image]) VALUES (4, N'Foods', 1, N'~/Content/upload/1906211166foods.jpg')
INSERT [dbo].[Category] ([ID], [Name], [Add_PID], [Image]) VALUES (5, N'Accessories', 1, N'~/Content/upload/1860727885Accessories.jpg')
INSERT [dbo].[Category] ([ID], [Name], [Add_PID], [Image]) VALUES (6, N'Camaras', 1, N'~/Content/upload/1255209622camaras.jpg')
INSERT [dbo].[Category] ([ID], [Name], [Add_PID], [Image]) VALUES (7, N'Clothes', 1, N'~/Content/upload/1469638130clothes.jpg')
INSERT [dbo].[Category] ([ID], [Name], [Add_PID], [Image]) VALUES (8, N'Skin Care', 1, N'~/Content/upload/753839447Skin care.jpg')
INSERT [dbo].[Category] ([ID], [Name], [Add_PID], [Image]) VALUES (9, N'Pet', 1, N'~/Content/upload/1595800432pet.png')
INSERT [dbo].[Category] ([ID], [Name], [Add_PID], [Image]) VALUES (11, N'Air Conditioner', 1, N'~/Content/upload/2029173897Air conditioner.jpg')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Email] ON 

INSERT [dbo].[Email] ([ID], [Email], [Address_id]) VALUES (1, N'jasun266@gmail.com', 1)
INSERT [dbo].[Email] ([ID], [Email], [Address_id]) VALUES (2, N'a@gmail.com', 4)
SET IDENTITY_INSERT [dbo].[Email] OFF
GO
SET IDENTITY_INSERT [dbo].[Phone] ON 

INSERT [dbo].[Phone] ([ID], [PhoneNumber], [Address_id]) VALUES (1, 1852643446, 1)
INSERT [dbo].[Phone] ([ID], [PhoneNumber], [Address_id]) VALUES (2, 1731470510, 4)
SET IDENTITY_INSERT [dbo].[Phone] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_AccountInfo] FOREIGN KEY([Advertiser_id])
REFERENCES [dbo].[AccountInfo] ([ID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_AccountInfo]
GO
ALTER TABLE [dbo].[adds]  WITH CHECK ADD  CONSTRAINT [FK_adds_Address] FOREIGN KEY([Address_id])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[adds] CHECK CONSTRAINT [FK_adds_Address]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_AccountInfo] FOREIGN KEY([Add_PID])
REFERENCES [dbo].[AccountInfo] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_AccountInfo]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_AccountInfo] FOREIGN KEY([AccountInfo])
REFERENCES [dbo].[AccountInfo] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_AccountInfo]
GO
ALTER TABLE [dbo].[Email]  WITH CHECK ADD  CONSTRAINT [FK_Email_AccountInfo1] FOREIGN KEY([Address_id])
REFERENCES [dbo].[AccountInfo] ([ID])
GO
ALTER TABLE [dbo].[Email] CHECK CONSTRAINT [FK_Email_AccountInfo1]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_AccountInfo1] FOREIGN KEY([Address_id])
REFERENCES [dbo].[AccountInfo] ([ID])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [FK_Phone_AccountInfo1]
GO
ALTER TABLE [dbo].[ReviewInfo]  WITH CHECK ADD  CONSTRAINT [FK_ReviewInfo_AccountInfo] FOREIGN KEY([AccountInfo])
REFERENCES [dbo].[AccountInfo] ([ID])
GO
ALTER TABLE [dbo].[ReviewInfo] CHECK CONSTRAINT [FK_ReviewInfo_AccountInfo]
GO
ALTER TABLE [dbo].[ReviewInfo]  WITH CHECK ADD  CONSTRAINT [FK_ReviewInfo_Comment] FOREIGN KEY([Commnentinfo])
REFERENCES [dbo].[Comment] ([ID])
GO
ALTER TABLE [dbo].[ReviewInfo] CHECK CONSTRAINT [FK_ReviewInfo_Comment]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_AccountInfo] FOREIGN KEY([AccountInfo])
REFERENCES [dbo].[AccountInfo] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_AccountInfo]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_ReviewInfo] FOREIGN KEY([ReviewInfo])
REFERENCES [dbo].[ReviewInfo] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_ReviewInfo]
GO
USE [master]
GO
ALTER DATABASE [FH] SET  READ_WRITE 
GO
