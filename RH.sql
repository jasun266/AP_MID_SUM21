USE [master]
GO
/****** Object:  Database [ReviewHub]    Script Date: 7/5/2021 10:59:56 PM ******/
CREATE DATABASE [ReviewHub]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReviewHub (1)_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ReviewHub (1).mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ReviewHub (1)_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ReviewHub (1).ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ReviewHub] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReviewHub].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReviewHub] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReviewHub] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReviewHub] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReviewHub] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReviewHub] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReviewHub] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ReviewHub] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReviewHub] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReviewHub] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReviewHub] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReviewHub] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReviewHub] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReviewHub] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReviewHub] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReviewHub] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ReviewHub] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReviewHub] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReviewHub] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReviewHub] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReviewHub] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReviewHub] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ReviewHub] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReviewHub] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ReviewHub] SET  MULTI_USER 
GO
ALTER DATABASE [ReviewHub] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReviewHub] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReviewHub] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReviewHub] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ReviewHub] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ReviewHub] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ReviewHub] SET QUERY_STORE = OFF
GO
USE [ReviewHub]
GO
/****** Object:  Table [dbo].[advertise_categories]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertise_categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_advertise_categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[advertise_comments]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertise_comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdvertiseId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Text] [text] NOT NULL,
 CONSTRAINT [PK_advertise_comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[advertise_locations]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertise_locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdvertiseId] [int] NOT NULL,
	[Country] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[Street] [varchar](255) NULL,
	[Zip] [varchar](255) NULL,
	[Lat] [int] NULL,
	[Lon] [int] NULL,
	[Additional] [text] NULL,
 CONSTRAINT [PK_advertise_locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[advertise_reacts]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertise_reacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdvertiseId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_advertise_reacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[advertisers]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertisers](
	[Id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CompanyCategoryId] [int] NULL,
	[PaymentId] [int] NULL,
 CONSTRAINT [PK_advertisers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[advertises]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertises](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Description] [text] NULL,
	[Image] [varchar](255) NULL,
	[Created_at] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[Views] [int] NULL,
	[AdvertiseCategoryId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_advertises] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_categories]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_company_categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_comments]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReviewId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Text] [text] NOT NULL,
 CONSTRAINT [PK_review_comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review_reacts]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review_reacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReviewId] [int] NOT NULL,
	[UserId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Description] [text] NULL,
	[Image] [varchar](255) NULL,
	[Created_at] [datetime] NOT NULL,
	[Views] [int] NULL,
	[AdvertiseId] [int] NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_locations]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Country] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[Street] [varchar](255) NULL,
	[Zip] [varchar](50) NULL,
	[Lat] [int] NULL,
	[Lon] [int] NULL,
	[Additional] [text] NULL,
 CONSTRAINT [PK_user_locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_types]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_user_types] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 7/5/2021 10:59:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](1000) NOT NULL,
	[Image] [varchar](255) NULL,
	[About] [text] NULL,
	[Joined_at] [datetime] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[advertise_categories] ON 

INSERT [dbo].[advertise_categories] ([Id], [Name], [Image]) VALUES (1, N'Bikes', N'~/Content/upload/1088559641Bike.jpg')
INSERT [dbo].[advertise_categories] ([Id], [Name], [Image]) VALUES (2, N'Phones', N'~/Content/upload/1611857105Phones.jpg')
INSERT [dbo].[advertise_categories] ([Id], [Name], [Image]) VALUES (3, N'Camaras', N'~/Content/upload/724451615camaras.jpg')
INSERT [dbo].[advertise_categories] ([Id], [Name], [Image]) VALUES (4, N'Clothes', N'~/Content/upload/1901031355clothes.jpg')
INSERT [dbo].[advertise_categories] ([Id], [Name], [Image]) VALUES (5, N'Foods', N'~/Content/upload/784896953foods.jpg')
INSERT [dbo].[advertise_categories] ([Id], [Name], [Image]) VALUES (6, N'Medicen', N'~/Content/upload/281774726medicen.jpg')
SET IDENTITY_INSERT [dbo].[advertise_categories] OFF
GO
SET IDENTITY_INSERT [dbo].[advertise_locations] ON 

INSERT [dbo].[advertise_locations] ([Id], [AdvertiseId], [Country], [City], [Street], [Zip], [Lat], [Lon], [Additional]) VALUES (3, 1, N'Bangladesh', N'Magura', N'College para', N'1210', NULL, NULL, NULL)
INSERT [dbo].[advertise_locations] ([Id], [AdvertiseId], [Country], [City], [Street], [Zip], [Lat], [Lon], [Additional]) VALUES (5, 3, N'Bangladesh', N'magura', N'college para', N'1111', NULL, NULL, NULL)
INSERT [dbo].[advertise_locations] ([Id], [AdvertiseId], [Country], [City], [Street], [Zip], [Lat], [Lon], [Additional]) VALUES (6, 4, N'Bangladesh', N'magura', N'college para', N'1111', NULL, NULL, NULL)
INSERT [dbo].[advertise_locations] ([Id], [AdvertiseId], [Country], [City], [Street], [Zip], [Lat], [Lon], [Additional]) VALUES (7, 5, N'Bangladesh', N'magura', N'college para', N'1111', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[advertise_locations] OFF
GO
SET IDENTITY_INSERT [dbo].[advertises] ON 

INSERT [dbo].[advertises] ([Id], [Title], [Description], [Image], [Created_at], [ExpirationDate], [Views], [AdvertiseCategoryId], [UserId]) VALUES (1, N'Suzuki', N'Indian', N'~/Content/upload/1450528779suzuki.png', CAST(N'2021-07-04T00:00:00.000' AS DateTime), CAST(N'2021-07-31T00:00:00.000' AS DateTime), NULL, 1, 6)
INSERT [dbo].[advertises] ([Id], [Title], [Description], [Image], [Created_at], [ExpirationDate], [Views], [AdvertiseCategoryId], [UserId]) VALUES (3, N'R15', N'Indian
Brand new
good quality', N'~/Content/upload/1785128115R15.jpg', CAST(N'2021-07-15T00:00:00.000' AS DateTime), CAST(N'2021-07-30T00:00:00.000' AS DateTime), NULL, 1, 6)
INSERT [dbo].[advertises] ([Id], [Title], [Description], [Image], [Created_at], [ExpirationDate], [Views], [AdvertiseCategoryId], [UserId]) VALUES (4, N'Iphone 12 Max Pro', N'New Iphone', N'~/Content/upload/837367597Iphone 12 max pro.jpg', CAST(N'2021-07-22T00:00:00.000' AS DateTime), CAST(N'2021-07-22T00:00:00.000' AS DateTime), NULL, 2, 6)
INSERT [dbo].[advertises] ([Id], [Title], [Description], [Image], [Created_at], [ExpirationDate], [Views], [AdvertiseCategoryId], [UserId]) VALUES (5, N'Pizza', N'Lean er pizza', N'~/Content/upload/339487213pizza.jpg', CAST(N'2021-07-05T00:00:00.000' AS DateTime), CAST(N'2021-07-07T00:00:00.000' AS DateTime), NULL, 5, 8)
SET IDENTITY_INSERT [dbo].[advertises] OFF
GO
SET IDENTITY_INSERT [dbo].[user_types] ON 

INSERT [dbo].[user_types] ([Id], [Name]) VALUES (1, N'advertiser')
SET IDENTITY_INSERT [dbo].[user_types] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([Id], [Username], [Email], [Password], [Image], [About], [Joined_at], [TypeId]) VALUES (6, N'Jasun', N'jasun266@gmail.com', N'123', NULL, NULL, CAST(N'2021-07-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[users] ([Id], [Username], [Email], [Password], [Image], [About], [Joined_at], [TypeId]) VALUES (8, N'Lean', N'lean266@gmail.com', N'123', NULL, NULL, CAST(N'2021-07-05T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[advertisers] ADD  CONSTRAINT [DF_advertisers_CompanyCategoryId]  DEFAULT ((0)) FOR [CompanyCategoryId]
GO
ALTER TABLE [dbo].[advertisers] ADD  CONSTRAINT [DF_advertisers_PaymentId]  DEFAULT ((0)) FOR [PaymentId]
GO
ALTER TABLE [dbo].[advertises] ADD  CONSTRAINT [DF_advertises_Views]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[advertises] ADD  CONSTRAINT [DF_advertises_AdvertiseCategoryId]  DEFAULT ((0)) FOR [AdvertiseCategoryId]
GO
ALTER TABLE [dbo].[reviews] ADD  CONSTRAINT [DF_reviews_Views]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[reviews] ADD  CONSTRAINT [DF_reviews_AdvertiseId]  DEFAULT ((0)) FOR [AdvertiseId]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_TypeId]  DEFAULT ((1)) FOR [TypeId]
GO
ALTER TABLE [dbo].[advertise_comments]  WITH CHECK ADD  CONSTRAINT [FK_advertise_comments_advertises] FOREIGN KEY([AdvertiseId])
REFERENCES [dbo].[advertises] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[advertise_comments] CHECK CONSTRAINT [FK_advertise_comments_advertises]
GO
ALTER TABLE [dbo].[advertise_comments]  WITH CHECK ADD  CONSTRAINT [FK_advertise_comments_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([Id])
GO
ALTER TABLE [dbo].[advertise_comments] CHECK CONSTRAINT [FK_advertise_comments_users]
GO
ALTER TABLE [dbo].[advertise_locations]  WITH CHECK ADD  CONSTRAINT [FK_advertise_locations_advertises] FOREIGN KEY([AdvertiseId])
REFERENCES [dbo].[advertises] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[advertise_locations] CHECK CONSTRAINT [FK_advertise_locations_advertises]
GO
ALTER TABLE [dbo].[advertise_reacts]  WITH CHECK ADD  CONSTRAINT [FK_advertise_reacts_advertises] FOREIGN KEY([AdvertiseId])
REFERENCES [dbo].[advertises] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[advertise_reacts] CHECK CONSTRAINT [FK_advertise_reacts_advertises]
GO
ALTER TABLE [dbo].[advertise_reacts]  WITH CHECK ADD  CONSTRAINT [FK_advertise_reacts_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([Id])
GO
ALTER TABLE [dbo].[advertise_reacts] CHECK CONSTRAINT [FK_advertise_reacts_users]
GO
ALTER TABLE [dbo].[advertisers]  WITH CHECK ADD  CONSTRAINT [FK_advertisers_company_categories] FOREIGN KEY([CompanyCategoryId])
REFERENCES [dbo].[company_categories] ([Id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[advertisers] CHECK CONSTRAINT [FK_advertisers_company_categories]
GO
ALTER TABLE [dbo].[advertisers]  WITH CHECK ADD  CONSTRAINT [FK_advertisers_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[advertisers] CHECK CONSTRAINT [FK_advertisers_users]
GO
ALTER TABLE [dbo].[advertises]  WITH CHECK ADD  CONSTRAINT [FK_advertises_advertise_categories] FOREIGN KEY([AdvertiseCategoryId])
REFERENCES [dbo].[advertise_categories] ([Id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[advertises] CHECK CONSTRAINT [FK_advertises_advertise_categories]
GO
ALTER TABLE [dbo].[advertises]  WITH CHECK ADD  CONSTRAINT [FK_advertises_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[advertises] CHECK CONSTRAINT [FK_advertises_users]
GO
ALTER TABLE [dbo].[review_comments]  WITH CHECK ADD  CONSTRAINT [FK_review_comments_reviews] FOREIGN KEY([ReviewId])
REFERENCES [dbo].[reviews] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[review_comments] CHECK CONSTRAINT [FK_review_comments_reviews]
GO
ALTER TABLE [dbo].[review_comments]  WITH CHECK ADD  CONSTRAINT [FK_review_comments_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([Id])
GO
ALTER TABLE [dbo].[review_comments] CHECK CONSTRAINT [FK_review_comments_users]
GO
ALTER TABLE [dbo].[review_reacts]  WITH CHECK ADD  CONSTRAINT [FK_review_reacts_reviews] FOREIGN KEY([ReviewId])
REFERENCES [dbo].[reviews] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[review_reacts] CHECK CONSTRAINT [FK_review_reacts_reviews]
GO
ALTER TABLE [dbo].[review_reacts]  WITH CHECK ADD  CONSTRAINT [FK_review_reacts_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([Id])
GO
ALTER TABLE [dbo].[review_reacts] CHECK CONSTRAINT [FK_review_reacts_users]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_advertises] FOREIGN KEY([AdvertiseId])
REFERENCES [dbo].[advertises] ([Id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_advertises]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_users]
GO
ALTER TABLE [dbo].[user_locations]  WITH CHECK ADD  CONSTRAINT [FK_user_locations_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_locations] CHECK CONSTRAINT [FK_user_locations_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_user_types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[user_types] ([Id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_user_types]
GO
USE [master]
GO
ALTER DATABASE [ReviewHub] SET  READ_WRITE 
GO
