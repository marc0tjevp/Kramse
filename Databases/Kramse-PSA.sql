USE [master]
GO
/****** Object:  Database [Kramse-PSA]    Script Date: 31/01/2021 10:12:59 ******/
CREATE DATABASE [Kramse-PSA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kramse-PSA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Kramse-PSA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kramse-PSA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Kramse-PSA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kramse-PSA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kramse-PSA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kramse-PSA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kramse-PSA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kramse-PSA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kramse-PSA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kramse-PSA] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kramse-PSA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kramse-PSA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kramse-PSA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kramse-PSA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kramse-PSA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kramse-PSA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kramse-PSA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kramse-PSA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kramse-PSA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kramse-PSA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kramse-PSA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kramse-PSA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kramse-PSA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kramse-PSA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kramse-PSA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kramse-PSA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kramse-PSA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kramse-PSA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kramse-PSA] SET  MULTI_USER 
GO
ALTER DATABASE [Kramse-PSA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kramse-PSA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kramse-PSA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kramse-PSA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kramse-PSA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kramse-PSA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Kramse-PSA] SET QUERY_STORE = OFF
GO
USE [Kramse-PSA]
GO
/****** Object:  Table [dbo].[Consignor]    Script Date: 31/01/2021 10:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consignor](
	[Id] [int] NOT NULL,
	[Consignor] [nvarchar](255) NOT NULL,
	[City] [nvarchar](255) NULL,
	[Discount] [int] NOT NULL,
	[Country] [nvarchar](255) NOT NULL,
	[EXTRACTION_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_Consignor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Container]    Script Date: 31/01/2021 10:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Container](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[RefrigerationFlag] [nvarchar](50) NOT NULL,
	[PowerFlag] [nvarchar](50) NOT NULL,
	[Length] [decimal](18, 2) NOT NULL,
	[Cubes] [int] NOT NULL,
	[EuroPricePerKm] [decimal](18, 2) NOT NULL,
	[EXTRACTION_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_Container] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Date]    Script Date: 31/01/2021 10:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[DateKey] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Day] [tinyint] NOT NULL,
	[DaySuffix] [char](2) NOT NULL,
	[Weekday] [tinyint] NOT NULL,
	[WeekDayName] [varchar](10) NOT NULL,
	[WeekDayName_Short] [char](3) NOT NULL,
	[WeekDayName_FirstLetter] [char](1) NOT NULL,
	[DOWInMonth] [tinyint] NOT NULL,
	[DayOfYear] [smallint] NOT NULL,
	[WeekOfMonth] [tinyint] NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[Month] [tinyint] NOT NULL,
	[MonthName] [varchar](10) NOT NULL,
	[MonthName_Short] [char](3) NOT NULL,
	[MonthName_FirstLetter] [char](1) NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[QuarterName] [varchar](6) NOT NULL,
	[Year] [int] NOT NULL,
	[MMYYYY] [char](6) NOT NULL,
	[MonthYear] [char](7) NOT NULL,
	[IsWeekend] [bit] NOT NULL,
	[IsHoliday] [bit] NOT NULL,
	[HolidayName] [varchar](20) NULL,
	[SpecialDays] [varchar](20) NULL,
	[FinancialYear] [int] NULL,
	[FinancialQuater] [int] NULL,
	[FinancialMonth] [int] NULL,
	[FirstDateofYear] [date] NULL,
	[LastDateofYear] [date] NULL,
	[FirstDateofQuater] [date] NULL,
	[LastDateofQuater] [date] NULL,
	[FirstDateofMonth] [date] NULL,
	[LastDateofMonth] [date] NULL,
	[FirstDateofWeek] [date] NULL,
	[LastDateofWeek] [date] NULL,
	[CurrentYear] [smallint] NULL,
	[CurrentQuater] [smallint] NULL,
	[CurrentMonth] [smallint] NULL,
	[CurrentWeek] [smallint] NULL,
	[CurrentDay] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 31/01/2021 10:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Category] [nvarchar](255) NULL,
	[Mfgr] [nvarchar](255) NULL,
	[StorageType] [nvarchar](255) NULL,
	[HazardFlag] [nvarchar](255) NULL,
	[EXTRACTION_DATE] [datetime] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Port]    Script Date: 31/01/2021 10:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Port](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Country] [nvarchar](255) NOT NULL,
	[DistanceFromOslo] [int] NOT NULL,
	[DistanceFromPiraeus] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[EXTRACTION_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_Port] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 31/01/2021 10:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[MaxNumberContainers] [bigint] NOT NULL,
	[SpeedInKnots] [int] NOT NULL,
	[SpeedInKmh] [int] NOT NULL,
	[Country] [nvarchar](255) NOT NULL,
	[YearCost] [bigint] NOT NULL,
	[EXTRACTION_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_Ship] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 31/01/2021 10:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[Id] [int] NOT NULL,
	[VoyageId] [int] NOT NULL,
	[ConsignorId] [int] NOT NULL,
	[PortIdFrom] [int] NOT NULL,
	[PortIdTo] [int] NOT NULL,
	[Distance] [int] NOT NULL,
	[NumberContainers] [int] NOT NULL,
	[ContainerNr] [nvarchar](255) NOT NULL,
	[ItemId] [int] NOT NULL,
	[ContainerTypeId] [int] NOT NULL,
	[EXTRACTION_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voyage]    Script Date: 31/01/2021 10:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voyage](
	[Id] [int] NOT NULL,
	[ShipId] [int] NOT NULL,
	[DateDepartVoyage] [date] NOT NULL,
	[DateDepartVoyage_Key] [int] NOT NULL,
	[PortIdStart] [int] NOT NULL,
	[PortIdEnd] [int] NOT NULL,
	[EXTRACTION_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_Voyage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoyagePort]    Script Date: 31/01/2021 10:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoyagePort](
	[VoyageId] [int] NOT NULL,
	[PortIdCurrent] [int] NOT NULL,
	[PortIdNext] [int] NOT NULL,
	[LegDateDepart] [date] NOT NULL,
	[LegDateArrival] [date] NOT NULL,
	[Traject_Distance] [int] NOT NULL,
	[PortOrder] [int] NULL,
	[LegDateDepart_Key] [int] NOT NULL,
	[LegDateArrival_Key] [int] NOT NULL,
	[DateDepartVoyage_Key] [int] NOT NULL,
	[Previous_LegDateArrival] [date] NULL,
	[EXTRACTION_DATE] [datetime] NOT NULL,
	[IdleTimeInHours] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_VoyagePort] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Consignor] FOREIGN KEY([ConsignorId])
REFERENCES [dbo].[Consignor] ([Id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Consignor]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Item]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Port] FOREIGN KEY([PortIdFrom])
REFERENCES [dbo].[Port] ([Id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Port]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Port1] FOREIGN KEY([PortIdTo])
REFERENCES [dbo].[Port] ([Id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Port1]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Voyage] FOREIGN KEY([VoyageId])
REFERENCES [dbo].[Voyage] ([Id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Voyage]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Date] FOREIGN KEY([DateDepartVoyage_Key])
REFERENCES [dbo].[Date] ([DateKey])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_Date]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Port] FOREIGN KEY([PortIdStart])
REFERENCES [dbo].[Port] ([Id])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_Port]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Port1] FOREIGN KEY([PortIdEnd])
REFERENCES [dbo].[Port] ([Id])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_Port1]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Ship] FOREIGN KEY([ShipId])
REFERENCES [dbo].[Ship] ([Id])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_Ship]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Date] FOREIGN KEY([LegDateArrival_Key])
REFERENCES [dbo].[Date] ([DateKey])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Date]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Date1] FOREIGN KEY([LegDateDepart_Key])
REFERENCES [dbo].[Date] ([DateKey])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Date1]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Date2] FOREIGN KEY([DateDepartVoyage_Key])
REFERENCES [dbo].[Date] ([DateKey])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Date2]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Port] FOREIGN KEY([PortIdCurrent])
REFERENCES [dbo].[Port] ([Id])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Port]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Port1] FOREIGN KEY([PortIdNext])
REFERENCES [dbo].[Port] ([Id])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Port1]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Voyage] FOREIGN KEY([VoyageId])
REFERENCES [dbo].[Voyage] ([Id])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Voyage]
GO
USE [master]
GO
ALTER DATABASE [Kramse-PSA] SET  READ_WRITE 
GO
