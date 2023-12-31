USE [master]
GO
/****** Object:  Database [GameCard2023DB]    Script Date: 11/12/2023 7:18:41 PM ******/
CREATE DATABASE [GameCard2023DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GameCard2023DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GameCard2023DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GameCard2023DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GameCard2023DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GameCard2023DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GameCard2023DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GameCard2023DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GameCard2023DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GameCard2023DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GameCard2023DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GameCard2023DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GameCard2023DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GameCard2023DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GameCard2023DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GameCard2023DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GameCard2023DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GameCard2023DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GameCard2023DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GameCard2023DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GameCard2023DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GameCard2023DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GameCard2023DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GameCard2023DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GameCard2023DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GameCard2023DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GameCard2023DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GameCard2023DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GameCard2023DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GameCard2023DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GameCard2023DB] SET  MULTI_USER 
GO
ALTER DATABASE [GameCard2023DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GameCard2023DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GameCard2023DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GameCard2023DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GameCard2023DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GameCard2023DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GameCard2023DB] SET QUERY_STORE = OFF
GO
USE [GameCard2023DB]
GO
/****** Object:  Table [dbo].[GameCardInfo]    Script Date: 11/12/2023 7:18:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameCardInfo](
	[GameCardId] [int] NOT NULL,
	[GameCardName] [nvarchar](90) NOT NULL,
	[GameDescription] [nvarchar](250) NULL,
	[GamePlatform] [nvarchar](100) NULL,
	[Price] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ProviderId] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[GameCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberAccount]    Script Date: 11/12/2023 7:18:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberAccount](
	[MemberAccountID] [int] NOT NULL,
	[MemberAccountPassword] [nvarchar](60) NOT NULL,
	[MemberFullName] [nvarchar](100) NOT NULL,
	[MemberEmail] [nvarchar](100) NULL,
	[Role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 11/12/2023 7:18:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderId] [nvarchar](30) NOT NULL,
	[ProviderName] [nvarchar](100) NOT NULL,
	[ProviderDescription] [nvarchar](250) NOT NULL,
	[IsOnline] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[GameCardInfo] ([GameCardId], [GameCardName], [GameDescription], [GamePlatform], [Price], [Quantity], [CreatedDate], [ProviderId]) VALUES (6652, N'1casdasdasd13', N'Modern Warfare 2 - Jaextraordinary items that make up the unique Sasquatch operator set for your favorite first-person shooter gameplay', N'PC', CAST(150 AS Decimal(18, 0)), 50, CAST(N'2023-10-16T00:00:00.000' AS DateTime), N'PR00884')
INSERT [dbo].[GameCardInfo] ([GameCardId], [GameCardName], [GameDescription], [GamePlatform], [Price], [Quantity], [CreatedDate], [ProviderId]) VALUES (6653, N'Monster Hunter World: Iceborne', N'Iceborne is an expansion pack to critically acclaimed action-RPG game Monster Hunter', N'PC', CAST(70 AS Decimal(18, 0)), 10, CAST(N'2023-10-16T00:00:00.000' AS DateTime), N'PR00884')
INSERT [dbo].[GameCardInfo] ([GameCardId], [GameCardName], [GameDescription], [GamePlatform], [Price], [Quantity], [CreatedDate], [ProviderId]) VALUES (6654, N'Cities: Skylines II ', N'The most realistic and detailed city builder ever, Cities: Skylines II pushes your creativity and problem-solving to another level.', N'PC', CAST(80 AS Decimal(18, 0)), 200, CAST(N'2023-10-16T00:00:00.000' AS DateTime), N'PR00885')
INSERT [dbo].[GameCardInfo] ([GameCardId], [GameCardName], [GameDescription], [GamePlatform], [Price], [Quantity], [CreatedDate], [ProviderId]) VALUES (6655, N'Random ELITE 5 Keys', N'Make your Steam library look ELITE thanks to the amazing titles you may receive. ', N'PC', CAST(60 AS Decimal(18, 0)), 100, CAST(N'2023-10-16T00:00:00.000' AS DateTime), N'PR00885')
INSERT [dbo].[GameCardInfo] ([GameCardId], [GameCardName], [GameDescription], [GamePlatform], [Price], [Quantity], [CreatedDate], [ProviderId]) VALUES (6656, N'Xbox Game Pass Ultimate 1 Month Non-Stackable', N'Get all the benefits of Xbox Live Gold, plus over 100 high-quality console and PC games for one low monthly price. ', N'Xbox Live', CAST(110 AS Decimal(18, 0)), 400, CAST(N'2023-10-16T00:00:00.000' AS DateTime), N'PR00881')
INSERT [dbo].[GameCardInfo] ([GameCardId], [GameCardName], [GameDescription], [GamePlatform], [Price], [Quantity], [CreatedDate], [ProviderId]) VALUES (6657, N'FIFA 23 (Xbox One) - Xbox Live Key', N'Experience virtual football like never before thanks to brand new technology, live through the excitement and be part of FIFA World Cup Qatar 2022', N'Xbox Live', CAST(70 AS Decimal(18, 0)), 300, CAST(N'2023-10-16T00:00:00.000' AS DateTime), N'PR00881')
INSERT [dbo].[GameCardInfo] ([GameCardId], [GameCardName], [GameDescription], [GamePlatform], [Price], [Quantity], [CreatedDate], [ProviderId]) VALUES (66513, N'PlayS', N'PlayStation Network Gift Card is used to add funds to any Sony Entertainment Network account wallet.', N'PSN UNITED STATES', CAST(50 AS Decimal(18, 0)), 200, CAST(N'2023-10-16T00:00:00.000' AS DateTime), N'PR00884')
GO
INSERT [dbo].[MemberAccount] ([MemberAccountID], [MemberAccountPassword], [MemberFullName], [MemberEmail], [Role]) VALUES (234, N'@2', N'Administrator', N'admin@GameCardStore.info', 1)
INSERT [dbo].[MemberAccount] ([MemberAccountID], [MemberAccountPassword], [MemberFullName], [MemberEmail], [Role]) VALUES (235, N'@2', N'Staff', N'staff@GameCardStore.info', 2)
INSERT [dbo].[MemberAccount] ([MemberAccountID], [MemberAccountPassword], [MemberFullName], [MemberEmail], [Role]) VALUES (236, N'@2', N'Manager', N'manager@GameCardStore.info', 3)
INSERT [dbo].[MemberAccount] ([MemberAccountID], [MemberAccountPassword], [MemberFullName], [MemberEmail], [Role]) VALUES (237, N'@2', N'Customer', N'customer@GameCardStore.info', 4)
GO
INSERT [dbo].[Provider] ([ProviderId], [ProviderName], [ProviderDescription], [IsOnline]) VALUES (N'PR00881', N'Xbox', N'There are several options for Xbox game card providers. Some popular choices include Microsoft, Amazon, and GameStop. ', 1)
INSERT [dbo].[Provider] ([ProviderId], [ProviderName], [ProviderDescription], [IsOnline]) VALUES (N'PR00884', N'PlayStation', N'Some of the most popular options include PlayStation Network (PSN) Card, GameStop, and Amazon.', 1)
INSERT [dbo].[Provider] ([ProviderId], [ProviderName], [ProviderDescription], [IsOnline]) VALUES (N'PR00885', N'Steam', N'There are several legitimate Steam game card providers that you can purchase from. Some popular options include Green Man Gaming, Gamivo, and Marketplace.', 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MemberAc__3F37B77A9B6E144B]    Script Date: 11/12/2023 7:18:41 PM ******/
ALTER TABLE [dbo].[MemberAccount] ADD UNIQUE NONCLUSTERED 
(
	[MemberEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GameCardInfo]  WITH CHECK ADD FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [GameCard2023DB] SET  READ_WRITE 
GO
