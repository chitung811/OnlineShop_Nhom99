USE [master]
GO
/****** Object:  Database [ShopFruit]    Script Date: 10/01/2021 23:22:10 ******/
CREATE DATABASE [ShopFruit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopFruit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopFruit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopFruit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopFruit_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopFruit] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopFruit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopFruit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopFruit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopFruit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopFruit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopFruit] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopFruit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopFruit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopFruit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopFruit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopFruit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopFruit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopFruit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopFruit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopFruit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopFruit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopFruit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopFruit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopFruit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopFruit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopFruit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopFruit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopFruit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopFruit] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopFruit] SET  MULTI_USER 
GO
ALTER DATABASE [ShopFruit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopFruit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopFruit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopFruit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopFruit] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopFruit] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopFruit', N'ON'
GO
ALTER DATABASE [ShopFruit] SET QUERY_STORE = OFF
GO
USE [ShopFruit]
GO
/****** Object:  Table [dbo].[About]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[AboutID] [int] IDENTITY(1,1) NOT NULL,
	[Banner] [nvarchar](50) NULL,
	[icon] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[ContentProduct] [nvarchar](500) NULL,
	[Avatar] [nvarchar](50) NULL,
	[ContentPeople] [nvarchar](500) NULL,
	[Name] [nvarchar](50) NULL,
	[HappyCustomer] [nvarchar](50) NULL,
	[FarmerName] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[Summary] [nvarchar](500) NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[AboutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnhSanPham]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhSanPham](
	[AnhSanPhamID] [bigint] IDENTITY(1,1) NOT NULL,
	[image1] [nvarchar](50) NULL,
	[Image2] [nvarchar](50) NULL,
	[Image3] [nvarchar](50) NULL,
	[Image4] [nvarchar](50) NULL,
	[Image5] [nvarchar](50) NULL,
	[SanPhamID] [bigint] NULL,
	[BlogID] [bigint] NULL,
 CONSTRAINT [PK_AnhSanPham] PRIMARY KEY CLUSTERED 
(
	[AnhSanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [bigint] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[TitleBlog] [nvarchar](50) NULL,
	[Content] [nvarchar](max) NULL,
	[DanhMucSanPhamID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[SanPhamID] [bigint] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](500) NULL,
	[UserID] [bigint] NULL,
	[BlogID] [bigint] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[Hotline] [varchar](15) NULL,
	[Call] [varchar](15) NULL,
	[Gmail] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[DanhGiaID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[SanPhamID] [bigint] NULL,
	[Rate] [int] NULL,
	[YourReview] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[DanhGiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[DanhMucID] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[DanhMucID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMucSanPham]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucSanPham](
	[DanhMucSanPhamID] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMucSanPham] [nvarchar](100) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[DanhMucID] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_DanhMucSanPham] PRIMARY KEY CLUSTERED 
(
	[DanhMucSanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[FooterID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[FooterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageContact]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageContact](
	[MessageContactID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Message] [nvarchar](500) NULL,
 CONSTRAINT [PK_MessageContact] PRIMARY KEY CLUSTERED 
(
	[MessageContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](15) NULL,
	[ShipAddress] [nchar](100) NULL,
	[ShipEmail] [nvarchar](100) NULL,
	[Status] [bit] NULL,
	[GiaShip] [decimal](18, 0) NULL,
	[UserID] [bigint] NULL,
	[TongTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[SanPhamID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[DonGia] [varchar](10) NULL,
	[Quantity] [int] NULL,
	[ThanhTien] [varchar](50) NULL,
 CONSTRAINT [PK_ChiTietGioHang] PRIMARY KEY CLUSTERED 
(
	[SanPhamID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[SanPhamID] [bigint] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[TenSanPham] [nvarchar](100) NULL,
	[DonGia] [varchar](10) NULL,
	[PromotionPrice] [varchar](10) NULL,
	[TomTat] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[Quantity] [int] NULL,
	[DanhMucSanPhamID] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[ShipID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[GiaShip] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Ship] PRIMARY KEY CLUSTERED 
(
	[ShipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[SlideID] [int] IDENTITY(1,1) NOT NULL,
	[slide] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[SlideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](100) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[Gmail] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[GroupID] [nvarchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](15) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Footer] ADD  CONSTRAINT [DF_Footer_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_GiaShip]  DEFAULT ((0)) FOR [GiaShip]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_TongTien]  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_SanPhamID]  DEFAULT ((0)) FOR [SanPhamID]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_OrderID]  DEFAULT ((0)) FOR [OrderID]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_ThanhTien]  DEFAULT ((0)) FOR [ThanhTien]
GO
ALTER TABLE [dbo].[Ship] ADD  CONSTRAINT [DF_Ship_GiaShip]  DEFAULT ((0)) FOR [GiaShip]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT (N'MEMBER') FOR [GroupID]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAbout]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeleteAbout]   
(    
 @AboutID int
)    
as     
Begin    
 Delete About where AboutID=@AboutID;    
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteBlog]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteBlog]   
(    
 @BlogID nchar    
)    
as     
Begin    
 Delete Blog where BlogID=@BlogID;    
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteContact]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteContact]   
(    
 @ContactID integer    
)    
as     
Begin    
 Delete Contact where ContactID=@ContactID;    
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteDanhMuc]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteDanhMuc] 
(    
 @DanhMucID integer    
)    
as     
Begin    
 Delete DanhMuc where DanhMucID=@DanhMucID;    
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteDanhMucSanPham]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteDanhMucSanPham]  
(    
 @DanhMucSanPhamID integer    
)    
as     
Begin    
 Delete DanhMucSanPham where DanhMucSanPhamID=@DanhMucSanPhamID;    
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteFooter]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteFooter]  
(    
 @FooterID integer    
)    
as     
Begin    
 Delete Footer where FooterID=@FooterID;    
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteOrder]
(
	@OrderID bigint
)
as
begin
	Delete [Order] where OrderID = @OrderID;
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteSanPham]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteSanPham] 
(    
 @SanPhamID bigint    
)    
as     
Begin    
 Delete SanPham where SanPhamID=@SanPhamID;    
End  
GO
/****** Object:  StoredProcedure [dbo].[DeleteSilde]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteSilde]
(    
 @SlideID integer    
)    
as     
Begin    
 Delete Slide where SlideID=@SlideID;    
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteUser]
(
	@UserID bigint
)
as
begin
	Delete [User] where UserID = @UserID;
end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateAbout]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateAbout]  
(    
@AboutID int,    
@Banner nvarchar(50),    
@icon nvarchar(50),
@Image nvarchar(50),
@ContentProduct nvarchar(500),   
@Avatar nvarchar(50),
@ContentPeople nvarchar(500),
@Name nvarchar(50),    
@HappyCustomer nvarchar(50),
@FarmerName nvarchar(50),
@Position nvarchar(50),
@Summary nvarchar(500),    
@Action varchar(10)    
)    
As    
Begin    
if @Action='Insert'    
Begin    
 Insert into About(Banner,icon,[Image],ContentProduct,Avatar,ContentPeople,Name,HappyCustomer,FarmerName,Position,Summary) values(@Banner,@icon,@Image,@ContentProduct,@Avatar,@ContentPeople,@Name,@HappyCustomer,@FarmerName,@Position,@Summary);    
End    
if @Action='Update'    
Begin    
 Update About set Banner=@Banner,icon=@icon,[Image]=@Image,ContentProduct=@ContentProduct,Avatar=@Avatar,ContentPeople=@ContentPeople,Name=@Name,HappyCustomer=@HappyCustomer,FarmerName=@FarmerName,Position=@Position,Summary=@Summary where AboutID=@AboutID;    
End      
End  
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateBlog]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateBlog]  
(    
@BlogID bigint,    
@Image nvarchar(100),    
@TitleBlog nvarchar(50),
@Content nvarchar(max),
@DanhMucSanPhamID int,   
@CreateDate datetime,
@SanPhamID bigint,
@Status int,    
@Action varchar(10)    
)    
As    
Begin    
if @Action='Insert'    
Begin    
 Insert into Blog([Image],TitleBlog,Content,DanhMucSanPhamID,CreateDate,SanPhamID,[Status]) values(@Image,@TitleBlog,@Content,@DanhMucSanPhamID,@CreateDate,@SanPhamID,@Status);    
End    
if @Action='Update'    
Begin    
 Update Blog set [Image]=@Image,TitleBlog=@TitleBlog,Content=@Content,DanhMucSanPhamID=@DanhMucSanPhamID,CreateDate=@CreateDate,SanPhamID=@SanPhamID,[Status]=@Status where BlogID=@BlogID;    
End      
End  
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateContact]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateContact]    
(    
@ContactID integer,    
@Address nvarchar(100),    
@Hotline varchar(15),    
@Call varchar(15),    
@Gmail nvarchar(50),
@Description nvarchar(500),  
@Action varchar(10)    
)    
As    
Begin    
if @Action='Insert'    
Begin    
 Insert into Contact([Address],Hotline,[Call],Gmail,[Description]) values(@Address,@Hotline,@Call,@Gmail,@Description);    
End    
if @Action='Update'    
Begin    
 Update Contact set [Address]=@Address,Hotline=@Hotline,[Call]=@Call,Gmail=@Gmail,[Description]=@Description where ContactID=@ContactID;    
End      
End  
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateDanhMuc]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[InsertUpdateDanhMuc]   
(    
@DanhMucID integer,    
@TenDanhMuc nvarchar(50),    
@MetaKeyword nvarchar(250),    
@Status nvarchar(50),       
@Action varchar(10)    
)    
As    
Begin    
if @Action='Insert'    
Begin    
 Insert into DanhMuc(TenDanhMuc,MetaKeyword,[Status]) values(@TenDanhMuc,@MetaKeyword,@Status);    
End    
if @Action='Update'    
Begin    
 Update DanhMuc set TenDanhMuc=@TenDanhMuc,MetaKeyword=@MetaKeyword,[Status]=@Status where DanhMucID=@DanhMucID;    
End      
End  
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateDanhMucSanPham]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateDanhMucSanPham]   
(    
@DanhMucSanPhamID integer,    
@TenDanhMucSanPham nvarchar(100),    
@MetaKeyword nvarchar(250),    
@DanhMucID integer,  
@Status integer,
@Action varchar(10)    
)    
As    
Begin    
if @Action='Insert'    
Begin    
 Insert into DanhMucSanPham(TenDanhMucSanPham,MetaKeyword,DanhMucID,[Status]) values(@TenDanhMucSanPham,@MetaKeyword,@DanhMucID,@Status);    
End    
if @Action='Update'    
Begin    
 Update DanhMucSanPham set TenDanhMucSanPham=@TenDanhMucSanPham    
,MetaKeyword=@MetaKeyword,DanhMucID=@DanhMucID,[Status]=@Status where DanhMucSanPhamID=@DanhMucSanPhamID;    
End      
End  
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateFooter]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateFooter]    
(    
@FooterID integer,    
@Content nvarchar(max),
@Status bit,    
@Action varchar(10)    
)    
As    
Begin    
if @Action='Insert'    
Begin    
 Insert into Footer(Content,[Status]) values(@Content,@Status);    
End    
if @Action='Update'    
Begin    
 Update Footer set Content=@Content,[Status]=@Status where FooterID=@FooterID;    
End      
End  
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateOrder]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateOrder]
(
@OrderID bigint,
@Action nchar(10)
)
as
Begin
if @Action='Update'
begin
	Update [Order] set [Status] = 0 where OrderID = @OrderID;
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateSanPham]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[InsertUpdateSanPham]   
(    
@SanPhamID bigint,    
@Image nvarchar(100),    
@TenSanPham nvarchar(100),    
@DonGia	varchar(10),
@PromotionPrice	varchar(10),
@TomTat	nvarchar(500),
@Description nvarchar(MAX),
@MetaKeyword nvarchar(250),
@Quantity int,
@DanhMucSanPhamID int,
@Status	int,
@Action varchar(10)    
)    
As    
Begin    
if @Action='Insert'    
Begin    
 Insert into SanPham(
[Image],
TenSanPham,
DonGia,
PromotionPrice,
TomTat,
[Description],
MetaKeyword,
Quantity,
DanhMucSanPhamID,
[Status]
) values(
@Image,
@TenSanPham,
@DonGia,
@PromotionPrice,
@TomTat,
@Description,
@MetaKeyword,
@Quantity,
@DanhMucSanPhamID,
@Status);    
End    
if @Action='Update'    
Begin    
 Update SanPham set [Image]=@Image,TenSanPham=@TenSanPham,DonGia=@DonGia,PromotionPrice=@PromotionPrice,TomTat=@TomTat,[Description]=@Description,MetaKeyword=@MetaKeyword,Quantity=@Quantity,DanhMucSanPhamID=@DanhMucSanPhamID,[Status]=@Status where SanPhamID=@SanPhamID;    
End      
End
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateSlide]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateSlide]   
(    
@SlideID integer,    
@slide nvarchar(50),    
@Image nvarchar(50),    
@Title nvarchar(50),    
@Description nvarchar(100),  
@Status bit,  
@Action varchar(10)    
)    
As    
Begin    
if @Action='Insert'    
Begin    
 Insert into Slide(slide,[Image],Title,[Description],[Status]) values(@slide,@Image,@Title,@Description,@Status);    
End    
if @Action='Update'    
Begin    
 Update Slide set slide=@slide,[Image]=@Image,Title=@Title,[Description]=@Description,[Status]=@Status where SlideID=@SlideID;    
End      
End  
  
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateUser]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateUser]
(
@UserID bigint,
@Gmail nvarchar(50),
@Password nvarchar(50),
@GroupID nvarchar(20) NULL,
@Name nvarchar(50) NULL,
@Address nvarchar(100) NULL,
@Phone varchar(15) NULL,
@Status bit,
@Action varchar(10)
)
as
Begin
if @Action='Insert'
begin
	Insert into [User](Gmail,Password,GroupID,Name,Address,Phone,Status) values(@Gmail,@Password,@GroupID,@Name,@Address,@Phone,@Status);
end
if @Action='Update'
begin
	Update [User] set Gmail=@Gmail, Password = @Password, GroupID = @GroupID, Name = @Name, Address = @Address, Phone= @Phone, Status = @Status where UserID = @UserID;
end
if @Action='UpdateFB'
begin
	Update [User] set Gmail=@Gmail, Password = @Password, GroupID = @GroupID, Name = Name, Address = @Address, Phone= @Phone, Status = @Status where UserID = @UserID;
end
end
GO
/****** Object:  StoredProcedure [dbo].[SelectAbout]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SelectAbout]  
as     
Begin    
Select * from About;    
End 
GO
/****** Object:  StoredProcedure [dbo].[SelectBlog]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SelectBlog]
as
begin
Select Blog.BlogID,Blog.Content,Blog.CreateDate,Blog.[Image],Blog.[Status],Blog.TitleBlog,AnhSanPham.image1,AnhSanPham.Image2,
		AnhSanPham.Image3,AnhSanPham.Image4,AnhSanPham.Image5,SanPham.SanPhamID,SanPham.TenSanPham,SanPham.TomTat
		from Blog left join SanPham on Blog.BlogID=SanPham.SanPhamID left join AnhSanPham on Blog.BlogID = AnhSanPham.BlogID

end
GO
/****** Object:  StoredProcedure [dbo].[SelectBlogAdmin]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SelectBlogAdmin]
as     
Begin    
Select * from Blog;    
End  
GO
/****** Object:  StoredProcedure [dbo].[SelectBlogDetail]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SelectBlogDetail]
(@BlogID bigint )
as
begin
Select Blog.BlogID,Blog.Content,Blog.CreateDate,Blog.[Image],Blog.[Status],Blog.TitleBlog,AnhSanPham.image1,AnhSanPham.Image2,
		AnhSanPham.Image3,AnhSanPham.Image4,AnhSanPham.Image5,SanPham.SanPhamID,SanPham.TenSanPham,SanPham.TomTat
		from Blog left join SanPham on Blog.BlogID=SanPham.SanPhamID left join AnhSanPham on Blog.BlogID = AnhSanPham.BlogID
		where Blog.BlogID = @BlogID

end
GO
/****** Object:  StoredProcedure [dbo].[SelectContact]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SelectContact]   
as     
Begin    
Select * from Contact;    
End  
   
GO
/****** Object:  StoredProcedure [dbo].[SelectDanhMuc]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SelectDanhMuc]    
as     
Begin    
Select * from DanhMuc;    
End  
  
GO
/****** Object:  StoredProcedure [dbo].[SelectDanhMucSanPham]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SelectDanhMucSanPham]    
as     
Begin    
Select DanhMucSanPham.DanhMucSanPhamID, DanhMucSanPham.TenDanhMucSanPham,DanhMucSanPham.MetaKeyword,DanhMucSanPham.Status,DanhMuc.TenDanhMuc from DanhMucSanPham inner join DanhMuc on DanhMucSanPham.DanhMucID = DanhMuc.DanhMucID;    
End  
  
GO
/****** Object:  StoredProcedure [dbo].[SelectFooter]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SelectFooter]   
as     
Begin    
Select * from Footer;    
End  
GO
/****** Object:  StoredProcedure [dbo].[SelectOrder]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Select User
Create Procedure [dbo].[SelectOrder]
as
Begin
Select * from [Order];
End
GO
/****** Object:  StoredProcedure [dbo].[SelectOrderDetail]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Select User
Create Procedure [dbo].[SelectOrderDetail]
as
Begin
Select * from [OrderDetail];
End
GO
/****** Object:  StoredProcedure [dbo].[SelectQuanLyDonHang]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectQuanLyDonHang]
(
	@UserID bigint
)
as
begin
select sp.TenSanPham, [Order].*,OrderDetail.*
from [Order] left join OrderDetail on OrderDetail.OrderID = [Order].OrderID left join SanPham sp on OrderDetail.SanPhamID = sp.SanPhamID
where [Order].UserID=@UserID AND [Order].[Status] = 'True'
end
GO
/****** Object:  StoredProcedure [dbo].[SelectQuanLyDonHangALL]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectQuanLyDonHangALL]
(
	@UserID bigint
)
as
begin
select sp.TenSanPham, [Order].*,OrderDetail.*
from ([Order] inner join OrderDetail on OrderDetail.OrderID = [Order].OrderID) inner join SanPham sp on OrderDetail.SanPhamID = sp.SanPhamID
where [Order].UserID=@UserID
end
GO
/****** Object:  StoredProcedure [dbo].[SelectQuanLyDonHangThanhToan]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectQuanLyDonHangThanhToan]
(
	@UserID bigint
)
as
begin
select sp.TenSanPham, [Order].*,OrderDetail.*
from [Order] left join OrderDetail on OrderDetail.OrderID = [Order].OrderID left join SanPham sp on OrderDetail.SanPhamID = sp.SanPhamID
where [Order].UserID=@UserID And [Order].Status = 'False'
end
GO
/****** Object:  StoredProcedure [dbo].[SelectSanPham]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SelectSanPham]    
as     
Begin    
Select SanPham.SanPhamID,
SanPham.Image,
SanPham.TenSanPham,
SanPham.DonGia,
SanPham.PromotionPrice,
SanPham.TomTat,
SanPham.Description,
SanPham.MetaKeyword,
SanPham.Quantity,
SanPham.Status,
DanhMucSanPham.TenDanhMucSanPham,
DanhMucSanPham.DanhMucSanPhamID
 from SanPham inner join DanhMucSanPham on SanPham.DanhMucSanPhamID = DanhMucSanPham.DanhMucSanPhamID;    
End 
 
GO
/****** Object:  StoredProcedure [dbo].[SelectSlide]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SelectSlide]   
as     
Begin    
Select * from Slide;    
End  
  
GO
/****** Object:  StoredProcedure [dbo].[SelectUser]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SelectUser]
as
Begin
Select * from [User];
End
GO
/****** Object:  StoredProcedure [dbo].[UpdateLoginFacebook]    Script Date: 10/01/2021 23:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[UpdateLoginFacebook]
(
@UserID bigint,
@Password nvarchar(50),
@Address nvarchar(100),
@Phone varchar(15),
@Action varchar(10)
)
as
Begin
if @Action='UpdateFB'
begin
	Update [User] set Password = @Password, Address = @Address, Phone= @Phone where UserID = @UserID;
end
end
GO
USE [master]
GO
ALTER DATABASE [ShopFruit] SET  READ_WRITE 
GO
