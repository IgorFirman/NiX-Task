USE [master]
GO
/****** Object:  Database [NiX_Test]    Script Date: 20.12.2020 19:34:16 ******/
CREATE DATABASE [NiX_Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NiX_Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NiX_Test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NiX_Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NiX_Test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NiX_Test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NiX_Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NiX_Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NiX_Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NiX_Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NiX_Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NiX_Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [NiX_Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NiX_Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NiX_Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NiX_Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NiX_Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NiX_Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NiX_Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NiX_Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NiX_Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NiX_Test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NiX_Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NiX_Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NiX_Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NiX_Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NiX_Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NiX_Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NiX_Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NiX_Test] SET RECOVERY FULL 
GO
ALTER DATABASE [NiX_Test] SET  MULTI_USER 
GO
ALTER DATABASE [NiX_Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NiX_Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NiX_Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NiX_Test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NiX_Test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NiX_Test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NiX_Test', N'ON'
GO
ALTER DATABASE [NiX_Test] SET QUERY_STORE = OFF
GO
USE [NiX_Test]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 20.12.2020 19:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Age] [int] NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Email] [varchar](30) NULL,
	[Phone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Example]    Script Date: 20.12.2020 19:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Example](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 20.12.2020 19:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CreatedAt] [date] NOT NULL,
	[ProductCount] [int] NULL,
	[Price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phones]    Script Date: 20.12.2020 19:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](30) NOT NULL,
	[Manufacturer] [nvarchar](20) NOT NULL,
	[MemoryInPhone] [int] NOT NULL,
	[ProductCount] [int] NULL,
	[Price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Age], [FirstName], [LastName], [Email], [Phone]) VALUES (1, 29, N'Petro', N'Lovchak', N'lovchak@gmail.com', N'+380667784352')
INSERT [dbo].[Customers] ([Id], [Age], [FirstName], [LastName], [Email], [Phone]) VALUES (2, 40, N'Anastasia', N'Golovata', N'angol@gmail.com', N'+380970054324')
INSERT [dbo].[Customers] ([Id], [Age], [FirstName], [LastName], [Email], [Phone]) VALUES (3, 20, N'Victor', N'Fedorchuk', N'fedd@gmail.com', N'+380778368111')
INSERT [dbo].[Customers] ([Id], [Age], [FirstName], [LastName], [Email], [Phone]) VALUES (4, 57, N'Maxym', N'Ivanov', N'ivanov@gmail.com', N'+380678856342')
INSERT [dbo].[Customers] ([Id], [Age], [FirstName], [LastName], [Email], [Phone]) VALUES (5, 18, N'Dmytro', N'Kovalchyk', N'dmkvlc@gmail.com', N'+380633328567')
INSERT [dbo].[Customers] ([Id], [Age], [FirstName], [LastName], [Email], [Phone]) VALUES (6, 34, N'Tetyana', N'Kozak', N'kozak@gmail.com', N'+380678843905')
INSERT [dbo].[Customers] ([Id], [Age], [FirstName], [LastName], [Email], [Phone]) VALUES (7, 22, N'Andriy', N'Melnyk', N'melnyk@gmail.com', N'+380668544390')
INSERT [dbo].[Customers] ([Id], [Age], [FirstName], [LastName], [Email], [Phone]) VALUES (8, 21, N'Volodymyr', N'Girnyak', N'girnyak@gmail.com', N'+380500054234')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdersDetails] ON 

INSERT [dbo].[OrdersDetails] ([Id], [ProductId], [CustomerId], [CreatedAt], [ProductCount], [Price]) VALUES (1, 1, 4, CAST(N'2020-12-11' AS Date), 2, 33000.0000)
INSERT [dbo].[OrdersDetails] ([Id], [ProductId], [CustomerId], [CreatedAt], [ProductCount], [Price]) VALUES (2, 2, 6, CAST(N'2020-12-13' AS Date), 2, 50000.0000)
INSERT [dbo].[OrdersDetails] ([Id], [ProductId], [CustomerId], [CreatedAt], [ProductCount], [Price]) VALUES (3, 5, 7, CAST(N'2020-12-13' AS Date), 2, 56000.0000)
INSERT [dbo].[OrdersDetails] ([Id], [ProductId], [CustomerId], [CreatedAt], [ProductCount], [Price]) VALUES (4, 7, 2, CAST(N'2020-12-15' AS Date), 2, 15000.0000)
SET IDENTITY_INSERT [dbo].[OrdersDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Phones] ON 

INSERT [dbo].[Phones] ([Id], [Model], [Manufacturer], [MemoryInPhone], [ProductCount], [Price]) VALUES (1, N'iPhone X', N'Apple', 64, 2, 33000.0000)
INSERT [dbo].[Phones] ([Id], [Model], [Manufacturer], [MemoryInPhone], [ProductCount], [Price]) VALUES (2, N'iPhone 12', N'Apple', 512, 2, 50000.0000)
INSERT [dbo].[Phones] ([Id], [Model], [Manufacturer], [MemoryInPhone], [ProductCount], [Price]) VALUES (3, N'iPhone 8', N'Apple', 128, 5, 13000.0000)
INSERT [dbo].[Phones] ([Id], [Model], [Manufacturer], [MemoryInPhone], [ProductCount], [Price]) VALUES (4, N'Xiaomi Redmi Note 9 Pro', N'Xiaomi', 128, 2, 9000.0000)
INSERT [dbo].[Phones] ([Id], [Model], [Manufacturer], [MemoryInPhone], [ProductCount], [Price]) VALUES (5, N'Galaxy S10 Plus', N'Samsung', 512, 1, 56000.0000)
INSERT [dbo].[Phones] ([Id], [Model], [Manufacturer], [MemoryInPhone], [ProductCount], [Price]) VALUES (6, N'Galaxy Fold', N'Samsung', 64, 2, 60000.0000)
INSERT [dbo].[Phones] ([Id], [Model], [Manufacturer], [MemoryInPhone], [ProductCount], [Price]) VALUES (7, N'Pixel 4', N'Google', 256, 6, 15000.0000)
INSERT [dbo].[Phones] ([Id], [Model], [Manufacturer], [MemoryInPhone], [ProductCount], [Price]) VALUES (8, N'P-Smart', N'Huawei', 64, 7, 8000.0000)
SET IDENTITY_INSERT [dbo].[Phones] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__5C7E359EBA5D6FB1]    Script Date: 20.12.2020 19:34:17 ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D10534A617252C]    Script Date: 20.12.2020 19:34:17 ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ((18)) FOR [Age]
GO
ALTER TABLE [dbo].[OrdersDetails] ADD  DEFAULT ((1)) FOR [ProductCount]
GO
ALTER TABLE [dbo].[Phones] ADD  DEFAULT ((0)) FOR [ProductCount]
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Phones] ([Id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [NiX_Test] SET  READ_WRITE 
GO
