USE [cosodulieu]
GO
/****** Object:  StoredProcedure [dbo].[Update_Customer]    Script Date: 31/07/2018 17:03:57 ******/
DROP PROCEDURE [dbo].[Update_Customer]
GO
/****** Object:  StoredProcedure [dbo].[Select_Customer]    Script Date: 31/07/2018 17:03:57 ******/
DROP PROCEDURE [dbo].[Select_Customer]
GO
/****** Object:  StoredProcedure [dbo].[Select_Account]    Script Date: 31/07/2018 17:03:57 ******/
DROP PROCEDURE [dbo].[Select_Account]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Customer]    Script Date: 31/07/2018 17:03:57 ******/
DROP PROCEDURE [dbo].[Insert_Customer]
GO
/****** Object:  StoredProcedure [dbo].[Find_Customer]    Script Date: 31/07/2018 17:03:57 ******/
DROP PROCEDURE [dbo].[Find_Customer]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Customer]    Script Date: 31/07/2018 17:03:57 ******/
DROP PROCEDURE [dbo].[Delete_Customer]
GO
/****** Object:  StoredProcedure [dbo].[Count_Row]    Script Date: 31/07/2018 17:03:57 ******/
DROP PROCEDURE [dbo].[Count_Row]
GO
/****** Object:  Table [dbo].[login]    Script Date: 31/07/2018 17:03:57 ******/
DROP TABLE [dbo].[login]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 31/07/2018 17:03:57 ******/
DROP TABLE [dbo].[customer]
GO
/****** Object:  User [user]    Script Date: 31/07/2018 17:03:57 ******/
DROP USER [user]
GO
USE [master]
GO
/****** Object:  Database [cosodulieu]    Script Date: 31/07/2018 17:03:57 ******/
DROP DATABASE [cosodulieu]
GO
/****** Object:  Database [cosodulieu]    Script Date: 31/07/2018 17:03:57 ******/
CREATE DATABASE [cosodulieu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cosodulieu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\cosodulieu.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cosodulieu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\cosodulieu_log.ldf' , SIZE = 270336KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [cosodulieu] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cosodulieu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cosodulieu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cosodulieu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cosodulieu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cosodulieu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cosodulieu] SET ARITHABORT OFF 
GO
ALTER DATABASE [cosodulieu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cosodulieu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cosodulieu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cosodulieu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cosodulieu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cosodulieu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cosodulieu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cosodulieu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cosodulieu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cosodulieu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cosodulieu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cosodulieu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cosodulieu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cosodulieu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cosodulieu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cosodulieu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cosodulieu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cosodulieu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cosodulieu] SET  MULTI_USER 
GO
ALTER DATABASE [cosodulieu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cosodulieu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cosodulieu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cosodulieu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cosodulieu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cosodulieu] SET QUERY_STORE = OFF
GO
USE [cosodulieu]
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
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [cosodulieu]
GO
/****** Object:  User [user]    Script Date: 31/07/2018 17:03:58 ******/
CREATE USER [user] FOR LOGIN [user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 31/07/2018 17:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](20) NULL,
	[birth] [nvarchar](50) NULL,
	[gender] [nvarchar](10) NULL,
	[phone] [ntext] NULL,
	[email] [nvarchar](50) NULL,
	[address] [ntext] NULL,
	[hidden] [bit] NULL,
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 31/07/2018 17:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[name] [nchar](20) NOT NULL,
	[password] [nchar](50) NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000001', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000002', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000003', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000004', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000005', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000006', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000007', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000008', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000009', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000010', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000011', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000012', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000013', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000014', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000015', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000016', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000017', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000018', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000019', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000020', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000021', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000022', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000023', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000024', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000025', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000026', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000027', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000028', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000029', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000030', N'Pham Thanh A', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000031', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000032', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000033', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000034', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000035', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000036', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000037', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000038', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000039', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000040', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000041', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000042', N'Pham Than', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000043', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000044', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000045', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000046', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000047', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000048', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000049', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000050', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000051', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000052', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000053', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000054', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000055', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000056', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000057', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000058', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000059', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000060', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000061', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000062', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000063', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000064', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000065', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000066', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000067', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000068', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000069', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000070', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000071', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000072', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000073', N'Pham Thao', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000074', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000075', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000076', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000077', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000078', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000079', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000080', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000081', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000082', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000083', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000084', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000085', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000086', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000087', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000088', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000089', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000090', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000091', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000092', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000093', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000094', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000095', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000096', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000097', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[customer] ([id], [name], [birth], [gender], [phone], [email], [address], [hidden]) VALUES (N'MH000098', N'Pham Thanh', N'27/11/1994', N'Male', N'01648093848', N'thanh@gmail.com', N'Hải An, Đằng Hải, Hải Phòng', 0)
INSERT [dbo].[login] ([name], [password]) VALUES (N'123                 ', N'123                                               ')
INSERT [dbo].[login] ([name], [password]) VALUES (N'admin               ', N'202cb962ac59075b964b07152d234b70                  ')
/****** Object:  StoredProcedure [dbo].[Count_Row]    Script Date: 31/07/2018 17:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Count_Row]
	
AS
BEGIN
	SELECT COUNT(id) FROM customer;
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Customer]    Script Date: 31/07/2018 17:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_Customer]
	@id nvarchar(10)
AS
BEGIN
	UPDATE customer SET hidden='1' WHERE id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[Find_Customer]    Script Date: 31/07/2018 17:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Find_Customer]
	@id nvarchar(10),
	@name nvarchar(20),
	@PageSize INT, 
	@PageNum INT,
	@RecordCount INT OUTPUT
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY id desc) AS RN,* INTO #tblTemp FROM customer WHERE
		id LIKE N'%'+@id+'%' 
		AND name LIKE N'%'+@name+'%' 
		AND hidden='0'
	SELECT @RecordCount=COUNT(*) FROM #tblTemp
	SELECT * FROM #tblTemp

	WHERE RN BETWEEN (@PageNum-1)*@PageSize+1 
		AND @PageNum*@PageSize 
		
	ORDER BY id desc
	DROP TABLE #tblTemp
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_Customer]    Script Date: 31/07/2018 17:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insert_Customer]
	@id nvarchar(10),
	@name nvarchar(20),
	@birth nvarchar(50),
	@gender nvarchar(10),
	@phone ntext,
	@email nvarchar(30),
	@address ntext
AS
BEGIN
	INSERT INTO customer(id,name,birth,gender,phone,email,address,hidden) VALUES(@id,@name,@birth,@gender,@phone,@email,@address,'0')
END
GO
/****** Object:  StoredProcedure [dbo].[Select_Account]    Script Date: 31/07/2018 17:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_Account]
	@name nvarchar(20),
	@pass nvarchar(50)
AS
BEGIN
	Select * From login Where name=@name and password= @pass
END
GO
/****** Object:  StoredProcedure [dbo].[Select_Customer]    Script Date: 31/07/2018 17:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_Customer]
	@id nvarchar(10)
AS
IF @id!=''
BEGIN
	SELECT * FROM customer WHERE id =@id and hidden='0' ORDER BY id DESC
END
IF @id=''
BEGIN
	SELECT * FROM customer WHERE hidden='0' ORDER BY id DESC
END
GO
/****** Object:  StoredProcedure [dbo].[Update_Customer]    Script Date: 31/07/2018 17:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Update_Customer]
	@id nvarchar(10),
	@name nvarchar(20),
	@birth nvarchar(50),
	@gender nvarchar(10),
	@phone ntext,
	@email nvarchar(30),
	@address ntext
AS
BEGIN
	UPDATE customer SET name=@name,birth=@birth,gender=@gender,phone=@phone,email=@email,address=@address WHERE id=@id
END

GO
USE [master]
GO
ALTER DATABASE [cosodulieu] SET  READ_WRITE 
GO
