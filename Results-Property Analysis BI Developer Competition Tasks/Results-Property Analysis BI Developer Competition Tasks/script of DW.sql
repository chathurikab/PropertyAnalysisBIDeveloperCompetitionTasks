USE [master]
GO
/****** Object:  Database [Task1_Warehouse]    Script Date: 4/01/2021 10:35:58 PM ******/
CREATE DATABASE [Task1_Warehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Task1_Warehouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Task1_Warehouse.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Task1_Warehouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Task1_Warehouse_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Task1_Warehouse] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Task1_Warehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Task1_Warehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Task1_Warehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Task1_Warehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Task1_Warehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Task1_Warehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET RECOVERY FULL 
GO
ALTER DATABASE [Task1_Warehouse] SET  MULTI_USER 
GO
ALTER DATABASE [Task1_Warehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Task1_Warehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Task1_Warehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Task1_Warehouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Task1_Warehouse] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Task1_Warehouse', N'ON'
GO
ALTER DATABASE [Task1_Warehouse] SET QUERY_STORE = OFF
GO
USE [Task1_Warehouse]
GO
/****** Object:  Table [dbo].[DimCity]    Script Date: 4/01/2021 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCity](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityCode] [nvarchar](10) NULL,
	[City] [nvarchar](100) NULL,
 CONSTRAINT [PK_Dim_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCountry]    Script Date: 4/01/2021 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCountry](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryCode] [nvarchar](10) NULL,
	[CountryName] [nvarchar](100) NULL,
 CONSTRAINT [PK_DimCountry] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPeriod]    Script Date: 4/01/2021 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPeriod](
	[PeriodKey] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
 CONSTRAINT [PK_DimPeriod] PRIMARY KEY CLUSTERED 
(
	[PeriodKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimState]    Script Date: 4/01/2021 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimState](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [nvarchar](10) NULL,
	[StateName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Dim_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSuburb]    Script Date: 4/01/2021 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSuburb](
	[SuburbId] [int] IDENTITY(1,1) NOT NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Suburb] [nvarchar](100) NULL,
	[Latitude] [decimal](8, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
 CONSTRAINT [PK_Dim_Suburb] PRIMARY KEY CLUSTERED 
(
	[SuburbId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactAreawiseProperty]    Script Date: 4/01/2021 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactAreawiseProperty](
	[CountryID] [int] NULL,
	[StateID] [int] NULL,
	[CityID] [int] NULL,
	[SuburbID] [int] NULL,
	[PeriodKey] [int] NULL,
	[PropertyMedian] [decimal](15, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSchool]    Script Date: 4/01/2021 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSchool](
	[SchoolCode] [nvarchar](10) NULL,
	[SchoolName] [nvarchar](100) NULL,
	[StreetNumber] [nvarchar](10) NULL,
	[StreetName] [nvarchar](100) NULL,
	[SuburbId] [int] NULL,
	[StateId] [int] NULL,
	[CountryId] [int] NULL,
	[LevelOfSchooling] [nvarchar](100) NULL,
	[Latitude] [decimal](8, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[SchoolSpecialtyType] [nvarchar](100) NULL,
	[SchoolSubType] [nvarchar](100) NULL,
	[SchoolGender] [nvarchar](50) NULL,
	[ICSEAValue] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTransport]    Script Date: 4/01/2021 10:35:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTransport](
	[Name] [nvarchar](100) NULL,
	[StopId] [nvarchar](10) NULL,
	[StreetNumber] [nvarchar](10) NULL,
	[StreetName] [nvarchar](100) NULL,
	[SuburbId] [int] NULL,
	[StateId] [int] NULL,
	[CountryId] [int] NULL,
	[PostCode] [nvarchar](10) NULL,
	[EntranceType] [nvarchar](100) NULL,
	[Latitude] [decimal](8, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[ExitNumber] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactAreawiseProperty]  WITH CHECK ADD  CONSTRAINT [FK_DmCity] FOREIGN KEY([CityID])
REFERENCES [dbo].[DimCity] ([CityId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactAreawiseProperty] CHECK CONSTRAINT [FK_DmCity]
GO
ALTER TABLE [dbo].[FactAreawiseProperty]  WITH CHECK ADD  CONSTRAINT [FK_DmCountry] FOREIGN KEY([CountryID])
REFERENCES [dbo].[DimCountry] ([CountryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactAreawiseProperty] CHECK CONSTRAINT [FK_DmCountry]
GO
ALTER TABLE [dbo].[FactAreawiseProperty]  WITH CHECK ADD  CONSTRAINT [FK_DmPeriod] FOREIGN KEY([PeriodKey])
REFERENCES [dbo].[DimPeriod] ([PeriodKey])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactAreawiseProperty] CHECK CONSTRAINT [FK_DmPeriod]
GO
ALTER TABLE [dbo].[FactAreawiseProperty]  WITH CHECK ADD  CONSTRAINT [FK_DmState] FOREIGN KEY([StateID])
REFERENCES [dbo].[DimState] ([StateId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactAreawiseProperty] CHECK CONSTRAINT [FK_DmState]
GO
ALTER TABLE [dbo].[FactAreawiseProperty]  WITH CHECK ADD  CONSTRAINT [FK_DmSuburb] FOREIGN KEY([SuburbID])
REFERENCES [dbo].[DimSuburb] ([SuburbId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactAreawiseProperty] CHECK CONSTRAINT [FK_DmSuburb]
GO
ALTER TABLE [dbo].[FactSchool]  WITH CHECK ADD  CONSTRAINT [FK_FactSchool_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[DimCountry] ([CountryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactSchool] CHECK CONSTRAINT [FK_FactSchool_Country]
GO
ALTER TABLE [dbo].[FactSchool]  WITH CHECK ADD  CONSTRAINT [FK_FactSchool_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[DimState] ([StateId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactSchool] CHECK CONSTRAINT [FK_FactSchool_State]
GO
ALTER TABLE [dbo].[FactSchool]  WITH CHECK ADD  CONSTRAINT [FK_FactSchool_Suburb] FOREIGN KEY([SuburbId])
REFERENCES [dbo].[DimSuburb] ([SuburbId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactSchool] CHECK CONSTRAINT [FK_FactSchool_Suburb]
GO
ALTER TABLE [dbo].[FactTransport]  WITH CHECK ADD  CONSTRAINT [FK_FactTransport_DimCountry] FOREIGN KEY([CountryId])
REFERENCES [dbo].[DimCountry] ([CountryID])
GO
ALTER TABLE [dbo].[FactTransport] CHECK CONSTRAINT [FK_FactTransport_DimCountry]
GO
ALTER TABLE [dbo].[FactTransport]  WITH CHECK ADD  CONSTRAINT [FK_FactTransport_DimState] FOREIGN KEY([StateId])
REFERENCES [dbo].[DimState] ([StateId])
GO
ALTER TABLE [dbo].[FactTransport] CHECK CONSTRAINT [FK_FactTransport_DimState]
GO
ALTER TABLE [dbo].[FactTransport]  WITH CHECK ADD  CONSTRAINT [FK_FactTransport_DimSuburb] FOREIGN KEY([SuburbId])
REFERENCES [dbo].[DimSuburb] ([SuburbId])
GO
ALTER TABLE [dbo].[FactTransport] CHECK CONSTRAINT [FK_FactTransport_DimSuburb]
GO
USE [master]
GO
ALTER DATABASE [Task1_Warehouse] SET  READ_WRITE 
GO
