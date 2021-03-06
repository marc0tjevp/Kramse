USE [master]
GO
/****** Object:  Database [Kramse-Staging]    Script Date: 31/01/2021 10:13:41 ******/
CREATE DATABASE [Kramse-Staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kramse-Staging', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Kramse-Staging.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kramse-Staging_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Kramse-Staging_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kramse-Staging] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kramse-Staging].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kramse-Staging] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kramse-Staging] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kramse-Staging] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kramse-Staging] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kramse-Staging] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kramse-Staging] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kramse-Staging] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kramse-Staging] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kramse-Staging] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kramse-Staging] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kramse-Staging] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kramse-Staging] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kramse-Staging] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kramse-Staging] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kramse-Staging] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kramse-Staging] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kramse-Staging] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kramse-Staging] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kramse-Staging] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kramse-Staging] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kramse-Staging] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kramse-Staging] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kramse-Staging] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kramse-Staging] SET  MULTI_USER 
GO
ALTER DATABASE [Kramse-Staging] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kramse-Staging] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kramse-Staging] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kramse-Staging] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kramse-Staging] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kramse-Staging] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Kramse-Staging] SET QUERY_STORE = OFF
GO
USE [Kramse-Staging]
GO
/****** Object:  Table [dbo].[Consignor]    Script Date: 31/01/2021 10:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consignor](
	[Id] [int] NOT NULL,
	[Consignor] [nvarchar](255) NOT NULL,
	[City] [nvarchar](255) NULL,
	[Discount] [int] NULL,
	[Country] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Container]    Script Date: 31/01/2021 10:13:41 ******/
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
	[EuroPricePerKm] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ITem]    Script Date: 31/01/2021 10:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITem](
	[item_key] [int] NOT NULL,
	[item_description] [nvarchar](255) NOT NULL,
	[item_category] [nvarchar](255) NOT NULL,
	[item_mfgr] [nvarchar](255) NOT NULL,
	[item_storage_type] [nvarchar](255) NOT NULL,
	[item_hazard_flag] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Port]    Script Date: 31/01/2021 10:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Port](
	[P_PortOrder] [int] NOT NULL,
	[VPS_PortId] [int] NOT NULL,
	[P_PortName] [nvarchar](255) NOT NULL,
	[P_Country] [nvarchar](255) NOT NULL,
	[P_DistanceFromOslo] [int] NOT NULL,
	[P_DistanceFromPiraeus] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 31/01/2021 10:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[VS_Shipid] [int] NOT NULL,
	[Sh_Shipname] [nvarchar](255) NOT NULL,
	[Sh_MaxNumberContain] [bigint] NOT NULL,
	[Sh_SpeedInKnots] [int] NOT NULL,
	[Sh_SpeedInKm_H] [int] NOT NULL,
	[Sh_Country] [nvarchar](255) NOT NULL,
	[Sh_Yearcost] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 31/01/2021 10:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ShipmentId] [int] NOT NULL,
	[VoyageId] [int] NOT NULL,
	[ConsignorId] [int] NOT NULL,
	[PortIdFrom] [int] NOT NULL,
	[PortIdTo] [int] NOT NULL,
	[Distance] [int] NOT NULL,
	[NumberContainers] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDetail]    Script Date: 31/01/2021 10:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDetail](
	[ShipmentId] [int] NOT NULL,
	[ContainerNr] [nvarchar](255) NOT NULL,
	[Item] [int] NOT NULL,
	[ContainertypeId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voyage]    Script Date: 31/01/2021 10:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voyage](
	[VV_VoyageId] [int] NOT NULL,
	[VS_ShipId] [int] NOT NULL,
	[V_DateDepartVoyage] [date] NOT NULL,
	[VPS_PortIdStart] [int] NOT NULL,
	[V_PortIdEnd] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoyagePort]    Script Date: 31/01/2021 10:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoyagePort](
	[VV_VoyageId] [int] NOT NULL,
	[VP_PortIdCurrent] [int] NOT NULL,
	[VP_PortIdNext] [int] NOT NULL,
	[Vp_LegDateDepart] [date] NOT NULL,
	[Vp_LegDateArrival] [date] NOT NULL,
	[Vp_Traject_Distance] [int] NOT NULL,
	[Vp_PortOder] [int] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Kramse-Staging] SET  READ_WRITE 
GO
