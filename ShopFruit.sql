USE [master]
GO
/****** Object:  Database [ShopFruit]    Script Date: 7/18/2019 12:36:35 PM ******/
CREATE DATABASE [ShopFruit]
 CONTAINMENT = NONE

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
ALTER DATABASE [ShopFruit] SET QUERY_STORE = OFF
GO
USE [ShopFruit]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ShopFruit]
GO
/****** Object:  Table [dbo].[About]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnhSanPham]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMucSanPham]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageContact]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 7/18/2019 12:36:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([AboutID], [Banner], [icon], [Image], [ContentProduct], [Avatar], [ContentPeople], [Name], [HappyCustomer], [FarmerName], [Position], [Summary]) VALUES (1, N'about.jpg', N'diet1.png', N'ruler.jpg', N'You''ve heard of Superfoods, but…Superfruits? Not every fruit qualifies. Those deemed "super" by nutrition scientists are packed with antioxidants, fiber, vitamins and minerals, and other nutrients that can help you live longer, look better, and even prevent disease.', N'cl1.jpg', N'Mauris id ipsum et magna egestas volutpat in ac neque. Phasellus sit amet risus sit amet elit ultrices rutrum. Proin vel gravida risus, mollis egestas velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.', N'Jammie Stone', N'Our happy customer', N'Leonel Messi', N'Chartered Financial Advisor', N'Born in Belmont, CA, Kathleen attended UC Riverside where she earned her B.S. ')
INSERT [dbo].[About] ([AboutID], [Banner], [icon], [Image], [ContentProduct], [Avatar], [ContentPeople], [Name], [HappyCustomer], [FarmerName], [Position], [Summary]) VALUES (2, NULL, N'diet2.png', NULL, N'You''ve heard of Superfoods, but…Superfruits? Not every fruit qualifies. Those deemed "super" by nutrition scientists are packed with antioxidants, fiber, vitamins and minerals, and other nutrients that can help you live longer, look better, and even prevent disease.', N'cl2.jpg', N'Mauris id ipsum et magna egestas volutpat in ac neque. Phasellus sit amet risus sit amet elit ultrices rutrum. Proin vel gravida risus, mollis egestas velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.', N'Jesus Navas', N'Our happy customer', NULL, N'Ariel Robbel', N'Born in Belmont, CA, Kathleen attended UC Riverside where she earned her B.S. ')
INSERT [dbo].[About] ([AboutID], [Banner], [icon], [Image], [ContentProduct], [Avatar], [ContentPeople], [Name], [HappyCustomer], [FarmerName], [Position], [Summary]) VALUES (3, N'aaaa', N'diet3.png', N'aaaa', N'You''ve heard of Superfoods, but…Superfruits? Not every fruit qualifies. Those deemed "super" by nutrition scientists are packed with antioxidants, fiber, vitamins and minerals, and other nutrients that can help you live longer, look better, and even prevent disease.', N'cl3.jpg', N'Mauris id ipsum et magna egestas volutpat in ac neque. Phasellus sit amet risus sit amet elit ultrices rutrum. Proin vel gravida risus, mollis egestas velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.', N'Kevil Bruyn', N'Our happy customer', N'aaaa', N'Annabel Croft', N'Born in Belmont, CA, Kathleen attended UC Riverside where she earned her B.S. ')
SET IDENTITY_INSERT [dbo].[About] OFF
SET IDENTITY_INSERT [dbo].[AnhSanPham] ON 

INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (1, N'chuoi-cau-210x210.jpg', N'chuoi-dole-viet-nam-210x210.jpg', N'chuoi-laba-210x210.jpg', N'chuoi-su-210x210.jpg', NULL, 1, 1)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (2, N'chuoi-dole-viet-nam-210x210.jpg', N'chuoi-su-210x210.jpg', N'chuoi-unifarm-210x210.jpg', N'chuoi-dole-viet-nam-210x210.jpg', NULL, 2, 2)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (3, N'chuoi-laba-210x210.jpg', N'chuoi-su-210x210.jpg', N'chuoi-dole-viet-nam-210x210.jpg', N'chuoi-unifarm-210x210.jpg', NULL, 3, 3)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (4, N'chuoi-unifarm-210x210.jpg', N'chuoi-su-210x210.jpg', N'chuoi-dole-viet-nam-210x210.jpg', N'chuoi-unifarm-210x210.jpg', NULL, 4, 4)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (5, N'chuoi-unifarm-210x210.jpg', N'chuoi-dole-viet-nam-210x210.jpg', N'chuoi-su-210x210.jpg', N'chuoi-unifarm-210x210.jpg', NULL, 5, 5)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (6, N'coc-non-giong-thai-7kgth-210x210.jpg', N'coc-xanh-5-7trkg-5kgth-210x210.jpg', N'coc-non-giong-thai-7kgth-210x210.jpg', N'coc-xanh-5-7trkg-5kgth-210x210.jpg', NULL, 6, 6)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (7, N'coc-xanh-5-7trkg-5kgth-210x210.jpg', N'coc-non-giong-thai-7kgth-210x210.jpg', N'coc-xanh-5-7trkg-5kgth-210x210.jpg', N'coc-non-giong-thai-7kgth-210x210.jpg', NULL, 7, 7)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (8, N'dau-han-quoc-330gr-7809-210x210.jpg', N'dau-han-quoc-500g-24540-210x210.jpg', N'dau-han-quoc-330gr-7809-210x210.jpg', NULL, NULL, 8, 8)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (9, N'dau-han-quoc-500g-24540-210x210.jpg', N'dau-han-quoc-330gr-7809-210x210.jpg', N'dau-han-quoc-500g-24540-210x210.jpg', NULL, NULL, 9, 9)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (10, N'dua-hau-do-khong-hat-2-3kg-210x210.jpg', N'dua-hau-my-17-3kg-210x210.jpg', N'dua-hau-ruot-do-2-3kg-210x210.jpg', NULL, NULL, 10, 10)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (11, N'dua-hau-my-17-3kg-210x210.jpg', N'dua-hau-do-khong-hat-2-3kg-210x210.jpg', N'dua-hau-my-17-3kg-210x210.jpg', NULL, NULL, 11, 11)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (12, N'dua-hau-ruot-do-2-3kg-210x210.jpg', N'dua-hau-my-17-3kg-210x210.jpg', N'dua-hau-do-khong-hat-2-3kg-210x210.jpg', NULL, NULL, 12, 12)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (13, NULL, NULL, NULL, NULL, NULL, 13, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (14, NULL, NULL, NULL, NULL, NULL, 14, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (15, NULL, NULL, NULL, NULL, NULL, 15, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (16, NULL, NULL, NULL, NULL, NULL, 16, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (17, NULL, NULL, NULL, NULL, NULL, 17, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (18, NULL, NULL, NULL, NULL, NULL, 18, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (19, NULL, NULL, NULL, NULL, NULL, 19, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (20, NULL, NULL, NULL, NULL, NULL, 20, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (21, NULL, NULL, NULL, NULL, NULL, 21, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (22, NULL, NULL, NULL, NULL, NULL, 22, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (23, NULL, NULL, NULL, NULL, NULL, 23, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (24, NULL, NULL, NULL, NULL, NULL, 24, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (25, NULL, NULL, NULL, NULL, NULL, 25, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (26, NULL, NULL, NULL, NULL, NULL, 26, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (27, NULL, NULL, NULL, NULL, NULL, 27, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (28, NULL, NULL, NULL, NULL, NULL, 28, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (29, NULL, NULL, NULL, NULL, NULL, 29, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (30, NULL, NULL, NULL, NULL, NULL, 30, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (31, NULL, NULL, NULL, NULL, NULL, 31, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (32, NULL, NULL, NULL, NULL, NULL, 32, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (33, NULL, NULL, NULL, NULL, NULL, 33, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (34, NULL, NULL, NULL, NULL, NULL, 34, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (35, NULL, NULL, NULL, NULL, NULL, 35, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (36, NULL, NULL, NULL, NULL, NULL, 36, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (37, NULL, NULL, NULL, NULL, NULL, 37, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (38, NULL, NULL, NULL, NULL, NULL, 38, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (39, NULL, NULL, NULL, NULL, NULL, 39, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (40, NULL, NULL, NULL, NULL, NULL, 40, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (41, NULL, NULL, NULL, NULL, NULL, 41, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (42, NULL, NULL, NULL, NULL, NULL, 42, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (43, NULL, NULL, NULL, NULL, NULL, 43, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (44, NULL, NULL, NULL, NULL, NULL, 44, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (45, NULL, NULL, NULL, NULL, NULL, 45, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (46, NULL, NULL, NULL, NULL, NULL, 46, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (47, NULL, NULL, NULL, NULL, NULL, 47, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (48, NULL, NULL, NULL, NULL, NULL, 48, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (49, NULL, NULL, NULL, NULL, NULL, 49, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (50, NULL, NULL, NULL, NULL, NULL, 50, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (51, NULL, NULL, NULL, NULL, NULL, 51, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (52, NULL, NULL, NULL, NULL, NULL, 52, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (53, NULL, NULL, NULL, NULL, NULL, 53, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (54, NULL, NULL, NULL, NULL, NULL, 54, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (55, NULL, NULL, NULL, NULL, NULL, 55, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (56, NULL, NULL, NULL, NULL, NULL, 56, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (57, NULL, NULL, NULL, NULL, NULL, 57, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (58, NULL, NULL, NULL, NULL, NULL, 58, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (59, NULL, NULL, NULL, NULL, NULL, 59, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (60, NULL, NULL, NULL, NULL, NULL, 60, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (61, NULL, NULL, NULL, NULL, NULL, 61, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (62, NULL, NULL, NULL, NULL, NULL, 62, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (63, NULL, NULL, NULL, NULL, NULL, 10071, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (64, NULL, NULL, NULL, NULL, NULL, 10072, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (65, NULL, NULL, NULL, NULL, NULL, 10073, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (66, NULL, NULL, NULL, NULL, NULL, 10074, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (67, NULL, NULL, NULL, NULL, NULL, 10075, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (68, NULL, NULL, NULL, NULL, NULL, 10076, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (69, NULL, NULL, NULL, NULL, NULL, 10077, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (70, NULL, NULL, NULL, NULL, NULL, 10078, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (71, NULL, NULL, NULL, NULL, NULL, 10079, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (72, NULL, NULL, NULL, NULL, NULL, 10080, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (73, NULL, NULL, NULL, NULL, NULL, 10081, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (74, NULL, NULL, NULL, NULL, NULL, 10082, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (75, NULL, NULL, NULL, NULL, NULL, 10083, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (76, NULL, NULL, NULL, NULL, NULL, 10084, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (77, NULL, NULL, NULL, NULL, NULL, 10085, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (78, NULL, NULL, NULL, NULL, NULL, 10086, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (79, NULL, NULL, NULL, NULL, NULL, 10087, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (80, NULL, NULL, NULL, NULL, NULL, 10088, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (81, NULL, NULL, NULL, NULL, NULL, 10089, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (82, NULL, NULL, NULL, NULL, NULL, 10090, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (83, NULL, NULL, NULL, NULL, NULL, 10091, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (84, NULL, NULL, NULL, NULL, NULL, 10092, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (85, NULL, NULL, NULL, NULL, NULL, 10093, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (86, NULL, NULL, NULL, NULL, NULL, 10094, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (87, NULL, NULL, NULL, NULL, NULL, 10095, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (88, NULL, NULL, NULL, NULL, NULL, 10096, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (89, NULL, NULL, NULL, NULL, NULL, 10097, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (90, NULL, NULL, NULL, NULL, NULL, 10098, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (91, NULL, NULL, NULL, NULL, NULL, 10099, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (92, NULL, NULL, NULL, NULL, NULL, 10100, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (93, NULL, NULL, NULL, NULL, NULL, 10101, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (94, NULL, NULL, NULL, NULL, NULL, 10102, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (95, NULL, NULL, NULL, NULL, NULL, 10103, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (96, NULL, NULL, NULL, NULL, NULL, 10104, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (97, NULL, NULL, NULL, NULL, NULL, 10105, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (98, NULL, NULL, NULL, NULL, NULL, 10106, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (99, NULL, NULL, NULL, NULL, NULL, 10107, NULL)
GO
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (100, NULL, NULL, NULL, NULL, NULL, 10108, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (101, NULL, NULL, NULL, NULL, NULL, 10109, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (102, NULL, NULL, NULL, NULL, NULL, 10110, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (103, NULL, NULL, NULL, NULL, NULL, 10111, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (104, NULL, NULL, NULL, NULL, NULL, 10112, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (105, NULL, NULL, NULL, NULL, NULL, 10113, NULL)
INSERT [dbo].[AnhSanPham] ([AnhSanPhamID], [image1], [Image2], [Image3], [Image4], [Image5], [SanPhamID], [BlogID]) VALUES (106, NULL, NULL, NULL, NULL, NULL, 10114, NULL)
SET IDENTITY_INSERT [dbo].[AnhSanPham] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogID], [Image], [TitleBlog], [Content], [DanhMucSanPhamID], [CreateDate], [SanPhamID], [Status]) VALUES (1, N'213216baoxaydung_6.jpg', N'Lợi ích của chuối mà bạn nên biết', N'<article class="post-body" id="post-body">
						<div style="display:block;overflow:hidden;margin-top: 10px;">
						<h2 class="motabai" style="font-weight:bold;margin-top:-5px">
                                Chuối là loại trái cây hết sức thân thuộc với mỗi chúng ta, song không phải ai cũng biết hết về những lợi ích mà chuối mang lại
                        </h2>
						</div>
                            <section class="entry" id="section_0" entry="261030">


                    <h2 class="sub-title">

                                            1.
                     
                Ngăn ngừa ung thư
            </h2>
        
                    <div class="media">                
                <a id="" class="gif-icon-a"><img class="img-responsive lazyloaded" style="display: block;width:100%" title="Ngăn ngừa ung thư" alt="Ngăn ngừa ung thư,Quả chuối,thực phẩm sạch,ăn chuối" data-src="https://media.ohay.tv/v1/upload/content/2017-02/08/17586-83059de4f5b5419a46f59d34beae387c-ohaytv.jpg" src="https://media.ohay.tv/v1/upload/content/2017-02/08/17586-83059de4f5b5419a46f59d34beae387c-ohaytv.jpg"></a>
                <small></small>
            </div>
        
                				
         <p>Chuối có chứa một loại protein có khả năng ngăn chặn tác tế bào ung thư. Đặc biệt, loại protein này sẽ có nhiều hơn trong quả chín, nhất là những quả đã có đốm hoặc chuyển sang màu tối hơn.</p>        
                 <div class="clear"></div>

    </section>
    
    
    <section class="entry" id="section_1" entry="261031">


                    <h2 class="sub-title">

                                            2.
                     
                Chống chuột rút
            </h2>
        
                    <div class="media">                
                <a id="" class="gif-icon-a"><img class="img-responsive lazyloaded" style="display: block;width:100%" title="Chống chuột rút" alt="Chống chuột rút,Quả chuối,thực phẩm sạch,ăn chuối" data-src="https://media.ohay.tv/v1/upload/content/2017-02/08/17586-fe93af1159298f5711c8a2491d3a7d1b-ohaytv.jpg" src="https://media.ohay.tv/v1/upload/content/2017-02/08/17586-fe93af1159298f5711c8a2491d3a7d1b-ohaytv.jpg"></a>
                <small></small>
            </div>
        
                				
         <p>Thiếu khoáng chất là một nguyên nhân phổ biến dẫn đến các cơn co thắt cơ bắp chân. Bằng cách ăn trái cây như giàu kali và magiê như chuối, bạn có thể ngăn ngừa chuột rút cơ bắp. Đó là lý do tại sao trong chế độ ăn uống của nhiều vận động viên, chuối là lựa chọn số 1.<br></p>        
                 <div class="clear"></div>

    </section>
                        
<center><div class="postads">
<ins class="adsbygoogle" style="display:inline-block;width:300px;height:250px;" data-ad-client="ca-pub-6256914542812517" data-ad-slot="7665358380"></ins>
						<script>
						(adsbygoogle = window.adsbygoogle || []).push({});
						</script>
</div></center>
            
    
    <section class="entry" id="section_2" entry="261032">


                    <h2 class="sub-title">

                                            3.
                     
                Phòng các bệnh về thận
            </h2>
        
                    <div class="media">                
                <a id="" class="gif-icon-a"><img class="img-responsive lazyloaded" style="display: block;width:100%" title="Phòng các bệnh về thận" alt="Phòng các bệnh về thận,Quả chuối,thực phẩm sạch,ăn chuối" data-src="https://media.ohay.tv/v1/upload/content/2017-02/08/17586-31a9d4585de867c260f9b9e49aca8e73-ohaytv.jpg" src="https://media.ohay.tv/v1/upload/content/2017-02/08/17586-31a9d4585de867c260f9b9e49aca8e73-ohaytv.jpg"></a>
                <small></small>
            </div>
        
                				
         <p>Thực phẩm có chứa đủ kali giúp ngăn ngừa sỏi thận. Theo một nghiên cứu, ăn chuối thường xuyên cũng có thể giảm nguy cơ bị khối u ác tính trong thận lên đến 40%.<br></p>        
                 <div class="clear"></div>

    </section>
    
    
    <section class="entry" id="section_3" entry="261033">


                    <h2 class="sub-title">

                                            4.
                     
                Giúp tim khỏe mạnh
            </h2>
        
        
                				
         <p>Một chế độ ăn giàu kali luôn được ưu tiên cho những người có huyết áp cao và dễ bị bệnh tim mạch. Ăn thức ăn hàng ngày có chứa 1,3 gam kali làm giảm nguy cơ tai biến tim tới 26%. Để cung cấp đủ số lượng mà cơ thể của bạn cần, bạn nên ăn 2-3 quả chuối mỗi ngày.<br></p>        
                 <div class="clear"></div>

    </section>
    
    
    <section class="entry" id="section_4" entry="261034">


                    <h2 class="sub-title">

                                            5.
                     
                Hết nghẽn mạch máu
            </h2>
        
                    <div class="media">                
                <a id="" class="gif-icon-a"><img class="img-responsive lazyloaded" style="display: block;width:100%" title="Hết nghẽn mạch máu" alt="Hết nghẽn mạch máu,Quả chuối,thực phẩm sạch,ăn chuối" data-src="https://media.ohay.tv/v1/upload/content/2017-02/08/17586-d8985ce1be517901770d9589ad17466c-ohaytv.jpg" src="https://media.ohay.tv/v1/upload/content/2017-02/08/17586-d8985ce1be517901770d9589ad17466c-ohaytv.jpg"></a>
                <small></small>
            </div>
        
                				
         <p>Cholesterol là nguyên nhân chính gây tắc nghẽn mạch máu, dẫn đến xơ vữa động mạch. Chuối chứa phytosterol giúp giảm mức độ cholesterol trong máu và duy trì sức khỏe hệ thống mạch máu của bạn.<br></p>        
                 <div class="clear"></div>

    </section>
    
    
    <section class="entry" id="section_5" entry="261035">


                    <h2 class="sub-title">

                                            6.
                     
                Dạ dày khỏe mạnh
            </h2>
        
                    <div class="media">                
                <a id="" class="gif-icon-a"><img class="img-responsive lazyloaded" style="display: block;width:100%" title="Dạ dày khỏe mạnh" alt="Dạ dày khỏe mạnh,Quả chuối,thực phẩm sạch,ăn chuối" data-src="https://media.ohay.tv/v1/upload/content/2017-02/08/17586-68627b65b088e8e057bb1df20eb5c815-ohaytv.jpg" src="https://media.ohay.tv/v1/upload/content/2017-02/08/17586-68627b65b088e8e057bb1df20eb5c815-ohaytv.jpg"></a>
                <small></small>
            </div>
        
                				
         <p>Chuối là loại trái cây tuyệt vời cho những ai bị loét dạ dày.&nbsp;Chúng chứa một loại enzyme đặc biệt làm tăng sự bài tiết chất nhầy bảo vệ thành dạ dày.</p>        
                 <div class="clear"></div>

    </section>
    
    
    <section class="entry" id="section_6" entry="261036">


                    <h2 class="sub-title">

                                            7.
                     
                Giúp bạn tràn đầy năng lượng
            </h2>
        
        
                				
         <p>Chuối rất giàu vitamin và chất khoáng. Điều này biến chuối thành một loại thực phẩm giàu năng lượng và sẵn sàng bổ sung cho bạn những lúc cần thiết.</p>        
                 <div class="clear"></div>

    </section>
    
    
    <section class="entry" id="section_7" entry="261037">


                    <h2 class="sub-title">

                                            8.
                     
                Giúp tâm trạng tốt hơn
            </h2>
        
        
                				
         <p>Trong chuối có chứa một loại&nbsp;hormone gọi là "hormone hạnh phúc" giúp tác động đến hệ thần kinh. Nếu bạn đang buồn chuối có thể sẽ giúp bạn cảm thấy thoải mái hơn.</p>        
                 <div class="clear"></div>

    </section>
    
    
    <section class="entry" id="section_8" entry="261038">


                    <h2 class="sub-title">

                                            9.
                     
                Tốt cho người bị tiểu đường
            </h2>
        
                    <div class="media">                
                <a id="" class="gif-icon-a"><img class="img-responsive lazyloaded" style="display: block;width:100%" title="Tốt cho người bị tiểu đường" alt="Tốt cho người bị tiểu đường,Quả chuối,thực phẩm sạch,ăn chuối" data-src="https://media.ohay.tv/v1/upload/content/2017-02/08/17586-c8715739e675003d6402f91eb2a4fae4-ohaytv.jpg" src="https://media.ohay.tv/v1/upload/content/2017-02/08/17586-c8715739e675003d6402f91eb2a4fae4-ohaytv.jpg"></a>
                <small></small>
            </div>
        
                				
         <p>Chuối có chứa một loại tinh bột có khả năng giúp cải thiện tình trạng của những người bị đái tháo đường. Tuy nhiên, loại tinh bột này chỉ có nhiều trong chuối xanh. Một quả chuối xanh có thể chứa 12.5g tinh bột. Con số này ở chuối chín chỉ là 5g.</p>        
                 <div class="clear"></div>

    </section>
    
    
    <section class="entry" id="section_9" entry="261039">


                    <h2 class="sub-title">

                                            10.
                     
                Giảm cân giữ dáng
            </h2>
        
                    <div class="media">                
                <a id="" class="gif-icon-a"><img class="img-responsive lazyloaded" style="display: block;width:100%" title="Giảm cân giữ dáng" alt="Giảm cân giữ dáng,Quả chuối,thực phẩm sạch,ăn chuối" data-src="https://media.ohay.tv/v1/upload/content/2017-02/08/1-6f8677bd6be125a12139820c58c17998-ohaytv.jpg" src="https://media.ohay.tv/v1/upload/content/2017-02/08/1-6f8677bd6be125a12139820c58c17998-ohaytv.jpg"></a>
                <small></small>
            </div>
        
                				
         <p>Kết hợp chuối vào một chế độ ăn hợp lí và tập thể dục sẽ giúp bạn có được một cơ thể hoàn hảo. Trong chuối có chứa một loại chất khoáng giúp ngăn việc tích tụ chất béo. Hãy thử nếu như bạn đang muốn giảm cân nhé.</p>        
                 <div class="clear"></div>

    </section>
    
    

                        </article>', 1, CAST(N'2019-07-06T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Blog] ([BlogID], [Image], [TitleBlog], [Content], [DanhMucSanPhamID], [CreateDate], [SanPhamID], [Status]) VALUES (2, N'list5.jpg', N'Công Dụng của nấm', N'<div class="bxcontentnews" id="bxcontentnewsindx">


            

            <h2 style="text-align: justify;"><span style="line-height: 1.6;">Là loại thực phẩm vô cùng phổ biến thế nhưng ít ai trong chúng ta biết rõ những tác dụng kỳ diệu mà nấm mang lại cho sức khỏe của mỗi người, giúp chống lại bệnh béo phì, cao huyết áp và cả phòng chống bệnh ung thư.</span></h2>

<p style="text-align: justify;">Hàm lượng chất dinh dưỡng trong nấm rất phong phú và đa dạng như vitamin A, B, C, canxi, sắt, kali, kẽm…giúp nấm trở thành loại thực phẩm bạn cần bổ sung ngay vào thực đơn của mình một cách thường xuyên hơn.</p>

<h3 style="text-align: justify;">Chống lại béo phì với nấm rơm</h3>

<p style="text-align: justify;">Là loại nấm vô cùng quen thuộc với tất cả mọi người và xuất hiện khá thường xuyên trong các bữa ăn, nấm rơm có chứa một lượng chất dinh dưỡng vô cùng phong phú. Theo nghiên cứu, trong nấm rơm có chứa protein, chất béo, chất bột đường, chất xơ, rất nhiều yếu tố vi lượng như canxi, sắt, phốt-pho, các vitamin A, B1, B2, C, D, PP…và các axit amin cần thiết cho cơ thể.</p>

<figure><img alt="Nấm rơm hỗ trợ chữa bệnh béo phì, rối loại mỡ máu" title="Nấm rơm hỗ trợ chữa bệnh béo phì, rối loại mỡ máu" class="lazy" data-src="https://cdn.tgdd.vn/Files/2014/08/20/561041/nam-va-nhung-tac-dung-than-ky-1.jpg" src="https://cdn.tgdd.vn/Files/2014/08/20/561041/nam-va-nhung-tac-dung-than-ky-1.jpg" style="display: block; opacity: 1;"><figcaption class="img-caption">Nấm rơm hỗ trợ chữa bệnh béo phì, rối loại mỡ máu</figcaption></figure>

<p style="text-align: justify;"><span style="line-height: 1.6;">Chính nhờ lượng chất phong phú đó, nấm rơm có công dụng hỗ trợ chữa bệnh béo phì, rối loạn lipid máu, đái tháo đường, xơ vữa động mạch và tăng huyết áp, ung thư và các bệnh lý động mạch vành tim.</span></p>

<h3 style="text-align: justify;">Nấm kim châm phòng và chống ung thư</h3>

<p style="text-align: justify;">Nấm kim châm được nhận định là thực phẩm giàu dinh dưỡng cho cả người lớn và trẻ em. Với hàm lượng chất lysin cao hơn hai lần so với nấm mỡ, nấm kim châm giúp tăng khả năng sinh trưởng, cải thiện chiều cao và trí lực cho trẻ nhỏ.</p>

<figure><img alt="Nấm kim châm rất tốt cho trẻ nhỏ" title="Nấm kim châm rất tốt cho trẻ nhỏ" class="lazy" data-src="https://cdn.tgdd.vn/Files/2014/08/20/561041/nam-va-nhung-tac-dung-than-ky-2.jpg" src="https://cdn.tgdd.vn/Files/2014/08/20/561041/nam-va-nhung-tac-dung-than-ky-2.jpg" style="display: block; opacity: 1;"><figcaption class="img-caption">Nấm kim châm rất tốt cho trẻ nhỏ</figcaption></figure>

<p style="text-align: justify;"><span style="line-height: 1.6;">Đối với người già mắc chứng cao huyết áp và người già sức đề kháng yếu, nấm kim châm nên được đưa vào bữa ăn thường xuyên hơn vì chúng chứa hàm lượng kali và kẽm tương đối cao trong khi lượng natri rất thấp.</span></p>

<p style="text-align: justify;">Theo Đông y, nấm kim châm được khuyên dùng bởi nấm có hoạt chất phòng và chống ung thư khá hiệu quả, làm hạ mỡ trong máu, phòng chống các bệnh về đường tiêu hóa, gan, mật.</p>

<h3 style="text-align: justify;">Nấm bào ngư giúp chống bệnh ung bướu</h3>

<figure><img alt="Nấm bào ngư ngăn ngừa ung thư và chống ung bướu" title="Nấm bào ngư ngăn ngừa ung thư và chống ung bướu" class="lazy" data-src="https://cdn.tgdd.vn/Files/2014/08/20/561041/nam-va-nhung-tac-dung-than-ky-3.jpg" src="https://cdn.tgdd.vn/Files/2014/08/20/561041/nam-va-nhung-tac-dung-than-ky-3.jpg" style="display: block; opacity: 1;"><figcaption class="img-caption">Nấm bào ngư ngăn ngừa ung thư và chống ung bướu</figcaption></figure>

<p style="text-align: justify;"><span style="line-height: 1.6;">Nấm bào ngư có vị ngọt, tính ấm, có tác dụng bồi bổ cơ thể, dưỡng huyết rất tốt. Lời khuyên của các chuyên gia đó là mỗi tuần bạn nên ăn nấm bào ngư ít nhất một lần thì cơ thể bạn sẽ chậm lão hóa hơn và ngăn ngừa bệnh ung thư. Các chất dinh dưỡng trong nấm bào ngư còn có khả năng phòng chống ung bướu, stress, béo phì, xơ mỡ động mạch và bệnh huyết áp.</span></p>

<h3 style="text-align: justify;">Giảm cholesterol máu với nấm mỡ</h3>

<figure><img alt="Nấm mỡ giúp giảm đường và cholesterol máu" title="Nấm mỡ giúp giảm đường và cholesterol máu" class="lazy" data-src="https://cdn.tgdd.vn/Files/2014/08/20/561041/nam-va-nhung-tac-dung-than-ky-4.jpg" src="https://cdn.tgdd.vn/Files/2014/08/20/561041/nam-va-nhung-tac-dung-than-ky-4.jpg" style="display: block; opacity: 1;"><figcaption class="img-caption">Nấm mỡ giúp giảm đường và cholesterol máu</figcaption></figure>

<p style="text-align: justify;"><span style="line-height: 1.6;">Nấm mỡ là một trong những loại nấm mang lại giá trị dinh dưỡng cao. Với hàm lượng dinh dưỡng cao như protid, lipid, glucid, canxi, sắt, B1, B2, B6, C, D, E, K…nấm mỡ có tác dụng làm giảm đường và cholesterol máu, phòng chống ung thư và cải thiện chức năng gan, thích hợp cho những người bị ung thư, đái đường, tăng cholesterol máu, cao huyết áp, giảm bạch cầu và viêm gan.</span></p>

<h3 style="text-align: justify;">Nấm hương giúp hạ huyết áp</h3>

<figure><img alt="Nấm hương tốt cho các bệnh về tim mạch" title="Nấm hương tốt cho các bệnh về tim mạch" class="lazy" data-src="https://cdn.tgdd.vn/Files/2014/08/20/561041/nam-va-nhung-tac-dung-than-ky-5.jpg" src="https://cdn.tgdd.vn/Files/2014/08/20/561041/nam-va-nhung-tac-dung-than-ky-5.jpg" style="display: block; opacity: 1;"><figcaption class="img-caption">Nấm hương tốt cho các bệnh về tim mạch</figcaption></figure>

<p style="text-align: justify;"><span style="line-height: 1.6;">Kết quả nghiên cứu đã cho thấy rằng trong nấm hương có chứa một hàm lượng chất khoáng rất phong phú, đặc biệt là kali. Bên cạnh đó, lượng protein, chất xơ, lipid, polisacarit và các vitamin B2, D, PP có trong nấm hương giúp nâng cao sức đề kháng của cơ thể. Nấm hương còn có công dụng hạ huyết áp, ngăn ngừa hình thành cục máu đông làm tắc mạch, giảm cholesterol, giảm béo, chữa viêm khớp, giảm albumin niệu, làm tăng interferon trong cơ thể, phòng ngừa suy lão, phòng trị ung thư, chữa tàn nhang.</span></p>

<h3 style="text-align: justify;">Mách nhỏ mẹo bảo quản nấm</h3>

<p style="text-align: justify;">Các loại nấm hiện được nuôi trồng phổ biến và bày bán rất nhiều trên thị trường, tuy nhiên nếu không biết cách bảo quản thì thời gian sử dụng nấm rất ngắn, chỉ trong một ngày, qua ngày hôm sau sẽ bị vi khuẩn tấn công và có mùi chua, nhớt rất khó chịu. Những sản phẩm này bạn không nên sử dụng.</p>

<p style="text-align: justify;">Cách đơn giản để bảo quản với các loại nấm thân mềm, dài, nhỏ là ngay khi nấm còn tươi, bạn cho nấm vào đóng gói hay những túi chân không có sẵn, sau đó cho vào <a href="http://www.dienmayxanh.com/tu-lanh" target="_blank" title="tủ lạnh">tủ lạnh</a> và dùng dần trong 3 – 4 ngày.</p>

<p style="text-align: justify;">Với loại nấm thân cứng, to, dài, trước khi bảo quản bạn phải tiến hành sơ chế, gọt bỏ phần thâm đen, các tạp chất lẫn trên thân nấm sau đó chần qua nước sôi từ 2 – 3 phút, vớt ra ngâm nước lạnh và cho vào ngăn mát trong tủ lạnh. Bạn có thể dùng chúng trong 3 - 4 ngày.</p>

<p style="text-align: justify;">Nấm có thể dùng để chế biến nhiều món ăn rất ngon từ xào, súp, nướng đến lẩu…mà không gây ngán. Với những lợi ích mà nấm mang lại, chắc chắn trong tuần này thực đơn nhà bạn nên xuất hiện một món nấm thật thơm ngon đúng không? Hãy chia sẻ với&nbsp;<em><a href="http://www.dienmayxanh.com/" target="_blank" title="DienmayXANH.com">DienmayXANH.com</a> </em>thành quả của bạn ngay phần bình luận bên dưới nhé.</p>

<p style="text-align: justify;"><em style="line-height: 1.6;"><a href="http://www.dienmayxanh.com/" target="_blank" title="DienmayXANH.com">DienmayXANH.com</a></em></p>

            <h3 class="fh3menu" style="display:none;"></h3>
        <p><i><a href="https://www.dienmayxanh.com/" target="_blank" title="Siêu thị Điện máy XANH" type="Siêu thị Điện máy XANH">Siêu thị Điện máy XANH</a></i></p></div>', 2, CAST(N'2019-07-06T00:00:00.000' AS DateTime), 50244, 1)
INSERT [dbo].[Blog] ([BlogID], [Image], [TitleBlog], [Content], [DanhMucSanPhamID], [CreateDate], [SanPhamID], [Status]) VALUES (3, N'banner-blog-masonry.jpg', N'16 Công dụng của chanh tốt cho sức khỏe', N'<div class="content-detail textview"> <style> @media (min-width:1024px) { #adsposttop { margin: 0 20px 10px 0; width: 336px; min-height: 360px; float: left } #adsposttop2 { height: 90px; } } @media (max-width:480px) { #adsposttop { float: none; min-height: 360px; } } </style> <div id="adsposttop"> <div id="adsposttop1" class="adbox"> <!-- QTM Responsive Post --> <ins class="adsbygoogle" style="display:block;" data-ad-client="ca-pub-9275417305531302" data-ad-slot="5967394489" data-ad-format="auto"></ins> <script> (adsbygoogle = window.adsbygoogle || []).push({}); </script> </div> <div id="adsposttop2" class="adbox"> <!-- Quantrimang Links - Dapung1 --> <ins class="adsbygoogle" style="display:block;" data-ad-client="ca-pub-9275417305531302" data-ad-slot="5850527689" data-ad-format="link"></ins> <script> (adsbygoogle = window.adsbygoogle || []).push({}); </script> </div> </div> <p>Tươi ngon, có hương thơm dịu nhẹ và nhiều nước - Chanh là một trong những loại quả có múi phổ biến nhất trên thế giới. Từ những bí quyết làm đẹp Ayurveda của Ấn Độ đến những món ăn ngon của Ý, chanh được sử dụng trên toàn thế giới với rất nhiều công dụng khác nhau như: làm tăng gia vị cho món ăn, giảm đau rát cổ họng và thậm chí có thể chữa lành một số bệnh. Chanh có chứa nhiều khoáng chất như vitamin C, pectin, nhóm vitamin B, chất chống oxy hóa, Kali và calcium. Chẳng có gì đáng ngạc nhiên khi chanh là một loại quả nhỏ nhưng đem lại nhiều công dụng vô cùng hữu ích phải không? Dưới đây là <strong>16 lợi ích từ chanh</strong> có thể bạn chưa biết, giúp khỏe hơn, đẹp hơn chỉ bằng một số mẹo nhỏ cực kỳ đơn giản. Mời các bạn cùng tham khảo!</p> <p><img style="display: block; margin-left: auto; margin-right: auto;" title="Lợi ích của chanh" src="https://st.quantrimang.com/photos/image/2017/02/02/chanh-1.jpg" alt="Lợi ích của chanh" width="650" height="366" class="lazy lightbox loaded" data-src="https://st.quantrimang.com/photos/image/2017/02/02/chanh-1.jpg" data-i="0" data-was-processed="true"></p> <h2>Cân bằng độ pH của cơ thể</h2> <p>Theo triết lý Ayurveda, chúng ta nên bắt đầu ngày mới bằng cách liên kết cơ thể với nhịp điệu của thiên nhiên. Điều này bao gồm cả việc phục hồi lại độ cân bằng&nbsp;pH cho&nbsp;cả cơ thể bởi độ pH thường bị axit hóa do: thức ăn vặt, ô nhiễm môi trường, ít vận động và một số loại độc tố khác. Cân bằng độ pH là một điều quan trọng để giữ lại tính kiềm trong cơ thể giúp ngăn ngừa một số bệnh, đặc biệt là bệnh mãn tính như ung thư. Mặc dù chanh có tính axit nhưng thành phần dinh dưỡng của chanh lại mang tính kiềm, đó chính là lý do tại sao chanh - sự lựa chọn tuyệt vời để bảo vệ sức khỏe. Hãy khởi động ngày mới bằng thói quen uống một ly nước chanh theo công thức: 1 ly nước ấm và nửa quả chanh.</p> <h2>Giảm chứng khó tiêu và táo bón</h2> <p>Chanh là một loại quả có khả năng kháng khuẩn tuyệt vời. Tính kháng khuẩn của chanh có thể đánh bại vi khuẩn có hại và cho phép vi khuẩn có lợi phát triển mạnh trong cơ thể. Chính điều này giúp làm giảm chứng khó tiêu và táo bón. Việc nhâm nhi một ly nước chanh sẽ kích thích các nhu động ruột, cũng như sản sinh nước bọt và axit dạ dày giúp việc tiêu hóa trở nên dễ dàng hơn.</p> <h2>Giảm cân nhanh hơn</h2> <p><img style="display: block; margin-left: auto; margin-right: auto;" title="Giảm cân nhanh hơn" src="https://st.quantrimang.com/photos/image/2017/02/02/chanh-2.jpg" alt="Giảm cân nhanh hơn" width="650" height="433" class="lazy lightbox loaded" data-src="https://st.quantrimang.com/photos/image/2017/02/02/chanh-2.jpg" data-i="1" data-was-processed="true"></p> <p>Nếu đang trong thời gian thực hiện chế độ ăn kiêng thì chanh có thể trở thành chiến hữu tốt nhất dành cho bạn đó. Một số diễn viên nổi tiếng Hollywood cho biết trong quá trình giảm cân giai đoạn Lemonade Diet (<em>giai đoạn thực hiện ít nhất trong 10 ngày) </em>khi cần giảm cân nhanh và hiệu quả sẽ<em>&nbsp;c</em>ó nhiều cách để giảm cân với chanh như:&nbsp;</p> <ul> <li>Pectin, một loại chất xơ hòa tan được tìm thấy trong chanh, có thể giúp bạn cảm thấy no và ăn ít hơn. Uống một ly nước nóng với nửa quả chanh vắt vào trước bữa ăn là một cách tuyệt vời để ngăn chặn việc ăn quá nhiều.</li> <li>Pectin cũng làm chậm tốc độ hấp thụ glucose hoặc đường trong cơ thể, do đó ngăn ngừa sự tăng lên đột biến của lượng đường trong máu - một tình trạng thường hay xảy ra ở những bệnh nhân mắc bệnh tiểu đường tuýp 2.</li> <li>Thêm vào đó, nước chanh cũng được xem như một loại thuốc lợi tiểu tự nhiên. Điều này có nghĩa giúp cơ thể thải ra một lượng nước thừa thông qua việc đi tiểu thường xuyên. Lượng nước trong cơ thể ít hơn cũng có nghĩa là cơ thể bạn không bị tích nước, phù nề, do vậy trông bạn sẽ thon gọn hơn.</li> <li>Nếu muốn nhanh chóng loại bỏ vài cân trước những sự kiện lớn, hãy thử áp dụng cách này: Vào buổi sáng, bạn có thể tạo cho mình một chế độ ăn kiêng bằng nước chanh: trộn 2 muỗng nước cốt chanh, 2 muỗng cà phê mật ong, 1 ít ớt đỏ và 1 ly nước lớn. Phần thời gian còn lại trong ngày, hãy pha 500ml nước với 2-3 quả chanh, rồi cho vào bình và mang theo để uống cả ngày. Bạn sẽ cảm thấy no hơn, không cảm thấy thèm ăn và thay vào đó là những chuyến đi đến nhà vệ sinh để thải lượng nước thừa trong cơ thể.&nbsp;</li> </ul> <h2>Tiêu diệt ký sinh trùng</h2> <p>Nếu từng bị ký sinh trùng và các loại giun đường ruột ghé thăm, chắc bạn cũng biết rằng việc thoát khỏi chúng khó khăn đến mức nào. Cách duy nhất để loại bỏ chúng một lần và mãi mãi đó là tạo ra một môi trường mà vi khuẩn không thể tồn tại được. Ký sinh trùng ưa sống ở môi trường axit, vì vậy cách tốt nhất để tiêu diệt chúng là tạo ra môi trường kiềm trong hệ thống tiêu hóa. Việc ăn một quả chanh hoặc uống nước chanh là một trong những cách nhanh nhất để tạo ra môi trường kiềm trong dạ dày và tiêu diệt ký sinh trùng pesky.</p> <h2>Cải thiện tình trạng răng miệng</h2> <p>Cho dù bạn bị hôi miệng hay loét miệng, chanh đều có thể làm giảm một loạt các vấn đề sức khỏe răng miệng. Nếu bị đau răng, hãy ngậm nước ép chanh tươi ở khu vực đó để có thể loại bỏ cơn đau. Còn nếu bị chảy máu nướu không ngừng, hãy dùng nước cốt chanh tươi mát-xa vào nướu để ngăn máu và vi khuẩn gây viêm nướu.</p> <h2>Thúc đẩy sự tập trung</h2> <p><img style="display: block; margin-left: auto; margin-right: auto;" title="Thúc đẩy sự tập trung" src="https://st.quantrimang.com/photos/image/2017/02/02/chanh-3.jpg" alt="Thúc đẩy sự tập trung" width="650" height="433" class="lazy lightbox loaded" data-src="https://st.quantrimang.com/photos/image/2017/02/02/chanh-3.jpg" data-i="2" data-was-processed="true"></p> <p>Tinh dầu chanh được khoa học chứng minh có tác dụng làm dịu, thúc đẩy sự tập trung và cải thiện tâm trạng. Một nghiên cứu cho thấy tinh dầu chanh có tác dụng cải thiện tâm trạng của người tham gia nghiên cứu. Nếu muốn tỉnh táo và thúc đẩy sự tập trung tại nơi làm việc, hãy dùng tinh dầu chanh nhé.</p> <h2>Tẩy tế bào chết trên da</h2> <p><a title="Vitamin C tốt nhất cho sức khỏe" href="https://meta.vn/vitamin-c-c3278" target="_blank" rel="noopener">Vitamin C</a> được tìm thấy trong chanh không chỉ tốt cho sức khỏe mà còn rất tốt cho làn da của bạn nữa. Vitamin C là một thành phần quan trọng có trong nhiều sản phẩm chăm sóc da vì nó vô hiệu hoá các gốc tự do và kích thích tái tạo tế bào bằng cách tẩy tế bào chết trên da. Hãy thử cắt một nửa quả chanh và chà lên mặt ít nhất 1 lần/tuần. Điều này sẽ giúp loại bỏ bụi bẩn cứng đầu và tế bào da chết tích tụ trên bề mặt da, để lộ một lớp da mới bên dưới. Vì vậy, khuôn mặt của bạn trông khỏe mạnh và tươi trẻ hơn, tốt nhất hãy sử dụng những sản phẩm có nguồn gốc từ thiên nhiên.</p> <h2>Giải độc gan</h2> <p>Theo các liệu pháp tự nhiên (<em>naturopaths</em>) và dùng thảo dược trị bệnh (<em>herbalists</em>), vị chua của chanh tạo ra tín hiệu thần kinh, nội tiết tố của cơ thể kích hoạt gan và thận. Các chất chống oxy hóa trong chanh giúp tăng cường thận và chức năng gan, giải độc cho cơ thể. Như đã đề cập bên trên, nước chanh cũng là một loại thuốc lợi tiểu giúp cơ thể giải phóng lượng nước dư thừa và các chất thải tích tụ trong cơ thể. Do đó, bạn sẽ cảm thấy thoải mái, nhẹ nhàng và tràn đầy năng lượng hơn bao giờ hết. Hãy giải độc gan bằng một ly nước chanh vào mỗi sáng. Đơn giản chỉ cần thêm nước cốt chanh tươi vào ly nước đầu tiên bạn uống vào mỗi ngày là được.</p> <h2>Điều trị huyết áp cao</h2> <p><img style="display: block; margin-left: auto; margin-right: auto;" title="Điều trị huyết áp cao" src="https://st.quantrimang.com/photos/image/2017/02/02/chanh-4.jpg" alt="Điều trị huyết áp cao" width="650" height="433" class="lazy lightbox loaded" data-src="https://st.quantrimang.com/photos/image/2017/02/02/chanh-4.jpg" data-i="3" data-was-processed="true"></p> <p>Chất Pectin được tìm thấy trong chanh có thể giúp giảm cholesterol gây ra huyết áp cao. Bên cạnh đó, chất Flavonoids trong chanh cũng như vitamin P giúp tăng cường các mạch máu. Chanh cũng rất giàu kali giúp ngăn ngừa bệnh huyết áp cao.</p> <div class="adbox in-article"><ins class="adsbygoogle" style="display:block; text-align:center;" data-ad-format="fluid" data-ad-layout="in-article" data-ad-client="ca-pub-9275417305531302" data-ad-slot="2737970258"></ins><script> (adsbygoogle = window.adsbygoogle || []).push({});</script></div><h2>Loại bỏ gàu</h2> <p>Nếu muốn có một liệu pháp đơn giản để điều trị gàu, bạn có thể kết hợp chanh với các thành phần tự nhiên khác như dầu dừa để làm mặt nạ chữa lành, dưỡng ẩm cho da đầu và loại bỏ sạch gàu. Chỉ cần lưu ý đừng lạm dụng cách điều trị này, bởi nước chanh cũng có khả năng làm màu tóc của bạn trông sáng hơn.</p> <h2>Giúp bàn chân mềm mại hơn</h2> <p>Bàn chân của bạn thô ráp và chai sạn? Giải pháp có thể nằm ngay trong căn bếp nhà bạn đó. Chanh có chứa axit citric và vitamin C nên có tác dụng tẩy tế bào chết, tăng cường tái tạo da mới và làm sáng các vùng tối. Hai cách dưới đây có thể làm cho đôi chân của bạn trở nên mềm mại, hấp dẫn hơn khi mang dép sandal:</p> <ul> <li>Hỗn hợp ngâm chân gồm 2-3 quả chanh cùng 2 muỗng canh dầu ô liu và ¼ cốc sữa. Cho hỗn hợp này vào một chậu nước ấm. Ngâm chân khoảng 20 phút, sau đó dùng bàn chải chà chân để chà hết da chết ở chân, đặc biệt là phần gót chân và phần ức bàn chân.</li> <li>Ngoài ra, bạn cũng có thể tạo ra một hỗn hợp tẩy tế bào chết ở giữa các ngón chân bằng chanh và đường. Kết hợp hai chén đường nâu với ¼ chén dầu ô liu. Hãy chắc chắc rằng hỗn hợp này mềm vừa đủ và không quá loãng. Sau đó thêm vài giọt tinh dầu chanh vào. Chà hỗn hợp này sau khi ngâm chân. Vậy là đã hoàn thành xong hỗn hợp dưỡng da chân có mùi chanh tự chế rồi đó, nó không chỉ đem lại một đôi bàn chân mềm mại đến kinh ngạc mà còn tạo cho bạn cảm giác tươi mới như mùa hè nữa.</li> </ul> <h2>Giảm sốt và cơn ớn lạnh</h2> <p><img style="display: block; margin-left: auto; margin-right: auto;" title="Giảm sốt và cơn ớn lạnh" src="https://st.quantrimang.com/photos/image/holder.png" alt="Giảm sốt và cơn ớn lạnh" width="650" height="433" class="lazy" data-src="https://st.quantrimang.com/photos/image/2017/02/02/chanh-7.jpg" data-i="4"></p> <p>Nước chanh có thể giúp bạn hết sốt và ớn lạnh bằng cách tăng tốc độ bài tiết mồ hôi một cách tự nhiên. Để hạ sốt nhanh chóng, hãy thêm nước cốt chanh vào một cốc nước ấm hoặc trà mật ong. Uống hỗn hợp này 2 giờ/lần cho đến khi giảm sốt. Nếu các triệu chứng của cơn sốt vẫn kéo dài, hãy tham khảo thêm ý kiến của bác sĩ.</p> <h2>Làm sáng da</h2> <p>Vitamin C được tìm thấy trong chanh là một trong những cách tự nhiên nhất để làm sáng các đốm đen và thậm chí là cả màu da. Hơn thế, vitamin C còn là một thành phần khi cơ thể sản xuất collagen và elastin, các mô giúp cho làn da trông căng mịn và có sức sống. Nếu không có đủ vitamin C, làn da của bạn không thể hình thành được các mô liên kết, dẫn tới việc xuất hiện các nếp nhăn.</p> <h2>Trị mụn trứng cá</h2> <p><img style="display: block; margin-left: auto; margin-right: auto;" title="Trị mụn trứng cá" src="https://st.quantrimang.com/photos/image/holder.png" alt="Trị mụn trứng cá" width="650" height="433" class="lazy" data-src="https://st.quantrimang.com/photos/image/2017/02/02/chanh-5.jpg" data-i="5"></p> <p>Nếu bị mụn trứng cá trên da, nước cốt chanh là một liệu pháp kháng khuẩn tự nhiên rất tốt cho mụn trứng cá. Bạn chỉ cần làm ướt một miếng bông bằng nước cốt chanh và đắp lên mặt một lần vào ban đêm trên những vùng có mụn trứng cá, mụn đầu đen và bệnh chàm như một phương pháp điều trị mụn trứng cá ngay tại chỗ. Rửa mặt lại với nước vào sáng hôm sau, rồi chăm sóc da theo cách bạn vẫn làm hàng ngày.</p> <h2>Tránh xa côn trùng</h2> <p>Chẳng cần bôi thuốc chống côn trùng lên da hay các loại thuốc xịt côn trùng độc hại khác nếu có chanh trong tay. Để làm một bình xịt đơn giản và hiệu quả, chỉ cần kết hợp 1 phần tinh dầu chanh với 10 phần dầu ô liu, dầu hướng dương hoặc rượu ethyl. Bạn phải sử dụng một trong những loại dầu kể trên mới có thể tạo nên hỗn hợp này bởi nước không kết hợp được với tinh dầu.</p> <h2>Giảm đau</h2> <p>Tinh dầu chanh tạo ra một hương thơm làm thư giãn các mạch máu và giảm viêm, đó là một trong những yếu tố quan trọng giúp giảm đau. Nếu đang bị đau do viêm khớp, thấp khớp hoặc các bệnh viêm khác, hãy uống một ly nước chanh mỗi ngày để có thể làm giảm bớt các cơn đau. Tinh dầu chanh kết hợp với nước cũng có thể giúp da bớt bỏng rát do cháy nắng. Bạn có thường xuất hiện hội chứng tiền kinh nguyệt (<em>premenstrual syndrome - PMS, những biểu hiện khó chịu gặp ở phụ nữ trước mỗi kỳ kinh nguyệt</em>)? Tin hay không tùy bạn nhưng việc uống nước chanh mỗi ngày cũng có thể giúp làm giảm các triệu chứng đó.</p> <h2>Giảm dấu hiệu xuất hiện bệnh suy tĩnh mạch</h2> <p><img style="display: block; margin-left: auto; margin-right: auto; border: 1px solid black;" title="Giảm dấu hiệu xuất hiện bệnh suy tĩnh mạch" src="https://st.quantrimang.com/photos/image/holder.png" alt="Giảm dấu hiệu xuất hiện bệnh suy tĩnh mạch" width="650" height="510" class="lazy" data-src="https://st.quantrimang.com/photos/image/2017/02/02/chanh-6.jpg" data-i="6"></p> <p>Mệt mỏi bởi những đường tĩnh mạch bị suy và tĩnh mạch mạng nhện (<em>spider veins</em>)&nbsp;khó có thể nhìn thấy? Việc dùng nước chanh sẽ làm cho các thành tĩnh mạch khỏe hơn và đôi chân của bạn trông hấp dẫn hơn. Trộn một vài giọt tinh dầu chanh với một loại dầu dưỡng ẩm mà bạn thích như tinh dầu jojoba (<em>một chất sáp lỏng được chiết xuất từ cây&nbsp;jojoba&nbsp;ở vùng tây nam Bắc Mỹ</em>) hoặc dầu trái bơ (<em>avocado oil</em>). Xoa bóp hỗn hợp đó vào khu vực bị ảnh hưởng một cách thường xuyên và hãy chờ xem những đường tĩnh mạch khó quan sát được biến mất như thế nào nhé!</p> <h2>Làm trắng răng</h2> <p>Những liệu pháp làm trắng răng mua ở ngoài tiệm thường là những phương pháp điều trị tốn kém và chứa các hóa chất mạnh có thể làm bạn dễ bị đau răng hơn. Chỉ với nước cốt chanh và bột nở baking soda cũng tạo nên một công thức làm trắng răng tự nhiên mà không hề tốn kém đó. Công thức kết hợp đơn giản hai thành phần theo tỷ lệ bằng nhau để tạo ra một hỗn hợp "<em>nổi</em>" có thể chà lên răng bằng cách sử dụng Q-tip (<em>bông ngoáy tai</em>). Ngậm trong miệng khoảng 45 giây, lưu ý không được để lâu hơn, vì các axit có trong nước chanh và baking soda có thể làm suy yếu men răng. Sau đó, nhẹ nhàng chà lại bằng bàn chải đánh răng và nước sạch.</p> <p>Như bạn đã thấy, chanh mang lại rất nhiều lợi ích cho chúng ta: làm tươi mới, tiếp thêm sinh lực, làm sạch và giải độc. Bên cạnh đó, chanh còn có thể là một người bạn đồng hành tuyệt vời cho cuộc sống trong gia đình.</p> <p>Tham khảo thêm một số bài viết:&nbsp;</p> <ul> <li><a style="line-height: 1.5em;" title="Caffeine có tác động đến não bộ của bạn như thế nào?" href="https://quantrimang.com/caffeine-co-tac-dong-den-nao-bo-cua-ban-nhu-the-nao-130032" rel="noopener">Caffeine có tác động đến não bộ của bạn như thế nào?</a></li> <li><a style="line-height: 1.5em;" title="10 lợi ích tuyệt vời của trà xanh Matcha có thể bạn chưa biết" href="https://quantrimang.com/10-loi-ich-tuyet-voi-cua-tra-xanh-matcha-co-the-ban-chua-biet-127199" rel="noopener">10 lợi ích tuyệt vời của trà xanh Matcha có thể bạn chưa biết</a></li> <li><a style="line-height: 1.5em;" title="12 lợi ích tuyệt vời từ việc uống nước ấm có thể bạn chưa biết" href="https://quantrimang.com/12-loi-ich-tuyet-voi-tu-viec-uong-nuoc-am-co-the-ban-chua-biet-127246" rel="noopener">12 lợi ích tuyệt vời từ việc uống nước ấm có thể bạn chưa biết</a></li> </ul> <p>Chúc các bạn vui vẻ!</p> </div>', 1, CAST(N'2019-07-06T00:00:00.000' AS DateTime), 10136, 1)
INSERT [dbo].[Blog] ([BlogID], [Image], [TitleBlog], [Content], [DanhMucSanPhamID], [CreateDate], [SanPhamID], [Status]) VALUES (4, N'list4.jpg', N'10 Lợi ích của dâu tây mà bạn nên biết', N'<div class="article__body">
            <p class="body-text"><strong>1. Ngăn chặn bệnh tim</strong></p><p class="body-image"><a class="photo" href="https://photo-2-baomoi.zadn.vn/w1000_r1/2019_02_05_347_29576266/a8dc45bed0ff39a160ee.jpg" data-desc="" data-index="0"><img src="https://photo-2-baomoi.zadn.vn/w700_r1/2019_02_05_347_29576266/a8dc45bed0ff39a160ee.jpg" data-width="1024" data-height="768"></a></p><p class="body-text">Dâu tây có chứa các chất dinh dưỡng thiết yếu như chất chống oxy hóa và chất flavonoid giúp ngăn chặn sự tích tụ cholesterol xấu có thể làm tắc nghẽn động mạch. Hơn nữa, dâu tây có đặc tính chống viêm, là sự lựa chọn hàng đầu cho trái tim của bạn.</p><p class="body-text"><strong>2. Cải thiện trí nhớ</strong></p><p class="body-text">Nếu bạn đang cố gắng để cải thiện trí nhớ của mình, hãy thêm dâu tây vào các bữa ăn hàng ngày của bạn. Dâu tây chứa fisetin, flavonoid có trong tự nhiên giúp kích thích và tăng cường trí nhớ. Theo một nghiên cứu được công bố trên tạp chí Annals of Neurology, tiêu thụ 2 hoặc nhiều hơn khẩu phần dâu tây mỗi tuần có thể giúp trì hoãn suy giảm trí nhớ ở phụ nữ lớn tuổi.</p><p class="body-text"><strong>3. Tăng hệ thống miễn dịch của bạn</strong></p><p class="body-text">Vitamin C có trong dâu tây giúp tăng cường hệ thống miễn dịch và bảo vệ bạn khỏi nhiễm trùng. Một cốc dâu tây có chứa 100% vitamin C cung cấp cho cơ thể trở nên khỏe mạnh mỗi ngày.</p><p class="body-text"><strong>4. Ngăn chặn bệnh tiểu đường và táo bón</strong></p><p class="body-text">Nếu bạn bị táo bón, bạn nên hạn chế nó bằng cách tiêu thụ đủ chất xơ mỗi ngày. Dâu tây có nhiều chất xơ, kiểm soát lượng đường trong máu và ngăn ngừa bệnh tiểu đường. Bệnh nhân tiểu đường có thể ăn dâu tây mà không cần lo lắng bởi dâu tây có chỉ số đường huyết thấp.</p><p class="body-text"><strong>5. Da hoàn hảo</strong></p><p class="body-image"><a class="photo" href="https://photo-2-baomoi.zadn.vn/w1000_r1/2019_02_05_347_29576266/cd532631b3705a2e0361.jpg" data-desc="" data-index="1"><img src="https://photo-2-baomoi.zadn.vn/w700_r1/2019_02_05_347_29576266/cd532631b3705a2e0361.jpg" data-width="600" data-height="315"></a></p><p class="body-text">Dâu tây chứa vitamin C và khả năng chống oxy hóa giúp làm chậm quá trình lão hóa và giữ cho làn da của bạn khỏe mạnh, căng mịn. Dâu tây chứa axit salicylic giúp ngăn ngừa mụn trứng cá, giữ cho làn da sáng mịn tự nhiên.</p><p class="body-text"><strong>6. Ngăn chặn ung thư</strong></p><p class="body-text">Dâu tây rất giàu chất chống oxy hóa vì vậy nó trợ giúp đắc lực trong việc ngăn ngừa bệnh ung thư.Chất chống oxy hóa như zeathanacins và lutein có trong dâu tây ngăn chặn sự tăng trưởng của tế bào ung thư. Ngoài ra, Vitamin C giúp tăng cường hệ thống miễn dịch với những ai đang chống chọi với căn bệnh ung thư.</p><p class="body-text"><strong>7. Tốt cho xương của bạn</strong></p><p class="body-text">Một trong những lý do quan trọng nhất để ăn dâu tây đó là nó rất tốt cho xương của bạn. Dâu tây nhiều chất kali, mangan và một số khoáng chất thiết yếu giúp thúc đẩy tăng trưởng xương và giữ cho xương khỏe mạnh. Vì vậy, dâu tây rất tốt cho trẻ em.</p><p class="body-text"><strong>8. Giúp giảm cân hiệu quả</strong></p><p class="body-text">Dâu tây có ít calo (một cốc chỉ có 53 calo), nhiều chất xơ giúp khiến bạn cảm thấy no lâu hơn và nếu bạn ăn dâu tây trước bữa ăn nó sẽ giúp bạn ăn ít hơn bình thường. Thêm vào đó, lượng Vitamin C cao có trong dâu tây sẽ đẩy nhanh tốc độ trao đổi chất và giúp cơ thể đốt cháy nhiều calo nhanh hơn.</p><p class="body-text"><strong>9. Ngăn chặn rụng tóc</strong></p><p class="body-text">Dâu tây có chứa axit folic, axit ellagic, vitamin B5 và vitamin B6, giúp ngăn ngừa tóc rụng. Thêm vào đó, khoáng chất magiê giúp ngăn chặn sự phát triển của nấm và gàu. Tự làm mặt nạ tóc bằng dâu tây rất tốt cho mái tóc của bạn.</p><p class="body-image"><a class="photo" href="https://photo-2-baomoi.zadn.vn/w1000_r1/2019_02_05_347_29576266/651efc2c646d8d33d47c.jpg" data-desc="" data-index="2"><img src="https://photo-2-baomoi.zadn.vn/w700_r1/2019_02_05_347_29576266/651efc2c646d8d33d47c.jpg" data-width="600" data-height="428"></a></p><p class="body-text"><strong>10. Tốt cho phụ nữ mang thai</strong></p><p class="body-text">Do hàm lượng folate cao, dâu tây tốt cho não của bé, tủy sống và phát triển hộp sọ.Hơn nữa, dâu tây có chứa axit folic có thể giải cứu em bé có khỏi một số khuyết tật bẩm sinh. Nếu bạn đang mang thai, hãy xem xét bao gồm dâu tây vào chế độ ăn uống của bạn.</p><p class="body-text body-author"><em><strong>Kim Ngưu (T/h) - Nguồn ảnh: Internet</strong></em></p>
        </div>', 1, CAST(N'2019-07-06T00:00:00.000' AS DateTime), 8, 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [Content], [UserID], [BlogID], [Status]) VALUES (1, N'sản phẩm tuyệt vời', 1, 1, 1)
INSERT [dbo].[Comment] ([CommentID], [Content], [UserID], [BlogID], [Status]) VALUES (2, N'sản phẩm ngoài sức tưởng tượng', 2, 1, 1)
INSERT [dbo].[Comment] ([CommentID], [Content], [UserID], [BlogID], [Status]) VALUES (3, N'sản phẩm tuyệt vời', 3, 1, 1)
INSERT [dbo].[Comment] ([CommentID], [Content], [UserID], [BlogID], [Status]) VALUES (4, N'sản phẩm tuyệt vời', 4, 1, 1)
INSERT [dbo].[Comment] ([CommentID], [Content], [UserID], [BlogID], [Status]) VALUES (5, N'sản phẩm tuyệt vời', 5, 1, 1)
INSERT [dbo].[Comment] ([CommentID], [Content], [UserID], [BlogID], [Status]) VALUES (6, N'sản phẩm tuyệt vời', 6, 1, 1)
INSERT [dbo].[Comment] ([CommentID], [Content], [UserID], [BlogID], [Status]) VALUES (7, N'sản phẩm tuyệt vời', 7, 1, 1)
INSERT [dbo].[Comment] ([CommentID], [Content], [UserID], [BlogID], [Status]) VALUES (8, N'sản phẩm ngoài sức tưởng tượng', 8, 2, 1)
INSERT [dbo].[Comment] ([CommentID], [Content], [UserID], [BlogID], [Status]) VALUES (9, N'sản phẩm ngoài sức tưởng tượng', 9, 2, 1)
INSERT [dbo].[Comment] ([CommentID], [Content], [UserID], [BlogID], [Status]) VALUES (10, N'sản phẩm ngoài sức tưởng tượng', 10, 2, 1)
INSERT [dbo].[Comment] ([CommentID], [Content], [UserID], [BlogID], [Status]) VALUES (11, N'sản phẩm ngoài sức tưởng tượng', 11, 2, 1)
INSERT [dbo].[Comment] ([CommentID], [Content], [UserID], [BlogID], [Status]) VALUES (12, N'sản phẩm ngoài sức tưởng tượng', 12, 2, 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactID], [Address], [Hotline], [Call], [Gmail], [Description]) VALUES (1, N'2B Lương Hữu Khánh, Phường Phạm Ngũ Lão, Quận 1, Hồ Chí Minh, Việt Nam', N'080 900660', N'040 5050 3396', N'nhokut666@gmail.com', N'If the supplier fails to ship your products on time or the product quality does not meet the standards set in your contract, Aloshop will refund the covered amount of your payment.')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[DanhGia] ON 

INSERT [dbo].[DanhGia] ([DanhGiaID], [UserID], [SanPhamID], [Rate], [YourReview], [Status]) VALUES (1, 1, 1, 10, N'good', 1)
INSERT [dbo].[DanhGia] ([DanhGiaID], [UserID], [SanPhamID], [Rate], [YourReview], [Status]) VALUES (2, 2, 2, 10, N'good', 1)
INSERT [dbo].[DanhGia] ([DanhGiaID], [UserID], [SanPhamID], [Rate], [YourReview], [Status]) VALUES (3, 3, 3, 10, N'good', 1)
INSERT [dbo].[DanhGia] ([DanhGiaID], [UserID], [SanPhamID], [Rate], [YourReview], [Status]) VALUES (4, 4, 4, 10, N'good', 1)
INSERT [dbo].[DanhGia] ([DanhGiaID], [UserID], [SanPhamID], [Rate], [YourReview], [Status]) VALUES (5, 5, 5, 10, N'good', 1)
SET IDENTITY_INSERT [dbo].[DanhGia] OFF
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc], [MetaKeyword], [Status]) VALUES (1, N'Thực Phẩm', N'Thuc-pham', 1)
INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc], [MetaKeyword], [Status]) VALUES (2, N'Hoa', N'Hoa', 1)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DanhMucSanPham] ON 

INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (1, N'Trái Cây', N'trai-cay', 1, 1)
INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (2, N'Rau', N'rau', 1, 1)
INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (3, N'Củ', N'cu', 1, 1)
INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (4, N'Quả', N'qua', 1, 1)
INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (5, N'Thực Phẩn Gia Vị', N'thuc-pham-gia-vi', 1, 1)
INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (6, N'Hoa Chia Buồn', N'hoa-chia-buon', 2, 1)
INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (7, N'Hoa Cưới', N'hoa-cuoi', 2, 1)
INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (8, N'Giỏ Hoa', N'gio-hoa', 2, 1)
INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (9, N'Hoa Khai Trương', N'hoa-khai-truong', 2, 1)
INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (10, N'Hoa Lan', N'hoa-lan', 2, 1)
INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (1011, N'Đang cập nhật', N'dang-cap-nhat', 1003, 1)
INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (1012, N'Đang cập nhật', N'dang-cap-nhat', 1003, 1)
INSERT [dbo].[DanhMucSanPham] ([DanhMucSanPhamID], [TenDanhMucSanPham], [MetaKeyword], [DanhMucID], [Status]) VALUES (1013, N'Đang cập nhật', N'dang-cap-nhat', 1003, 1)
SET IDENTITY_INSERT [dbo].[DanhMucSanPham] OFF
SET IDENTITY_INSERT [dbo].[Footer] ON 

INSERT [dbo].[Footer] ([FooterID], [Content], [Status]) VALUES (1, N'<!-- End Content -->        <footer id="footer">            <div class="footer2 box-parallax">                <div class="container">                    <div class="main-footer2">                        <div class="row">                            <div class="col-md-4 col-sm-4 col-xs-12">                                <div class="footer-box2">                                    <h2 class="title18 font-bold color">About Fruit., cop</h2>                                    <p class="desc white">Excellence in quality and service is the hallmark of all operations performed at Fruit. Firmly standing by its business values, Fruit is active in manufacture and sale of textile </p>                                </div>                                <div class="footer-box2 payment-method">                                    <h2 class="title18 font-bold color">Online Payments by</h2>                                    <a href="#" class="wobble-top"><img src="/Content/Client/images/icon/pay11.png" alt=""></a>                                    <a href="#" class="wobble-top"><img src="/Content/Client/images/icon/pay21.png" alt=""></a>                                    <a href="#" class="wobble-top"><img src="/Content/Client/images/icon/pay31.png" alt=""></a>                                    <a href="#" class="wobble-top"><img src="/Content/Client/images/icon/pay41.png" alt=""></a>                                </div>                            </div>                            <div class="col-md-4 col-sm-4 col-xs-12">                                <div class="footer-box2">                                    <h2 class="title18 font-bold color">Location Store</h2>                                    <div class="contact-footer2">                                        <p class="desc white"><span class="color"><i class="fa fa-map-marker" aria-hidden="true"></i></span>Gul Ahmed Textile Mills Limited Plot No.82, Main National Highway, Landhi</p>                                        <p class="desc white"><span class="color"><i class="fa fa-phone" aria-hidden="true"></i></span>+72-43-000 485 485 Ext-6595.</p>                                        <p class="desc white"><span class="color"><i class="fa fa-envelope" aria-hidden="true"></i></span><a href="#" class="white">your.email@sitename.com</a></p>                                    </div>                                </div>                            </div>                            <div class="col-md-4 col-sm-4 col-xs-12">                                <div class="footer-box2">                                    <h2 class="title18 font-bold color">Subscribe To Our Newsletter</h2>                                    <p class="white">Stay tune for updates</p>                                    <form class="email-form2">                                        <input onblur="if (this.value=='''') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''''" value="Enter your order number" type="text">                                        <input type="submit" value="submit">                                    </form>                                </div>                                <div class="social-network footer-box2">                                    <h2 class="title18 font-bold color">Connect With Us</h2>                                    <a href="#" class="float-shadow"><img src="/Content/Client/images/icon/icon-fb.png" alt=""></a>                                    <a href="#" class="float-shadow"><img src="/Content/Client/images/icon/icon-tw.png" alt=""></a>                                    <a href="#" class="float-shadow"><img src="/Content/Client/images/icon/icon-pt.png" alt=""></a>                                    <a href="#" class="float-shadow"><img src="/Content/Client/images/icon/icon-gp.png" alt=""></a>                                    <a href="#" class="float-shadow"><img src="/Content/Client/images/icon/icon-ig.png" alt=""></a>                                </div>                            </div>                        </div>                    </div>                    <!-- End Main Footer -->                    <div class="logo-footer2 text-center">                        <a href="#" class="pulse"><img src="/Content/Client/images/home/home2/logo-footer.png" alt="" /></a>                    </div>                    <div class="bottom-footer2 text-center">                        <ul class="menu-footer2 list-inline-block">                            <li><a href="#" class="white">Home</a></li>                            <li><a href="#" class="white">Help Center</a></li>                            <li><a href="#" class="white">Terms & Conditions</a></li>                            <li><a href="#" class="white">Privacy Policy</a></li>                            <li><a href="#" class="white">Blog</a></li>                            <li><a href="#" class="white">About Us</a></li>                            <li><a href="#" class="white">Contact Us</a></li>                        </ul>                        <p class="copyright2 desc white">Fruit © 2017</p>                    </div>                </div>            </div>        </footer>        <!-- End Footer -->', 1)
SET IDENTITY_INSERT [dbo].[Footer] OFF
SET IDENTITY_INSERT [dbo].[MessageContact] ON 

INSERT [dbo].[MessageContact] ([MessageContactID], [Name], [Email], [Message]) VALUES (1, N'Duy Thái', N'nhokut666@gmail.com', N'vui lòng liên hệ với chúng tôi.')
INSERT [dbo].[MessageContact] ([MessageContactID], [Name], [Email], [Message]) VALUES (2, N'Thanh Tuy', N'ThanhTuy@gmail.com', N'vui lòng liên hệ với chúng tôi.')
INSERT [dbo].[MessageContact] ([MessageContactID], [Name], [Email], [Message]) VALUES (3, N'thai', N'nhokut666@gmail.com', N'aaaaaa')
SET IDENTITY_INSERT [dbo].[MessageContact] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (30003, CAST(N'2019-06-27T15:31:07.630' AS DateTime), N'duy thai', N'0974199063', N'2b                                                                                                  ', N'nhokut666@gmail.com', 1, CAST(0 AS Decimal(18, 0)), 10006, CAST(28000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (30004, CAST(N'2019-07-01T08:28:23.617' AS DateTime), N'aaaaabbaa', N'1212', N'2b, luong huu khanh                                                                                 ', N'nhokut666@gmail.com', 1, CAST(30000 AS Decimal(18, 0)), 10008, CAST(27000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (30005, CAST(N'2019-06-27T19:39:38.747' AS DateTime), N'duy thai', N'1212', N'a                                                                                                   ', N'nhokut666@gmail.com', 1, CAST(30000 AS Decimal(18, 0)), 10008, CAST(26000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (30006, CAST(N'2019-06-27T19:44:01.353' AS DateTime), N'duy thai', N'0974199063', N'2b                                                                                                  ', N'nhokut666@gmail.com', 1, CAST(50000 AS Decimal(18, 0)), 10006, CAST(30000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (30007, CAST(N'2019-06-27T19:58:51.410' AS DateTime), N'duy thai', N'1212', N'a                                                                                                   ', N'nhokut666@gmail.com', 1, CAST(1 AS Decimal(18, 0)), 10008, CAST(14000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (30009, CAST(N'2019-06-27T20:13:44.200' AS DateTime), N'duy thai', N'1212', N'2b                                                                                                  ', N'nhokut666@gmail.com', 0, CAST(50000 AS Decimal(18, 0)), 10008, CAST(128000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (30010, CAST(N'2019-06-27T20:15:48.777' AS DateTime), N'duy thai', N'1212', N'2b                                                                                                  ', N'nhokut666@gmail.com', 1, CAST(30000 AS Decimal(18, 0)), 10008, CAST(680000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (30011, CAST(N'2019-06-27T20:19:41.867' AS DateTime), N'duy thai', N'0974199063', N'2b                                                                                                  ', N'nhokut666@gmail.com', 0, CAST(1 AS Decimal(18, 0)), 10008, CAST(27000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (70007, CAST(N'2019-07-04T09:03:35.847' AS DateTime), N'a121212', N'0974199063', N'12a                                                                                                 ', N'nhokut666@gmail.com', 1, CAST(30000 AS Decimal(18, 0)), NULL, CAST(1530000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (80009, CAST(N'2019-07-05T12:49:55.990' AS DateTime), N'vu duy thai', N'0974199063', N'2b luong huu khanh                                                                                  ', N'nhokut666@gmail.com', 1, CAST(30000 AS Decimal(18, 0)), NULL, CAST(410000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (80010, CAST(N'2019-07-05T12:54:55.143' AS DateTime), N'duy thai', N'0974199063', N'2b luong huu khanh q1                                                                               ', N'nhokut666@gmail.com', 1, CAST(30000 AS Decimal(18, 0)), NULL, CAST(331000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (80011, CAST(N'2019-07-05T13:00:43.100' AS DateTime), N'vu duy thai', N'0974199063', N'2b luong huu khanh q1                                                                               ', N'nhokut666@gmail.com', 1, CAST(50000 AS Decimal(18, 0)), NULL, CAST(546000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (80012, CAST(N'2019-07-05T13:04:45.297' AS DateTime), N'vu duy thai', N'0974199063', N'2b luong huu khanh q1                                                                               ', N'nhokut666@gmail.com', 1, CAST(30000 AS Decimal(18, 0)), NULL, CAST(456000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (90009, CAST(N'2019-07-08T10:00:03.503' AS DateTime), N'aaa', N'213213', N'aaa                                                                                                 ', N'thanhvien2@gmail.com', 1, CAST(30000 AS Decimal(18, 0)), NULL, CAST(545000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (100009, CAST(N'2019-07-08T11:44:18.600' AS DateTime), N'aaa', N'213213', N'sdfsafs                                                                                             ', N'thanhvien2@gmail.com', 1, CAST(0 AS Decimal(18, 0)), NULL, CAST(60000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CreateDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [GiaShip], [UserID], [TongTien]) VALUES (110009, CAST(N'2019-07-09T08:07:10.690' AS DateTime), N'duy thai', N'0974199063', N'2b luong huu khanh q1                                                                               ', N'nhokut666@gmail.com', 1, CAST(30000 AS Decimal(18, 0)), NULL, CAST(63000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (1, 100009, N'30000', 2, N'60000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (2, 80012, N'29000', 2, N'58000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (3, 30003, N'28000', 1, N'28000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (4, 30003, N'27000', 1, N'27000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (5, 30005, N'26000', 1, N'26000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (6, 1, N'15000', 2, N'30000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (6, 30006, N'15000', 2, N'30000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (12, 30007, N'14000', 1, N'14000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (50, 1, N'128000', 2, N'256000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (50, 30009, N'128000', 1, N'128000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (50, 80011, N'128000', 2, N'256000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (50, 80012, N'128000', 1, N'128000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (10074, 110009, N'33000', 1, N'33000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (10105, 90009, N'35000', 1, N'35000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (10149, 30010, N'340000', 2, N'680000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (20151, 1, N'350000', 3, N'1050000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (20170, 80011, N'240000
', 1, N'240000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (20170, 80012, N'240000
', 1, N'240000')
INSERT [dbo].[OrderDetail] ([SanPhamID], [OrderID], [DonGia], [Quantity], [ThanhTien]) VALUES (20170, 90009, N'240000
', 2, N'480000')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_USER', N'thêm user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', N'Xóa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_CONTENT', N'Sửa nội dung')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', N'Sửa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem danh sách sản phẩm')
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (1, N'chuoi-cau-210x210.jpg', N'Chuối cau', N'35000', N'30000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Chuối cau khi chín có màu vàng tươi là một trong những trái cây có vị ngọt tự nhiên. Trong chuối cau bao gồm các chất dinh dưỡng như kali, magie, vitamin B6 và chất xơ đem đến các tác động tích cực như tăng cường thị lực, giảm stress và nhuận trường. Với kích thước nhỏ và mềm, chuối cau thường được chọn làm món ăn tráng miệng cho trẻ nhỏ.', N'chuoi-cau', 998, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (2, N'chuoi-dole-viet-nam-210x210.jpg', N'Chuối Dole', N'34000', N'29000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Chuối khi chín có màu vàng tươi là một trong những trái cây có vị ngọt tự nhiên. Trong chuối bao gồm các chất dinh dưỡng như kali, magie, vitamin B6 và chất xơ đem đến các tác động tích cực như tăng cường thị lực, giảm stress và nhuận trường. Với kích thước nhỏ và mềm, chuối thường được chọn làm món ăn tráng miệng cho trẻ nhỏ.', N'chuoi-dole', 998, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (3, N'chuoi-laba-210x210.jpg', N'Chuối Laba', N'33000', N'28000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Chuối khi chín có màu vàng tươi là một trong những trái cây có vị ngọt tự nhiên. Trong chuối bao gồm các chất dinh dưỡng như kali, magie, vitamin B6 và chất xơ đem đến các tác động tích cực như tăng cường thị lực, giảm stress và nhuận trường. Với kích thước nhỏ và mềm, chuối thường được chọn làm món ăn tráng miệng cho trẻ nhỏ.', N'chuoi-laba', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (4, N'chuoi-su-210x210.jpg', N'Chuối Sứ', N'32000', N'27000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Chuối khi chín có màu vàng tươi là một trong những trái cây có vị ngọt tự nhiên. Trong chuối bao gồm các chất dinh dưỡng như kali, magie, vitamin B6 và chất xơ đem đến các tác động tích cực như tăng cường thị lực, giảm stress và nhuận trường. Với kích thước nhỏ và mềm, chuối thường được chọn làm món ăn tráng miệng cho trẻ nhỏ.', N'chuoi-su', 999, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (5, N'chuoi-unifarm-210x210.jpg', N'Chuối Unifarm', N'31000', N'26000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Chuối khi chín có màu vàng tươi là một trong những trái cây có vị ngọt tự nhiên. Trong chuối bao gồm các chất dinh dưỡng như kali, magie, vitamin B6 và chất xơ đem đến các tác động tích cực như tăng cường thị lực, giảm stress và nhuận trường. Với kích thước nhỏ và mềm, chuối thường được chọn làm món ăn tráng miệng cho trẻ nhỏ.', N'chuoi-unifarm', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (6, N'coc-non-giong-thai-7kgth-210x210.jpg', N'Cóc Non', N'18000', N'15000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Cóc Non', N'coc-non', 994, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (7, N'coc-xanh-5-7trkg-5kgth-210x210.jpg', N'Cóc Xanh', N'20000', N'17000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Cóc Xanh', N'coc-xanh', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (8, N'dau-han-quoc-330gr-7809-210x210.jpg', N'Dâu Hàn quốc', N'399000', N'289000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Dâu tây Hàn Quốc được nhiều người tiêu dùng biết đến với hương thơm ngọt ngào, tự nhiên, vị ngọt thanh, chua nhẹ. Dây tây Hàn Quốc thường có kích thướt lớn, màu đỏ tươi, da căng mọng nước. Cùng với đó, dâu tây có đa dạng cách để chế biến, từ làm bánh, ăn kèm với sữa, làm mứt...', N'dau-han-quoc', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (9, N'dau-han-quoc-500g-24540-210x210.jpg', N'Dâu Nhật Bản', N'468000', N'430000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Dâu tây Nhật Bản được nhiều người tiêu dùng biết đến với hương thơm ngọt ngào, tự nhiên, vị ngọt thanh, chua nhẹ. Dây tây Nhật Bản thường có kích thướt lớn, màu đỏ tươi, da căng mọng nước. Cùng với đó, dâu tây có đa dạng cách để chế biến, từ làm bánh, ăn kèm với sữa, làm mứt...', N'dau-nhat-ban', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10, N'dua-hau-do-khong-hat-2-3kg-210x210.jpg', N'Dưa Hấu Đỏ Không hạt', N'25000', N'22000', N'Dưa hấu là loại trái cây quen thuộc lâu năm của dân tộc Việt Nam. Ngày nay, giống dưa hấu không hạt ra đời, có màu đỏ đẹp hơn, không còn hạt giúp người ăn dễ chịu, ít tốn thời gian lựa, nhả hạt ra.', N'Dưa hấu không hạt có ruột dưa đỏ, đẹp, không hạt, ngọt, vỏ mỏng, có mùi thơm đặc trưng, và dễ bảo quản.
Dưa hấu chứa nhiều lycopene-chất chống oxy hóa có tác dụng chống lại ung thư ngực ở phụ nữ và ung thư tuyến tiền liệt ở nam giới. Ngoài ra còn là nguồn cung cấp các chất dinh dưỡng như các sinh tố A, B1 (Tbiamin), B6 (Pyridoxine), C, E, Magnesium và Potassium.
Dưa hấu thường được dùng tươi tráng miệng sau bữa ăn và giải khát chống nhiệt. Đặc biệt, vào những ngày nắng nóng, đối với những người làm việc mệt nhọc hoặc đi đường xa khát nước, một vài miếng dưa hấu cũng đủ làm bớt mệt, đỡ khát, sảng khoái, dễ chịu.
Đối với người dân nam bộ nói riêng và cả nước nói chung, dưa hấu là loại trái cây không thể thiếu được trong những ngày tết cổ truyền.
Hướng dẫn sử dụng: Rửa sạch, ăn ngay, dùng ngon hơn khi bảo quản trong tủ lạnh. Không sử dụng dưa đã úng nước.

Hướng dẫn bảo quản: Nơi khô ráo, thoáng mát hoặc ngăn mát tủ lạnh.', N'du-hau', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (11, N'dua-hau-my-17-3kg-210x210.jpg', N'Dưa Hấu Mĩ', N'20000', N'19000', N'Dưa hấu Mỹ là giống dưa hấu ngon được du nhập vào Việt Nam và được trồng nhiều tại các nhà vườn ở miền Tây. Dưa hấu Mỹ có hình dạng bầu dục, lớp vỏ mỏng, bề mặt vỏ màu xanh nhạt với các đường sọc san sát màu xanh đậm rất dễ nhận biết. Ruột dưa hấu màu đỏ tươi, ít hạt và mọng nước có vị ngọt thanh tạo cảm giác sảng khoái cho người dùng.', N'Dưa hấu là loại trái cây chứa nhiều chất dinh dưỡng, thường được sử dụng giải nhiệt trong những ngày hè nóng nực.Hướng dẫn sử dụng: ăn trực tiếp.

Bảo quản: Bảo quản trong ngăn mát tủ lạnh.

Xuất xứ: Việt Nam.', N'dua-hau-mi', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (12, N'dua-hau-ruot-do-2-3kg-210x210.jpg', N'Dưa Hấu Ruột Đỏ', N'15000', N'14000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Dưa hấu là loại trái cây chứa nhiều chất dinh dưỡng, thường được sử dụng giải nhiệt trong những ngày hè nóng nực.Hướng dẫn sử dụng: ăn trực tiếp.

Bảo quản: Bảo quản trong ngăn mát tủ lạnh.

Xuất xứ: Việt Nam.', N'dua-hau', 998, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (13, N'dua-huong-210x210.jpg', N'Dừa Hương', N'86000', N'74000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Dừa được xem là biểu tượng của Bến Tre có diện tích khoảng 36.000 ha, năng suất khoảng 242 triệu trái mỗi năm. Thăm Bến Tre, bạn có thể thưởng thức không chỉ kẹo dừa mà còn hàng thủ công truyền thống được làm từ nguyên liệu dừa như sandal, búpbê, giỏ nhỏ, đèn ngủ và lọ hoa', N'dua-huong', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (14, N'dua-tuoi-12trth-210x210.jpg', N'Dừa Tươi', N'35000', N'26000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Dừa được xem là biểu tượng của Bến Tre có diện tích khoảng 36.000 ha, năng suất khoảng 242 triệu trái mỗi năm. Thăm Bến Tre, bạn có thể thưởng thức không chỉ kẹo dừa mà còn hàng thủ công truyền thống được làm từ nguyên liệu dừa như sandal, búpbê, giỏ nhỏ, đèn ngủ và lọ hoa', N'dua-tuoi', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (15, N'du-du-ruot-do-210x210.jpg', N'Đu Đủ Ruột Đỏ', N'18000', N'16000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Đu đủ vàng là một trong những loại trái cây giàu chất dinh dưỡng phù hợp cho mọi đối tượng trong gia đình. Trong đu đủ vàng chứa một lượng vitamin A, B, C và lycopene cao đóng vai trò như một “thần dược” giúp chống lại oxy hóa, ngăn ngừa ung thư, cải thiện tiêu hóa và thúc đẩy sức khỏe tim mạch.', N'du-du', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (16, N'du-du-ruot-vang-08kg-up-210x210.jpg', N'Đu Dủ Ruột vàng', N'22000', N'18000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Đu đủ vàng là một trong những loại trái cây giàu chất dinh dưỡng phù hợp cho mọi đối tượng trong gia đình. Trong đu đủ vàng chứa một lượng vitamin A, B, C và lycopene cao đóng vai trò như một “thần dược” giúp chống lại oxy hóa, ngăn ngừa ung thư, cải thiện tiêu hóa và thúc đẩy sức khỏe tim mạch.', N'du-du', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (17, N'khe-chua-210x210.jpg', N'Khế Chua', N'18000', N'16000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', NULL, N'khe-chua', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (18, N'kiwi-vang-new-33kgth-210x210.jpg', N'Kiwi Vàng', N'199000', N'186000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Kiwi vàng Newzeland có hình quả trứng, thịt quả màu vàng trong rất đẹp mắt, với nhiều hạt đen tạo thành một vòng tròn xung quanh trục dọc của quả. Kiwi vàng có vị ngọt mát, chua dịu rất đặc trưng, phù hợp với khẩu vị của người Việt Nam.', N'kiwi', 999, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (19, N'kiwi-vang-new-500gr-4023-210x210.jpg', N'Kiwi Vàng NEW', N'253000', N'246000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Kiwi vàng Newzeland có hình quả trứng, thịt quả màu vàng trong rất đẹp mắt, với nhiều hạt đen tạo thành một vòng tròn xung quanh trục dọc của quả. Kiwi vàng có vị ngọt mát, chua dịu rất đặc trưng, phù hợp với khẩu vị của người Việt Nam.', N'kiwi', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20, N'kiwi-xanh-new-500g-210x210.jpg', N'Kiwi Xanh', N'180000', N'176000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Kiwi New Zealand là loại trái cây cao cấp giàu giá trị dinh dưỡng. Có 2 loại Kiwi vàng và Kiwi xanh. Kiwi xanh New Zealand có ruột màu xanh ngọc, khi chín có vị ngọt, thịt giòn, ăn rất ngon. Kiwi xanh cung cấp nhiều vitamin và khoáng chất có lợi cho sức khỏe.', N'kiwi', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (21, N'le-han-quoc-15kgth-210x210.jpg', N'Lê Hàn Quốc', N'234000', N'215000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Lê Nam Phi có bề ngoài nhỏ phần trên và phình to ở thân dưới. Vỏ lê Nam Phi có màu vàng xanh pha lẫn với sắc đỏ cam và có nhiều đốm li ti trên vỏ. Lê Nam Phi ngọt dịu, giòn và mọng nước nên vô cùng phù hợp để ăn trong thời tiết nóng bức.', N'le-nam-phi', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (22, N'le-nam-phi-210x210.jpg', N'Lê Nam Phi', N'187000', N'168000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Lê Nam Phi có bề ngoài nhỏ phần trên và phình to ở thân dưới. Vỏ lê Nam Phi có màu vàng xanh pha lẫn với sắc đỏ cam và có nhiều đốm li ti trên vỏ. Lê Nam Phi ngọt dịu, giòn và mọng nước nên vô cùng phù hợp để ăn trong thời tiết nóng bức.', N'le-nam-phi', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (23, N'man-ap-11traikg-10kgth-210x210.jpg', N'Mân AP', N'23000', N'22500', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'man', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (24, N'man-xanh-duong-210x210.jpg', N'Mận Xanh Đường', N'18000', N'17800', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'man-xanh', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (25, N'mcau-xiem-08kg-trai-10kgth-210x210.jpg', N'Mãng Cầu Xiêm', N'56000', N'52000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Sapoche là một loại trái cây nhiệt đới, có mùi vị độc đáo riêng biệt so với các loại quả khác. Sapoche chín có mùi rất thơm, trong quả có một chất nhựa ăn được là một trong những thành phần nguyên liệu dùng để sản xuất kẹo chewing gum.', N'mang-cau-xiem', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (26, N'me-thai-12kgthung-210x210.jpg', N'Me Thái', N'34000', N'31000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'me-thai', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (27, N'mit-giong-thai-6-8kg-210x210.jpg', N'Mít Giống Thái', N'54000', N'46000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'mit-thai', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (28, N'nho-den-kh-uc-210x210.jpg', N'Nho Đen Úc', N'298000', N'277000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'nho-den-uc', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (29, N'nho-do-co-hat-uc-210x210.jpg', N'Nho Đỏ  có hạt', N'168000', N'161000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'nho-do', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (30, N'nho-do-kh-uc-85kgth-210x210.jpg', N'Nho Đỏ không hạt', N'238000', N'234000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'nho-do-khong-hat', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (31, N'nho-do-peru-8468-210x210.png', N'Nho Đỏ Peru', N'189000', N'176000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'nho-do', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (32, N'nho-xanh-khong-hat-my-9kg-thu-5221-210x210.jpg', N'Nho Xanh không hạt', N'299000', N'289000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'nho-xanh', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (33, N'nho-xanh-kh-uc-210x210.jpg', N'Nho Xanh không hạt Úc', N'278000', N'270000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'nho-xanh', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (34, N'oi-giong-dl-5-6tr-10kgth-210x210.jpg', N'Ổi giống DL', N'24000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'oi', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (35, N'oi-nu-hoang-10kgth-210x210.jpg', N'Ổi Nữ Hoàng', N'23000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'oi-nu-hoang', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (36, N'qua-na-4-5traikg-210x210.jpg', N'Quả Na', N'56000', N'54000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'qua-na', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (37, N'quyt-duong-8-10trkg-10kgth-210x210.jpg', N'Quýt Dường', N'45000', N'43000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'quyt-duong', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (38, N'quyt-tieu-7-9traikg-8kgth-210x210.jpg', N'Quýt Tiêu', N'53000', N'49000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'quyt-tieu', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (39, N'sapoche-7-9traikg-10kgthsapo-210x210.jpg', N'Sapoche', N'46000', N'41000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'sapoche', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (40, N'tao-breeze-new-23550-210x210.jpg', N'Táo Breeze', N'75000', N'68000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (41, N'tao-do-my-20kgthung-210x210.jpg', N'Táo Đỏ Mĩ', N'64000', N'59000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-do-mi', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (42, N'tao-do-phap-210x210.jpg', N'Táo Đỏ Pháp', N'56000', N'51000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫnSản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-do-phap', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (43, N'tao-envy-my-210x210.jpg', N'Táo Envy', N'54000', N'50000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-envy', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (44, N'tao-envy-my-hop-3-trai-210x210.jpg', N'Táo Envy hộp 3 trái', N'34000', N'29000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-envy', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (45, N'tao-envy-new-17kgthung-210x210.jpg', N'Táo Envy NEW', N'69000', N'62000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-envy-new', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (46, N'tao-gala-my-20kgth-210x210.jpg', N'Táo Gala Mĩ', N'64000', N'59000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-gala', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (47, N'tao-gala-new-17kgth-210x210.jpg', N'Táo Gala NEW', N'78000', N'72000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-gala-new', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (48, N'tao-gala-phap-20kgth-210x210.jpg', N'Táo Gala Pháp', N'68000', N'63000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-gala-phap', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (49, N'tao-jazz-new-17kgth-210x210.jpg', N'Táo Jazz', N'59000', N'52000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-jazz', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (50, N'tao-juliet-phap-210x210.jpg', N'Táo Juliet Pháp', N'138000', N'128000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-juliet', 994, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (51, N'tao-queen-new-20kgth-210x210.jpg', N'Táo Queen', N'198000', N'189000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-queen', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (52, N'tao-ta-vn-40trkg-20kgth-210x210.jpg', N'Táo Ta Viêt Nam', N'26000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-ta-viet-nam', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (53, N'tao-xanh-my-17kgth-210x210.jpg', N'Táo Xanh Mỹ', N'69000', N'62000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'tao-xanh', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (54, N'thanh-long-450gtrai-210x210.jpg', N'Thanh Long', N'18000', N'17000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'thanh-long', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (55, N'thom-nguyen-trai-1kg-up-210x210.jpg', N'Thơm', N'18000', N'15000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'thom', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (56, N'vu-sua-210x210.jpg', N'Vũ Sữa', N'26000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'vu-sua', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (57, N'xoai-cat-bo-400gr-up-10kgth-210x210.jpg', N'Xoài Cát', N'38000', N'35000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'xoai-cat', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (58, N'xoai-cat-chu-250gr-up-10kgth-210x210.jpg', N'Xoài Cát Chu', N'38000', N'31000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'xoai-cat-chu', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (59, N'xoai-gdai-loan2-3trkg-th10kg-210x210.jpg', N'Xoài Giống Dài', N'28000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'xoai-giong-dai', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (60, N'xoai-giong-thai-210x210.jpg', N'Xoài Thái', N'28000', N'26000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'xoai-thai', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (61, N'xoai-hoa-loc-350gr-up-10kgth-210x210.jpg', N'Xoài Hòa Lộc', N'68000', N'58000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'xoai-hoa-loc', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (62, N'xoai-keo-350gr-up-10kgth-210x210.jpg', N'Xoài Keo', N'38000', N'35000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'Trái cây có vô số các chất dinh dưỡng, chất xơ và các loại vitamin, chúng đóng vai trò quan trọng trong việc giữ cho cơ thể của bạn khỏe mạnh. Do đó cần sử dụng thật nhiều trái cây trong khẩu phần ăn hàng ngày.', N'xoai-keo', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10071, N'bac-hadoc-mung-210x210.jpg', N'Bạc Hà', N'18000', N'17000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'bac-ha', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10072, N'bap-cai-trai-tim-210x210.jpg', N'Bắp Cải trái tim', N'28000', N'25000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'bap-cai', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10073, N'bap-cai-trang-dl-800g-up-210x210.jpg', N'Bắp Cải Trắng', N'22000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'bap-cai-trang', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10074, N'bong-thien-ly-200g-210x210.jpg', N'Bông Thiên Lý', N'35000', N'33000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'bong-thien-ly', 999, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10075, N'cai-be-xanh-kg-210x210.jpg', N'Cải Bẹ Xanh', N'26000', N'24000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cai-be-xanh', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10076, N'cai-dun-dl-210x210.jpg', N'Cải Dun', N'35000', N'31000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cai', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10077, N'cai-ngong-210x210.jpg', N'Cải Ngồng', N'25000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cai-ngong', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10078, N'cai-ngot-kg-210x210.jpg', N'Cải Ngọt', N'22000', N'19000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cai-ngot', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10079, N'cai-phung-baby-300g-sx-1984-210x210.JPG', N'Cải Phung', N'24000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cai', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10080, N'cai-thao-dl-500-700grbap-210x210.jpg', N'Cải Thảo', N'19000', N'18000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cai-thao', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10081, N'cai-thao-hoa-tien-300-500gr-210x210.jpg', N'Cải Thảo Hoa Tiến', N'24000', N'20000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cai-thao', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10082, N'cai-thia-baby-300gr-210x210.jpg', N'Cải Thìa', N'23000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cai-thia', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10083, N'cai-xanh-baby-sx-300gr-210x210.jpg', N'Cải Xanh', N'20000', N'19000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cai-xanh', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10084, N'canh-chua-vi-600gr-1628-210x210.JPG', N'Canh Chua Vỉ', N'35000', N'31000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'canh-chua', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10085, N'can-tay-210x210.jpg', N'Cần Tây', N'31000', N'28000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'can-tay', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10086, N'la-giang-210x210.jpg', N'Lá Giang', N'33000', N'30000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'la-giang', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10087, N'mong-toi-210x210.jpg', N'Mồng Tơi', N'21000', N'19000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'mong-toi', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10088, N'nha-dam-210x210.jpg', N'Nha Dam', N'36000', N'34000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'nha-dam', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10089, N'rau-den-com-210x210.jpg', N'Rau Dền', N'24000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'rau-den', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10090, N'rau-den-com-ls-200gr-1027-210x210.JPG', N'Rau Dền Cơm', N'23000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'rau-den-com', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10091, N'rau-la-lot-210x210.jpg', N'Rau Lá Lốt', N'26000', N'24000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'rau-la-lot', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10092, N'rau-lang-an-toan-kg-210x210.jpg', N'Rau Lang', N'21000', N'19000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'rau-lang', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10093, N'rau-muong-bao-210x210.jpg', N'Rau Muống Sợi', N'26000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'rau-muong-soi', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10094, N'rau-ngot-210x210.jpg', N'Rau Ngót', N'17000', N'16000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'rau-ngot', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10095, N'rau-nhut-210x210.jpg', N'Rau Nhút', N'35000', N'31000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'rau-nhut', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10096, N'sv-bong-cai-xanh-baby-300g-50406-210x210.JPG', N'Bông Cải Xanh', N'34000', N'32000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'bong-cai-xanh', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10097, N'sx-rau-den-com-baby-300gr-h-50342-210x210.JPG', N'Rau Dền Cơm', N'22000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'rau-den', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10098, N'xa-lach-xoong-nho-210x210.jpg', N'Xà Lách Xoong', N'29000', N'26000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'xa-lach', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10099, N'xa-lach-lolo-xanh-210x210.jpg', N'Xà Lách Lolo', N'23000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'xa-lach-lolo', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10100, N'xa-lach-cuon-210x210.jpg', N'Xà Lách Cuộn', N'26000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'xa-lach-cuon', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10101, N'ca-rot-dl-5-8cukg-210x210.jpg', N'Cà Rốt', N'24000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'ca-rot', 1000, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10102, N'cu-cai-trang-210x210.jpg', N'Củ Cải Trắng', N'26000', N'24000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cu-cai-trang', 1000, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10103, N'cu-den-210x210.jpg', N'Củ Dền', N'27000', N'25000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cu-den', 1000, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10104, N'cu-sancu-dau-5kgth-210x210.jpg', N'Củ Đậu', N'25000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cu-dau', 1000, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10105, N'cu-sen-tuoi-ck-400g-210x210.jpg', N'Củ Sen Tươi', N'38000', N'35000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cu-sen', 999, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10106, N'hanh-tay-dl-13-15cukg-210x210.jpg', N'Hành Tây', N'26000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'hanh-tay', 1000, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10107, N'khoai-lang-dl-210x210.jpg', N'Khoai Lang', N'24000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'khoai-lang', 1000, 3, 1)
GO
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10108, N'khoai-lang-giong-nhat-5-8cu-210x210.jpg', N'Khoai Lang Nhật', N'28000', N'26000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'khoai-lang-nhat', 1000, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10109, N'khoai-so-210x210.jpg', N'Khoai Sọ', N'24000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'khoai-so', 1000, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10110, N'khoai-tay-dl-8-11cukg-210x210.jpg', N'Khoai Tây', N'22000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'khoai-tay', 1000, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10111, N'khoai-tay-hong-da-lat-210x210.jpg', N'Khoai Tây Hồng', N'35000', N'31000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'khoai-tay', 1000, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10112, N'khoai-tay-vang-bi-210x210.jpg', N'Khoai Tây Vàng', N'24000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'khoai-tay-vang', 1000, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10113, N'tf-cu-cai-do-400r-khay-50463-210x210.JPG', N'Củ Cải Đỏ', N'36000', N'31000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cu-cai-do', 1000, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10114, N'su-hao-xanh-188-210x210.jpg', N'Su Hào Xanh', N'24000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'su-hao', 1000, 3, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10115, N'bap-my-dong-khay-210x210.jpg', N'Bắp Mĩ', N'36000', N'32000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'bap-mi', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10116, N'bap-non-200gr-3444-210x210.JPG', N'Bắp Non', N'24000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'bap-non', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10117, N'bau-sao-vg-210x210.jpg', N'Bầu Sao Vàng', N'22000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'bao', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10118, N'bau-xanh-450gr-up-210x210.jpg', N'Bầu Xanh', N'22000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'bao-xanh', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10119, N'bi-dao-xanh-450gr-up-210x210.jpg', N'Bí Dao Xanh', N'24000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiếtĐược trồng theo phương pháp hữu cơCung cấp nhiều vitamin, dưỡng chất tốt cho cơ thểHương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'bi-dao', 2000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10120, N'bi-do-tron-15kg-up-210x210.jpg', N'Bí Đỏ Tròn', N'35000', N'32000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'bi-do-tron', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10121, N'bi-ho-lo-400g-up-210x210.jpg', N'Bí Hồ Lô', N'28000', N'266000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'bi-ho-lo', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10122, N'ca-chua-beef-khay-2725-210x210.jpg', N'Cà Chua Beef', N'25000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'ca-chua-beef', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10123, N'ca-chua-bi-210x210.jpg', N'Cà Chua Bi', N'24000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'ca-chua-bi', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10124, N'ca-chua-da-lat-11-15trkg-210x210.jpg', N'Cà Chua Đà Lạt', N'35000', N'31000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'ca-chua', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10125, N'ca-tim-210x210.jpg', N'Cà Tím', N'24000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'ca-tim', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10126, N'dau-bap-baby-300gr-sv-210x210.jpg', N'Đậu Bắp ', N'28000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'dau-bap', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10127, N'dau-dua-210x210.jpg', N'Đậu Đũa', N'24000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'dau-dua', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10128, N'dau-ha-lan-tuoi-210x210.jpg', N'Đậu Hà lan', N'26000', N'24000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'dau-ha-lan-tuoi', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10129, N'dua-leo-5-10trkg-210x210.jpg', N'Dưa Leo', N'24000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'dua-leo', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10130, N'dua-leo-bi-210x210.jpg', N'Dưa Leo Bi', N'22000', N'20000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'dua-leo-bi', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10131, N'dua-leo-cocktail-210x210.jpg', N'Dưa Leo Cocktail', N'28000', N'25000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'dua-leo-cocktail', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10132, N'muop-huong-210x210.jpg', N'Mướp Hương', N'24000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'muop-huong', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10133, N'ot-chuong-do-210x210.jpg', N'Ớt Chuông Đỏ', N'24000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'ot-chuong-do', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10134, N'ot-chuong-vang-210x210.jpg', N'Ớt Chuông Vàng', N'24000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'ot-chuong-vang', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10135, N'ot-chuong-xanh-210x210.jpg', N'Ớt Chuông Xanh', N'24000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'ot-chuong-xanh', 1000, 4, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10136, N'chanh-khong-hat-210x210.jpg', N'Chanh Không Hạt', N'19000', N'18000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'chanh-khong-hat', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10137, N'chuoi-chat-210x210.jpg', N'Chuối Chát', N'34000', N'32000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'chuoi-chat', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10138, N'cu-nghe-210x210.jpg', N'Củ Nghệ', N'25000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cu-nghe', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10139, N'cu-rieng-210x210.jpg', N'Củ Riềng', N'26000', N'25000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'cu-rieng', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10140, N'hanh-tay-baby-300gr-2119-210x210.jpg', N'Hành Tây', N'24000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'hanh-tay-baby', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10141, N'ngo-gai-210x210.jpg', N'Ngò Gai', N'23000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'ngo-gai', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10142, N'ngo-rirau-mui-210x210.jpg', N'Rau Mùi', N'16000', N'15000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'ngo-ri-rau-mui', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10143, N'ot-hiem-do-210x210.jpg', N'Ớt Hiểm Đỏ', N'25000', N'23000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'ot-hiem-do', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10144, N'ot-sung-do-khong-cay-210x210.jpg', N'Ớt Sung Đỏ', N'28000', N'25000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'ot-sung-do-khong-cay', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10145, N'rau-omrau-ngo-210x210.jpg', N'Rau Ngò', N'25000', N'22000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'rau-om-rau-ngo', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10146, N'sa-cay-210x210.jpg', N'Sả Cây', N'35000', N'31000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'sa-cay', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10147, N'tac-trai-210x210.jpg', N'Trái Tắc', N'34000', N'32000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'tac-trai', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10148, N'thi-la-210x210.jpg', N'Thì là', N'23000', N'21000', N'Sản phẩm thực tế có thể có màu sắc khác nhau, tùy theo mùa vụ hoặc thời tiết
Được trồng theo phương pháp hữu cơ
Cung cấp nhiều vitamin, dưỡng chất tốt cho cơ thể
Hương vị thơm ngon, hấp dẫn', N'chế độ ăn uống hàng ngày của con người nên bao gồm rau củ quả, đặc biệt là rau lá xanh cùng nhiều mặt hàng thực phẩm khác. Nó được gọi là thực phẩm kỳ diệu vì chứa tất cả các chất dinh dưỡng lành mạnh, thiết yếu cho cơ thể như vitamin, khoáng chất, canxi, sắt, chất xơ..., Ngoài việc giúp bạn giảm cân, rau xanh giảm nguy cơ bệnh tiểu đường, tăng huyết áp và ung thư. Nhưng làm thế nào để tiêu thụ nhiều rau xanh mỗi ngày? Một số nghiên cứu khuyên bạn nên ăn 2-3 chén rau (nấu, hấp, chiên, xào, hay ăn sống) mỗi ngày cho người trưởng thành là tốt nhất. ', N'thi-la', 1000, 5, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (10149, N'1_031966a1417f4fdc91dbdf8a99e986c1_grande.jpg', N'Mẫu 1', N'350000', N'340000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20149, N'1_e428d4ce37714feebfe0c6a71aed2bec_grande.jpg', N'Mẫu 2', N'360000', N'350000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20150, N'2_1dc8816f4f594b4eb4ada9cb86ed7a2a_grande.jpg', N'Mẫu 3', N'370000', N'360000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20151, N'2_bd11e15f44e742c3b5b738e89d3ec0a2_grande.jpg', N'Mẫu 4', N'380000', N'350000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 996, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20152, N'3_7ccb9d9715df4f0994f723e54782a187_grande.jpg', N'Mẫu 5', N'390000', N'370000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20153, N'3_d1a6b3c3692240788fa3bbd030a11e21_grande.jpg', N'Mẫu 6', N'400000', N'390000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20154, N'4_0c55b2d9e73b45fdaa08a4b393b350dd_grande.jpg', N'Mẫu 7', N'410000', N'390000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20155, N'5_1e94247e1fda417f9b8898561a34fe00_grande.jpg', N'Mẫu 8', N'420000', N'410000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20156, N'6_a2a5192d5d2a407393852a58d62522b3_grande.jpg', N'Mẫu 9', N'430000', N'420000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20157, N'7_bca4663451fe4fa19a2a9756ad79557e_grande.jpg', N'Mẫu 10', N'440000', N'420000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20158, N'8_23b86af0eac24d49b5ffa53bbb112b72_grande.jpg', N'Mẫu 11', N'450000', N'440000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20159, N'9_db8a2bd87f9a48f18f8d0a6a4f6e5fc9_grande.jpg', N'Mẫu 12', N'460000', N'450000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20160, N'10_a99b0e856fd04f5a8de04ba8f1e316d1_grande.jpg', N'Mẫu 13', N'470000', N'430000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20161, N'12_038acb8026564c75accdfcf2a67c555f_grande.jpg', N'Mẫu 14', N'480000', N'450000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20162, N'13_4700115b9b39446daba36cccb2b71987_grande.jpg', N'Mẫu 15', N'490000', N'470000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20163, N'14_61ce56515c7e447b99ac11db5255f2bf_grande.jpg', N'Mẫu 16', N'500000', N'490000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20164, N'15_194fc58f357c4133af82f55f938d8c84_grande.jpg', N'Mẫu 17', N'450000', N'430000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20165, N'16_221c5c923ecc439c9b1d3112646f2fae_grande.jpg', N'Mẫu 18', N'550000', N'510000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20166, N'18_245a762a2eb647d7a213e703ba7d5a26_grande.jpg', N'Mẫu 19', N'420000', N'400000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20167, N'19_1ba0f6fe3ae046e68aa1d0675f0dd939_grande.jpg', N'Mẫu 20', N'390000', N'380000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20168, N'1_2f4610c2a8714dcdb1dba43d041cac2e_grande.jpg', N'Mẫu 1', N'250000', N'340000', N'Bạn bè, người thân ra đi luôn để lại nỗi buồn và nhung nhớ khôn nguôi trong tâm trí mỗi người. Trong giây phút chia cách đau thương, từng kỷ niệm được hồi tưởng như một cuốn phim chiếu chậm, tràn ngập những niềm vui, nỗi buồn cũng như tiếc nuối. Kệ hoa “Giã biệt 1” chất chứa nỗi niềm riêng của người ở lại dành cho người đã khuất, những nỗi niềm giờ đây đã không biết tỏ cùng ai.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-chia-buon', 1000, 6, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20169, N'700_a7655a51b0c14a66ae580e195565f469_grande.jpg', N'Mẫu 2', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20170, N'750_a1c8f7d3cac349b59f35eecd0895269c_grande.jpg', N'Mẫu 3', N'250000', N'240000
', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 990, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20171, N'chon-hoa-cuoi-theo-phong-cach-cua-12-cung-hoang-dao-2728-1_grande.jpg', N'Mẫu 4', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20172, N'hoa_cam_tay_co_dau_hoatuoi24h_com_vn_550_a6b7b003793a4761b35c7d30f026dfbd_grande.jpg', N'Mẫu 5', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20173, N'hoa_cam_tay_co_dau_hoatuoi24h_com_vn_600_0e84852d1eb247d7a612eab756f04900_grande.jpg', N'Mẫu 6', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20174, N'hoa_cam_tay_co_dau_hoatuoi24h_com_vn_640_d1c2fac9a8da432a8d5444fb782d779d_grande.jpg', N'Mẫu 7', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20175, N'hoa_cam_tay_co_dau_hoatuoi24h_com_vn_650_1_ec3f2c0c92934719be487a1351a41a33_grande.jpg', N'Mẫu 8', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20176, N'hoa_cam_tay_co_dau_hoatuoi24h_com_vn_690_6530b946d69b4057b37757e496711a1a_grande', N'Mẫu 9', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20177, N'hoa_cam_tay_co_dau_hoatuoi24h_com_vn_750_2b7f28ce6a5e485389bf10d072f3efa2_grande.jpg', N'Mẫu 10', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20178, N'hoa_cam_tay_co_dau_hoatuoi24h_com_vn_ec8f3e7d615e46e9a3d116f93f2f0ffe_grande.jpg', N'Mẫu 11', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20179, N'hoa-cam-tay-co-dau-hai-phong-1495536522_14746b6b81b4434c97d5959366c26bb8_grande.jpg', N'Mẫu 12', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20180, N'nhung-mau-hoa-cuoi-cam-tay-co-dau-duoc-ua-chuong-nhat_grande.jpg', N'Mẫu 13', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20181, N'hoa_xe_cuoi_hoatuoi24h_com_vn_3_981a3d4adc1340da896b949d68f57f4a_grande.jpg', N'Mẫu 14', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20182, N'hoa_xe_cuoi_hoatuoi24h_com_vn_5_6822f365a4c24d88a31b5e75d3231234_grande.jpg', N'Mẫu 15', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20183, N'hoa_xe_cuoi_hoatuoi24h_com_vn_39845f46d8414c718c7a70445bc13579_grande.jpg', N'Mẫu 16', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20184, N'ket_hoa_xe_cuoi_dep_2_fa658a3746ec4324a9ae7eeadd504c76_grande.jpg', N'Mẫu 17', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20185, N'ket_hoa_xe_cuoi_dep_4_ceff632776664f74bcfe56fb40d84dbb_grande.jpg', N'Mẫu 18', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20186, N'ket_hoa_xe_cuoi_dep_d15c632be6be420692c7bfd3d6b8d3a1_grande.jpg', N'Mẫu 19', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20187, N'ket_hoa_xe_cuoi_dep_hoatuoi24h_com_vn_b3846a9ed7a94a2487ea95f93d61eb57_grande.jpg', N'Mẫu 20', N'250000', N'240000', N'Có khoảng khắc nào đặc biệt hơn giây phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn. khi mà niềm hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc được ngỏ lời về chung một nhà chính là cảm hứng chính cho thiết kế bó hoa cưới "Tiếng Yêu". Đây là một bó hoa vừa nồng nàn, lãng mạn, nhưng cũng rất dịu dàng, nhẹ nhàng rất riêng và rất đỗi con gái', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa-cuoi', 1000, 7, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20188, N'1_4ba1645c4ab549eba6fc85f0bdf1ff19_grande.jpg', N'Mẫu 1', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20189, N'1_9b27deca94ca4aa2a10194ecc83df637_grande.jpg', N'Mẫu 2', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20190, N'2_312bffef1908466a9418718775dc9534_grande.jpg', N'Mẫu 3', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20191, N'3_6abb22d4ccdf4060ae5d3c0fe5b8f0a6_grande.jpg', N'Mẫu 4', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20192, N'4_2f7f6f706166478ea0dfef34012dc658_grande.jpg', N'Mẫu 5', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20193, N'6_ba72ddf3faa649468bd1b2c6e2c0abc2_grande.jpg', N'Mẫu 6', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20194, N'7_a89fe43a6dbb463487af71d088a2b962_grande.jpg', N'Mẫu 7', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20195, N'8_grande.jpg', N'Mẫu 8', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20196, N'10_46a9a6f7c6664665841c16d70097d67f_grande.jpg', N'Mẫu 9', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20197, N'11_22c24efd723f4fb9a923233be306e05b_grande.jpg', N'Mẫu 10', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20198, N'13_3fce197eb6654a268b0aafdc08a71241_grande.jpg', N'Mẫu 11', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20199, N'14_b3c98ccf84374c7ea9f68d978923b371_grande.jpg', N'Mẫu 12', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20200, N'17_7d4adc9df58a4d799c73dae7cf17c2f7_grande.jpg', N'Mẫu 13', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20201, N'19_2067afe5498f41bbab2455b64970f5c2_grande.jpg', N'Mẫu 14', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20202, N'20_bad8fe1674ce4523bd47213637fd0144_grande.jpg', N'Mẫu 15', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20203, N'21_ad6ec33982a04c658854b013999660d2_grande.jpg', N'Mẫu 16', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20204, N'25_e72fa2aa8b104ec8817d3f0ba8eafc1b_grande.jpg', N'Mẫu 17', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20205, N'26_842d81639ab94ec39b6367ea863911da_grande.jpg', N'Mẫu 18', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20206, N'27_48e508be2bb14774ac3335e15164b91a_grande.jpg', N'Mẫu 19', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
GO
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20207, N'7001_dce7b48229564703a447323f1bbfba8d_grande.jpg', N'Mẫu 20', N'400000', N'380000', N'Kỳ thực con người sống trên cuộc đời này chỉ tồn tại một khoảng thời gian hữu hạn. Khoảng cách từ sinh ra đến khi mất đi, nói ngắn cũng không ngắn, mà dài cũng chẳng thật sự dài. Lẵng hoa “từng phút từng giây” là lời nhắn nhủ mọi người hãy trân trọng quỹ thời gian mình đang có, hãy làm điều mình thích, bày tỏ yêu thương đến người mình yêu, tận hưởng và cảm nhận những gì cuộc sống đem đến. Hãy sống mỗi ngày chứ đừng sống qua ngày.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'gio-hoa', 1000, 8, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20208, N'1__1__4cee443f232b4936a9cbbde77b0924ab_grande.jpg', N'Mẫu 1', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20209, N'1__1__grande.jpg', N'Mẫu 2', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20210, N'2__1__grande.jpg', N'Mẫu 3', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20211, N'5_grande.jpg', N'Mẫu 4', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20212, N'8ae96950f79015ce4c81_c29dd51802dd49d9b8aa88ec2e79579b_grande.jpg', N'Mẫu 5', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20213, N'76a713bea14942171b58_grande.jpg', N'Mẫu 6', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20214, N'700_0b9cf4d09a4a4139b6edb1bbfb9baf85_grande.jpg', N'Mẫu 7', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20215, N'700_2_dc2576094a4943d5a3ea91d49349fda9_grande.jpg', N'Mẫu 8', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20216, N'700_55d79a0aaeff4dddbe219a5b2922d511_d820ed38ce294ac5babe9c06a9499384_grande.jpg', N'Mẫu 9', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20217, N'700_468019562a8a4492a91c6be7bbfb62f7_dfbdf687ada34276a46e36a69378d416_grande.jpg', N'Mẫu 10', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20218, N'700_d977edd05d20470dbdb1b6250487834c_grande.jpg', N'Mẫu 11', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20219, N'750_d394dfc152274e188a6d9d280b2bb382_a856884c252744afadb8415bfc9de41e_grande.jpg', N'Mẫu 12', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20220, N'800_1_ccb212f616064658abb5eb01d426f5a7_grande.jpg', N'Mẫu 13', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20221, N'800_b41fefa3a9564b43bec7e633848cfae5_grande.jpg', N'Mẫu 14', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20222, N'800_f73084a6ef884ac8a19ce905b41bd4b4_0170b3f224ca42f7a7d9b3d38a0c677f_grande.jpg', N'Mẫu 15', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20223, N'850_1_a66921db51a64911b7740a4f234c3e90_grande.jpg', N'Mẫu 16', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20224, N'850_3_2b564ecd2be348ffb96d594c76c43e8c_grande.jpg', N'Mẫu 17', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20225, N'850_4_63c7b22b6b834b57b47b9c70511d40dd_grande.jpg', N'Mẫu 18', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20226, N'900_b42e854dcfc440469b676327c45e145a_00d1f3e981494a1391813c0c6f74316f_grande.jpg', N'Mẫu 19', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20227, N'1000_1_f26c413a5b1c4f1c90b449bc56bffb84_grande.jpg', N'Mẫu 20', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20228, N'1000_3f734949d1024b0d954896f16a0b5459_grande.jpg', N'Mẫu 21', N'550000', N'530000', N'Như những đốm mặt trời tỏa sáng lấp lánh, một lẵng hoa hướng dương rực rỡ sẽ là một món quà chúc mừng tuyệt vời trao gửi những lời chúc chân thành và tốt đẹp nhất của bạn đến đối tác, cấp trên hay đồng nghiệp nhân ngày trọng đại của họ.', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'Hoa Khai Trương', 1000, 9, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20229, N'chau-lan-ho-diep-2-canh-tim-sang-trong241_grande.jpg', N'Mẫu Lan 1', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20230, N'chau-lan-ho-diep-2-canh-trang-dep-nhat544_grande.jpg', N'Mẫu Lan 2', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20231, N'chau-lan-ho-diep-loc-vang764__1__grande.jpg', N'Mẫu Lan 3', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20232, N'chau-lan-ho-diep-tim-buom-xinh261__1__grande.jpg', N'Mẫu Lan 4', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 1010, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20233, N'chau-lan-ho-diep-tim-man-ma370_grande.jpg', N'Mẫu Lan 5', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20234, N'chau-lan-ho-diep-trang-duy-nhat906_grande.jpg', N'Mẫu Lan 6', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20235, N'chau-lan-ho-diep-trang-sang-trong190_grande.jpg', N'Mẫu Lan 7', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20236, N'chau-lan-ho-diep-trang-tinh-khoi236_grande.jpg', N'Mẫu Lan 8', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20237, N'chau-lan-ho-diep-trang-tinh-te422_grande.jpg', N'Mẫu Lan 9', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20238, N'chau-lan-ho-diep-trang-vang-ket-hop432_grande.jpg', N'Mẫu Lan 10', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20239, N'chau-lan-ho-diep-vang-dep-nhat662_grande.jpg', N'Mẫu Lan 11', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20240, N'chau-lan-ket-hop-3-mau-hoan-hao682_grande.jpg', N'Mẫu Lan 12', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20241, N'chau-lan-tim-vuon-xa794_grande.jpg', N'Mẫu Lan 13', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20242, N'lan-du-mau-tinh-te359_grande.jpg', N'Mẫu Lan 14', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (20243, N'tet-am-cung834_grande.jpg', N'Mẫu Lan 15', N'650000', N'620000', N'Dịu dàng mang đến một gam màu dịu nhẹ, không nồng nàng, rực rỡ như những màu lan khác. Chậu lan mang đến một sức sống mới cho ngôi nhà của bạn, rất phù hợp đặt trong phòng khách hay quầy lễ tân.
Chậu lan là một sự sáng tạo bắt nguồn từ Phong cách Châu Âu, phong cách thể hiện nét tính cách phóng khoáng, hiện đại và gần gũi thiên nhiên', N'Với nhiều năm kinh nghiệm phục vụ trong ngành điện hoa, chúng tôi hiểu mức độ quan trọng trong công việc của mình là truyền tải đúng và đủ thông điệp của người tặng đến người nhận. Vì thế chúng tôi cam kết 100% sự hài lòng của khách hàng với chúng dịch vụ của chúng tôi. Với bất cứ điều gì không hài lòng bạn đều được hoàn lại 100% phí dịch vụ đã chuyển cho chúng tôi.', N'hoa lan, Hoa Lan Hồ Điệp', 1000, 10, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (50244, N'mas4.jpg', N'Nấm', N'400000', N'380000', N'Vì sao nấm lại được gọi với mỹ từ "món ăn của thượng đế"? Đơn giản vì từ xưa đến này, có nhiều chuyên gia ẩm thực và dinh dưỡng xem nấm là món ăn đặc biệt. Nhiều chuyên gia ẩm thực đánh giá cao thành phần dinh dưỡng có trong nấm. Đây cũng là thực phẩm nổi tiếng từ châu Âu sang châu Á với 4 công dụng rất tốt cho sức khỏe.', N'Các chuyên gia cho rằng khả năng chống oxy hóa của nấm thậm chí còn tốt hơn so với một số các loại rau quả tươi như bí xanh, cà rốt, súp lơ, ớt đỏ.Đa phần các loại rau tươi và trái cây khác không chứa vitamin D, riêng nấm là một ngoại lệ. Không những thế, hàm lượng vitamin D trong nấm lại rất phong phú, đặc biệt có lợi xương khớp.', N'nam', 1000, 2, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (70245, N'fruit_04.jpg', N'mân xôi', N'100000', N'80000', N'đây là quả mâm xôi', N'Nơi bán trái cây', N'man-xoi', 1000, 1, 1)
INSERT [dbo].[SanPham] ([SanPhamID], [Image], [TenSanPham], [DonGia], [PromotionPrice], [TomTat], [Description], [MetaKeyword], [Quantity], [DanhMucSanPhamID], [Status]) VALUES (70246, N'fruit_04.jpg', N'mâm xôi', N'1000', N'10', N'đây là quả mâm xôi', N'Nơi bán trái cây', N'man-xoi', 100, 1, 0)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[Ship] ON 

INSERT [dbo].[Ship] ([ShipID], [Name], [GiaShip]) VALUES (1, N'Nội thành', CAST(30000 AS Decimal(18, 0)))
INSERT [dbo].[Ship] ([ShipID], [Name], [GiaShip]) VALUES (2, N'Ngoại thành', CAST(50000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Ship] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([SlideID], [slide], [Image], [Title], [Description], [Status]) VALUES (1, N'slide1.jpg', N'sl1.png', N'Trái cây', N'Nơi bán trái cây', 1)
INSERT [dbo].[Slide] ([SlideID], [slide], [Image], [Title], [Description], [Status]) VALUES (2, N'slide2.jpg', N'sl2.png', N'Rau củ', N'Nơi bán rau củ', 1)
INSERT [dbo].[Slide] ([SlideID], [slide], [Image], [Title], [Description], [Status]) VALUES (3, N'slide3.jpg', N'sl3.png', N'Hoa', N'Nơi bán Hoa', 1)
INSERT [dbo].[Slide] ([SlideID], [slide], [Image], [Title], [Description], [Status]) VALUES (5, N'v', N'v', N'v', N'v', 0)
INSERT [dbo].[Slide] ([SlideID], [slide], [Image], [Title], [Description], [Status]) VALUES (6, N'c', N'c', N'c', N'c', 0)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([TagID], [TagName], [Status]) VALUES (1, N'Hoa Quả', 1)
INSERT [dbo].[Tag] ([TagID], [TagName], [Status]) VALUES (2, N'Rau', 1)
INSERT [dbo].[Tag] ([TagID], [TagName], [Status]) VALUES (3, N'Trái cây', 1)
INSERT [dbo].[Tag] ([TagID], [TagName], [Status]) VALUES (4, N'Gia vị', 1)
INSERT [dbo].[Tag] ([TagID], [TagName], [Status]) VALUES (5, N'Hạt', 1)
INSERT [dbo].[Tag] ([TagID], [TagName], [Status]) VALUES (6, N'Hoa', 1)
INSERT [dbo].[Tag] ([TagID], [TagName], [Status]) VALUES (7, N'Hoa lan', 1)
SET IDENTITY_INSERT [dbo].[Tag] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Gmail], [Password], [GroupID], [Name], [Address], [Phone], [Status]) VALUES (3, N'thanhtuy@gmail.com', N'03f99b25c5f6f9304e8a99e0b0e4214f', N'ADMIN', N'Than tuy', N'Hồ Chí Minh', N'00000000000', 1)
INSERT [dbo].[User] ([UserID], [Gmail], [Password], [GroupID], [Name], [Address], [Phone], [Status]) VALUES (10006, N'thanhvien@gmail.com', N'eda1e1856672f3f28d8fb8ac739485e2', N'MEMBER', NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([UserID], [Gmail], [Password], [GroupID], [Name], [Address], [Phone], [Status]) VALUES (10008, N'thanhvien2@gmail.com', N'eda1e1856672f3f28d8fb8ac739485e2', N'MEMBER', N'aaa', N'aaa', N'213213', 1)
INSERT [dbo].[User] ([UserID], [Gmail], [Password], [GroupID], [Name], [Address], [Phone], [Status]) VALUES (20004, N'duythai666@gmail.com', N'eda1e1856672f3f28d8fb8ac739485e2', N'ADMIN', N'Duy thái', N'Bình Dương', N'121212', 1)
INSERT [dbo].[User] ([UserID], [Gmail], [Password], [GroupID], [Name], [Address], [Phone], [Status]) VALUES (40004, N'a@gmail.com', N'duythai', N'MEMBER', N'thai', N'2b', N'0974199063', 1)
INSERT [dbo].[User] ([UserID], [Gmail], [Password], [GroupID], [Name], [Address], [Phone], [Status]) VALUES (50005, N'nhokut666@gmail.com', N'47bce5c74f589f4867dbd57e9ca9f808', N'MEMBER', N'Thái Duy Vũ', N'2b', N'0974199063', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Khách hàng')
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
/****** Object:  StoredProcedure [dbo].[DeleteAbout]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteBlog]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteContact]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteDanhMuc]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteDanhMucSanPham]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteFooter]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteSanPham]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteSilde]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUpdateAbout]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUpdateBlog]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUpdateContact]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUpdateDanhMuc]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUpdateDanhMucSanPham]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUpdateFooter]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUpdateOrder]    Script Date: 7/18/2019 12:36:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateOrder]
(
@OrderID bigint,
@CreateDate	datetime,
@ShipName nvarchar(50),
@ShipMobile	varchar(15),
@ShipAddress nchar(100),
@ShipEmail nvarchar(100),
@Status	bit,
@UserID	bigint,
@TongTien bigint,
@Action nchar(10)
)
as
Begin
if @Action='Update'
begin
	Update [Order] set CreateDate=@CreateDate, ShipName = @ShipName, ShipMobile = @ShipMobile, ShipAddress = @ShipAddress, ShipEmail = @ShipEmail, [Status] = @Status,TongTien=@TongTien where OrderID = @OrderID;
end
end
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateSanPham]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUpdateSlide]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertUpdateUser]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectAbout]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectBlog]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectBlogAdmin]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectBlogDetail]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectContact]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectDanhMuc]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectDanhMucSanPham]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectFooter]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectOrder]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectQuanLyDonHang]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectQuanLyDonHangALL]    Script Date: 7/18/2019 12:36:37 PM ******/
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
from [Order] left join OrderDetail on OrderDetail.OrderID = [Order].OrderID left join SanPham sp on OrderDetail.SanPhamID = sp.SanPhamID
where [Order].UserID=@UserID
end
GO
/****** Object:  StoredProcedure [dbo].[SelectQuanLyDonHangThanhToan]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectSanPham]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectSlide]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectUser]    Script Date: 7/18/2019 12:36:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateLoginFacebook]    Script Date: 7/18/2019 12:36:37 PM ******/
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
