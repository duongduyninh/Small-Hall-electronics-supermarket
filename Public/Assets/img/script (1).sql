USE [master]
GO
/****** Object:  Database [dvdkhoa]    Script Date: 29/09/2023 6:35:38 CH ******/
CREATE DATABASE [dvdkhoa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dvdkhoa_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dvdkhoa.mdf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 LOG ON 
( NAME = N'dvdkhoa_Logs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dvdkhoa.ldf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dvdkhoa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dvdkhoa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dvdkhoa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dvdkhoa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dvdkhoa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dvdkhoa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dvdkhoa] SET ARITHABORT OFF 
GO
ALTER DATABASE [dvdkhoa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dvdkhoa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dvdkhoa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dvdkhoa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dvdkhoa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dvdkhoa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dvdkhoa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dvdkhoa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dvdkhoa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dvdkhoa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dvdkhoa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dvdkhoa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dvdkhoa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dvdkhoa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dvdkhoa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dvdkhoa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dvdkhoa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dvdkhoa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dvdkhoa] SET  MULTI_USER 
GO
ALTER DATABASE [dvdkhoa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dvdkhoa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dvdkhoa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dvdkhoa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dvdkhoa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dvdkhoa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dvdkhoa] SET QUERY_STORE = OFF
GO
USE [dvdkhoa]
GO
/****** Object:  User [dvdkhoa_SQLLogin_2]    Script Date: 29/09/2023 6:35:38 CH ******/
CREATE USER [dvdkhoa_SQLLogin_2] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dvdkhoa_SQLLogin_2]
GO
/****** Object:  Schema [dvdkhoa_SQLLogin_2]    Script Date: 29/09/2023 6:35:38 CH ******/
CREATE SCHEMA [dvdkhoa_SQLLogin_2]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[CartId] [int] NOT NULL,
	[ProductId] [nvarchar](450) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProducPrice] [float] NOT NULL,
	[ProductImage] [nvarchar](max) NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_CartDetails] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
	[Icon] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryDetailedConfigs]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryDetailedConfigs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ConfigId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CategoryDetailedConfigs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classifications]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Classifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Dob] [datetime2](7) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailedConfigs]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailedConfigs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_DetailedConfigs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CustomerName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[PaymentMethod] [nvarchar](max) NULL,
	[TmpTotal] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[StaffId] [nvarchar](450) NOT NULL,
	[StoreId] [nvarchar](450) NOT NULL,
	[ShipStatus] [int] NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [nvarchar](450) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductClassifications]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductClassifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationId] [int] NOT NULL,
	[ProductId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ProductClassifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetailedConfigs]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetailedConfigs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [nvarchar](450) NOT NULL,
	[ConfigId] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductDetailedConfigs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [nvarchar](450) NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPromotions]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPromotions](
	[PromotionId] [int] NOT NULL,
	[ProductId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ProductPromotions] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[PromotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[PromotionPrice] [float] NULL,
	[Unit] [nvarchar](max) NULL,
	[Supplier] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Origin] [nvarchar](max) NULL,
	[Weight] [nvarchar](max) NULL,
	[Expiry] [datetime2](7) NULL,
	[ManufactoringDate] [datetime2](7) NULL,
	[CategoryId] [int] NULL,
	[Status] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductWareHouses]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductWareHouses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WareHouseId] [nvarchar](450) NOT NULL,
	[ProductId] [nvarchar](450) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProductWareHouses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Percent] [int] NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[PromotionType] [int] NOT NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptDetails]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptId] [int] NOT NULL,
	[ProductId] [nvarchar](450) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_ReceiptDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipts]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[Type] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[WareHouseId] [nvarchar](450) NOT NULL,
	[StaffId] [nvarchar](450) NOT NULL,
	[DestinationWarehouseId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Receipts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Gender] [int] NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[StartDay] [datetime2](7) NOT NULL,
	[WareHouseId] [nvarchar](450) NULL,
	[UserId] [nvarchar](450) NULL,
	[Status] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NOT NULL,
	[LastUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[testconnect]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testconnect](
	[demo] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WareHouses]    Script Date: 29/09/2023 6:35:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WareHouses](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreatedTime] [datetime2](7) NULL,
	[LastUpdated] [datetime2](7) NULL,
 CONSTRAINT [PK_WareHouses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230716072629_Init_luanvan', N'6.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230816114047_Add_CategoryConfigs', N'6.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230816142833_add_CategoryConfigs', N'6.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230829150007_Init_luanvanB2', N'6.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230902015904_add_order_to_ProductImage', N'6.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230903095853_allow_null_value_detailConfigs', N'6.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230904070946_Fix_name_CategoryDetailConfig', N'6.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230910090406_add_description_for_promotion', N'6.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230911063248_add_type_for_promotion', N'6.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230917082653_add_icon_to_category', N'6.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230919063738_add_productdetailedConfig', N'6.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230923143159_add_destinationWarehouseId_receipt', N'6.0.15')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (2, N'Thiết bị mạng', N'Đây là mô tả danh mục 3', CAST(N'2023-09-29T14:21:59.5339847' AS DateTime2), CAST(N'2023-09-29T14:21:59.5340180' AS DateTime2), 1, N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1695404699/luanvan/Categories/3b4958a5-ed18-4c19-8c09-2e124c24540c.png')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (3, N'Laptop', N'<div class="panel entry-content">
				

<h2 style="text-align: center;"><br></h2><div>
	<div id="stack-4036776903" class="stack hide-for-small stack-row justify-start items-start">
		
	<div class="img has-hover x md-x lg-x y md-y lg-y" id="image_145754721">
		<a class="" href="https://nguyenvu.store/zalo" target="_blank" rel="noopener noreferrer">						<div class="img-inner image-zoom dark">
			<noscript><img width="512" height="512" src="https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo.png" class="attachment-large size-large" alt="" decoding="async" srcset="https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo.png 512w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-510x510.png 510w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-100x100.png 100w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-96x96.png 96w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-150x150.png 150w" sizes="(max-width: 512px) 100vw, 512px" /></noscript>						
					</div>
						</a>		
<style>
#image_145754721 {
  width: 3%;
}
</style>
	</div>
	
	<div class="img has-hover x md-x lg-x y md-y lg-y" id="image_52957087">
		<a class="" href="https://nguyenvu.store/messenger" target="_blank" rel="noopener noreferrer">						<div class="img-inner image-zoom dark">
			<noscript><img width="512" height="512" src="https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png.webp" class="attachment-large size-large" alt="Fanpage Nguyễn Vũ Store Showroom" decoding="async" srcset="https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png.webp 512w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-510x510.webp 510w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-100x100.webp 100w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-96x96.webp 96w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-150x150.webp 150w" sizes="(max-width: 512px) 100vw, 512px" /></noscript>						
					</div>
						</a>		
<style>
#image_52957087 {
  width: 3%;
}
</style>
	</div>
	
		
<style>
#stack-4036776903 > * {
  --stack-gap: 0.75rem;
}
</style>
	</div>
	
	<div id="stack-2641597623" class="stack show-for-small stack-row justify-start items-start">
		
	<div class="img has-hover x md-x lg-x y md-y lg-y" id="image_752567141">
		<a class="" href="https://nguyenvu.store/zalo" target="_blank" rel="noopener noreferrer">						<div class="img-inner image-zoom dark">
			<noscript><img width="512" height="512" src="https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo.png" class="attachment-large size-large" alt="" decoding="async" srcset="https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo.png 512w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-510x510.png 510w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-100x100.png 100w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-96x96.png 96w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-150x150.png 150w" sizes="(max-width: 512px) 100vw, 512px" /></noscript>						
					</div>
						</a>		
<style>
#image_752567141 {
  width: 10%;
}
@media (min-width:550px) {
  #image_752567141 {
    width: 3%;
  }
}
</style>
	</div>
	
	<div class="img has-hover x md-x lg-x y md-y lg-y" id="image_1182577908">
		<a class="" href="https://nguyenvu.store/messenger" target="_blank" rel="noopener noreferrer">						<div class="img-inner image-zoom dark">
			<noscript><img width="512" height="512" src="https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png.webp" class="attachment-large size-large" alt="Fanpage Nguyễn Vũ Store Showroom" decoding="async" srcset="https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png.webp 512w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-510x510.webp 510w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-100x100.webp 100w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-96x96.webp 96w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-150x150.webp 150w" sizes="(max-width: 512px) 100vw, 512px" /></noscript>						
					</div>
						</a>		
<style>
#image_1182577908 {
  width: 10%;
}
@media (min-width:550px) {
  #image_1182577908 {
    width: 3%;
  }
}
</style>
	</div>
	
		
<style>
#stack-2641597623 > * {
  --stack-gap: 0.75rem;
}
</style>
	</div>
	
</div>
			</div>', CAST(N'2023-09-29T14:22:00.9062482' AS DateTime2), CAST(N'2023-09-29T14:22:00.9062498' AS DateTime2), 1, N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1695403514/luanvan/Categories/d7829fc8-67a9-4517-bf42-16d39a84cb62.png')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (4, N'Thẻ nhớ', NULL, CAST(N'2023-09-29T14:22:02.2459240' AS DateTime2), CAST(N'2023-09-29T14:22:02.2459270' AS DateTime2), 1, N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1695404637/luanvan/Categories/47b9937f-42b4-49aa-b7c3-0c101a93534c.png')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (5, N'Điện thoại', N'<h1 style="text-align: center;"><span style="background-color: rgb(255, 255, 255);"><font color="#000000" style=""><font face="Times New Roman"><span style="font-size: 1rem;">Đây là mô tả danh mục số 2</span></font><br><div style="text-align: left;"><img src="https://localhost:7055/Files/update_sach_b2.png" style="width: 50%; float: right;" class="note-float-right"><font face="Times New Roman"><span style="font-size: 16px;"><br></span></font></div></font></span></h1>', CAST(N'2023-09-29T14:22:03.9978003' AS DateTime2), CAST(N'2023-09-29T14:22:03.9978024' AS DateTime2), 1, N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1695404744/luanvan/Categories/219e30d4-f432-4e8d-9d31-800618d91035.png')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (7, N'Danh mục 1', N'Đây là mô tả danh mục 1', CAST(N'2023-09-29T14:22:06.0214834' AS DateTime2), CAST(N'2023-09-29T14:22:06.0214869' AS DateTime2), 1, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (8, N'PC(máy tính cá nhân)', N'Đây là mô tả của danh mục 4', CAST(N'2023-09-29T14:22:07.9012336' AS DateTime2), CAST(N'2023-09-29T14:22:07.9012364' AS DateTime2), 1, N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1695404769/luanvan/Categories/79c645a6-ed0b-4c80-aa0c-35d311199927.png')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (9, N'Test nè', N'<p>ádfasdf</p>', CAST(N'2023-09-29T14:22:10.0864337' AS DateTime2), CAST(N'2023-09-29T14:22:10.0864356' AS DateTime2), 1, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (10, N'Màn hình', N'<p><b><span style="font-size: 36px;">cái này là&nbsp;</span></b></p><p><br></p><p style="text-align: center; ">test&nbsp;</p><p><br></p><p><br></p><p style="text-align: right; "><font color="#000000" style="background-color: rgb(255, 255, 0);"><span style="font-size: 18px;">nè</span></font></p>', CAST(N'2023-09-29T14:22:12.1340875' AS DateTime2), CAST(N'2023-09-29T14:22:12.1340914' AS DateTime2), 1, N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1695404801/luanvan/Categories/ae78f558-83cb-4d1f-be54-971ab9d3929c.png')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (11, N'hello mấy cưng', N'<p><img src="https://localhost:7055/Files/update_sach_b2.png" style="width: 50%;"></p><p><br></p><p>yah</p>', CAST(N'2023-09-29T14:22:14.0380966' AS DateTime2), CAST(N'2023-09-29T14:22:14.0381102' AS DateTime2), 1, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (12, N'Tủ lạnh', NULL, CAST(N'2023-09-29T14:22:15.9062115' AS DateTime2), CAST(N'2023-09-29T14:22:15.9062143' AS DateTime2), 1, N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1695404833/luanvan/Categories/6e4fd740-3cd0-4332-b9c7-0cd01ea97e7a.png')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (13, N'Máy giặt', N'<p>ddd</p>', CAST(N'2023-09-29T14:22:18.7727989' AS DateTime2), CAST(N'2023-09-29T14:22:18.7728005' AS DateTime2), 1, N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1695404864/luanvan/Categories/c669d01f-d7f4-4972-8868-c29e33068808.png')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (14, N'Tivi', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1695404946/luanvan/Categories/ddc9c8fb-9983-4cbd-8490-31fa066c9613.png')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreatedTime], [LastUpdated], [Status], [Icon]) VALUES (15, N'Loa', N'<p>Loa</p>', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1695403581/luanvan/Categories/c79566c3-a359-4e5d-9328-2e1312eb38ae.png')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryDetailedConfigs] ON 

INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1021, 5, 4, 0, CAST(N'2023-09-18T19:45:42.7525982' AS DateTime2), CAST(N'2023-09-18T19:45:42.7525997' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1022, 5, 5, 0, CAST(N'2023-09-18T19:45:42.7526227' AS DateTime2), CAST(N'2023-09-18T19:45:42.7526229' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1023, 5, 6, 0, CAST(N'2023-09-18T19:45:42.7526456' AS DateTime2), CAST(N'2023-09-18T19:45:42.7526458' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1024, 3, 4, 0, CAST(N'2023-09-19T13:08:59.8456659' AS DateTime2), CAST(N'2023-09-19T13:08:59.8461309' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1025, 3, 5, 0, CAST(N'2023-09-19T13:08:59.8467771' AS DateTime2), CAST(N'2023-09-19T13:08:59.8467774' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1026, 3, 6, 0, CAST(N'2023-09-19T13:08:59.8467947' AS DateTime2), CAST(N'2023-09-19T13:08:59.8467948' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1029, 14, 4, 0, CAST(N'2023-09-21T17:13:00.6851996' AS DateTime2), CAST(N'2023-09-21T17:13:00.6852509' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1030, 3, 7, 0, CAST(N'2023-09-22T15:10:12.8347091' AS DateTime2), CAST(N'2023-09-22T15:10:12.8347473' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1031, 3, 8, 0, CAST(N'2023-09-22T15:10:12.8348927' AS DateTime2), CAST(N'2023-09-22T15:10:12.8348931' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1032, 3, 9, 0, CAST(N'2023-09-22T15:10:12.8349232' AS DateTime2), CAST(N'2023-09-22T15:10:12.8349234' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1033, 3, 10, 0, CAST(N'2023-09-22T15:10:12.8349631' AS DateTime2), CAST(N'2023-09-22T15:10:12.8349634' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1034, 3, 11, 0, CAST(N'2023-09-22T15:10:12.8349912' AS DateTime2), CAST(N'2023-09-22T15:10:12.8349914' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1035, 3, 12, 0, CAST(N'2023-09-22T15:10:12.8350073' AS DateTime2), CAST(N'2023-09-22T15:10:12.8350074' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1036, 3, 13, 0, CAST(N'2023-09-22T15:10:12.8350218' AS DateTime2), CAST(N'2023-09-22T15:10:12.8350219' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1037, 3, 14, 0, CAST(N'2023-09-22T15:10:12.8350338' AS DateTime2), CAST(N'2023-09-22T15:10:12.8350339' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (1038, 3, 15, 0, CAST(N'2023-09-22T15:10:12.8350470' AS DateTime2), CAST(N'2023-09-22T15:10:12.8350471' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (2027, 2, 4, 0, CAST(N'2023-09-24T14:26:30.9389730' AS DateTime2), CAST(N'2023-09-24T14:26:30.9390136' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (2028, 2, 5, 0, CAST(N'2023-09-24T14:26:30.9392054' AS DateTime2), CAST(N'2023-09-24T14:26:30.9392057' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (2029, 2, 6, 0, CAST(N'2023-09-24T14:26:30.9392264' AS DateTime2), CAST(N'2023-09-24T14:26:30.9392265' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (2030, 2, 7, 0, CAST(N'2023-09-24T14:26:30.9392540' AS DateTime2), CAST(N'2023-09-24T14:26:30.9392541' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (2031, 2, 8, 0, CAST(N'2023-09-24T14:26:30.9392714' AS DateTime2), CAST(N'2023-09-24T14:26:30.9392715' AS DateTime2))
INSERT [dbo].[CategoryDetailedConfigs] ([Id], [CategoryId], [ConfigId], [Status], [CreatedTime], [LastUpdated]) VALUES (2032, 2, 9, 0, CAST(N'2023-09-24T14:26:30.9392918' AS DateTime2), CAST(N'2023-09-24T14:26:30.9392919' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CategoryDetailedConfigs] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailedConfigs] ON 

INSERT [dbo].[DetailedConfigs] ([Id], [Name], [Status]) VALUES (4, N'Kích thước', 1)
INSERT [dbo].[DetailedConfigs] ([Id], [Name], [Status]) VALUES (5, N'Cân nặng', 1)
INSERT [dbo].[DetailedConfigs] ([Id], [Name], [Status]) VALUES (6, N'Bộ nhớ trong', 1)
INSERT [dbo].[DetailedConfigs] ([Id], [Name], [Status]) VALUES (7, N'Ram', 1)
INSERT [dbo].[DetailedConfigs] ([Id], [Name], [Status]) VALUES (8, N'Màn hình', 1)
INSERT [dbo].[DetailedConfigs] ([Id], [Name], [Status]) VALUES (9, N'Âm thanh', 1)
INSERT [dbo].[DetailedConfigs] ([Id], [Name], [Status]) VALUES (10, N'Tấm nền', 1)
INSERT [dbo].[DetailedConfigs] ([Id], [Name], [Status]) VALUES (11, N'Tần số quét', 1)
INSERT [dbo].[DetailedConfigs] ([Id], [Name], [Status]) VALUES (12, N'Ổ cứng', 1)
INSERT [dbo].[DetailedConfigs] ([Id], [Name], [Status]) VALUES (13, N'Cổng kết nối', 1)
INSERT [dbo].[DetailedConfigs] ([Id], [Name], [Status]) VALUES (14, N'Pin', 1)
INSERT [dbo].[DetailedConfigs] ([Id], [Name], [Status]) VALUES (15, N'Màu sắc', 1)
SET IDENTITY_INSERT [dbo].[DetailedConfigs] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Image], [Content], [CreatedTime], [LastUpdated], [Status]) VALUES (1, N'bang', N'aaaa1111', N'aaaa', CAST(N'1000-01-01T00:00:00.0000000' AS DateTime2), CAST(N'1000-01-01T00:00:00.0000000' AS DateTime2), 2)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetailedConfigs] ON 

INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1, N'11111111', 4, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">17.67 x 314.00 x 226.60 mm</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (2, N'11111111', 5, N'<br>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (3, N'11111111', 6, N'<p><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (6, N'11111111', 7, N'<span style="color: rgb(0, 0, 0); font-family: Quicksand;">16GB LPDDR5 4800Mhz</span>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (7, N'11111111', 8, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">Anti-Glare, LED-Backlit, Non-Touch, WVA</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (8, N'11111111', 9, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">Dolby Atmos, Waves MaxxAudio® Pro</span></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (9, N'11111111', 10, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">IPS</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (10, N'11111111', 11, N'<p>120Hz<br><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (11, N'11111111', 12, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">1TB</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (12, N'11111111', 13, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">1 x Headset Jack, 1 x SD Card Reader, 1 x Thunderbolt 4 (Type-C / USB 4 / DP 1.4a), 1x HDMI 1.4, 2 x USB 3.2 Gen 1</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (13, N'11111111', 14, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">4 Cell, 64 Wh</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (14, N'11111111', 15, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">Bạc</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1002, N'bzz', 4, N'<p>ac</p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1003, N'bzz', 5, NULL)
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1004, N'bzz', 6, NULL)
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1005, N'bzz', 7, NULL)
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1006, N'bzz', 8, NULL)
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1007, N'bzz', 9, NULL)
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1008, N'h', 4, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">13.3 Inch</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1009, N'h', 5, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">0.99 Kg</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1010, N'h', 6, NULL)
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1011, N'h', 7, N'<span style="color: rgb(0, 0, 0); font-family: Quicksand;">16GB (8×2) LPDDR5 4800MHz Onboard</span><br>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1012, N'h', 8, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">Tỉ lệ 16:10</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1013, N'h', 9, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">2 x 2W Speaker</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1014, N'h', 10, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">IPS</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1015, N'h', 11, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">60Hz</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1016, N'h', 12, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">1 TB SSD NVMe PCIe Gen 4</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1017, N'h', 13, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">2x Type-C (USB / DP / Thunderbolt™ 4) with PD charging</span><br style="font-family: Quicksand; color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0); font-family: Quicksand;">1x Type-A USB 3.2 Gen2</span><br style="font-family: Quicksand; color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0); font-family: Quicksand;">1x HDMI™ 2.1 (4K @ 60Hz)</span><br style="font-family: Quicksand; color: rgb(0, 0, 0);"><span style="color: rgb(0, 0, 0); font-family: Quicksand;">1x Mic-in/Headphone-out Combo Jack</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1018, N'h', 14, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">4 Cell 75 Whr</span><br></p>')
INSERT [dbo].[ProductDetailedConfigs] ([Id], [ProductId], [ConfigId], [Value]) VALUES (1019, N'h', 15, N'<p><span style="color: rgb(0, 0, 0); font-family: Quicksand;">Xám</span><br></p>')
SET IDENTITY_INSERT [dbo].[ProductDetailedConfigs] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (1, N'ádfsadf', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1693323848/luanvan/ádfsadf/c3ee8cc4-d8f1-429a-bac1-2ef0d8542bc3.jpg', NULL, CAST(N'2023-08-29T22:44:10.1265488' AS DateTime2), CAST(N'2023-08-29T22:44:10.1266118' AS DateTime2), 1, 2)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (2, N'ádfsadf', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1693323851/luanvan/ádfsadf/27448476-1dcf-448f-bf94-d524ec2303ef.jpg', NULL, CAST(N'2023-08-29T22:44:12.5552617' AS DateTime2), CAST(N'2023-08-29T22:44:12.5552628' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (3, N'h', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694680944/luanvan/h/70fbc3ed-8b68-4ba8-91e3-5b5fb53b9cce.png', NULL, CAST(N'2023-09-14T15:42:27.0997206' AS DateTime2), CAST(N'2023-09-14T15:42:27.0997519' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (4, N'h', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694680946/luanvan/h/8ae2df37-50b8-4e5e-8e4e-918bd03d7cf5.png', NULL, CAST(N'2023-09-14T15:42:29.2619243' AS DateTime2), CAST(N'2023-09-14T15:42:29.2619257' AS DateTime2), 1, 2)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (5, N'h', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694680947/luanvan/h/e3d446ab-1afb-4264-9d06-530d236bc466.png', NULL, CAST(N'2023-09-14T15:42:30.1684834' AS DateTime2), CAST(N'2023-09-14T15:42:30.1684847' AS DateTime2), 1, 3)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (6, N'h', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694680948/luanvan/h/0ae13358-3d13-49a8-9f54-2357af8179e6.png', NULL, CAST(N'2023-09-14T15:42:31.2056178' AS DateTime2), CAST(N'2023-09-14T15:42:31.2056189' AS DateTime2), 1, 4)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (7, N'h', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694680949/luanvan/h/d0e84eaf-d26e-46f9-8fdb-8402a22fdf66.png', NULL, CAST(N'2023-09-14T15:42:31.9527790' AS DateTime2), CAST(N'2023-09-14T15:42:31.9527801' AS DateTime2), 1, 5)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (8, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694681786/luanvan/11111111/068dbd34-334c-4c1a-9eda-46000cc7e51f.png', NULL, CAST(N'2023-09-14T15:56:29.1002053' AS DateTime2), CAST(N'2023-09-14T15:56:29.1002066' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (9, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694681790/luanvan/11111111/021c3675-80b6-472d-acb6-9ea8ce039a78.png', NULL, CAST(N'2023-09-14T15:56:32.9062826' AS DateTime2), CAST(N'2023-09-14T15:56:32.9062842' AS DateTime2), 1, 2)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (10, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694681795/luanvan/11111111/e1df7944-0a9f-4d7b-9429-c505b9e87a64.png', NULL, CAST(N'2023-09-14T15:56:37.9193121' AS DateTime2), CAST(N'2023-09-14T15:56:37.9193137' AS DateTime2), 1, 3)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (11, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694681797/luanvan/11111111/d1f792b8-5a41-40e9-9701-17479c854b9d.png', NULL, CAST(N'2023-09-14T15:56:39.4544514' AS DateTime2), CAST(N'2023-09-14T15:56:39.4544530' AS DateTime2), 1, 4)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (12, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694681799/luanvan/11111111/b59d6274-9138-4241-ad31-097eb64621f5.png', NULL, CAST(N'2023-09-14T15:56:41.9101847' AS DateTime2), CAST(N'2023-09-14T15:56:41.9101867' AS DateTime2), 1, 5)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (13, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694682503/luanvan/11111111/9faa834c-8a3e-4005-b232-c60488d3dd93.png', NULL, CAST(N'2023-09-14T16:08:26.4686839' AS DateTime2), CAST(N'2023-09-14T16:08:26.4690905' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (14, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694682520/luanvan/11111111/8821085d-694c-41c8-bec8-0192ec3cafc0.png', NULL, CAST(N'2023-09-14T16:08:43.1697904' AS DateTime2), CAST(N'2023-09-14T16:08:43.1697929' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (15, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694682528/luanvan/11111111/1e48bdca-7d1c-47e4-af68-bf0fe3e833b9.png', NULL, CAST(N'2023-09-14T16:08:51.5283950' AS DateTime2), CAST(N'2023-09-14T16:08:51.5283998' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (16, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694682622/luanvan/11111111/cdf0b56b-8d64-4318-9c5d-e0354f26ed75.png', NULL, CAST(N'2023-09-14T16:10:25.2041655' AS DateTime2), CAST(N'2023-09-14T16:10:25.2041670' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (17, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694682752/luanvan/11111111/6ac972ad-b54a-4de0-b9f5-aaff5335a0b0.png', NULL, CAST(N'2023-09-14T16:12:35.2943427' AS DateTime2), CAST(N'2023-09-14T16:12:35.2943442' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (18, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694682989/luanvan/11111111/9cef22a7-8dda-4b0d-a7fe-d23dc3de2a48.png', NULL, CAST(N'2023-09-14T16:16:31.6069324' AS DateTime2), CAST(N'2023-09-14T16:16:31.6069360' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (19, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694683005/luanvan/11111111/1a3d64b2-57fe-44a6-a393-a0c42047bb88.png', NULL, CAST(N'2023-09-14T16:16:48.0094295' AS DateTime2), CAST(N'2023-09-14T16:16:48.0094310' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (20, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694683025/luanvan/11111111/176ad8a7-2440-4b6d-9b82-32e7505e8007.png', NULL, CAST(N'2023-09-14T16:17:07.9298847' AS DateTime2), CAST(N'2023-09-14T16:17:07.9298871' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (21, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694683041/luanvan/11111111/f492f33c-c6b5-4120-bc8f-b07b0a2a11b2.png', NULL, CAST(N'2023-09-14T16:17:23.6905130' AS DateTime2), CAST(N'2023-09-14T16:17:23.6905143' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (22, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694683053/luanvan/11111111/7ed783fd-277d-4e24-a24c-ed6096924c05.png', NULL, CAST(N'2023-09-14T16:17:36.1861065' AS DateTime2), CAST(N'2023-09-14T16:17:36.1861079' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (23, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694683174/luanvan/11111111/37623d1a-7a8a-4138-9080-175f947bc2d8.png', NULL, CAST(N'2023-09-14T16:19:37.3763995' AS DateTime2), CAST(N'2023-09-14T16:19:37.3764010' AS DateTime2), 1, 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (24, N'11111111', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694683178/luanvan/11111111/f235d3ff-4a9c-4ce2-9141-5259eca6a287.png', NULL, CAST(N'2023-09-14T16:19:40.9796846' AS DateTime2), CAST(N'2023-09-14T16:19:40.9796866' AS DateTime2), 1, 2)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (25, N'h', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694699864/luanvan/h/bc03af5f-4d9f-41ac-bbc1-57346aa70bef.png', NULL, CAST(N'2023-09-14T20:57:47.3971126' AS DateTime2), CAST(N'2023-09-14T20:57:47.3971463' AS DateTime2), 1, 6)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (26, N'h', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694699868/luanvan/h/2921b75d-b379-4019-8b0c-135339924760.png', NULL, CAST(N'2023-09-14T20:57:51.4504177' AS DateTime2), CAST(N'2023-09-14T20:57:51.4504194' AS DateTime2), 1, 7)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (27, N'h', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694699869/luanvan/h/fd026cc3-7798-452f-a597-d9279c854b00.png', NULL, CAST(N'2023-09-14T20:57:52.0986298' AS DateTime2), CAST(N'2023-09-14T20:57:52.0986314' AS DateTime2), 1, 8)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (28, N'h', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694701060/luanvan/h/38c10cea-01f3-4b13-9471-ca94f1cb0754.png', NULL, CAST(N'2023-09-14T21:17:43.4992227' AS DateTime2), CAST(N'2023-09-14T21:17:43.4992686' AS DateTime2), 1, 9)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Path], [Description], [CreatedTime], [LastUpdated], [Status], [Order]) VALUES (29, N'h', N'http://res.cloudinary.com/dqkpxkmip/image/upload/v1694701065/luanvan/h/1f3dc85d-00b8-4b30-9b7d-870e03a5ef6c.png', NULL, CAST(N'2023-09-14T21:17:47.6261403' AS DateTime2), CAST(N'2023-09-14T21:17:47.6261415' AS DateTime2), 1, 10)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
INSERT [dbo].[ProductPromotions] ([PromotionId], [ProductId]) VALUES (6, N'11111111')
INSERT [dbo].[ProductPromotions] ([PromotionId], [ProductId]) VALUES (6, N'azz')
INSERT [dbo].[ProductPromotions] ([PromotionId], [ProductId]) VALUES (6, N'bzz')
INSERT [dbo].[ProductPromotions] ([PromotionId], [ProductId]) VALUES (8, N'11111111')
INSERT [dbo].[ProductPromotions] ([PromotionId], [ProductId]) VALUES (8, N'azz')
INSERT [dbo].[ProductPromotions] ([PromotionId], [ProductId]) VALUES (8, N'g')
INSERT [dbo].[ProductPromotions] ([PromotionId], [ProductId]) VALUES (8, N'hihi')
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'0', N'1', N'1', 1, NULL, N'1', N'1', NULL, NULL, NULL, NULL, NULL, 7, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'11111111', N'Laptop Dell Inspiron 14 5430 71015633 (i7-1360P | 16GB | 1TB | RTX 2050 | 14″ 2,5K 120Hz | Win 11)', N'<div class="panel entry-content">
				

<h2 style="text-align: center;">Laptop Dell Inspiron 14 5430 71015633</h2>
<h3>Sản phẩm Laptop Mạnh Mẽ và Tiện Lợi</h3>
<p>Bạn đang tìm kiếm một chiếc laptop mạnh mẽ, đẹp mắt và tiện lợi? Hãy cùng chúng tôi khám phá Dell Inspiron 14 5430 71015633 – một sản phẩm laptop đỉnh cao với các tính năng ấn tượng.</p>
<p><img decoding="async" fetchpriority="high" class="alignnone size-full wp-image-160156 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-08.webp" alt="" width="900" height="450" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-08.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-08-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-08-850x425.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-08.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-08.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-08-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-08-850x425.webp 850w"><noscript><img decoding="async" fetchpriority="high" class="alignnone size-full wp-image-160156" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-08.webp" alt="" width="900" height="450" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-08.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-08-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-08-850x425.webp 850w" sizes="(max-width: 900px) 100vw, 900px" /></noscript></p>
<h4><strong>Thông số kỹ thuật</strong></h4>
<ul>
<li><strong>Bộ vi xử lý</strong>: Được trang bị bộ vi xử lý Intel® Core™ i7-1360P thế hệ 13, với 12 nhân, 16 luồng và tốc độ Turbo lên đến 5.00 GHz. Sự mạnh mẽ và đa nhiệm không bao giờ là vấn đề.</li>
<li><strong>Hệ điều hành</strong>: Sử dụng Windows 11 Pro, hỗ trợ nhiều ngôn ngữ như tiếng Anh, tiếng Pháp và tiếng Tây Ban Nha, giúp bạn dễ dàng sử dụng theo ngôn ngữ ưa thích.</li>
<li><strong>Card đồ họa</strong>: Hệ thống đồ họa Intel® Iris® Xe sẽ mang đến trải nghiệm hình ảnh tuyệt vời cho các ứng dụng và trò chơi.</li>
<li><strong>Màn hình</strong>: Với màn hình 14 inch 2.5K (2560×1600) Anti-Glare NonTouch và công nghệ ComfortView Plus Support, bạn sẽ có trải nghiệm xem hình ảnh sắc nét và thoải mái cho mắt.</li>
<li><strong>Bộ nhớ</strong>: 16 GB LPDDR5 với tốc độ 4800 MT/s tích hợp sẵn, đảm bảo máy luôn hoạt động mượt mà.</li>
<li><strong>Ổ cứng</strong>: Dung lượng lớn 1 TB SSD M.2 PCIe NVMe giúp bạn lưu trữ dữ liệu và ứng dụng một cách dễ dàng.</li>
<li><strong>Thiết kế</strong>: Với màu sắc sang trọng Platinum Silver và vỏ ngoài bằng nhôm, Dell Inspiron 14 5430 71015633 không chỉ mạnh mẽ mà còn lịch lãm.</li>
</ul>
<h4><strong>Chức năng bảo mật và hỗ trợ</strong></h4>
<ul>
<li>Được tích hợp cùng máy là bản dùng thử 30 ngày của McAfee® LiveSafe™, giúp bảo vệ dữ liệu và quyền riêng tư của bạn.</li>
<li>Hỗ trợ bảo hành cơ bản 1 năm tại nơi sử dụng với hỗ trợ phần cứng đảm bảo bạn luôn có sự an tâm khi sử dụng sản phẩm này.</li>
</ul>
<p><img decoding="async" class="alignnone size-full wp-image-160163 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-07.webp" alt="" width="900" height="450" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-07.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-07-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-07-850x425.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-07.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-07.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-07-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-07-850x425.webp 850w"><noscript><img decoding="async" class="alignnone size-full wp-image-160163" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-07.webp" alt="" width="900" height="450" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-07.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-07-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-07-850x425.webp 850w" sizes="(max-width: 900px) 100vw, 900px" /></noscript></p>
<h4><strong>Kết nối và tiện ích</strong></h4>
<ul>
<li>Laptop Dell Inspiron 14 5430 71015633 được trang bị nhiều cổng kết nối như 2 cổng USB 3.2 Gen 1, 1 cổng Thunderbolt™ 4 hỗ trợ DisplayPort™ và Power Delivery, 1 cổng HDMI 1.4, 1 cổng Universal Audio Jack, và 1 cổng Power-adapter port.</li>
<li>Bên cạnh đó, bạn cũng có 1 khe cắm thẻ SD-card để dễ dàng truy cập và chia sẻ dữ liệu.</li>
</ul>
<p><img decoding="async" class="alignnone size-full wp-image-160162 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-06.webp" alt="" width="900" height="450" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-06.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-06-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-06-850x425.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-06.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-06.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-06-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-06-850x425.webp 850w"><noscript><img decoding="async" class="alignnone size-full wp-image-160162" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-06.webp" alt="" width="900" height="450" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-06.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-06-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-06-850x425.webp 850w" sizes="(max-width: 900px) 100vw, 900px" /></noscript></p>
<h4><strong>Kích thước và trọng lượng</strong></h4>
<ul>
<li>Khi nói đến di động, Dell Inspiron 14 5430 71015633 là sự lựa chọn hoàn hảo với kích thước nhỏ gọn: chiều cao (phía trước) 15.74 mm, chiều cao (phía sau) 17.67 mm, rộng 314.00 mm và chiều dài 226.60 mm. Trọng lượng tối thiểu chỉ 1.531 kg, giúp bạn dễ dàng mang theo bất kỳ đâu.</li>
</ul>
<p><img decoding="async" class="alignnone size-full wp-image-160157 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-09.webp" alt="" width="900" height="450" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-09.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-09-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-09-850x425.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-09.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-09.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-09-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-09-850x425.webp 850w"><noscript><img decoding="async" class="alignnone size-full wp-image-160157" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-09.webp" alt="" width="900" height="450" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-09.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-09-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-09-850x425.webp 850w" sizes="(max-width: 900px) 100vw, 900px" /></noscript></p>
<h4><strong>Âm thanh và loa</strong></h4>
<ul>
<li>Hệ thống loa stereo Upfiring với công nghệ Waves MaxxAudio® Pro và Dolby Atmos Core mang đến âm thanh sống động với tổng công suất lên đến 5W (dành cho các phiên bản được trang bị loa Upfiring).</li>
</ul>
<p><img decoding="async" class="alignnone size-full wp-image-160160 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-03.webp" alt="" width="900" height="450" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-03.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-03-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-03-850x425.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-03.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-03.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-03-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-03-850x425.webp 850w"><noscript><img decoding="async" class="alignnone size-full wp-image-160160" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-03.webp" alt="" width="900" height="450" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-03.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-03-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-03-850x425.webp 850w" sizes="(max-width: 900px) 100vw, 900px" /></noscript></p>
<h4><strong>Kết nối không dây và pin</strong></h4>
<ul>
<li>Sản phẩm hỗ trợ kết nối không dây với Intel® Wi-Fi 6E AX211, Bluetooth® wireless card, giúp bạn duyệt web và kết nối mạng một cách nhanh chóng.</li>
<li>Pin tích hợp 4 Cell với dung lượng 64 Wh, giúp bạn sử dụng máy lâu dài mà không cần lo lắng về thời gian sạc.</li>
</ul>
<p><img decoding="async" class="alignnone size-full wp-image-160158 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-01.webp" alt="" width="900" height="450" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-01.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-01-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-01-850x425.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-01.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-01.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-01-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-01-850x425.webp 850w"><noscript><img decoding="async" class="alignnone size-full wp-image-160158" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-01.webp" alt="" width="900" height="450" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-01.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-01-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-01-850x425.webp 850w" sizes="(max-width: 900px) 100vw, 900px" /></noscript></p>
<h4><strong>Nâng cao bảo vệ môi trường</strong></h4>
<ul>
<li>Dell Inspiron 14 5430 71015633 tuân thủ các tiêu chuẩn bảo vệ môi trường như Energy Star 8.0 và Dell Regulatory Compliance, giúp đảm bảo sản phẩm này không chỉ mạnh mẽ mà còn thân thiện với môi trường.</li>
</ul>
<p><img decoding="async" class="alignnone size-full wp-image-160159 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-02.webp" alt="" width="900" height="450" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-02.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-02-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-02-850x425.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-02.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-02.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-02-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-02-850x425.webp 850w"><noscript><img decoding="async" class="alignnone size-full wp-image-160159" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-02.webp" alt="" width="900" height="450" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-02.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-02-768x384.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-dell-inspiron-14-5430-71015633-02-850x425.webp 850w" sizes="(max-width: 900px) 100vw, 900px" /></noscript></p>
<div>
<h4><div class="is-divider divider clearfix"></div></h4>
<h4>Mua&nbsp; ngay Laptop Dell chính hãng giá rẻ tại Nguyễn Vũ Store. Hỗ trợ trả góp, giao hàng toàn quốc, bảo hành chính hãng 12 tháng.</h4>
	<div id="stack-4036776903" class="stack hide-for-small stack-row justify-start items-start">
		
	<div class="img has-hover x md-x lg-x y md-y lg-y" id="image_145754721">
		<a class="" href="https://nguyenvu.store/zalo" target="_blank" rel="noopener noreferrer">						<div class="img-inner image-zoom dark">
			<noscript><img width="512" height="512" src="https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo.png" class="attachment-large size-large" alt="" decoding="async" srcset="https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo.png 512w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-510x510.png 510w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-100x100.png 100w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-96x96.png 96w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-150x150.png 150w" sizes="(max-width: 512px) 100vw, 512px" /></noscript>						
					</div>
						</a>		
<style>
#image_145754721 {
  width: 3%;
}
</style>
	</div>
	
	<div class="img has-hover x md-x lg-x y md-y lg-y" id="image_52957087">
		<a class="" href="https://nguyenvu.store/messenger" target="_blank" rel="noopener noreferrer">						<div class="img-inner image-zoom dark">
			<noscript><img width="512" height="512" src="https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png.webp" class="attachment-large size-large" alt="Fanpage Nguyễn Vũ Store Showroom" decoding="async" srcset="https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png.webp 512w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-510x510.webp 510w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-100x100.webp 100w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-96x96.webp 96w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-150x150.webp 150w" sizes="(max-width: 512px) 100vw, 512px" /></noscript>						
					</div>
						</a>		
<style>
#image_52957087 {
  width: 3%;
}
</style>
	</div>
	
		
<style>
#stack-4036776903 > * {
  --stack-gap: 0.75rem;
}
</style>
	</div>
	
	<div id="stack-2641597623" class="stack show-for-small stack-row justify-start items-start">
		
	<div class="img has-hover x md-x lg-x y md-y lg-y" id="image_752567141">
		<a class="" href="https://nguyenvu.store/zalo" target="_blank" rel="noopener noreferrer">						<div class="img-inner image-zoom dark">
			<noscript><img width="512" height="512" src="https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo.png" class="attachment-large size-large" alt="" decoding="async" srcset="https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo.png 512w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-510x510.png 510w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-100x100.png 100w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-96x96.png 96w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-150x150.png 150w" sizes="(max-width: 512px) 100vw, 512px" /></noscript>						
					</div>
						</a>		
<style>
#image_752567141 {
  width: 10%;
}
@media (min-width:550px) {
  #image_752567141 {
    width: 3%;
  }
}
</style>
	</div>
	
	<div class="img has-hover x md-x lg-x y md-y lg-y" id="image_1182577908">
		<a class="" href="https://nguyenvu.store/messenger" target="_blank" rel="noopener noreferrer">						<div class="img-inner image-zoom dark">
			<noscript><img width="512" height="512" src="https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png.webp" class="attachment-large size-large" alt="Fanpage Nguyễn Vũ Store Showroom" decoding="async" srcset="https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png.webp 512w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-510x510.webp 510w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-100x100.webp 100w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-96x96.webp 96w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-150x150.webp 150w" sizes="(max-width: 512px) 100vw, 512px" /></noscript>						
					</div>
						</a>		
<style>
#image_1182577908 {
  width: 10%;
}
@media (min-width:550px) {
  #image_1182577908 {
    width: 3%;
  }
}
</style>
	</div>
	
		
<style>
#stack-2641597623 > * {
  --stack-gap: 0.75rem;
}
</style>
	</div>
	
</div>
			</div>', 28990000, NULL, NULL, N'Dell', NULL, NULL, NULL, NULL, NULL, 3, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-22T15:17:22.0675104' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'ádffdfdfdf11', N'455', NULL, 5555, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'ádfsadf', N'ádfsdf', NULL, 7777, 777.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-11T13:59:55.4699800' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'azz', N'Laptop HP Pavilion 14-dv2077TU 7C0W3PA (i5-1235U | 8GB | 256GB | Intel Iris Xe Graphics | 14″ FHD | Win 11)', N'<div class="panel entry-content">
				

<h2 style="text-align: center;">Laptop HP Pavilion 14-dv2077TU 7C0W3PA</h2>
<h4><strong>Hệ điều hành và Hiệu năng</strong></h4>
<p>Laptop HP Pavilion 14-dv2077TU được trang bị hệ điều hành Windows 11 Home, mang đến trải nghiệm người dùng mượt mà và tiện lợi. Với bộ vi xử lý Intel® Core™ i5-1235U, laptop này có khả năng xử lý đa nhiệm tốt nhờ công nghệ Intel® Turbo Boost Technology, đạt tốc độ lên đến 4.4 GHz. Với 10 nhân và 12 luồng, bạn có thể dễ dàng thực hiện nhiều tác vụ cùng lúc mà không gặp trở ngại.</p>
<p><img decoding="async" fetchpriority="high" class="alignnone size-full wp-image-160207 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-01.webp" alt="" width="800" height="600" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-01.webp 800w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-01-768x576.webp 768w" data-lazy-sizes="(max-width: 800px) 100vw, 800px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-01.webp" data-ll-status="loaded" sizes="(max-width: 800px) 100vw, 800px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-01.webp 800w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-01-768x576.webp 768w"><noscript><img decoding="async" fetchpriority="high" class="alignnone size-full wp-image-160207" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-01.webp" alt="" width="800" height="600" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-01.webp 800w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-01-768x576.webp 768w" sizes="(max-width: 800px) 100vw, 800px" /></noscript></p>
<h4><strong>Hiển thị và Đồ họa</strong></h4>
<p>Màn hình 35.6 cm (14) FHD (1920 x 1080) IPS với công nghệ BrightView mang lại hình ảnh sắc nét với độ sáng 250 nits và khả năng tái tạo màu sắc 45% NTSC. Điều này đảm bảo bạn có trải nghiệm giải trí tốt nhất và làm việc hiệu quả hơn. Ngoài ra, với bộ xử lý đồ họa Intel® Iris® Xᵉ, bạn có thể thưởng thức các tác phẩm đồ họa và chơi game mượt mà.</p>
<p><img decoding="async" class="alignnone size-full wp-image-160209 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03.webp" alt="" width="1600" height="1200" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03.webp 1600w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03-768x576.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03-1536x1152.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03-850x638.webp 850w" data-lazy-sizes="(max-width: 1600px) 100vw, 1600px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03.webp" data-ll-status="loaded" sizes="(max-width: 1600px) 100vw, 1600px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03.webp 1600w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03-768x576.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03-1536x1152.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03-850x638.webp 850w"><noscript><img decoding="async" class="alignnone size-full wp-image-160209" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03.webp" alt="" width="1600" height="1200" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03.webp 1600w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03-768x576.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03-1536x1152.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-03-850x638.webp 850w" sizes="(max-width: 1600px) 100vw, 1600px" /></noscript></p>
<h4><strong>Bộ nhớ và Lưu trữ</strong></h4>
<p>Laptop này đi kèm với 8GB bộ nhớ DDR4-3200 MHz RAM và 256GB ổ cứng SSD PCIe® NVMe™ M.2. Điều này đảm bảo bạn có không gian lưu trữ đủ lớn để lưu trữ dữ liệu quan trọng và khởi động ứng dụng nhanh chóng.</p>
<h4><strong>Kết nối và Cổng kết nối</strong></h4>
<p>HP Pavilion 14-dv2077TU cung cấp nhiều cổng kết nối, bao gồm 1 cổng USB Type-C® SuperSpeed 10Gbps, 2 cổng USB Type-A SuperSpeed 5Gbps, 1 cổng HDMI 2.1, 1 cổng AC smart pin và 1 cổng tai nghe/microphone combo. Điều này giúp bạn dễ dàng kết nối với các thiết bị ngoại vi và màn hình ngoại vi.</p>
<p><img decoding="async" class="alignnone size-full wp-image-160208 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-02.webp" alt="" width="800" height="600" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-02.webp 800w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-02-768x576.webp 768w" data-lazy-sizes="(max-width: 800px) 100vw, 800px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-02.webp" data-ll-status="loaded" sizes="(max-width: 800px) 100vw, 800px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-02.webp 800w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-02-768x576.webp 768w"><noscript><img decoding="async" class="alignnone size-full wp-image-160208" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-02.webp" alt="" width="800" height="600" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-02.webp 800w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-02-768x576.webp 768w" sizes="(max-width: 800px) 100vw, 800px" /></noscript></p>
<h4><strong>Âm thanh và Camera</strong></h4>
<p>Với âm thanh được tinh chỉnh bởi B&amp;O và hỗ trợ HP Audio Boost, laptop này cung cấp trải nghiệm âm thanh sống động và rõ ràng. Webcam HP Wide Vision 720p HD với công nghệ giảm tiếng ồn và hai microphone số hóa giúp bạn thực hiện cuộc gọi video chất lượng cao.</p>
<p><img decoding="async" class="alignnone size-full wp-image-160210 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04.webp" alt="" width="1600" height="1200" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04.webp 1600w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04-768x576.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04-1536x1152.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04-850x638.webp 850w" data-lazy-sizes="(max-width: 1600px) 100vw, 1600px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04.webp" data-ll-status="loaded" sizes="(max-width: 1600px) 100vw, 1600px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04.webp 1600w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04-768x576.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04-1536x1152.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04-850x638.webp 850w"><noscript><img decoding="async" class="alignnone size-full wp-image-160210" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04.webp" alt="" width="1600" height="1200" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04.webp 1600w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04-768x576.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04-1536x1152.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-04-850x638.webp 850w" sizes="(max-width: 1600px) 100vw, 1600px" /></noscript></p>
<h4><strong>Thiết kế và Trọng lượng</strong></h4>
<p>Laptop HP Pavilion 14-dv2077TU có thiết kế tinh tế với màu sắc tự nhiên bạc và vỏ máy được xử lý cát, tạo nên vẻ đẹp sang trọng và hiện đại. Với kích thước nhỏ gọn 32.5 x 21.66 x 1.7 cm và trọng lượng chỉ 1.41 kg, bạn có thể dễ dàng mang theo laptop này khi di chuyển.</p>
<p><img decoding="async" class="alignnone size-full wp-image-160211 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05.webp" alt="" width="1600" height="1200" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05.webp 1600w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05-768x576.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05-1536x1152.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05-850x638.webp 850w" data-lazy-sizes="(max-width: 1600px) 100vw, 1600px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05.webp" data-ll-status="loaded" sizes="(max-width: 1600px) 100vw, 1600px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05.webp 1600w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05-768x576.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05-1536x1152.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05-850x638.webp 850w"><noscript><img decoding="async" class="alignnone size-full wp-image-160211" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05.webp" alt="" width="1600" height="1200" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05.webp 1600w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05-768x576.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05-1536x1152.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-05-850x638.webp 850w" sizes="(max-width: 1600px) 100vw, 1600px" /></noscript></p>
<h4><strong>Bảo mật và Phần mềm</strong></h4>
<p>Sản phẩm được trang bị hỗ trợ Trusted Platform Module (Firmware TPM) để bảo vệ dữ liệu cá nhân và thông tin quan trọng của bạn. Ngoài ra, laptop đi kèm với phần mềm McAfee LiveSafe™, cung cấp sự bảo vệ trực tuyến cho thiết bị của bạn.</p>
<p><img decoding="async" class="alignnone size-full wp-image-160212 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06.webp" alt="" width="1600" height="1200" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06.webp 1600w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06-768x576.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06-1536x1152.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06-850x638.webp 850w" data-lazy-sizes="(max-width: 1600px) 100vw, 1600px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06.webp" data-ll-status="loaded" sizes="(max-width: 1600px) 100vw, 1600px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06.webp 1600w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06-768x576.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06-1536x1152.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06-850x638.webp 850w"><noscript><img decoding="async" class="alignnone size-full wp-image-160212" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06.webp" alt="" width="1600" height="1200" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06.webp 1600w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06-768x576.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06-1536x1152.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-hp-pavilion-14-dv2077tu-7c0w3pa-06-850x638.webp 850w" sizes="(max-width: 1600px) 100vw, 1600px" /></noscript></p>
<div>
<h4><div class="is-divider divider clearfix"></div></h4>
<h4>Mua&nbsp; ngay Laptop HP chính hãng giá rẻ tại Nguyễn Vũ Store. Hỗ trợ trả góp, giao hàng toàn quốc, bảo hành chính hãng 12 tháng.</h4>
	<div id="stack-341552646" class="stack hide-for-small stack-row justify-start items-start">
		
	<div class="img has-hover x md-x lg-x y md-y lg-y" id="image_2027928791">
		<a class="" href="https://nguyenvu.store/zalo" target="_blank" rel="noopener noreferrer">						<div class="img-inner image-zoom dark">
			<noscript><img width="512" height="512" src="https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo.png" class="attachment-large size-large" alt="" decoding="async" srcset="https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo.png 512w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-510x510.png 510w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-100x100.png 100w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-96x96.png 96w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-150x150.png 150w" sizes="(max-width: 512px) 100vw, 512px" /></noscript>						
					</div>
						</a>		
<style>
#image_2027928791 {
  width: 3%;
}
</style>
	</div>
	
	<div class="img has-hover x md-x lg-x y md-y lg-y" id="image_1860850199">
		<a class="" href="https://nguyenvu.store/messenger" target="_blank" rel="noopener noreferrer">						<div class="img-inner image-zoom dark">
			<noscript><img width="512" height="512" src="https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png.webp" class="attachment-large size-large" alt="Fanpage Nguyễn Vũ Store Showroom" decoding="async" srcset="https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png.webp 512w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-510x510.webp 510w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-100x100.webp 100w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-96x96.webp 96w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-150x150.webp 150w" sizes="(max-width: 512px) 100vw, 512px" /></noscript>						
					</div>
						</a>		
<style>
#image_1860850199 {
  width: 3%;
}
</style>
	</div>
	
		
<style>
#stack-341552646 > * {
  --stack-gap: 0.75rem;
}
</style>
	</div>
	
	<div id="stack-1623676266" class="stack show-for-small stack-row justify-start items-start">
		
	<div class="img has-hover x md-x lg-x y md-y lg-y" id="image_411028954">
		<a class="" href="https://nguyenvu.store/zalo" target="_blank" rel="noopener noreferrer">						<div class="img-inner image-zoom dark">
			<noscript><img width="512" height="512" src="https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo.png" class="attachment-large size-large" alt="" decoding="async" srcset="https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo.png 512w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-510x510.png 510w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-100x100.png 100w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-96x96.png 96w, https://nguyenvu-store-medias.tn-cdn.net/2020/04/zalo-logo-150x150.png 150w" sizes="(max-width: 512px) 100vw, 512px" /></noscript>						
					</div>
						</a>		
<style>
#image_411028954 {
  width: 10%;
}
@media (min-width:550px) {
  #image_411028954 {
    width: 3%;
  }
}
</style>
	</div>
	
	<div class="img has-hover x md-x lg-x y md-y lg-y" id="image_1842346286">
		<a class="" href="https://nguyenvu.store/messenger" target="_blank" rel="noopener noreferrer">						<div class="img-inner image-zoom dark">
			<noscript><img width="512" height="512" src="https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png.webp" class="attachment-large size-large" alt="Fanpage Nguyễn Vũ Store Showroom" decoding="async" srcset="https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png.webp 512w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-510x510.webp 510w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-100x100.webp 100w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-96x96.webp 96w, https://nguyenvu-store-medias.tn-cdn.net/2022/07/facebook_icon_130940.png-150x150.webp 150w" sizes="(max-width: 512px) 100vw, 512px" /></noscript>						
					</div>
						</a>		
<style>
#image_1842346286 {
  width: 10%;
}
@media (min-width:550px) {
  #image_1842346286 {
    width: 3%;
  }
}
</style>
	</div>
	
		
<style>
#stack-1623676266 > * {
  --stack-gap: 0.75rem;
}
</style>
	</div>
	
</div>
			</div>', 14990000, NULL, NULL, N'HP', NULL, NULL, NULL, NULL, NULL, 3, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-22T15:24:33.5663706' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'bzz', N'Hàng hóa số 3', N'Đây là mô tả của mặt hàng số 3', 20000, NULL, N'ml', N'abc Inc', NULL, NULL, NULL, NULL, NULL, 2, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-11T13:20:50.9587523' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'g', N'Laptop MSI Modern 15 B12MO 487VN (I7-1255U | 16GB | 512GB | Intel Iris Xe Graphics | 15.6″ FHD | Win 11)', N'<h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand; text-align: center;">Laptop MSI Modern 15 B12MO 487VN</h2><h4 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.125em; font-family: Quicksand;"><span style="font-weight: bolder;">Thiết kế Tinh Tế và Hiệu Năng Mạnh Mẽ</span></h4><h4 style="font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(33, 37, 41); text-align: center;"><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium; text-align: start;">MSI Modern 15 B12MO 487VN thể hiện sự sang trọng với thiết kế tinh tế. Được trang bị chip Intel Core I7-1255U có xung nhịp tối đa lên đến 4.7 GHz, laptop này sẽ đảm bảo bạn có trải nghiệm mượt mà khi làm việc trên Microsoft Office, Outlook và thậm chí cả việc soạn thảo văn bản, tạo bảng tính phức tạp, chạy code và đồ họa đơn giản.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium; text-align: start;"><img decoding="async" fetchpriority="high" class="alignnone size-full wp-image-159043 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-03.webp" alt="" width="1418" height="656" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-03.webp 1418w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-03-768x355.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-03-850x393.webp 850w" data-lazy-sizes="(max-width: 1418px) 100vw, 1418px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-03.webp" data-ll-status="loaded" sizes="(max-width: 1418px) 100vw, 1418px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-03.webp 1418w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-03-768x355.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-03-850x393.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p></h4><h4 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.125em; font-family: Quicksand;"><span style="font-weight: bolder;">Đồ Họa Tối Ưu với Intel Iris Xe Graphics</span></h4><h4 style="font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(33, 37, 41); text-align: center;"><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium; text-align: start;">Card đồ họa tích hợp Intel Iris Xe Graphics trên MSI Modern 15 B12MO nâng cao khả năng xử lý đồ họa, cho phép bạn chỉnh sửa hình ảnh, render video cơ bản, xem phim 4K và thậm chí chơi các tựa game nhẹ và trung bình như League of Legends, Valorant một cách dễ dàng.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium; text-align: start;"><img decoding="async" class="alignnone size-full wp-image-159042 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-02.webp" alt="" width="1579" height="692" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-02.webp 1579w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-02-768x337.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-02-1536x673.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-02-850x373.webp 850w" data-lazy-sizes="(max-width: 1579px) 100vw, 1579px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-02.webp" data-ll-status="loaded" sizes="(max-width: 1579px) 100vw, 1579px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-02.webp 1579w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-02-768x337.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-02-1536x673.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-02-850x373.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p></h4><h4 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.125em; font-family: Quicksand;"><span style="font-weight: bolder;">Hiệu Suất Ưu Việt</span></h4><h4 style="font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(33, 37, 41); text-align: center;"><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium; text-align: start;">Với 16 GB RAM chuẩn DDR4 và ổ cứng SSD 512 GB NVMe PCIe, bạn có đủ sức mở nhiều ứng dụng nặng cùng một lúc mà không phải lo lắng về độ giật và tắt máy. Đồng thời, khả năng khởi động hệ điều hành và ứng dụng chỉ trong vài giây giúp bạn tiết kiệm thời gian đáng kể.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium; text-align: start;"><img decoding="async" class="alignnone size-full wp-image-159041 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-05.webp" alt="" width="2062" height="950" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-05.webp 2062w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-05-768x354.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-05-1536x708.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-05-2048x944.webp 2048w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-05-850x392.webp 850w" data-lazy-sizes="(max-width: 2062px) 100vw, 2062px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-05.webp" data-ll-status="loaded" sizes="(max-width: 2062px) 100vw, 2062px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-05.webp 2062w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-05-768x354.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-05-1536x708.webp 1536w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-05-2048x944.webp 2048w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-05-850x392.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p></h4><h4 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.125em; font-family: Quicksand;"><span style="font-weight: bolder;">Trải Nghiệm Màn Hình Sắc Nét</span></h4><h4 style="font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(33, 37, 41); text-align: center;"><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium; text-align: start;">Màn hình 15.6 inch với độ phân giải Full HD (1920 x 1080) cung cấp hình ảnh sắc nét và chi tiết. Công nghệ tấm nền IPS với thông số màu 45% NTSC giúp bạn thưởng thức các nội dung phim ảnh và chỉnh sửa hình ảnh với độ chính xác màu sắc tốt.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium; text-align: start;"><img decoding="async" class="alignnone size-full wp-image-159044 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-04.webp" alt="" width="800" height="475" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-04.webp 800w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-04-768x456.webp 768w" data-lazy-sizes="(max-width: 800px) 100vw, 800px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-04.webp" data-ll-status="loaded" sizes="(max-width: 800px) 100vw, 800px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-04.webp 800w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-msi-modern-15-b12mo-628vn-04-768x456.webp 768w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p></h4><h4 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.125em; font-family: Quicksand;"><span style="font-weight: bolder;">Di Động và Linh Hoạt</span></h4><h4 style="font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(33, 37, 41); text-align: center;"><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium; text-align: start;">Với trọng lượng chỉ 1.7 kg, MSI Modern 15 B12MO 487VN là một mẫu laptop di động và linh hoạt, dễ dàng mang theo bên mình trong balo. Bàn phím được trang bị đèn nền giúp bạn sử dụng mọi lúc, kể cả trong không gian thiếu sáng.</p></h4><h4 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.125em; font-family: Quicksand;"><span style="font-weight: bolder;">Bảo Mật Cao Cấp</span></h4><h4 style="font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; color: rgb(33, 37, 41); text-align: center;"><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium; text-align: start;">Thông tin cá nhân và hình ảnh của bạn luôn được đảm bảo an toàn với công nghệ mã hóa dữ liệu TPM 2.0 tiên tiến. Laptop MSI Modern cũng có nhiều cổng giao tiếp như USB 2.0, Jack tai nghe 3.5 mm, USB 3.2, HDMI để bạn dễ dàng kết nối với các thiết bị khác.</p></h4>', 15990000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-27T22:12:48.6830165' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'h', N'Laptop MSI Prestige 13 Evo A13M-081VN (i7-1360P | 16GB | 1TB | Intel Iris Xe Graphics | 13.3′ WUXGA | Win 11)', N'<h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;">Laptop MSI Prestige 13 Evo A13M-081VN</h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Dòng sản phẩm Prestige Series của MSI mang đến hiệu suất xuất sắc, tính di động cao và thiết kế gọn gàng, nhằm đáp ứng mọi nhu cầu của một chiếc laptop làm việc hoàn hảo. Được chứng nhận bởi Intel® Evo™, chiếc Prestige 13 Evo giúp bạn làm việc hiệu quả hơn và mang lại trải nghiệm tuyệt vời hàng ngày, cho cả công việc lẫn cuộc sống cá nhân.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><span style="font-weight: bolder;">Một số điểm nổi bật của dòng Prestige Series:</span></p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="font-weight: bolder;">Hiệu suất mạnh mẽ:</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Được trang bị bộ vi xử lý Intel® Core™ i7 thế hệ 13 mới nhất và đạt chứng nhận Intel® Evo™, dòng sản phẩm Prestige là một trong những chiếc laptop mạnh mẽ nhất cho công việc và cuộc sống hiện nay.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" fetchpriority="high" class="size-full wp-image-153245 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-2.webp" alt="" width="900" height="677" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-2.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-2-768x578.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-2-850x639.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-2.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-2.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-2-768x578.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-2-850x639.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="font-weight: bolder;">Màn hình tỷ lệ 16:10:</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Màn hình tỉ lệ 16:10 mang lại không gian hiển thị lớn hơn, giúp bạn có trải nghiệm tốt nhất khi làm việc trong thời gian dài.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-153248 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-5.webp" alt="" width="900" height="556" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-5.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-5-768x474.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-5-850x525.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-5.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-5.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-5-768x474.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-5-850x525.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="font-weight: bolder;">Thiết kế siêu nhẹ và trang nhã</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Với thân máy làm từ hợp kim nhôm – magie, Prestige 13 Evo là một chiếc laptop siêu nhẹ, siêu mỏng, giúp bạn di chuyển và làm việc một cách thuận tiện.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-153247 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-4.webp" alt="" width="900" height="407" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-4.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-4-768x347.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-4-850x384.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-4.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-4.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-4-768x347.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-4-850x384.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="font-weight: bolder;">Tốc độ và hiệu suất không dây:</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Hỗ trợ chuẩn Wi-Fi 6E, mang lại tốc độ kết nối mạng nhanh chóng và mượt mà, giúp bạn hoàn thành công việc một cách hiệu quả.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-153246 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-3.webp" alt="" width="900" height="448" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-3.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-3-768x382.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-3-850x423.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-3.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-3.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-3-768x382.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-3-850x423.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="font-weight: bolder;">Tính di động không giới hạn:</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Dòng Prestige được thiết kế để làm việc di động trong thời gian dài, với thời lượng pin dài và khả năng sạc nhanh, giúp bạn sẵn sàng làm việc ở bất cứ đâu.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-153244 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-1.webp" alt="" width="900" height="621" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-1.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-1-768x530.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-1-850x587.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-1.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-1.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-1-768x530.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-1-850x587.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="font-weight: bolder;">Bảo mật cấp độ doanh nghiệp:</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Hỗ trợ đăng nhập bằng tính năng nhận diện gương mặt Windows Hello hoặc dấu vân tay, cùng với tính năng bảo mật Tobii Aware giúp bảo vệ sự riêng tư của bạn.</p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="font-weight: bolder;">Cổng kết nối đa dạng:</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Dòng Prestige vẫn giữ được thiết kế mỏng nhẹ nhưng không làm giảm cổng kết nối.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-153249 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-6.webp" alt="" width="900" height="270" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-6.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-6-768x230.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-6-850x255.webp 850w" data-lazy-sizes="(max-width: 900px) 100vw, 900px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-6.webp" data-ll-status="loaded" sizes="(max-width: 900px) 100vw, 900px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-6.webp 900w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-6-768x230.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/08/laptop-msi-prestige-13-evo-a13m-081vn-chinh-hang-6-850x255.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="font-weight: bolder;">MSI Center:</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Phần mềm MSI Center giúp tối ưu hóa hệ thống dễ dàng với chế độ AI Smart Auto, đáp ứng các tình huống và nhu cầu khác nhau.</p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="font-weight: bolder;">Độ bền chuẩn quân đội:</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Sản phẩm đạt tiêu chuẩn độ bền quân đội MIL-STD-810G, đảm bảo chất lượng và độ tin cậy tối đa.</p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="font-weight: bolder;">Uy tín:</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Prestige 13 Evo A13M đã được độc giả PCMAG.com bình chọn là Thương hiệu được độc giả ưa chuộng nhất trong 3 năm liên tiếp, từ 2021 đến 2023.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Dòng sản phẩm Prestige của MSI là một lựa chọn hoàn hảo cho những người cân bằng giữa công việc và cuộc sống, mang lại hiệu suất và tính di động mà không đánh đổi sự trải nghiệm tốt nhất.</p>', 29990000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-27T22:15:37.7595310' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'HHH', N'HHH', N'<p><img src="https://localhost:7055/Files/update_sach_b2.png" style="width: 50%;">&nbsp;Xin chao<br></p>', 1414414, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-09-10T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-10T00:00:00.0000000' AS DateTime2), 3, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'hihi', N'xin chao', NULL, 123, 110.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-12T21:42:23.7062657' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'i', N'Laptop Lenovo LOQ 15IRH8 82XV00D5VN (i7-13620H | 16GB | 512GB | GeForce RTX™ 4060 8GB | 15.6′ FHD 144Hz | Win 11)', N'<h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;">Laptop Lenovo LOQ 15IRH8 82XV00D5VN</h2><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;">1. Thiết kế nổi bật – Hấp dẫn từ cái nhìn đầu tiên</h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Với màu Storm Grey và logo mới, Lenovo LOQ 15IRH8 82XV00D5VN tỏ ra cuốn hút ngay từ cái nhìn đầu tiên. Thiết kế tỉ mỉ với các góc cạnh được trau chuốt cùng khu vực mặt A bóng loáng tạo nên vẻ đẹp tinh tế và cao cấp. Màn hình 15 inch với viền mỏng giúp tối ưu không gian hiển thị, mang đến trải nghiệm hấp dẫn và sắc nét.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" fetchpriority="high" class="size-full wp-image-146407 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-2.webp" alt="" width="850" height="508" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-2.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-2-768x459.webp 768w" data-lazy-sizes="(max-width: 850px) 100vw, 850px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-2.webp" data-ll-status="loaded" sizes="(max-width: 850px) 100vw, 850px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-2.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-2-768x459.webp 768w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;">2. Hiệu năng mạnh mẽ – Cùng vượt qua mọi thử thách</h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Được trang bị bộ vi xử lý Gen 13 i7-13620H của Intel, Lenovo LOQ 15IRH8 82XV00D5VN sở hữu tốc độ xử lý lên đến 4.9 GHz cùng công nghệ tiên tiến P-Core và E-Core. Với RAM 16GB DDR5, máy hoạt động mượt mà và đáp ứng tốt đa nhiệm. Điều này đảm bảo cho bạn có thể thoải mái chơi game nặng, làm việc đồ họa 2D, 3D hay xử lý tác vụ phức tạp mà không gặp trở ngại.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-146408 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-3.webp" alt="" width="850" height="494" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-3.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-3-768x446.webp 768w" data-lazy-sizes="(max-width: 850px) 100vw, 850px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-3.webp" data-ll-status="loaded" sizes="(max-width: 850px) 100vw, 850px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-3.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-3-768x446.webp 768w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;">3. GPU RTX 4060 – Sức mạnh đồ họa vượt trội</h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Với card đồ họa GPU RTX 4060, Lenovo LOQ 15IRH8 82XV00D5VN mang đến sức mạnh và hiệu suất đồ họa đỉnh cao. Được hỗ trợ bởi kiến trúc NVIDIA Ada Lovelace và công nghệ dò tia, bạn có thể trải nghiệm thế giới ảo sống động như thật và chơi game FPS cực cao với độ trễ thấp nhất. Đảm bảo cho bạn những trận chiến hấp dẫn và đậm chất thực tế.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-146409 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-4.webp" alt="" width="850" height="300" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-4.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-4-768x271.webp 768w" data-lazy-sizes="(max-width: 850px) 100vw, 850px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-4.webp" data-ll-status="loaded" sizes="(max-width: 850px) 100vw, 850px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-4.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-4-768x271.webp 768w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;">4. Lưu trữ rộng rãi</h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Sở hữu ổ cứng SSD dung lượng 512GB, Lenovo LOQ 15IRH8 82XV00D5VN cung cấp không gian lưu trữ lý tưởng cho mọi dữ liệu, từ phim ảnh, tài liệu học tập đến các ứng dụng và tựa game yêu thích. Với tốc độ đọc và mở nhanh chóng, bạn có thể dễ dàng truy cập và sử dụng dữ liệu một cách liền mạch.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-146410 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-5.webp" alt="" width="850" height="366" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-5.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-5-768x331.webp 768w" data-lazy-sizes="(max-width: 850px) 100vw, 850px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-5.webp" data-ll-status="loaded" sizes="(max-width: 850px) 100vw, 850px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-5.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-5-768x331.webp 768w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;">5. Màn hình sắc nét và tần số quét cao</h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Với màn hình 15 inch độ phân giải Full HD trên tấm nền IPS, mọi pixel được hiển thị rõ nét và góc nhìn rộng hơn. Tần số quét 144Hz đảm bảo mọi chuyển động trong game mượt mà và sống động. Độ sáng 350 nits giúp điểm ảnh nổi bật hơn, cùng với 45% NTSC tạo nên những hình ảnh sống động và chân thực.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-146406 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-1.webp" alt="" width="850" height="612" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-1.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-1-768x553.webp 768w" data-lazy-sizes="(max-width: 850px) 100vw, 850px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-1.webp" data-ll-status="loaded" sizes="(max-width: 850px) 100vw, 850px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-1.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-1-768x553.webp 768w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;">6. Đa dạng cổng kết nối – Sẵn sàng đáp ứng mọi nhu cầu</h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Lenovo LOQ 15IRH8 82XV00D5VN trang bị đầy đủ các cổng kết nối thông dụng như USB 3.2 Gen1/Gen2, USB Type-C 3.2 Gen 2, cổng HDMI (hỗ trợ 8K/60Hz), cổng Ethernet (RJ-45) và combo jack audio 3.5mm. Không thể bỏ qua khả năng kết nối Internet không dây với WiFi 6, mang đến tốc độ và đường truyền mạnh mẽ nhất cho việc lướt web và trải nghiệm trực tuyến liền mạch.<br><img decoding="async" class="aligncenter wp-image-146418 size-full entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-11-e1690186913987.webp" alt="" width="700" height="274" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-11-e1690186913987.webp" data-ll-status="loaded" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">&nbsp;</p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;">7. Bàn phím RGB Backlit – Trải nghiệm gõ phím tuyệt vời</h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Bàn phím fullsize với đèn nền RGB trên Lenovo LOQ 15IRH8 82XV00D5VN mang lại trải nghiệm gõ phím tuyệt vời. Bạn có thể dễ dàng điều chỉnh đèn nền theo ý muốn, tạo nên không gian chơi game và làm việc độc đáo. Đặc biệt, bàn phím có hành trình phím tốt và phản hồi nhanh, giúp bạn gõ chính xác và thoải mái trong thời gian dài.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-146416 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-10.webp" alt="" width="700" height="452" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-10.webp" data-ll-status="loaded" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;">8. Hệ thống làm mát hiệu quả – Giảm thiểu quá nhiệt</h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Laptop gaming thường gặp vấn đề quá nhiệt trong quá trình hoạt động nặng. Tuy nhiên, Lenovo LOQ 15IRH8 82XV00D5VN đã được thiết kế với hệ thống làm mát hiệu quả để giảm thiểu tối đa quá nhiệt. Điều này đảm bảo laptop hoạt động ổn định và bền bỉ trong thời gian dài, đồng thời giữ cho nhiệt độ máy ở mức an toàn cho các linh kiện bên trong.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-146411 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-6.webp" alt="" width="850" height="576" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-6.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-6-768x520.webp 768w" data-lazy-sizes="(max-width: 850px) 100vw, 850px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-6.webp" data-ll-status="loaded" sizes="(max-width: 850px) 100vw, 850px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-6.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-6-768x520.webp 768w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;">9. Pin lâu dài – Đồng hành cùng bạn suốt cả ngày</h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Với pin dung lượng lớn và tiết kiệm năng lượng, Lenovo LOQ 15IRH8 82XV00D5VN giúp bạn đồng hành suốt cả ngày mà không cần lo lắng về việc hết pin. Thời lượng pin cụ thể tùy thuộc vào việc sử dụng và cài đặt, nhưng bạn có thể yên tâm về hiệu suất pin của chiếc laptop này.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-146414 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-9.webp" alt="" width="850" height="552" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-9.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-9-768x499.webp 768w" data-lazy-sizes="(max-width: 850px) 100vw, 850px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-9.webp" data-ll-status="loaded" sizes="(max-width: 850px) 100vw, 850px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-9.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/07/laptop-lenovo-loq-15irh8-82xv00d5vn-chinh-hang-9-768x499.webp 768w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p>', 33490000, NULL, NULL, N'Lenovo', NULL, NULL, NULL, NULL, NULL, 3, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-27T22:37:18.4355954' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'iii', N'Laptop Lenovo ThinkBook 14s G2 ITL 20VA003NVN (i5-1135G7 | 8GB | 512GB | Intel Iris Xe Graphics | 14′ FHD 100% sRGB | Win 11)', N'<h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand; text-align: center;">Lenovo ThinkBook 14s G2 ITL 20VA003NVN</h2><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="-webkit-box-decoration-break: clone;">THIẾT KẾ</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Thiết kế siêu gọn nhẹ là một trong những điểm nổi bật khiến Laptop Lenovo ThinkBook 14s G2 ITL (20VA003NVN) ghi điểm cực cao trong mắt người dùng. Với kích thước ba chiều lần lượt là 322 x 207 x 14.9 mm cùng khối lượng vỏn vẹn 1.27 kg, chiếc máy này chỉ tương đương với một quyển sách.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" fetchpriority="high" class="size-full wp-image-118008 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-2.webp" alt="" width="1000" height="496" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-2.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-2-768x381.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-2-510x253.webp 510w" data-lazy-sizes="(max-width: 1000px) 100vw, 1000px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-2.webp" data-ll-status="loaded" sizes="(max-width: 1000px) 100vw, 1000px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-2.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-2-768x381.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-2-510x253.webp 510w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Giờ đây bạn có thể loại bỏ những phiền não khi phải mang theo chiếc laptop nặng nề, cồng kềnh đi làm mỗi ngày. Bạn còn có thể dễ dàng mang theo em nó khi đi công tác hay đi du lịch một cách dễ dàng, đơn giản.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Hướng đến sự tối giản nhưng không vì thế mà chiếc máy kém phần trang nhã, tinh tế. Không phải một màu sơn đơn sắc thường thấy ở hầu hết các dòng máy trên thị trường, các nhà thiết kế của Lenovo đã kết hợp hài hòa hai sắc thái đậm nhạt của màu xám để tạo nên nét đẹp độc đáo mà chỉ tìm thấy ở dòng máy ThinkBook này.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Các chi tiết nhỏ cũng được sắp xếp tinh tế như: Dòng chữ “ThinkBook” đặt ngay ngắn lệch về phía phải, logo của hãng nhỏ nhắn nằm ở góc trái. Tất cả tạo nên một tổng thể đơn giản nhưng vô cùng hài hòa, thanh lịch và cuốn hút.</p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="-webkit-box-decoration-break: clone;">HIỆU NĂNG</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Trang bị con chip Intel Core i5 Tiger Lake 1135G7 cấu trúc 4 nhân 8 luồng cung cấp tốc độ xung nhịp cơ bản 2.40 GHz, đạt tối đa lên đến 4.2 GHz nhờ Turbo Boost, kết hợp cùng bộ nhớ đệm 8 MB, mang lại hiệu suất giúp vận hành êm mượt các công việc văn phòng trên công cụ Word, Excel, PowerPoint,… hay thiết kế đồ họa bằng phần mềm Photoshop, AI, Figma,…</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-118009 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-3.webp" alt="" width="1000" height="560" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-3.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-3-768x430.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-3-510x286.webp 510w" data-lazy-sizes="(max-width: 1000px) 100vw, 1000px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-3.webp" data-ll-status="loaded" sizes="(max-width: 1000px) 100vw, 1000px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-3.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-3-768x430.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-3-510x286.webp 510w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Chất lượng hình ảnh đồ họa mượt mà hơn nhờ card đồ họa tích hợp Intel Iris Xe Graphics hỗ trợ thực hiện các thao tác chỉnh sửa hình ảnh, render video hay chơi các tựa game phổ biến nhẹ nhàng.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Laptop RAM 8 GB thuộc loại DDR4 (On board) tốc độ Bus RAM đến 4266 MHz đa nhiệm mượt mà, cho phép bạn mở nhiều ứng dụng làm việc cùng lúc với nghe nhạc, lướt web,… di chuyển qua lại giữa các cửa sổ phần mềm một cách trơn tru mà không lo giật lag máy.</p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="-webkit-box-decoration-break: clone;">MÀN HÌNH</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Đi cùng các tính năng thú vị, laptop Lenovo sở hữu cho mình màn hình 14 inch với độ phân giải Full HD (1920 x 1080), kết hợp cùng công nghệ Dolby Vision giúp bạn đắm mình trong thế giới hình ảnh chân thật và sắc nét, mang lại những trải nghiệm đầy bất ngờ và thú vị.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-118011 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-5.webp" alt="" width="1000" height="730" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-5.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-5-768x561.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-5-510x372.webp 510w" data-lazy-sizes="(max-width: 1000px) 100vw, 1000px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-5.webp" data-ll-status="loaded" sizes="(max-width: 1000px) 100vw, 1000px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-5.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-5-768x561.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-5-510x372.webp 510w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Được trang bị thêm tấm nền IPS, góc nhìn của bạn cũng được mở rộng đến 178 độ cùng màn hình 100% sRGB, hứa hẹn sẽ mang đến những gam màu sắc vô cùng bắt mắt và mới lạ. Độ sáng 300 nits cho bạn khả năng làm việc ở nhiều môi trường ánh sáng khác nhau, đặc biệt là khi làm ngoài trời.</p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="-webkit-box-decoration-break: clone;">BÀN PHÍM</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Bàn phím của Laptop Lenovo ThinkBook 14s G2 ITL 20VA003NVN được thiết kế chắc chắn với các phím bấm lớn để bạn thoải mái thao tác. Với hành trình phím hợp lý, độ nhạy cao giúp việc soạn thảo văn bản và nhập liệu được tiến hành dễ dàng, nhanh chóng và chính xác.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-118010 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-4.webp" alt="" width="1000" height="556" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-4.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-4-768x427.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-4-510x284.webp 510w" data-lazy-sizes="(max-width: 1000px) 100vw, 1000px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-4.webp" data-ll-status="loaded" sizes="(max-width: 1000px) 100vw, 1000px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-4.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-4-768x427.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-4-510x284.webp 510w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Touchpad của máy có diện tích khá rộng, được phủ một lớp nhám mịn giúp cho việc thao tác chuột trở nên thuận tiện hơn, thậm chí không thua kém quá nhiều so với khi sử dụng một chiếc chuột rời.</p><h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand;"><span style="-webkit-box-decoration-break: clone;">KẾT NỐI</span></h2><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="size-full wp-image-118007 aligncenter entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-1.webp" alt="" width="1116" height="484" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-1.webp 1116w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-1-768x333.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-1-510x221.webp 510w" data-lazy-sizes="(max-width: 1116px) 100vw, 1116px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-1.webp" data-ll-status="loaded" sizes="(max-width: 1116px) 100vw, 1116px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-1.webp 1116w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-1-768x333.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/02/laptop-lenovo-thinkbook-14s-g2-itl-20va003nvn-nguyenvu.store-1-510x221.webp 510w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; clear: both; margin: auto; width: auto;"></p><ul style="list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><li style="margin-bottom: 0.6em; margin-left: 1.3em;">1x USB 3.2 Gen 1</li><li style="margin-bottom: 0.6em; margin-left: 1.3em;">1x USB 3.2 Gen 1 (Always On)</li><li style="margin-bottom: 0.6em; margin-left: 1.3em;">1x Thunderbolt 4 / USB4™ 40Gbps (support data transfer, Power Delivery 3.0, and DisplayPort™ 1.4)</li><li style="margin-bottom: 0.6em; margin-left: 1.3em;">1x HDMI 2.0b</li><li style="margin-bottom: 0.6em; margin-left: 1.3em;">1x Headphone / microphone combo jack (3.5mm)</li></ul>', 14490000, NULL, NULL, N'Lenovo', NULL, NULL, NULL, NULL, NULL, 3, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-27T22:39:24.0399366' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'ljlljlj', N'asdfsdf', N'<p><b><img src="https://localhost:7055/Files/update_sach_b2.png" style="width: 50%;">&nbsp;xin chaof</b><br></p>', 555555, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'lll', N'Laptop GIGABYTE AERO 17 XE5-73VN744AH (i7-12700H | 32GB | 1TB SSD | 17.3″ UHD | RTX3070Ti 8GB | Win11 | Silver)', N'<h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand; text-align: center;"><span style="font-weight: bolder;">Laptop GIGABYTE AERO 17 XE5-73VN744AH</span></h2><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;"><span style="font-weight: bolder;">Mobile Theatre</span></h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Máy tính xách tay AERO 17 Creator chắt chiu từ các thế hệ và thiết kế trước đó, mỏng nhẹ tiến hóa và thẩm mỹ. Kết hợp bộ vi xử lý Intel Core thế hệ 12, card đồ họa NVIDIA GeForce RTX Series 30 và màn hình 4K HDR ultra-wide đáng kinh ngạc trong một thiết kế nhỏ gọn. Nó mang đến hiệu suất cao với vẻ đẹp tối đa, được thúc đẩy bởi những tiêu chí cốt lõi về hiệu suất với thiết kế tối giản nhưng tinh tế, mang lại hiệu quả, độ chính xác và hình thức và chức năng xuất sắc cho tất cả những người sáng tạo trên hành trình sáng tạo của mình.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" fetchpriority="high" class="alignnone size-full wp-image-136484 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-01.webp" alt="" width="1000" height="1000" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-01.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-01-768x768.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-01-850x850.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-01-100x100.webp 100w" data-lazy-sizes="(max-width: 1000px) 100vw, 1000px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-01.webp" data-ll-status="loaded" sizes="(max-width: 1000px) 100vw, 1000px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-01.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-01-768x768.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-01-850x850.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-01-100x100.webp 100w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;"><span style="font-weight: bolder;">Thiết kế thẩm mỹ</span></h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Công thức thẩm mỹ của AERO 17 gồm các chi tiết được chăm chút tỉ mỉ và sự đơn giản tinh tế. Thân máy hình cung được bổ sung bằng những góc cạnh gọn gàng, loại bỏ bất kỳ sự phức tạp không cần thiết nào. Thân máy đúc từ hợp kim nhôm CNC rất tinh vi. Giống như một prisma phân tán ánh sáng thành các màu sắc phổ của nó, AERO 17 là sự nhân cách hóa của một prisma nghịch đảo, kết hợp những đặc điểm màu sắc và tinh tế tuyệt vời của cuộc sống vào một trải nghiệm tổng hòa phong phú.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="alignnone size-full wp-image-136485 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-02.webp" alt="" width="1000" height="1000" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-02.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-02-768x768.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-02-850x850.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-02-100x100.webp 100w" data-lazy-sizes="(max-width: 1000px) 100vw, 1000px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-02.webp" data-ll-status="loaded" sizes="(max-width: 1000px) 100vw, 1000px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-02.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-02-768x768.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-02-850x850.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-02-100x100.webp 100w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;"><span style="font-weight: bolder;">CNC tinh xảo hoàn hảo</span></h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">AERO áp dụng quy trình sản xuất CNC chỉ dành cho các sản phẩm cao cấp. AERO được cắt chính xác để tạo nên một cấu trúc đẹp mắt cho máy tính xách tay, và mọi góc của vỏ máy được chế tạo một cách cẩn thận, hiển thị một kết cấu tinh tế và chất lượng vững chắc.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="alignnone size-full wp-image-136487 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-04.webp" alt="" width="1000" height="1000" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-04.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-04-768x768.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-04-850x850.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-04-100x100.webp 100w" data-lazy-sizes="(max-width: 1000px) 100vw, 1000px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-04.webp" data-ll-status="loaded" sizes="(max-width: 1000px) 100vw, 1000px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-04.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-04-768x768.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-04-850x850.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-04-100x100.webp 100w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;"><span style="font-weight: bolder;">Bộ vi xử lý Intel Core thế hệ 12</span></h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">AERO được nâng cấp với bộ vi xử lý Intel® Core thế hệ 12 mới nhất, nâng cấp hiệu suất lên đến 35%1 so với các thế hệ trước đó, đạt tốc độ xung nhịp cao nhất là 5.0GHz – mang lại hiệu suất đa nhiệm cao cấp, tạo sức mạnh cho cả sáng tạo và năng suất của bạn.</p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;"><span style="font-weight: bolder;">ĐỘT PHÁ SÁNG TẠO CỦA BẠN</span><br><span style="font-weight: bolder;">Làm nhiều hơn, chờ ít hơn với card đồ họa.</span></h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Kết xuất nhanh hơn. Phát sóng rõ ràng hơn. Chỉnh sửa video tốt hơn. Từ ray tracing và thực tế ảo cho đến chỉnh sửa video 8K được hỗ trợ bởi trí tuệ nhân tạo, card đồ họa NVIDIA trên các máy tính xách tay và máy tính để bàn Studio tăng tốc quy trình làm việc của bạn. Và chúng được hỗ trợ bởi các Driver Studio độc quyền, miễn phí, giúp tối ưu hóa ứng dụng sáng tạo của bạn.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="alignnone size-full wp-image-136486 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-03.webp" alt="" width="1000" height="1000" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-03.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-03-768x768.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-03-850x850.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-03-100x100.webp 100w" data-lazy-sizes="(max-width: 1000px) 100vw, 1000px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-03.webp" data-ll-status="loaded" sizes="(max-width: 1000px) 100vw, 1000px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-03.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-03-768x768.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-03-850x850.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-03-100x100.webp 100w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;"><span style="font-weight: bolder;">Công nghệ AI Eye Care</span></h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Công nghệ AI Eye Care độc quyền của GIGABYTE điều chỉnh độ sáng màn hình tự động khi bạn làm việc trong các điều kiện ánh sáng khác nhau. AI Eye Care bảo vệ đôi mắt của bạn và giảm mệt mỏi!</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="alignnone size-full wp-image-136489 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-06.webp" alt="" width="1000" height="1000" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-06.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-06-768x768.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-06-850x850.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-06-100x100.webp 100w" data-lazy-sizes="(max-width: 1000px) 100vw, 1000px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-06.webp" data-ll-status="loaded" sizes="(max-width: 1000px) 100vw, 1000px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-06.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-06-768x768.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-06-850x850.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-06-100x100.webp 100w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;"><span style="font-weight: bolder;">Màn hình 17″ 4K miniLED mỏng nhưng vô hạn</span></h3><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">AERO 17 đi kèm với màn hình 17″ 4K UHD miniLED tuyệt vời nhất trong lịch sử của GIGABYTE. Với thiết kế đèn nền đa vùng, AERO 17 đem đến trải nghiệm chìm vào không gian ba chiều với độ sáng cao và tỷ lệ động tương phản cao. Nó hỗ trợ tới 100% gam màu DCI-P3, hiển thị những màu sắc sống động và chân thực nhất. Hãy sẵn sàng để chào đón trải nghiệm hình ảnh phong phú nhất trên thế giới.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="alignnone size-full wp-image-136488 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-05.webp" alt="" width="1000" height="1000" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-05.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-05-768x768.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-05-850x850.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-05-100x100.webp 100w" data-lazy-sizes="(max-width: 1000px) 100vw, 1000px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-05.webp" data-ll-status="loaded" sizes="(max-width: 1000px) 100vw, 1000px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-05.webp 1000w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-05-768x768.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-05-850x850.webp 850w, https://nguyenvu-store-medias.tn-cdn.net/2023/06/laptop-gigabyte-aero-17-xe5-73vn744ah-05-100x100.webp 100w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p>', 37490000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-27T22:42:47.5531854' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'q', N'Laptop Acer Aspire 3 A314-36M-37FM (i3-N305 | 8GB | 512GB | Intel UHD Graphics | 14″ FHD | Win 11)', N'<h2 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; line-height: 1.3; font-size: 1.6em; font-family: Quicksand; text-align: center;">Laptop Acer Aspire 3 A314-36M-37FM</h2><h3 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.25em; font-family: Quicksand;">Acer Aspire 3 2022 – LAPTOP MỎNG NHẸ ĐA NĂNG CHO HỌC SINH SINH VIÊN, NHÂN VIÊN VĂN PHÒNG</h3><div class="rll-youtube-player" data-src="//www.youtube.com/embed/iYwoWlzelfo" data-id="iYwoWlzelfo" data-query="" data-alt="Acer | Aspire 3 - A Family-oriented Laptop" style="font-family: Quicksand; position: relative; padding-bottom: 484.475px; height: 0px; overflow: hidden; max-width: 100%; color: rgb(119, 119, 119); font-size: medium;"><div data-id="iYwoWlzelfo" data-query="" data-src="//www.youtube.com/embed/iYwoWlzelfo"><img data-lazy-src="https://i.ytimg.com/vi/iYwoWlzelfo/hqdefault.jpg" alt="Acer | Aspire 3 - A Family-oriented Laptop" width="480" height="360" data-ll-status="loaded" class="entered lazyloaded" src="https://i.ytimg.com/vi/iYwoWlzelfo/hqdefault.jpg" style="border-width: initial; border-color: initial; border-image: initial; display: block; height: auto; max-width: 100%; opacity: 1; transition: all 0.4s ease 0s; inset: 0px; margin: auto; width: 861.6px; position: absolute;"><button class="play" aria-label="play Youtube video" style="font-style: inherit; font-variant: inherit; font-weight: bolder; font-stretch: inherit; font-size: 0.97em; line-height: 2.4em; font-family: Quicksand; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; text-transform: uppercase; touch-action: manipulation; text-rendering: optimizelegibility; border-width: initial; border-style: none; border-color: initial; letter-spacing: 0.03em; margin-right: 1em; max-width: 100%; min-height: 2.5em; padding: 0px 1.2em; position: absolute; transition: transform 0.3s ease 0s, border 0.3s ease 0s, background 0.3s ease 0s, box-shadow 0.3s ease 0s, opacity 0.3s ease 0s, color 0.3s ease 0s; vertical-align: middle; margin-bottom: 1em; height: 484.475px; width: 861.6px; left: 0px; top: 0px; background-image: url(&quot;https://nguyenvu.store/wp-content/plugins/wp-rocket/assets/img/youtube.png&quot;); background-position: center center; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 5px !important;"></button></div></div><h4 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.125em; font-family: Quicksand;">Hiệu suất sẵn sàng hoạt động</h4><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Aspire 3 sẵn sàng hoạt động với Bộ xử lý Intel Core Thế hệ thứ mới với Đồ họa Intel UHD Graphics lý tưởng cho cả gia đình, lấy hiệu suất và năng suất làm trọng tâm. Hoàn hảo để tận dụng tối đa công việc, học tập hoặc giải trí.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" fetchpriority="high" class="alignnone size-full wp-image-157620 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-01.webp" alt="" width="1443" height="950" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-01.webp 1443w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-01-768x506.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-01-850x560.webp 850w" data-lazy-sizes="(max-width: 1443px) 100vw, 1443px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-01.webp" data-ll-status="loaded" sizes="(max-width: 1443px) 100vw, 1443px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-01.webp 1443w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-01-768x506.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-01-850x560.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p><h4 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.125em; font-family: Quicksand;">Nhiệt độ được cải tiến</h4><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Với diện tích bề mặt quạt tăng 78%, hãy tận hưởng hệ thống nhiệt cải tiến và công suất nhiệt tăng thêm 17%. Cho phép các phiên làm việc dài hơn, hiệu quả hơn trong khi không cắm điện.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="alignnone size-full wp-image-157621 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-02.webp" alt="" width="1443" height="950" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-02.webp 1443w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-02-768x506.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-02-850x560.webp 850w" data-lazy-sizes="(max-width: 1443px) 100vw, 1443px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-02.webp" data-ll-status="loaded" sizes="(max-width: 1443px) 100vw, 1443px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-02.webp 1443w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-02-768x506.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-02-850x560.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p><h4 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.125em; font-family: Quicksand;">Thiết kế có mục đích</h4><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Với lớp vỏ kim loại bóng bẩy cùng các màu sắc sống động mới, Aspire 3 nhẹ hơn và mỏng hơn bao giờ hết với trọng lượng 1,4kg và 18mm. Trong khi thời lượn pin lâu dài cho phép gia đình làm được nhiều việc hơn giữa các lần sạc.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="alignnone size-full wp-image-157622 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-03.webp" alt="" width="1443" height="950" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-03.webp 1443w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-03-768x506.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-03-850x560.webp 850w" data-lazy-sizes="(max-width: 1443px) 100vw, 1443px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-03.webp" data-ll-status="loaded" sizes="(max-width: 1443px) 100vw, 1443px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-03.webp 1443w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-03-768x506.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-03-850x560.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p><h4 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.125em; font-family: Quicksand;">Màn hình hiển thị</h4><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Màn hình 1080p FHD hoàn hảo cho việc duyệt web thông thường và truyền phát video, cho hình ảnh sắc nét, chi tiết. Và với Acer BlueLightShield, hãy giảm mức độ tiếp xúc với ánh sáng xanh cho bạn và những người thân yêu của bạn.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="alignnone size-full wp-image-157623 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-04.webp" alt="" width="1443" height="950" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-04.webp 1443w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-04-768x506.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-04-850x560.webp 850w" data-lazy-sizes="(max-width: 1443px) 100vw, 1443px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-04.webp" data-ll-status="loaded" sizes="(max-width: 1443px) 100vw, 1443px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-04.webp 1443w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-04-768x506.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-04-850x560.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p><h4 style="text-rendering: optimizespeed; color: rgb(85, 85, 85); margin-bottom: 0.5em; width: 861.6px; font-size: 1.125em; font-family: Quicksand;">Khả năng kết nối</h4><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;">Kết nối hoặc sạc các thiết bị mới nhất của bạn trên cổng USB Type-C đầy đủ chức năng. Ngoài ra, Wi-Fi 6E và HDMI 2.1 giúp tăng năng suất và chức năng cho cả gia đình.</p><p style="margin-bottom: 1.3em; font-family: Quicksand; color: rgb(119, 119, 119); font-size: medium;"><img decoding="async" class="alignnone size-full wp-image-157619 entered lazyloaded" src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-05.webp" alt="" width="1443" height="950" data-lazy-srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-05.webp 1443w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-05-768x506.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-05-850x560.webp 850w" data-lazy-sizes="(max-width: 1443px) 100vw, 1443px" data-lazy-src="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-05.webp" data-ll-status="loaded" sizes="(max-width: 1443px) 100vw, 1443px" srcset="https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-05.webp 1443w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-05-768x506.webp 768w, https://nguyenvu-store-medias.tn-cdn.net/2023/09/laptop-acer-aspire-3-a315-59-31bt-05-850x560.webp 850w" style="display: block; height: auto; max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; width: auto; margin: auto auto 2em;"></p><div><br></div>', 7990000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-27T22:44:40.8835337' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'qe', N'qe', NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'sdfasdffff', N'ádfsdf', NULL, 55555, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N't', N't', NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'tea', N'2', N'2', 2, NULL, N'2', N'2', NULL, NULL, NULL, NULL, NULL, 3, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'xyc', N'xyc', NULL, 321, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PromotionPrice], [Unit], [Supplier], [Image], [Origin], [Weight], [Expiry], [ManufactoringDate], [CategoryId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'xyz', N'xyz', NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[ProductWareHouses] ON 

INSERT [dbo].[ProductWareHouses] ([Id], [WareHouseId], [ProductId], [Quantity], [Status], [CreatedTime], [LastUpdated]) VALUES (1, N'2', N'azz', 23, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[ProductWareHouses] ([Id], [WareHouseId], [ProductId], [Quantity], [Status], [CreatedTime], [LastUpdated]) VALUES (2, N'2', N'bzz', 0, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[ProductWareHouses] ([Id], [WareHouseId], [ProductId], [Quantity], [Status], [CreatedTime], [LastUpdated]) VALUES (3, N'2', N'g', 6, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[ProductWareHouses] ([Id], [WareHouseId], [ProductId], [Quantity], [Status], [CreatedTime], [LastUpdated]) VALUES (4, N'2', N'h', 0, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[ProductWareHouses] ([Id], [WareHouseId], [ProductId], [Quantity], [Status], [CreatedTime], [LastUpdated]) VALUES (5, N'2', N'i', 0, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[ProductWareHouses] ([Id], [WareHouseId], [ProductId], [Quantity], [Status], [CreatedTime], [LastUpdated]) VALUES (6, N'123', N'g', 5, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[ProductWareHouses] ([Id], [WareHouseId], [ProductId], [Quantity], [Status], [CreatedTime], [LastUpdated]) VALUES (7, N'123', N'qe', 3, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[ProductWareHouses] ([Id], [WareHouseId], [ProductId], [Quantity], [Status], [CreatedTime], [LastUpdated]) VALUES (8, N'2', N'hihi', 10, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[ProductWareHouses] ([Id], [WareHouseId], [ProductId], [Quantity], [Status], [CreatedTime], [LastUpdated]) VALUES (9, N'KHO3', N'11111111', 10, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[ProductWareHouses] ([Id], [WareHouseId], [ProductId], [Quantity], [Status], [CreatedTime], [LastUpdated]) VALUES (1009, N'KHO4', N'g', 2, 1, CAST(N'2023-09-26T20:31:20.6864298' AS DateTime2), CAST(N'2023-09-26T20:31:20.6864938' AS DateTime2))
INSERT [dbo].[ProductWareHouses] ([Id], [WareHouseId], [ProductId], [Quantity], [Status], [CreatedTime], [LastUpdated]) VALUES (1010, N'KHO4', N'qe', 2, 1, CAST(N'2023-09-26T20:31:20.7102190' AS DateTime2), CAST(N'2023-09-26T20:31:20.7102203' AS DateTime2))
INSERT [dbo].[ProductWareHouses] ([Id], [WareHouseId], [ProductId], [Quantity], [Status], [CreatedTime], [LastUpdated]) VALUES (1011, N'KHO3', N'g', 5, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ProductWareHouses] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotions] ON 

INSERT [dbo].[Promotions] ([Id], [Name], [Percent], [StartDate], [EndDate], [CreatedTime], [LastUpdated], [Status], [Description], [PromotionType]) VALUES (6, N'Mua 1 tặng 1(hàng tặng kèm)', NULL, CAST(N'2023-09-10T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-15T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'<p>hì</p><h1><font color="#000000" style="background-color: rgb(255, 255, 0);"><b>đây là khuyến mãi tặng quà</b></font></h1><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; yeh</p>', 0)
INSERT [dbo].[Promotions] ([Id], [Name], [Percent], [StartDate], [EndDate], [CreatedTime], [LastUpdated], [Status], [Description], [PromotionType]) VALUES (8, N'Khuyến mãi giảm giá 10%', 10, CAST(N'2023-09-12T21:40:14.3021569' AS DateTime2), CAST(N'2023-09-13T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-12T21:40:14.3021181' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'<p><span style="font-family: &quot;Segoe UI&quot;;">﻿</span><font color="#000000" style="background-color: rgb(255, 255, 0);"><b><span style="font-family: &quot;Segoe UI&quot;;">Khuyến mãi giảm giá 10%</span></b></font><br></p>', 0)
INSERT [dbo].[Promotions] ([Id], [Name], [Percent], [StartDate], [EndDate], [CreatedTime], [LastUpdated], [Status], [Description], [PromotionType]) VALUES (9, N'Khuyến mãi giảm giá 20%', 20, CAST(N'2023-09-12T21:44:11.0870015' AS DateTime2), CAST(N'2023-09-14T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-12T21:44:11.0869997' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'<p><font color="#000000" style="background-color: rgb(255, 255, 0);"><span style="font-family: &quot;Comic Sans MS&quot;;">Khuyến mãi giảm giá 20%</span></font><br></p>', 0)
SET IDENTITY_INSERT [dbo].[Promotions] OFF
GO
SET IDENTITY_INSERT [dbo].[ReceiptDetails] ON 

INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (1, 2, N'azz', 1, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (2, 2, N'bzz', 2, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (3, 2, N't', 4, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (4, 2, N'q', 5, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (5, 3, N'hihi', 1, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (6, 3, N'h', 10, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (7, 3, N'g', 10, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (8, 4, N'bzz', 23, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (9, 5, N'bzz', 2, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (10, 6, N'11111111', 2, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (11, 6, N'g', 3, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (12, 7, N'11111111', 1, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (13, 7, N'bzz', 2, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (14, 8, N'bzz', 5, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (15, 9, N'azz', 1, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (16, 10, N'azz', 1, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (17, 13, N'bzz', 2, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (18, 14, N'azz', 5, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (19, 15, N'g', 5, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (20, 16, N'g', 4, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (21, 16, N'h', 6, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (22, 16, N'i', 7, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (23, 17, N'azz', 2, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (24, 18, N'azz', 2, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (25, 18, N'bzz', 1, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (26, 18, N'i', 6, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (27, 40, N'azz', 3, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (28, 40, N'bzz', 1, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (29, 40, N'i', 1, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (30, 42, N'g', 1, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (31, 42, N'qe', 5, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (32, 43, N'azz', 23, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (33, 43, N'g', 3, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (34, 43, N'hihi', 10, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (35, 45, N'h', 6, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (36, 46, N'11111111', 10, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (1036, 47, N'g', 2, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (1037, 49, N'g', 1, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (1038, 51, N'g', 1, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (1039, 53, N'g', 1, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (1040, 54, N'g', 10, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (1041, 55, N'g', 2, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (1042, 56, N'g', 3, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (1043, 57, N'g', 2, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (1044, 57, N'qe', 2, 1)
INSERT [dbo].[ReceiptDetails] ([Id], [ReceiptId], [ProductId], [Quantity], [Status]) VALUES (1045, 58, N'g', 5, 1)
SET IDENTITY_INSERT [dbo].[ReceiptDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipts] ON 

INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (1, CAST(N'2023-04-01T14:53:51.4813280' AS DateTime2), 1, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (2, CAST(N'2023-04-01T15:09:06.4077600' AS DateTime2), 1, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (3, CAST(N'2023-04-01T15:11:57.9455832' AS DateTime2), 1, 1, N'123', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (4, CAST(N'2023-04-01T15:14:15.9021346' AS DateTime2), 1, 1, N'123', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (5, CAST(N'2023-04-01T15:33:22.1505618' AS DateTime2), 1, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (6, CAST(N'2023-04-02T22:47:37.8964988' AS DateTime2), 0, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (7, CAST(N'2023-04-02T22:49:23.6596241' AS DateTime2), 0, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (8, CAST(N'2023-04-02T23:06:59.2045089' AS DateTime2), 0, 1, N'123', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (9, CAST(N'2023-04-03T00:48:00.1669724' AS DateTime2), 1, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (10, CAST(N'2023-04-03T00:48:44.5068075' AS DateTime2), 1, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (13, CAST(N'2023-04-03T00:49:55.4362873' AS DateTime2), 1, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (14, CAST(N'2023-04-04T10:59:43.5544781' AS DateTime2), 1, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (15, CAST(N'2023-04-04T11:00:15.7863787' AS DateTime2), 1, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (16, CAST(N'2023-04-04T11:01:52.4303626' AS DateTime2), 1, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (17, CAST(N'2023-04-04T11:03:03.1920427' AS DateTime2), 0, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (18, CAST(N'2023-04-04T11:03:51.4802339' AS DateTime2), 0, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (40, CAST(N'2023-04-04T11:21:56.4205206' AS DateTime2), 0, 1, N'2', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (42, CAST(N'2023-04-04T14:54:30.6521122' AS DateTime2), 1, 1, N'123', N'dvdk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (43, CAST(N'2023-04-12T15:07:26.0879182' AS DateTime2), 1, 1, N'2', N'dvdk-1', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (45, CAST(N'2023-04-15T11:13:24.1395188' AS DateTime2), 0, 1, N'2', N'dvdk23', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (46, CAST(N'2023-09-23T20:34:01.4487990' AS DateTime2), 1, 1, N'KHO3', N'đk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (47, CAST(N'2023-09-26T20:13:37.9337612' AS DateTime2), 0, 1, N'2', N'đk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (49, CAST(N'2023-09-26T20:14:15.2069799' AS DateTime2), 0, 1, N'123', N'đk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (51, CAST(N'2023-09-26T20:14:42.5925440' AS DateTime2), 0, 1, N'123', N'đk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (53, CAST(N'2023-09-26T20:15:46.7469670' AS DateTime2), 0, 1, N'123', N'đk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (54, CAST(N'2023-09-26T20:16:15.2998969' AS DateTime2), 1, 1, N'123', N'đk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (55, CAST(N'2023-09-26T20:17:11.8373718' AS DateTime2), 0, 1, N'2', N'đk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (56, CAST(N'2023-09-26T20:17:27.1090465' AS DateTime2), 0, 1, N'123', N'đk', NULL)
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (57, CAST(N'2023-09-26T20:17:27.1090667' AS DateTime2), 2, 1, N'123', N'đk', N'KHO4')
INSERT [dbo].[Receipts] ([Id], [DateCreated], [Type], [Status], [WareHouseId], [StaffId], [DestinationWarehouseId]) VALUES (58, CAST(N'2023-09-27T17:01:17.7668304' AS DateTime2), 1, 1, N'KHO3', N'đk', NULL)
SET IDENTITY_INSERT [dbo].[Receipts] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6e89e82b-2282-4b09-863c-da4b87de248e', N'Admin', N'ADMIN', N'ced0ab4b-1374-4e61-b9e8-a8c55923fbc0')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8f75442e-09ec-4ebe-8349-f54c37b4645d', N'Manager', N'MANAGER', N'e02207a3-eac0-407f-a4ea-0a900ff6ab47')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a5439a8b-1943-49b1-af9a-ab3a50b6be7c', N'Storekeeper', N'STOREKEEPER', N'f1759ca6-a5c7-4e60-88d7-4ad056ac5656')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'bbf38c0a-6019-4b94-823e-ed6d16f9ab6a', N'Sales staff', N'SALES STAFF', N'6a02a778-744b-46e6-b5b9-5005f6be8dae')
GO
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'123', N'Nguyễn Văn A', CAST(N'2023-03-24T00:00:00.0000000' AS DateTime2), 0, N'0989337123', N'123@gmai.com', NULL, CAST(N'2023-03-24T00:00:00.0000000' AS DateTime2), N'123', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'đk', N'đặng khoa', CAST(N'2023-04-04T00:00:00.0000000' AS DateTime2), 0, N'+84989337410', N'dangkhoa10052000@gmail.com', N'abcxyz', CAST(N'2023-04-04T00:00:00.0000000' AS DateTime2), N'123', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'đk14', N'đặng khoa', CAST(N'2023-04-04T00:00:00.0000000' AS DateTime2), 0, N'+84989337410', N'dangkhoa10052001@gmail.com', N'abcxyz', CAST(N'2023-04-04T00:00:00.0000000' AS DateTime2), N'123', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'đk23', N'đặng khoa', CAST(N'2023-04-04T00:00:00.0000000' AS DateTime2), 0, N'+84989337410', N'dangkhoa10052000@gmail.com', N'abcxyz', CAST(N'2023-04-04T00:00:00.0000000' AS DateTime2), N'123', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'dvdk', N'dang van dang khoa', CAST(N'2023-03-28T00:00:00.0000000' AS DateTime2), 0, N'+84989337410', N'dvdk0@gmail.com', N'231 nguyen tri phuong', CAST(N'2023-03-28T00:00:00.0000000' AS DateTime2), N'2', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'dvdk-1', N'dang van dang khoa', CAST(N'2023-03-29T00:00:00.0000000' AS DateTime2), 0, N'0989337410', N'khoa028@gmail.com', N'abcxyz', CAST(N'2023-03-29T00:00:00.0000000' AS DateTime2), N'123', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'dvdk15', N'dang van dang khoa', CAST(N'2023-03-28T00:00:00.0000000' AS DateTime2), 0, N'+84989337410', N'dvdk15@gmail.com', N'231 nguyen tri phuong', CAST(N'2023-03-28T00:00:00.0000000' AS DateTime2), N'123', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'dvdk23', N'dang van dang khoa', CAST(N'2023-03-28T00:00:00.0000000' AS DateTime2), 0, N'+84989337410', N'dvdk23@gmail.com', N'231 nguyen tri phuong', CAST(N'2023-03-28T00:00:00.0000000' AS DateTime2), N'2', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'dvdk33', N'dang van dang khoa', CAST(N'2023-03-29T00:00:00.0000000' AS DateTime2), 0, N'0989337410', N'khoa028@gmail.com', N'abcxyz', CAST(N'2023-03-29T00:00:00.0000000' AS DateTime2), N'2', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'dvdk50', N'dang van dang khoa', CAST(N'2023-03-28T00:00:00.0000000' AS DateTime2), 0, N'+84989337410', N'dvdkhoa50@gmail.com', N'231 nguyen tri phuong', CAST(N'2023-03-28T00:00:00.0000000' AS DateTime2), N'2', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'dvdk54', N'dang van dang khoa', CAST(N'2023-03-29T00:00:00.0000000' AS DateTime2), 0, N'0989337410', N'khoa028@gmail.com', N'abcxyz', CAST(N'2023-03-29T00:00:00.0000000' AS DateTime2), N'2', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'dvdk69', N'dang van dang khoa', CAST(N'2023-03-29T00:00:00.0000000' AS DateTime2), 0, N'0989337410', N'khoa028@gmail.com', N'abcxyz', CAST(N'2023-03-29T00:00:00.0000000' AS DateTime2), N'2', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'h', N'Trần Văn B', CAST(N'2023-09-29T00:00:00.0000000' AS DateTime2), 0, NULL, N'hihi@gmail.com', NULL, CAST(N'2023-09-22T00:00:00.0000000' AS DateTime2), N'KHO6', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Staffs] ([Id], [Name], [DateOfBirth], [Gender], [PhoneNumber], [Email], [Address], [StartDay], [WareHouseId], [UserId], [Status], [CreatedTime], [LastUpdated]) VALUES (N'Tiats', N'dang van dang khoa', CAST(N'2023-03-28T00:00:00.0000000' AS DateTime2), 0, N'+84989337410', N'tiats@gmail.com', N'231 nguyen tri phuong', CAST(N'2023-03-28T00:00:00.0000000' AS DateTime2), N'2', NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[testconnect] ([demo]) VALUES (N'ngon      ')
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'960b09bc-7737-40e0-a9ba-708b9b321616', N'6e89e82b-2282-4b09-863c-da4b87de248e')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'9119bf4a-23e0-41ea-bfd0-68d1666c1d55', N'8f75442e-09ec-4ebe-8349-f54c37b4645d')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'20dac466-2fe8-4ed1-9c13-f06bc4f5535a', N'a5439a8b-1943-49b1-af9a-ab3a50b6be7c')
GO
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'04a1e2ec-0b48-4c04-9abb-a2d1477b2e0a', N'dvkhoa@gmail.com', N'DVKHOA@GMAIL.COM', N'dvkhoa@gmail.com', N'DVKHOA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAiOvjn3uLd7Xh9hPO2wfk+2SUGmBZOsjqzSSo2EK1z5j3Oe8DsQpe1iDWtyMucWKQ==', N'RKS6WUWSGDJVY54325WU7DYB5EERTF37', N'2038f180-84a8-47d5-9677-8454b8e252a6', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'20dac466-2fe8-4ed1-9c13-f06bc4f5535a', N'dangkhoa10052001@gmail.com', N'DANGKHOA10052001@GMAIL.COM', N'dangkhoa10052001@gmail.com', N'DANGKHOA10052001@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEEOh77KFiKlWq9hG2DEM2GV9Z6NBbTXWvTTPcQ5hNo7Oqe4hoJcgSmZb56Tl/qXJbA==', N'ECXHLAXBTV6QEHWCBTC4QWBAMZP4LWNS', N'3eb95bf3-b329-4852-a42b-2505ab7e305a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'644f124a-e8da-4b87-a849-0b0419da36ed', N'dvdkhoa@gmail.com', N'DVDKHOA@GMAIL.COM', N'dvdkhoa@gmail.com', N'DVDKHOA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKjH/r10rAjXAXWTSRsj8zZcAD19GrAQwDcjEAS+QLwUkpz4l/r10x0EWWDWCMURlg==', N'QC464YT7RDG4OUHZFW4ZSM4SOO3V2HV4', N'fc745e7f-46d9-4e6d-bb0b-bcdd3e6bebb1', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'68b3187a-8fc6-40ae-9ec5-b00b53879320', N'hihi@gmail.com', N'HIHI@GMAIL.COM', N'hihi@gmail.com', N'HIHI@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOm6re3TCPDYCzBZ2mBO/H9DhXdwjfMADTZES0Kaz5t50kkvFeIxuX9YOiww76X4Cg==', N'33I4DL6HDWIJCSUYB4HCOSSRDE4ZOBC6', N'0783b63f-7732-4af5-83a0-c66442f69a21', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9119bf4a-23e0-41ea-bfd0-68d1666c1d55', N'khoa028@gmail.com', N'KHOA028@GMAIL.COM', N'khoa028@gmail.com', N'KHOA028@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAED0CT/uTvebXVl5v4XTTmFnkxTI8+VjnI7UCcjyqQMLqop0N415nBTdCv3uddsQtpg==', N'LT7KZMGFIN33Z6WNE7SKCNZFOL4RH5SF', N'30b9ac52-c497-4eee-8e59-44aa5c0367d6', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'960b09bc-7737-40e0-a9ba-708b9b321616', N'admin', N'ADMIN', N'dangkhoa10052000@gmail.com', N'DANGKHOA10052000@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEH96Np/syoj7OIus7OHvs3UU8aXuYNYXvARc8tJ5QxlpTZp3GHAuxRkuhj00sG02Rg==', N'324PC3AGDHTQEP6WXOLHWGJKPBBUGKZF', N'55db03fc-5de2-4381-9c9b-7f411ff2497b', NULL, 0, 0, CAST(N'2023-07-13T13:26:49.7648565+00:00' AS DateTimeOffset), 1, 0)
GO
INSERT [dbo].[WareHouses] ([Id], [Name], [PhoneNumber], [Address], [Status], [CreatedTime], [LastUpdated]) VALUES (N'123', N'Kho 2', N'0944712905', N'1 Hai Ba Trung', 1, CAST(N'2023-09-29T14:01:31.7505367' AS DateTime2), CAST(N'2023-09-29T14:01:31.7505383' AS DateTime2))
INSERT [dbo].[WareHouses] ([Id], [Name], [PhoneNumber], [Address], [Status], [CreatedTime], [LastUpdated]) VALUES (N'2', N'Kho 1', N'0989337410', N'2 Nguyen Tri Phuong', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[WareHouses] ([Id], [Name], [PhoneNumber], [Address], [Status], [CreatedTime], [LastUpdated]) VALUES (N'KHO3', N'Kho 3', N'0989337444', N'Ninh Kiều, Cần Thơ', 1, CAST(N'2023-09-22T15:00:39.3900309' AS DateTime2), CAST(N'2023-09-22T15:00:39.3900743' AS DateTime2))
INSERT [dbo].[WareHouses] ([Id], [Name], [PhoneNumber], [Address], [Status], [CreatedTime], [LastUpdated]) VALUES (N'KHO4', N'Kho 4', N'0989337444', N'Cái Răng, Cần Thơ', 1, CAST(N'2023-09-22T15:00:58.7718652' AS DateTime2), CAST(N'2023-09-22T15:00:58.7718677' AS DateTime2))
INSERT [dbo].[WareHouses] ([Id], [Name], [PhoneNumber], [Address], [Status], [CreatedTime], [LastUpdated]) VALUES (N'KHO5', N'Kho 5', N'0989337444', N'Ô Môn, Cần Thơ', 1, CAST(N'2023-09-22T15:01:15.9907719' AS DateTime2), CAST(N'2023-09-22T15:01:15.9907750' AS DateTime2))
INSERT [dbo].[WareHouses] ([Id], [Name], [PhoneNumber], [Address], [Status], [CreatedTime], [LastUpdated]) VALUES (N'KHO6', N'Kho 6', N'0989337444', N'Cờ Đỏ, Cần Thơ', 1, CAST(N'2023-09-22T15:01:38.1008061' AS DateTime2), CAST(N'2023-09-22T15:01:38.1008093' AS DateTime2))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CartDetails_ProductId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CartDetails_ProductId] ON [dbo].[CartDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_CustomerId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Carts_CustomerId] ON [dbo].[Carts]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryDetailedConfigs_CategoryId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_CategoryDetailedConfigs_CategoryId] ON [dbo].[CategoryDetailedConfigs]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryDetailedConfigs_ConfigId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_CategoryDetailedConfigs_ConfigId] ON [dbo].[CategoryDetailedConfigs]
(
	[ConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Customer_UserId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Customer_UserId] ON [dbo].[Customer]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_CustomerId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_Order_CustomerId] ON [dbo].[Order]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Order_StaffId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_Order_StaffId] ON [dbo].[Order]
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Order_StoreId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_Order_StoreId] ON [dbo].[Order]
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_OrderId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrderDetail_OrderId] ON [dbo].[OrderDetail]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrderDetail_ProductId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrderDetail_ProductId] ON [dbo].[OrderDetail]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductClassifications_ClassificationId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_ProductClassifications_ClassificationId] ON [dbo].[ProductClassifications]
(
	[ClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductClassifications_ProductId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_ProductClassifications_ProductId] ON [dbo].[ProductClassifications]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductDetailedConfigs_ConfigId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_ProductDetailedConfigs_ConfigId] ON [dbo].[ProductDetailedConfigs]
(
	[ConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductDetailedConfigs_ProductId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_ProductDetailedConfigs_ProductId] ON [dbo].[ProductDetailedConfigs]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductImages_ProductId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_ProductId] ON [dbo].[ProductImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductPromotions_PromotionId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_ProductPromotions_PromotionId] ON [dbo].[ProductPromotions]
(
	[PromotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductWareHouses_ProductId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_ProductWareHouses_ProductId] ON [dbo].[ProductWareHouses]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductWareHouses_WareHouseId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_ProductWareHouses_WareHouseId] ON [dbo].[ProductWareHouses]
(
	[WareHouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReceiptDetails_ProductId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_ReceiptDetails_ProductId] ON [dbo].[ReceiptDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReceiptDetails_ReceiptId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_ReceiptDetails_ReceiptId] ON [dbo].[ReceiptDetails]
(
	[ReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Receipts_DestinationWarehouseId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_Receipts_DestinationWarehouseId] ON [dbo].[Receipts]
(
	[DestinationWarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Receipts_StaffId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_Receipts_StaffId] ON [dbo].[Receipts]
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Receipts_WareHouseId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_Receipts_WareHouseId] ON [dbo].[Receipts]
(
	[WareHouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleClaims_RoleId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_RoleClaims_RoleId] ON [dbo].[RoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[Roles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Staffs_UserId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Staffs_UserId] ON [dbo].[Staffs]
(
	[UserId] ASC
)
WHERE ([UserId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Staffs_WareHouseId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_Staffs_WareHouseId] ON [dbo].[Staffs]
(
	[WareHouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserClaims_UserId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_UserClaims_UserId] ON [dbo].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserLogins_UserId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_UserLogins_UserId] ON [dbo].[UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserRoles_RoleId]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleId] ON [dbo].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[Users]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 29/09/2023 6:35:39 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[Users]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Promotions] ADD  DEFAULT ((0)) FOR [PromotionType]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Carts_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Carts_CartId]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Customer_CustomerId]
GO
ALTER TABLE [dbo].[CategoryDetailedConfigs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryDetailedConfigs_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[CategoryDetailedConfigs] CHECK CONSTRAINT [FK_CategoryDetailedConfigs_Categories_CategoryId]
GO
ALTER TABLE [dbo].[CategoryDetailedConfigs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryDetailedConfigs_DetailedConfigs_ConfigId] FOREIGN KEY([ConfigId])
REFERENCES [dbo].[DetailedConfigs] ([Id])
GO
ALTER TABLE [dbo].[CategoryDetailedConfigs] CHECK CONSTRAINT [FK_CategoryDetailedConfigs_DetailedConfigs_ConfigId]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Users_UserId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer_CustomerId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Staffs_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staffs] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Staffs_StaffId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_WareHouses_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[WareHouses] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_WareHouses_StoreId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order_OrderId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ProductClassifications_Classifications_ClassificationId] FOREIGN KEY([ClassificationId])
REFERENCES [dbo].[Classifications] ([Id])
GO
ALTER TABLE [dbo].[ProductClassifications] CHECK CONSTRAINT [FK_ProductClassifications_Classifications_ClassificationId]
GO
ALTER TABLE [dbo].[ProductClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ProductClassifications_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductClassifications] CHECK CONSTRAINT [FK_ProductClassifications_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductDetailedConfigs]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetailedConfigs_DetailedConfigs_ConfigId] FOREIGN KEY([ConfigId])
REFERENCES [dbo].[DetailedConfigs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDetailedConfigs] CHECK CONSTRAINT [FK_ProductDetailedConfigs_DetailedConfigs_ConfigId]
GO
ALTER TABLE [dbo].[ProductDetailedConfigs]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetailedConfigs_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDetailedConfigs] CHECK CONSTRAINT [FK_ProductDetailedConfigs_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductPromotions]  WITH CHECK ADD  CONSTRAINT [FK_ProductPromotions_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductPromotions] CHECK CONSTRAINT [FK_ProductPromotions_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductPromotions]  WITH CHECK ADD  CONSTRAINT [FK_ProductPromotions_Promotions_PromotionId] FOREIGN KEY([PromotionId])
REFERENCES [dbo].[Promotions] ([Id])
GO
ALTER TABLE [dbo].[ProductPromotions] CHECK CONSTRAINT [FK_ProductPromotions_Promotions_PromotionId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ProductWareHouses]  WITH CHECK ADD  CONSTRAINT [FK_ProductWareHouses_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductWareHouses] CHECK CONSTRAINT [FK_ProductWareHouses_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductWareHouses]  WITH CHECK ADD  CONSTRAINT [FK_ProductWareHouses_WareHouses_WareHouseId] FOREIGN KEY([WareHouseId])
REFERENCES [dbo].[WareHouses] ([Id])
GO
ALTER TABLE [dbo].[ProductWareHouses] CHECK CONSTRAINT [FK_ProductWareHouses_WareHouses_WareHouseId]
GO
ALTER TABLE [dbo].[ReceiptDetails]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ReceiptDetails] CHECK CONSTRAINT [FK_ReceiptDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[ReceiptDetails]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptDetails_Receipts_ReceiptId] FOREIGN KEY([ReceiptId])
REFERENCES [dbo].[Receipts] ([Id])
GO
ALTER TABLE [dbo].[ReceiptDetails] CHECK CONSTRAINT [FK_ReceiptDetails_Receipts_ReceiptId]
GO
ALTER TABLE [dbo].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_Receipts_Staffs_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staffs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Receipts] CHECK CONSTRAINT [FK_Receipts_Staffs_StaffId]
GO
ALTER TABLE [dbo].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_Receipts_WareHouses_DestinationWarehouseId] FOREIGN KEY([DestinationWarehouseId])
REFERENCES [dbo].[WareHouses] ([Id])
GO
ALTER TABLE [dbo].[Receipts] CHECK CONSTRAINT [FK_Receipts_WareHouses_DestinationWarehouseId]
GO
ALTER TABLE [dbo].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_Receipts_WareHouses_WareHouseId] FOREIGN KEY([WareHouseId])
REFERENCES [dbo].[WareHouses] ([Id])
GO
ALTER TABLE [dbo].[Receipts] CHECK CONSTRAINT [FK_Receipts_WareHouses_WareHouseId]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK_Staffs_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK_Staffs_Users_UserId]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK_Staffs_WareHouses_WareHouseId] FOREIGN KEY([WareHouseId])
REFERENCES [dbo].[WareHouses] ([Id])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK_Staffs_WareHouses_WareHouseId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [dvdkhoa] SET  READ_WRITE 
GO
