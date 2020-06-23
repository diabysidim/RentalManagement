USE [master]
GO
/****** Object:  Database [RentalManagement]    Script Date: 6/22/2020 6:49:09 PM ******/
CREATE DATABASE [RentalManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentalManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\RentalManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RentalManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\RentalManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RentalManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentalManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentalManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentalManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentalManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentalManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentalManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentalManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RentalManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentalManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentalManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentalManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentalManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentalManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentalManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentalManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentalManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RentalManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentalManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentalManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentalManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentalManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentalManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentalManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentalManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RentalManagement] SET  MULTI_USER 
GO
ALTER DATABASE [RentalManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentalManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentalManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentalManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RentalManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RentalManagement] SET QUERY_STORE = OFF
GO
USE [RentalManagement]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 6/22/2020 6:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Equipment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Equipment_Category] [nvarchar](50) NULL,
	[Equipment_Model] [nvarchar](50) NULL,
	[Equipment_Make] [int] NULL,
	[Inven_SerialNo] [int] NULL,
	[Equipment_Name] [nvarchar](225) NOT NULL,
	[Rental_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Equipment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 6/22/2020 6:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Invoice_ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoice_No] [int] NULL,
	[Amount] [money] NOT NULL,
	[Job_ID] [int] NOT NULL,
	[Rental_ID] [int] NOT NULL,
	[Vendor_ID] [int] NOT NULL,
	[User_ID] [int] NULL,
 CONSTRAINT [PK__Invoice__0DE60494CA431106] PRIMARY KEY CLUSTERED 
(
	[Invoice_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice_Equipment]    Script Date: 6/22/2020 6:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Equipment](
	[InvoiceEquipment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoice_ID] [int] NOT NULL,
	[Equipment_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceEquipment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 6/22/2020 6:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Job_ID] [int] IDENTITY(1,1) NOT NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Job_Description] [nvarchar](225) NULL,
	[Last_Update] [datetime] NULL,
	[Job_Title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Job_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 6/22/2020 6:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[Rental_ID] [int] IDENTITY(1,1) NOT NULL,
	[Receive_Date] [datetime] NULL,
	[Receive_hr] [time](7) NULL,
	[Return_Date] [datetime] NULL,
	[Return_hr] [time](7) NULL,
	[Rental_rate] [int] NULL,
	[Equipment_Name] [nvarchar](50) NOT NULL,
	[Duration] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Rental_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/22/2020 6:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NULL,
	[LastName] [varchar](25) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Passwords] [nvarchar](255) NULL,
	[IsAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 6/22/2020 6:49:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[Vendor_ID] [int] IDENTITY(1,1) NOT NULL,
	[SalesPerson] [nvarchar](225) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone_No] [nvarchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[Vendor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Jobs] ADD  DEFAULT (getdate()) FOR [Last_Update]
GO
ALTER TABLE [dbo].[Rentals] ADD  DEFAULT ((0)) FOR [Duration]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD FOREIGN KEY([Rental_ID])
REFERENCES [dbo].[Rentals] ([Rental_ID])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_UserAccounts] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_UserAccounts]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Job_ID] FOREIGN KEY([Job_ID])
REFERENCES [dbo].[Jobs] ([Job_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Job_ID]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Rental_ID] FOREIGN KEY([Rental_ID])
REFERENCES [dbo].[Rentals] ([Rental_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Rental_ID]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_ID] FOREIGN KEY([Vendor_ID])
REFERENCES [dbo].[Vendors] ([Vendor_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Vendor_ID]
GO
ALTER TABLE [dbo].[Invoice_Equipment]  WITH CHECK ADD FOREIGN KEY([Equipment_ID])
REFERENCES [dbo].[Equipment] ([Equipment_Id])
GO
ALTER TABLE [dbo].[Invoice_Equipment]  WITH CHECK ADD FOREIGN KEY([Invoice_ID])
REFERENCES [dbo].[Invoice] ([Invoice_ID])
GO
USE [master]
GO
ALTER DATABASE [RentalManagement] SET  READ_WRITE 
GO
