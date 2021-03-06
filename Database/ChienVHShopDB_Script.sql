USE [master]
GO
/****** Object:  Database [ChienVHShopDB]    Script Date: 10/30/2017 1:50:26 AM ******/
CREATE DATABASE [ChienVHShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChienVHShopDB', FILENAME = N'D:\Training Online\DotNET\ASP.Net MVC & Entity Framework by Example Project\Database\2014\ChienVHShopDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ChienVHShopDB_log', FILENAME = N'D:\Training Online\DotNET\ASP.Net MVC & Entity Framework by Example Project\Database\2014\ChienVHShopDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ChienVHShopDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChienVHShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChienVHShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChienVHShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChienVHShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChienVHShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChienVHShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ChienVHShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [ChienVHShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChienVHShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChienVHShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChienVHShopDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ChienVHShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChienVHShopDB', N'ON'
GO
USE [ChienVHShopDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/30/2017 1:50:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Color]    Script Date: 10/30/2017 1:50:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[Color] [varchar](50) NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 10/30/2017 1:50:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactUs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](150) NULL,
	[phone] [varchar](20) NULL,
	[content] [nvarchar](2000) NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Model]    Script Date: 10/30/2017 1:50:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Model](
	[ModelId] [int] IDENTITY(1,1) NOT NULL,
	[Model] [varchar](50) NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[ModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 10/30/2017 1:50:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Title] [nvarchar](250) NULL,
	[ShortDescription] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/30/2017 1:50:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderName] [nvarchar](50) NULL,
	[OrderDate] [date] NULL,
	[PaymentType] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerPhone] [varchar](15) NULL,
	[CustomerEmail] [nvarchar](100) NULL,
	[CustomerAddress] [nvarchar](250) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/30/2017 1:50:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/30/2017 1:50:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[Price] [float] NULL,
	[UserId] [int] NULL,
	[CategoryId] [int] NULL,
	[ColorId] [int] NULL,
	[ModelId] [int] NULL,
	[StorageId] [int] NULL,
	[SellStartDate] [datetime] NULL,
	[SellEndDate] [datetime] NULL,
	[IsNew] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Storage]    Script Date: 10/30/2017 1:50:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Storage](
	[StorageId] [int] IDENTITY(1,1) NOT NULL,
	[Storage] [varchar](50) NULL,
 CONSTRAINT [PK_Storage] PRIMARY KEY CLUSTERED 
(
	[StorageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/30/2017 1:50:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

GO
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'Iphone')
GO
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'Ipad')
GO
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'Macbook')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

GO
INSERT [dbo].[Color] ([ColorId], [Color]) VALUES (1, N'Rose')
GO
INSERT [dbo].[Color] ([ColorId], [Color]) VALUES (2, N'Gold')
GO
INSERT [dbo].[Color] ([ColorId], [Color]) VALUES (3, N'White')
GO
INSERT [dbo].[Color] ([ColorId], [Color]) VALUES (4, N'Black')
GO
INSERT [dbo].[Color] ([ColorId], [Color]) VALUES (5, N'Grey')
GO
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactUs] ON 

GO
INSERT [dbo].[ContactUs] ([id], [name], [email], [phone], [content]) VALUES (1, N'Chien Vu', N'chien.vh@gmail.com', N'986665248', N'What the hell?')
GO
INSERT [dbo].[ContactUs] ([id], [name], [email], [phone], [content]) VALUES (2, N'Chien Vu Hoang', N'chien.vh@gmail.com', N'986665248', N'2nd time for submitting form. thanks')
GO
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
GO
SET IDENTITY_INSERT [dbo].[Model] ON 

GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (1, N'6S Rose Gold')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (2, N'6S Gold')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (3, N'6 Gold')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (4, N'6 Grey')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (5, N'6S Rose Plus')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (6, N'6S Gold Plus')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (7, N'6 Gold Plus')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (8, N'6 Grey Plus')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (9, N'5S Gold')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (10, N'5S Black')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (11, N'5S White')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (12, N'5 White')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (13, N'5 Black')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (14, N'Ipad Mini 1')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (15, N'Ipad Mini 2')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (16, N'Ipad Mini 3')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (17, N'Ipad Mini 4')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (18, N'Ipad 2')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (19, N'Ipad 3')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (20, N'Ipad 4')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (21, N'Ipad Air')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (22, N'Macbook Pro')
GO
INSERT [dbo].[Model] ([ModelId], [Model]) VALUES (23, N'Macbook Pro Retina')
GO
SET IDENTITY_INSERT [dbo].[Model] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (2, 1, N'My Testing First', N'This is the short description first', N'iPhone 6 Plus 16Gb Grey.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (3, 1, N'My Testing 2', N'This is the short description 2', N'iPhone 5S 32GB Silver.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (4, 1, N'My Testing 3', N'This is the short description 3', N'iPhone 6 Plus 16Gb Grey.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (5, 1, N'My Testing 4', N'This is the short description 4', N'iPhone 5S 32GB Silver.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (6, 1, N'My Testing 5', N'This is the short description 5', N'iPhone 6 Plus 16Gb Grey.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (7, 1, N'My Testing 6', N'This is the short description 6', N'iPhone 5S 32GB Silver.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (8, 1, N'My Testing 7', N'This is the short description 7', N'iPhone 5S 32GB Silver.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (9, 1, N'My Testing 8', N'This is the short description 8', N'iPhone 5S 32GB Silver.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (10, 1, N'My Testing 9', N'This is the short description 9', N'iPhone 6 Plus 16Gb Grey.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (11, 1, N'My Testing 10', N'This is the short description 10', N'iPhone 5S 32GB Silver.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (12, 1, N'My Testing 11', N'This is the short description 11', N'iPhone 6 Plus 16Gb Grey.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (13, 1, N'My Testing 12', N'This is the short description 12', N'iPhone 5S 32GB Silver.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (14, 1, N'My Testing 13', N'This is the short description 13', N'iPhone 5S 32GB Silver.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (15, 1, N'My Testing 14', N'This is the short description 14', N'iPhone 6 Plus 16Gb Grey.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (16, 1, N'My Testing 15', N'This is the short description 15', N'iPhone 6 Plus 16Gb Grey.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (17, 1, N'My Testing 16', N'This is the short description 16', N'iPhone 6 Plus 16Gb Grey.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (18, 1, N'My Testing 17', N'This is the short description 17', N'iPhone 5S 32GB Silver.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (19, 1, N'My Testing 18', N'This is the short description 18', N'iPhone 5S 32GB Silver.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (20, 1, N'My Testing 19', N'This is the short description 19', N'iPhone 6 Plus 16Gb Grey.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (21, 1, N'My Testing 20', N'This is the short description 20', N'iPhone 6 Plus 16Gb Grey.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (22, 1, N'My Testing 21', N'This is the short description 21', N'iPhone 6 Plus 16Gb Grey.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[News] ([NewsId], [UserId], [Title], [ShortDescription], [Image], [Content], [CreatedDate], [Status]) VALUES (23, 1, N'My Testing 22', N'This is the short description 22', N'iPhone 5S 32GB Silver.jpg', N'Content should be here. Will be updated later', CAST(N'2015-11-11 00:00:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

GO
INSERT [dbo].[Order] ([OrderID], [OrderName], [OrderDate], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (1, N'Order 1', CAST(N'2017-07-02' AS Date), N'Cash', N'Paid', N'Chien Vu', N'84986665248', N'chien.vh@gmail.com', N'My Dinh, Ha Noi, Viet Nam')
GO
INSERT [dbo].[Order] ([OrderID], [OrderName], [OrderDate], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (2, N'Order 2', CAST(N'2017-07-07' AS Date), N'Cash', N'Processing', N'Chien Vu Hoang', N'84986665248', N'chien.vh@hotmail.com', N'Ha Noi, Viet Nam')
GO
INSERT [dbo].[Order] ([OrderID], [OrderName], [OrderDate], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (3, N'Order 3', CAST(N'2017-08-26' AS Date), N'Cash', N'Processing', N'Hoang Hop', N'986665248', N'chien.vh@gmail.com', N'My Dinh, Ha Noi, Viet Nam')
GO
INSERT [dbo].[Order] ([OrderID], [OrderName], [OrderDate], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (4, N'Order 4', CAST(N'2017-08-26' AS Date), N'Cash', N'Processing', N'Hop Hoang', N'986665248', N'chien.vh@gmail.com', N'My Dinh, Ha Noi, Viet Nam')
GO
INSERT [dbo].[Order] ([OrderID], [OrderName], [OrderDate], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (5, N'Order 5', CAST(N'2017-08-26' AS Date), N'Cash', N'Processing', N'Chien VH', N'986665248', N'chien.vh@gmail.com', N'My Dinh, Ha Noi, Viet Nam')
GO
INSERT [dbo].[Order] ([OrderID], [OrderName], [OrderDate], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (6, N'Order 6', CAST(N'2017-08-26' AS Date), N'Cash', N'Processing', N'Chien', N'986665248', N'chien.vh@gmail.com', N'My Dinh, Ha Noi, Viet Nam')
GO
INSERT [dbo].[Order] ([OrderID], [OrderName], [OrderDate], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (7, N'Order 7', CAST(N'2017-08-26' AS Date), N'Cash', N'Processing', N'Chien Hoang', N'986665248', N'chien.vh@gmail.com', N'My Dinh, Ha Noi, Viet Nam')
GO
INSERT [dbo].[Order] ([OrderID], [OrderName], [OrderDate], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (8, N'Order 8', CAST(N'2017-08-27' AS Date), N'Cash', N'Processing', N'Hop HT', N'986665248', N'chien.vh@gmail.com', N'Ha Noi, Viet Nam')
GO
INSERT [dbo].[Order] ([OrderID], [OrderName], [OrderDate], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (9, N'Order 9', CAST(N'2017-08-27' AS Date), N'Cash', N'Processing', N'Chien Vu', N'986665248', N'chien.vh@gmail.com', N'Ha Noi, Viet Nam')
GO
INSERT [dbo].[Order] ([OrderID], [OrderName], [OrderDate], [PaymentType], [Status], [CustomerName], [CustomerPhone], [CustomerEmail], [CustomerAddress]) VALUES (10, NULL, CAST(N'2017-09-03' AS Date), N'Cash', N'Processing', N'Chien Vu', N'986665248', N'chien.vh@gmail.com', N'P806, Nha B2, Khu Do Thi My Dinh 1, My Dinh, Tu Liem, Ha Noi')
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (1, 23, 549, 5)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (1, 24, 649, 3)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (1, 26, 1100, 2)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (2, 26, 1100, 2)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (3, 25, 649, 2)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (4, 17, 549, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (5, 21, 649, 5)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (6, 22, 549, 2)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (6, 25, 649, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (6, 26, 1100, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (7, 19, 549, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (7, 21, 649, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (8, 17, 549, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (8, 20, 549, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (8, 22, 549, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (8, 25, 649, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (9, 23, 549, 2)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (9, 25, 649, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (10, 7, 649, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Price], [Quantity]) VALUES (10, 15, 549, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (1, N'Iphone 7 Rose 32GB', N'iPhone 6S 16GB Gold.jpg', 849, 1, 1, 1, 1, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2016-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (2, N'Iphone 6 Gold 16GB', N'iPhone 6S 16GB Gold.jpg', 549, 1, 1, 2, 1, 1, CAST(N'2014-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (3, N'Iphone 6S Rose 16GB', N'iPhone 6S 16GB Gold.jpg', 649, 1, 1, 3, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (4, N'Iphone 6S Rose 16GB', N'iPhone 6S 16GB Gold.jpg', 649, 1, 1, 3, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (5, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 649, 1, 1, 3, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (6, N'Iphone 6S Rose 16GB', N'iPhone 6S 16GB Gold.jpg', 649, 1, 1, 3, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (7, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 649, 1, 1, 3, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (8, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 549, 1, 1, 3, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (9, N'Iphone 6 Gold 16GB', N'iPhone 6S 16GB Gold.jpg', 649, 1, 1, 3, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (10, N'Iphone 6 Gold 16GB', N'iPhone 6 128GB.jpg', 549, 1, 1, 1, 1, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (11, N'Ipad Air 4', N'Ipad1.jpg', 649, 1, 2, 1, 1, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (12, N'Iphone 6 Gold 16GB', N'iPhone 6 128GB.jpg', 649, 1, 2, 1, 1, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (13, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 649, 1, 2, 1, 1, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (14, N'Iphone 6 Gold 16GB', N'iPhone 6S 16GB Gold.jpg', 649, 1, 2, 1, 1, 2, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (15, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 549, 1, 2, 1, 1, 2, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (16, N'Iphone 6 Gold 16GB', N'iPhone 6S 16GB Gold.jpg', 549, 1, 2, 1, 1, 2, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (17, N'Macbook Pro 2016', N'macbook1.jpg', 20, 1, 3, 2, 1, 2, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (18, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 649, 1, 3, 2, 1, 2, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (19, N'Iphone 6 Gold 16GB', N'macbook2.jpg', 549, 1, 3, 2, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (20, N'Iphone 6 Gold 16GB', N'iPhone 6S 16GB Gold.jpg', 549, 1, 3, 2, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (21, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 649, 1, 3, 1, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (22, N'Iphone 6 Gold 16GB', N'iPhone 6S 16GB Gold.jpg', 549, 1, 1, 1, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (23, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 549, 1, 1, 1, 2, 2, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (24, N'Iphone 6 Gold 16GB', N'iPhone 6S 16GB Gold.jpg', 649, 1, 1, 2, 1, 2, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (25, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 649, 1, 1, 1, 1, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (26, N'Iphone 7+ Red 128GB', N'7plusred.jpg', 1100, 1, 1, 1, 1, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (27, N'Macbook Pro 2015', N'macbook1.jpg', 3, 1, 3, 2, 1, 2, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (28, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 649, 1, 3, 2, 1, 2, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (29, N'Iphone 6 Gold 16GB', N'macbook2.jpg', 549, 1, 3, 2, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (30, N'Iphone 6 Gold 16GB', N'iPhone 6S 16GB Gold.jpg', 549, 1, 3, 2, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (31, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 649, 1, 3, 1, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (32, N'Macbook Pro 2017', N'macbook1.jpg', 5, 1, 3, 2, 1, 2, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (33, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 649, 1, 3, 2, 1, 2, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (34, N'Iphone 6 Gold 16GB', N'macbook2.jpg', 549, 1, 3, 2, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (35, N'Iphone 6 Gold 16GB', N'iPhone 6S 16GB Gold.jpg', 549, 1, 3, 2, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Image], [Price], [UserId], [CategoryId], [ColorId], [ModelId], [StorageId], [SellStartDate], [SellEndDate], [IsNew]) VALUES (36, N'Iphone 6S Rose 16GB', N'iPhone 6 128GB.jpg', 649, 1, 3, 1, 2, 1, CAST(N'2015-09-09 00:00:00.000' AS DateTime), CAST(N'2015-09-09 00:00:00.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Storage] ON 

GO
INSERT [dbo].[Storage] ([StorageId], [Storage]) VALUES (1, N'16 GB')
GO
INSERT [dbo].[Storage] ([StorageId], [Storage]) VALUES (2, N'64 GB')
GO
INSERT [dbo].[Storage] ([StorageId], [Storage]) VALUES (3, N'128 GB')
GO
INSERT [dbo].[Storage] ([StorageId], [Storage]) VALUES (4, N'8 GB')
GO
INSERT [dbo].[Storage] ([StorageId], [Storage]) VALUES (5, N'32 GB')
GO
SET IDENTITY_INSERT [dbo].[Storage] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([UserId], [Username], [Password]) VALUES (1, N'chienvh', N'chienvh')
GO
INSERT [dbo].[User] ([UserId], [Username], [Password]) VALUES (2, N'admin', N'admin')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Color] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Color] ([ColorId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Color]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Model] FOREIGN KEY([ModelId])
REFERENCES [dbo].[Model] ([ModelId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Model]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Storage] FOREIGN KEY([StorageId])
REFERENCES [dbo].[Storage] ([StorageId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Storage]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
USE [master]
GO
ALTER DATABASE [ChienVHShopDB] SET  READ_WRITE 
GO
