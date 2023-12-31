USE [master]
GO
/****** Object:  Database [RapPhim]    Script Date: 12/2/2023 1:40:17 PM ******/
CREATE DATABASE [RapPhim]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RapPhim', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RapPhim.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RapPhim_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RapPhim_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RapPhim] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RapPhim].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RapPhim] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RapPhim] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RapPhim] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RapPhim] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RapPhim] SET ARITHABORT OFF 
GO
ALTER DATABASE [RapPhim] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RapPhim] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RapPhim] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RapPhim] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RapPhim] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RapPhim] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RapPhim] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RapPhim] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RapPhim] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RapPhim] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RapPhim] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RapPhim] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RapPhim] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RapPhim] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RapPhim] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RapPhim] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RapPhim] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RapPhim] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RapPhim] SET  MULTI_USER 
GO
ALTER DATABASE [RapPhim] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RapPhim] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RapPhim] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RapPhim] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RapPhim] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RapPhim] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RapPhim] SET QUERY_STORE = OFF
GO
USE [RapPhim]
GO
/****** Object:  Table [dbo].[chi_nhanh]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_nhanh](
	[ma_cn] [varchar](5) NOT NULL,
	[ten_cn] [nvarchar](150) NULL,
	[dia_chi] [nvarchar](500) NULL,
	[so_dt] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_cn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chi_tiet_ghe]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_ghe](
	[ma_ctghe] [int] NOT NULL,
	[ma_phong] [varchar](5) NULL,
	[ma_ghe] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_ctghe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chi_tiet_phim]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_phim](
	[ma_phim] [varchar](5) NOT NULL,
	[ma_the_loai] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_phim] ASC,
	[ma_the_loai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chi_tiet_topping]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_topping](
	[IdVe] [int] NOT NULL,
	[MaTopping] [varchar](5) NOT NULL,
	[SoLuongMua] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVe] ASC,
	[MaTopping] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chuc_vu]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chuc_vu](
	[ma_cv] [varchar](5) NOT NULL,
	[ten_cv] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_cv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[csvc]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[csvc](
	[MaCSVC] [varchar](5) NOT NULL,
	[TenCSVC] [nvarchar](150) NULL,
	[Hinh] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCSVC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ct_csvc]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ct_csvc](
	[MaCSVC] [varchar](5) NOT NULL,
	[MaPhong] [varchar](5) NOT NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCSVC] ASC,
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ghe]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ghe](
	[ma_ghe] [varchar](5) NOT NULL,
	[ten_ghe] [varchar](5) NULL,
	[ma_loai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_ghe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khach_hang]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khach_hang](
	[ma_kh] [int] IDENTITY(1,1) NOT NULL,
	[ten_kh] [nvarchar](150) NULL,
	[mat_khau] [varchar](10) NULL,
	[email] [varchar](30) NULL,
	[sodt] [varchar](10) NULL,
	[dia_chi] [nvarchar](500) NULL,
	[gioi_tinh] [bit] NULL,
	[id_FB] [nvarchar](150) NULL,
	[hinh_FB] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_kh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lich_lam_viec]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lich_lam_viec](
	[ID_LLV] [int] IDENTITY(1,1) NOT NULL,
	[NgayLam] [date] NULL,
	[ThoiGianBatDau] [time](7) NULL,
	[ThoiGianKetThuc] [time](7) NULL,
	[LuongCoBan] [float] NULL,
	[MaNV] [varchar](5) NULL,
	[MaCN] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_LLV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai_ghe]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai_ghe](
	[ma_loai] [int] NOT NULL,
	[ten_loai] [nvarchar](150) NULL,
	[phu_thu] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_loai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ngay_chieu]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ngay_chieu](
	[stt] [int] IDENTITY(1,1) NOT NULL,
	[ngay] [date] NULL,
	[gio_bat_dau] [time](7) NULL,
	[ma_phim] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[stt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhan_vien]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhan_vien](
	[ma_nv] [varchar](5) NOT NULL,
	[ho_ten] [nvarchar](150) NULL,
	[gioi_tinh] [int] NULL,
	[mat_khau] [varchar](10) NULL,
	[ngay_sinh] [date] NULL,
	[so_dt] [varchar](10) NULL,
	[ma_cv] [varchar](5) NULL,
	[email] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_nv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phim]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phim](
	[ma_phim] [varchar](5) NOT NULL,
	[ten_phim] [nvarchar](150) NULL,
	[dien_vien] [nvarchar](150) NULL,
	[namsx] [int] NULL,
	[hinh] [nvarchar](150) NULL,
	[dao_dien] [nvarchar](150) NULL,
	[quoc_gia] [nvarchar](150) NULL,
	[thoi_luong] [nvarchar](150) NULL,
	[mo_ta] [nvarchar](1550) NULL,
	[trailer] [nvarchar](150) NULL,
	[trang_thai] [nvarchar](50) NULL,
	[ngay_khoi_chieu] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_phim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phong_chieu]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phong_chieu](
	[MaPhong] [varchar](5) NOT NULL,
	[TenPhong] [nvarchar](150) NULL,
	[MaCN] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tai_khoan]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tai_khoan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[roles] [varchar](5) NULL,
	[ma_KH] [int] NULL,
	[ma_nv] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[the_loai]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[the_loai](
	[ma_the_loai] [varchar](5) NOT NULL,
	[ten_the_loai] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_the_loai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[topping]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topping](
	[ma_topping] [varchar](5) NOT NULL,
	[ten_topping] [nvarchar](150) NULL,
	[so_luong_dang_co] [int] NULL,
	[gia] [float] NULL,
	[hinh] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_topping] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ve]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ve](
	[Id_Ve] [int] IDENTITY(1,1) NOT NULL,
	[Tong_Gia_Ve] [float] NULL,
	[Thue_VAT] [float] NULL,
	[Ma_KH] [int] NULL,
	[Ma_CTGhe] [int] NULL,
	[Stt_XC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Ve] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xuat_chieu]    Script Date: 12/2/2023 1:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xuat_chieu](
	[stt] [int] IDENTITY(1,1) NOT NULL,
	[gia_xuat_chieu] [float] NULL,
	[ma_ngay_chieu] [int] NULL,
	[ma_phong] [varchar](5) NULL,
	[ma_phim] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[stt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[chi_nhanh] ([ma_cn], [ten_cn], [dia_chi], [so_dt]) VALUES (N'CN1', N'DEC TP.HCM', N'645 Quang Trung, Phường 11, Gò Vấp, TP Hồ Chí Minh, Việt Nam', N'0123456789')
INSERT [dbo].[chi_nhanh] ([ma_cn], [ten_cn], [dia_chi], [so_dt]) VALUES (N'CN2', N'DEC Hà Nội', N'8 Đê La Thành, Giảng Võ, Ba Đình, Hà Nội, Việt Nam', N'0234567891')
INSERT [dbo].[chi_nhanh] ([ma_cn], [ten_cn], [dia_chi], [so_dt]) VALUES (N'CN3', N'DEC Cần Thơ', N'21 Đ.3 tháng 2, Xuân Khánh, Ninh Kiều, Cần Thơ, Việt Nam', N'0346517892')
INSERT [dbo].[chi_nhanh] ([ma_cn], [ten_cn], [dia_chi], [so_dt]) VALUES (N'CN4', N'DEC Đà Nẵng', N'10 Nại Nam, Hòa Cường Bắc, Hài Châu, Đà Nẵng, Việt Nam', N'0282413567')
INSERT [dbo].[chi_nhanh] ([ma_cn], [ten_cn], [dia_chi], [so_dt]) VALUES (N'CN5', N'DEC Khánh Hòa', N'231 Lê Hồng Phong, Phước Tân, Nha Trang, Khánh Hòa, Việt Nam', N'0907845613')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1, N'PC01', N'g1')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (2, N'PC01', N'g2')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (3, N'PC01', N'g3')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (4, N'PC01', N'g4')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (5, N'PC01', N'g5')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (6, N'PC01', N'g6')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (7, N'PC01', N'g7')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (8, N'PC01', N'g8')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (9, N'PC01', N'g9')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (10, N'PC01', N'g10')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (11, N'PC01', N'g11')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (12, N'PC01', N'g12')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (13, N'PC01', N'g13')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (14, N'PC01', N'g14')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (15, N'PC01', N'g15')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (16, N'PC01', N'g16')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (17, N'PC01', N'g17')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (18, N'PC01', N'g18')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (19, N'PC01', N'g19')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (20, N'PC01', N'g20')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (21, N'PC01', N'g21')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (22, N'PC01', N'g22')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (23, N'PC01', N'g23')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (24, N'PC01', N'g24')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (25, N'PC01', N'g25')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (26, N'PC01', N'g26')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (27, N'PC01', N'g27')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (28, N'PC01', N'g28')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (29, N'PC01', N'g29')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (30, N'PC01', N'g30')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (31, N'PC01', N'g31')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (32, N'PC01', N'g32')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (33, N'PC01', N'g33')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (34, N'PC01', N'g34')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (35, N'PC01', N'g35')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (36, N'PC01', N'g36')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (37, N'PC01', N'g37')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (38, N'PC01', N'g38')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (39, N'PC01', N'g39')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (40, N'PC01', N'g40')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (41, N'PC01', N'g41')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (42, N'PC01', N'g42')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (43, N'PC01', N'g43')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (44, N'PC01', N'g44')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (45, N'PC01', N'g45')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (46, N'PC01', N'g46')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (47, N'PC01', N'g47')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (48, N'PC01', N'g48')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (49, N'PC01', N'g49')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (50, N'PC01', N'g50')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (51, N'PC01', N'g51')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (52, N'PC01', N'g52')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (53, N'PC01', N'g53')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (54, N'PC01', N'g54')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (55, N'PC01', N'g55')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (56, N'PC01', N'g56')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (57, N'PC01', N'g57')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (58, N'PC01', N'g58')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (59, N'PC01', N'g59')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (60, N'PC01', N'g60')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (61, N'PC01', N'g61')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (62, N'PC01', N'g62')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (63, N'PC01', N'g63')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (64, N'PC01', N'g64')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (65, N'PC01', N'g65')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (66, N'PC01', N'g66')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (67, N'PC01', N'g67')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (68, N'PC01', N'g68')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (69, N'PC01', N'g69')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (70, N'PC01', N'g70')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (71, N'PC01', N'g71')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (72, N'PC01', N'g72')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (73, N'PC01', N'g73')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (74, N'PC01', N'g74')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (75, N'PC01', N'g75')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (76, N'PC01', N'g76')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (77, N'PC01', N'g77')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (78, N'PC01', N'g78')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (79, N'PC01', N'g79')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (80, N'PC01', N'g80')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (81, N'PC01', N'g81')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (82, N'PC01', N'g82')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (83, N'PC01', N'g83')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (84, N'PC01', N'g84')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (85, N'PC01', N'g85')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (86, N'PC01', N'g86')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (87, N'PC01', N'g87')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (88, N'PC01', N'g88')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (89, N'PC01', N'g89')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (90, N'PC01', N'g90')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (91, N'PC01', N'g91')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (92, N'PC01', N'g92')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (93, N'PC01', N'g93')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (94, N'PC01', N'g94')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (95, N'PC01', N'g95')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (96, N'PC01', N'g96')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (97, N'PC02', N'g1')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (98, N'PC02', N'g2')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (99, N'PC02', N'g3')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (100, N'PC02', N'g4')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (101, N'PC02', N'g5')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (102, N'PC02', N'g6')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (103, N'PC02', N'g7')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (104, N'PC02', N'g8')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (105, N'PC02', N'g9')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (106, N'PC02', N'g10')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (107, N'PC02', N'g11')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (108, N'PC02', N'g12')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (109, N'PC02', N'g13')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (110, N'PC02', N'g14')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (111, N'PC02', N'g15')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (112, N'PC02', N'g16')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (113, N'PC02', N'g17')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (114, N'PC02', N'g18')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (115, N'PC02', N'g19')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (116, N'PC02', N'g20')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (117, N'PC02', N'g21')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (118, N'PC02', N'g22')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (119, N'PC02', N'g23')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (120, N'PC02', N'g24')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (121, N'PC02', N'g25')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (122, N'PC02', N'g26')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (123, N'PC02', N'g27')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (124, N'PC02', N'g28')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (125, N'PC02', N'g29')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (126, N'PC02', N'g30')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (127, N'PC02', N'g31')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (128, N'PC02', N'g32')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (129, N'PC02', N'g33')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (130, N'PC02', N'g34')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (131, N'PC02', N'g35')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (132, N'PC02', N'g36')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (133, N'PC02', N'g37')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (134, N'PC02', N'g38')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (135, N'PC02', N'g39')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (136, N'PC02', N'g40')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (137, N'PC02', N'g41')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (138, N'PC02', N'g42')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (139, N'PC02', N'g43')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (140, N'PC02', N'g44')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (141, N'PC02', N'g45')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (142, N'PC02', N'g46')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (143, N'PC02', N'g47')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (144, N'PC02', N'g48')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (145, N'PC02', N'g49')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (146, N'PC02', N'g50')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (147, N'PC02', N'g51')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (148, N'PC02', N'g52')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (149, N'PC02', N'g53')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (150, N'PC02', N'g54')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (151, N'PC02', N'g55')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (152, N'PC02', N'g56')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (153, N'PC02', N'g57')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (154, N'PC02', N'g58')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (155, N'PC02', N'g59')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (156, N'PC02', N'g60')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (157, N'PC02', N'g61')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (158, N'PC02', N'g62')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (159, N'PC02', N'g63')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (160, N'PC02', N'g64')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (161, N'PC02', N'g65')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (162, N'PC02', N'g66')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (163, N'PC02', N'g67')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (164, N'PC02', N'g68')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (165, N'PC02', N'g69')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (166, N'PC02', N'g70')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (167, N'PC02', N'g71')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (168, N'PC02', N'g72')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (169, N'PC02', N'g73')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (170, N'PC02', N'g74')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (171, N'PC02', N'g75')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (172, N'PC02', N'g76')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (173, N'PC02', N'g77')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (174, N'PC02', N'g78')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (175, N'PC02', N'g79')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (176, N'PC02', N'g80')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (177, N'PC02', N'g81')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (178, N'PC02', N'g82')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (179, N'PC02', N'g83')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (180, N'PC02', N'g84')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (181, N'PC02', N'g85')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (182, N'PC02', N'g86')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (183, N'PC02', N'g87')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (184, N'PC02', N'g88')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (185, N'PC02', N'g89')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (186, N'PC02', N'g90')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (187, N'PC02', N'g91')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (188, N'PC02', N'g92')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (189, N'PC02', N'g93')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (190, N'PC02', N'g94')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (191, N'PC02', N'g95')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (192, N'PC02', N'g96')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (193, N'PC03', N'g1')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (194, N'PC03', N'g2')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (195, N'PC03', N'g3')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (196, N'PC03', N'g4')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (197, N'PC03', N'g5')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (198, N'PC03', N'g6')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (199, N'PC03', N'g7')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (200, N'PC03', N'g8')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (201, N'PC03', N'g9')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (202, N'PC03', N'g10')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (203, N'PC03', N'g11')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (204, N'PC03', N'g12')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (205, N'PC03', N'g13')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (206, N'PC03', N'g14')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (207, N'PC03', N'g15')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (208, N'PC03', N'g16')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (209, N'PC03', N'g17')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (210, N'PC03', N'g18')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (211, N'PC03', N'g19')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (212, N'PC03', N'g20')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (213, N'PC03', N'g21')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (214, N'PC03', N'g22')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (215, N'PC03', N'g23')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (216, N'PC03', N'g24')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (217, N'PC03', N'g25')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (218, N'PC03', N'g26')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (219, N'PC03', N'g27')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (220, N'PC03', N'g28')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (221, N'PC03', N'g29')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (222, N'PC03', N'g30')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (223, N'PC03', N'g31')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (224, N'PC03', N'g32')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (225, N'PC03', N'g33')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (226, N'PC03', N'g34')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (227, N'PC03', N'g35')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (228, N'PC03', N'g36')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (229, N'PC03', N'g37')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (230, N'PC03', N'g38')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (231, N'PC03', N'g39')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (232, N'PC03', N'g40')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (233, N'PC03', N'g41')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (234, N'PC03', N'g42')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (235, N'PC03', N'g43')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (236, N'PC03', N'g44')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (237, N'PC03', N'g45')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (238, N'PC03', N'g46')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (239, N'PC03', N'g47')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (240, N'PC03', N'g48')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (241, N'PC03', N'g49')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (242, N'PC03', N'g50')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (243, N'PC03', N'g51')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (244, N'PC03', N'g52')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (245, N'PC03', N'g53')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (246, N'PC03', N'g54')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (247, N'PC03', N'g55')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (248, N'PC03', N'g56')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (249, N'PC03', N'g57')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (250, N'PC03', N'g58')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (251, N'PC03', N'g59')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (252, N'PC03', N'g60')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (253, N'PC03', N'g61')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (254, N'PC03', N'g62')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (255, N'PC03', N'g63')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (256, N'PC03', N'g64')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (257, N'PC03', N'g65')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (258, N'PC03', N'g66')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (259, N'PC03', N'g67')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (260, N'PC03', N'g68')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (261, N'PC03', N'g69')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (262, N'PC03', N'g70')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (263, N'PC03', N'g71')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (264, N'PC03', N'g72')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (265, N'PC03', N'g73')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (266, N'PC03', N'g74')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (267, N'PC03', N'g75')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (268, N'PC03', N'g76')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (269, N'PC03', N'g77')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (270, N'PC03', N'g78')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (271, N'PC03', N'g79')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (272, N'PC03', N'g80')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (273, N'PC03', N'g81')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (274, N'PC03', N'g82')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (275, N'PC03', N'g83')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (276, N'PC03', N'g84')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (277, N'PC03', N'g85')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (278, N'PC03', N'g86')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (279, N'PC03', N'g87')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (280, N'PC03', N'g88')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (281, N'PC03', N'g89')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (282, N'PC03', N'g90')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (283, N'PC03', N'g91')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (284, N'PC03', N'g92')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (285, N'PC03', N'g93')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (286, N'PC03', N'g94')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (287, N'PC03', N'g95')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (288, N'PC03', N'g96')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (289, N'PC04', N'g1')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (290, N'PC04', N'g2')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (291, N'PC04', N'g3')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (292, N'PC04', N'g4')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (293, N'PC04', N'g5')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (294, N'PC04', N'g6')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (295, N'PC04', N'g7')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (296, N'PC04', N'g8')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (297, N'PC04', N'g9')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (298, N'PC04', N'g10')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (299, N'PC04', N'g11')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (300, N'PC04', N'g12')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (301, N'PC04', N'g13')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (302, N'PC04', N'g14')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (303, N'PC04', N'g15')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (304, N'PC04', N'g16')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (305, N'PC04', N'g17')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (306, N'PC04', N'g18')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (307, N'PC04', N'g19')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (308, N'PC04', N'g20')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (309, N'PC04', N'g21')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (310, N'PC04', N'g22')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (311, N'PC04', N'g23')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (312, N'PC04', N'g24')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (313, N'PC04', N'g25')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (314, N'PC04', N'g26')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (315, N'PC04', N'g27')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (316, N'PC04', N'g28')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (317, N'PC04', N'g29')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (318, N'PC04', N'g30')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (319, N'PC04', N'g31')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (320, N'PC04', N'g32')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (321, N'PC04', N'g33')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (322, N'PC04', N'g34')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (323, N'PC04', N'g35')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (324, N'PC04', N'g36')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (325, N'PC04', N'g37')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (326, N'PC04', N'g38')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (327, N'PC04', N'g39')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (328, N'PC04', N'g40')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (329, N'PC04', N'g41')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (330, N'PC04', N'g42')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (331, N'PC04', N'g43')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (332, N'PC04', N'g44')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (333, N'PC04', N'g45')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (334, N'PC04', N'g46')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (335, N'PC04', N'g47')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (336, N'PC04', N'g48')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (337, N'PC04', N'g49')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (338, N'PC04', N'g50')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (339, N'PC04', N'g51')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (340, N'PC04', N'g52')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (341, N'PC04', N'g53')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (342, N'PC04', N'g54')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (343, N'PC04', N'g55')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (344, N'PC04', N'g56')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (345, N'PC04', N'g57')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (346, N'PC04', N'g58')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (347, N'PC04', N'g59')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (348, N'PC04', N'g60')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (349, N'PC04', N'g61')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (350, N'PC04', N'g62')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (351, N'PC04', N'g63')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (352, N'PC04', N'g64')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (353, N'PC04', N'g65')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (354, N'PC04', N'g66')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (355, N'PC04', N'g67')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (356, N'PC04', N'g68')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (357, N'PC04', N'g69')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (358, N'PC04', N'g70')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (359, N'PC04', N'g71')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (360, N'PC04', N'g72')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (361, N'PC04', N'g73')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (362, N'PC04', N'g74')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (363, N'PC04', N'g75')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (364, N'PC04', N'g76')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (365, N'PC04', N'g77')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (366, N'PC04', N'g78')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (367, N'PC04', N'g79')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (368, N'PC04', N'g80')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (369, N'PC04', N'g81')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (370, N'PC04', N'g82')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (371, N'PC04', N'g83')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (372, N'PC04', N'g84')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (373, N'PC04', N'g85')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (374, N'PC04', N'g86')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (375, N'PC04', N'g87')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (376, N'PC04', N'g88')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (377, N'PC04', N'g89')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (378, N'PC04', N'g90')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (379, N'PC04', N'g91')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (380, N'PC04', N'g92')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (381, N'PC04', N'g93')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (382, N'PC04', N'g94')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (383, N'PC04', N'g95')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (384, N'PC04', N'g96')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (385, N'PC05', N'g1')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (386, N'PC05', N'g2')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (387, N'PC05', N'g3')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (388, N'PC05', N'g4')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (389, N'PC05', N'g5')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (390, N'PC05', N'g6')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (391, N'PC05', N'g7')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (392, N'PC05', N'g8')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (393, N'PC05', N'g9')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (394, N'PC05', N'g10')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (395, N'PC05', N'g11')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (396, N'PC05', N'g12')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (397, N'PC05', N'g13')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (398, N'PC05', N'g14')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (399, N'PC05', N'g15')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (400, N'PC05', N'g16')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (401, N'PC05', N'g17')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (402, N'PC05', N'g18')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (403, N'PC05', N'g19')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (404, N'PC05', N'g20')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (405, N'PC05', N'g21')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (406, N'PC05', N'g22')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (407, N'PC05', N'g23')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (408, N'PC05', N'g24')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (409, N'PC05', N'g25')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (410, N'PC05', N'g26')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (411, N'PC05', N'g27')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (412, N'PC05', N'g28')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (413, N'PC05', N'g29')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (414, N'PC05', N'g30')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (415, N'PC05', N'g31')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (416, N'PC05', N'g32')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (417, N'PC05', N'g33')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (418, N'PC05', N'g34')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (419, N'PC05', N'g35')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (420, N'PC05', N'g36')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (421, N'PC05', N'g37')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (422, N'PC05', N'g38')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (423, N'PC05', N'g39')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (424, N'PC05', N'g40')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (425, N'PC05', N'g41')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (426, N'PC05', N'g42')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (427, N'PC05', N'g43')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (428, N'PC05', N'g44')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (429, N'PC05', N'g45')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (430, N'PC05', N'g46')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (431, N'PC05', N'g47')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (432, N'PC05', N'g48')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (433, N'PC05', N'g49')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (434, N'PC05', N'g50')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (435, N'PC05', N'g51')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (436, N'PC05', N'g52')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (437, N'PC05', N'g53')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (438, N'PC05', N'g54')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (439, N'PC05', N'g55')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (440, N'PC05', N'g56')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (441, N'PC05', N'g57')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (442, N'PC05', N'g58')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (443, N'PC05', N'g59')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (444, N'PC05', N'g60')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (445, N'PC05', N'g61')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (446, N'PC05', N'g62')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (447, N'PC05', N'g63')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (448, N'PC05', N'g64')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (449, N'PC05', N'g65')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (450, N'PC05', N'g66')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (451, N'PC05', N'g67')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (452, N'PC05', N'g68')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (453, N'PC05', N'g69')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (454, N'PC05', N'g70')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (455, N'PC05', N'g71')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (456, N'PC05', N'g72')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (457, N'PC05', N'g73')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (458, N'PC05', N'g74')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (459, N'PC05', N'g75')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (460, N'PC05', N'g76')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (461, N'PC05', N'g77')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (462, N'PC05', N'g78')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (463, N'PC05', N'g79')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (464, N'PC05', N'g80')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (465, N'PC05', N'g81')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (466, N'PC05', N'g82')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (467, N'PC05', N'g83')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (468, N'PC05', N'g84')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (469, N'PC05', N'g85')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (470, N'PC05', N'g86')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (471, N'PC05', N'g87')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (472, N'PC05', N'g88')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (473, N'PC05', N'g89')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (474, N'PC05', N'g90')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (475, N'PC05', N'g91')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (476, N'PC05', N'g92')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (477, N'PC05', N'g93')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (478, N'PC05', N'g94')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (479, N'PC05', N'g95')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (480, N'PC05', N'g96')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (481, N'PC06', N'g1')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (482, N'PC06', N'g2')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (483, N'PC06', N'g3')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (484, N'PC06', N'g4')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (485, N'PC06', N'g5')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (486, N'PC06', N'g6')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (487, N'PC06', N'g7')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (488, N'PC06', N'g8')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (489, N'PC06', N'g9')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (490, N'PC06', N'g10')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (491, N'PC06', N'g11')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (492, N'PC06', N'g12')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (493, N'PC06', N'g13')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (494, N'PC06', N'g14')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (495, N'PC06', N'g15')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (496, N'PC06', N'g16')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (497, N'PC06', N'g17')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (498, N'PC06', N'g18')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (499, N'PC06', N'g19')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (500, N'PC06', N'g20')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (501, N'PC06', N'g21')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (502, N'PC06', N'g22')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (503, N'PC06', N'g23')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (504, N'PC06', N'g24')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (505, N'PC06', N'g25')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (506, N'PC06', N'g26')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (507, N'PC06', N'g27')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (508, N'PC06', N'g28')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (509, N'PC06', N'g29')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (510, N'PC06', N'g30')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (511, N'PC06', N'g31')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (512, N'PC06', N'g32')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (513, N'PC06', N'g33')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (514, N'PC06', N'g34')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (515, N'PC06', N'g35')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (516, N'PC06', N'g36')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (517, N'PC06', N'g37')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (518, N'PC06', N'g38')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (519, N'PC06', N'g39')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (520, N'PC06', N'g40')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (521, N'PC06', N'g41')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (522, N'PC06', N'g42')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (523, N'PC06', N'g43')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (524, N'PC06', N'g44')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (525, N'PC06', N'g45')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (526, N'PC06', N'g46')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (527, N'PC06', N'g47')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (528, N'PC06', N'g48')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (529, N'PC06', N'g49')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (530, N'PC06', N'g50')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (531, N'PC06', N'g51')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (532, N'PC06', N'g52')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (533, N'PC06', N'g53')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (534, N'PC06', N'g54')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (535, N'PC06', N'g55')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (536, N'PC06', N'g56')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (537, N'PC06', N'g57')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (538, N'PC06', N'g58')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (539, N'PC06', N'g59')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (540, N'PC06', N'g60')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (541, N'PC06', N'g61')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (542, N'PC06', N'g62')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (543, N'PC06', N'g63')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (544, N'PC06', N'g64')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (545, N'PC06', N'g65')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (546, N'PC06', N'g66')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (547, N'PC06', N'g67')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (548, N'PC06', N'g68')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (549, N'PC06', N'g69')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (550, N'PC06', N'g70')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (551, N'PC06', N'g71')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (552, N'PC06', N'g72')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (553, N'PC06', N'g73')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (554, N'PC06', N'g74')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (555, N'PC06', N'g75')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (556, N'PC06', N'g76')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (557, N'PC06', N'g77')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (558, N'PC06', N'g78')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (559, N'PC06', N'g79')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (560, N'PC06', N'g80')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (561, N'PC06', N'g81')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (562, N'PC06', N'g82')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (563, N'PC06', N'g83')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (564, N'PC06', N'g84')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (565, N'PC06', N'g85')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (566, N'PC06', N'g86')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (567, N'PC06', N'g87')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (568, N'PC06', N'g88')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (569, N'PC06', N'g89')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (570, N'PC06', N'g90')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (571, N'PC06', N'g91')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (572, N'PC06', N'g92')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (573, N'PC06', N'g93')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (574, N'PC06', N'g94')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (575, N'PC06', N'g95')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (576, N'PC06', N'g96')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (577, N'PC06', N'g97')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (578, N'PC06', N'g98')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (579, N'PC06', N'g99')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (580, N'PC06', N'g100')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (581, N'PC06', N'g101')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (582, N'PC06', N'g102')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (583, N'PC06', N'g103')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (584, N'PC06', N'g104')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (585, N'PC06', N'g105')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (586, N'PC06', N'g106')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (587, N'PC06', N'g107')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (588, N'PC06', N'g108')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (589, N'PC06', N'g109')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (590, N'PC06', N'g110')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (591, N'PC07', N'g1')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (592, N'PC07', N'g2')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (593, N'PC07', N'g3')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (594, N'PC07', N'g4')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (595, N'PC07', N'g5')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (596, N'PC07', N'g6')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (597, N'PC07', N'g7')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (598, N'PC07', N'g8')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (599, N'PC07', N'g9')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (600, N'PC07', N'g10')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (601, N'PC07', N'g11')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (602, N'PC07', N'g12')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (603, N'PC07', N'g13')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (604, N'PC07', N'g14')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (605, N'PC07', N'g15')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (606, N'PC07', N'g16')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (607, N'PC07', N'g17')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (608, N'PC07', N'g18')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (609, N'PC07', N'g19')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (610, N'PC07', N'g20')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (611, N'PC07', N'g21')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (612, N'PC07', N'g22')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (613, N'PC07', N'g23')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (614, N'PC07', N'g24')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (615, N'PC07', N'g25')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (616, N'PC07', N'g26')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (617, N'PC07', N'g27')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (618, N'PC07', N'g28')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (619, N'PC07', N'g29')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (620, N'PC07', N'g30')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (621, N'PC07', N'g31')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (622, N'PC07', N'g32')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (623, N'PC07', N'g33')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (624, N'PC07', N'g34')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (625, N'PC07', N'g35')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (626, N'PC07', N'g36')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (627, N'PC07', N'g37')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (628, N'PC07', N'g38')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (629, N'PC07', N'g39')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (630, N'PC07', N'g40')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (631, N'PC07', N'g41')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (632, N'PC07', N'g42')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (633, N'PC07', N'g43')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (634, N'PC07', N'g44')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (635, N'PC07', N'g45')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (636, N'PC07', N'g46')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (637, N'PC07', N'g47')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (638, N'PC07', N'g48')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (639, N'PC07', N'g49')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (640, N'PC07', N'g50')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (641, N'PC07', N'g51')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (642, N'PC07', N'g52')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (643, N'PC07', N'g53')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (644, N'PC07', N'g54')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (645, N'PC07', N'g55')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (646, N'PC07', N'g56')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (647, N'PC07', N'g57')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (648, N'PC07', N'g58')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (649, N'PC07', N'g59')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (650, N'PC07', N'g60')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (651, N'PC07', N'g61')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (652, N'PC07', N'g62')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (653, N'PC07', N'g63')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (654, N'PC07', N'g64')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (655, N'PC07', N'g65')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (656, N'PC07', N'g66')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (657, N'PC07', N'g67')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (658, N'PC07', N'g68')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (659, N'PC07', N'g69')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (660, N'PC07', N'g70')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (661, N'PC07', N'g71')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (662, N'PC07', N'g72')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (663, N'PC07', N'g73')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (664, N'PC07', N'g74')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (665, N'PC07', N'g75')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (666, N'PC07', N'g76')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (667, N'PC07', N'g77')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (668, N'PC07', N'g78')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (669, N'PC07', N'g79')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (670, N'PC07', N'g80')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (671, N'PC07', N'g81')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (672, N'PC07', N'g82')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (673, N'PC07', N'g83')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (674, N'PC07', N'g84')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (675, N'PC07', N'g85')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (676, N'PC07', N'g86')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (677, N'PC07', N'g87')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (678, N'PC07', N'g88')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (679, N'PC07', N'g89')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (680, N'PC07', N'g90')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (681, N'PC07', N'g91')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (682, N'PC07', N'g92')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (683, N'PC07', N'g93')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (684, N'PC07', N'g94')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (685, N'PC07', N'g95')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (686, N'PC07', N'g96')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (687, N'PC07', N'g97')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (688, N'PC07', N'g98')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (689, N'PC07', N'g99')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (690, N'PC07', N'g100')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (691, N'PC07', N'g101')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (692, N'PC07', N'g102')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (693, N'PC07', N'g103')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (694, N'PC07', N'g104')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (695, N'PC07', N'g105')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (696, N'PC07', N'g106')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (697, N'PC07', N'g107')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (698, N'PC07', N'g108')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (699, N'PC07', N'g109')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (700, N'PC07', N'g110')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (701, N'PC08', N'g1')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (702, N'PC08', N'g2')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (703, N'PC08', N'g3')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (704, N'PC08', N'g4')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (705, N'PC08', N'g5')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (706, N'PC08', N'g6')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (707, N'PC08', N'g7')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (708, N'PC08', N'g8')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (709, N'PC08', N'g9')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (710, N'PC08', N'g10')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (711, N'PC08', N'g11')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (712, N'PC08', N'g12')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (713, N'PC08', N'g13')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (714, N'PC08', N'g14')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (715, N'PC08', N'g15')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (716, N'PC08', N'g16')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (717, N'PC08', N'g17')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (718, N'PC08', N'g18')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (719, N'PC08', N'g19')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (720, N'PC08', N'g20')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (721, N'PC08', N'g21')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (722, N'PC08', N'g22')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (723, N'PC08', N'g23')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (724, N'PC08', N'g24')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (725, N'PC08', N'g25')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (726, N'PC08', N'g26')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (727, N'PC08', N'g27')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (728, N'PC08', N'g28')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (729, N'PC08', N'g29')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (730, N'PC08', N'g30')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (731, N'PC08', N'g31')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (732, N'PC08', N'g32')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (733, N'PC08', N'g33')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (734, N'PC08', N'g34')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (735, N'PC08', N'g35')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (736, N'PC08', N'g36')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (737, N'PC08', N'g37')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (738, N'PC08', N'g38')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (739, N'PC08', N'g39')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (740, N'PC08', N'g40')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (741, N'PC08', N'g41')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (742, N'PC08', N'g42')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (743, N'PC08', N'g43')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (744, N'PC08', N'g44')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (745, N'PC08', N'g45')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (746, N'PC08', N'g46')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (747, N'PC08', N'g47')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (748, N'PC08', N'g48')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (749, N'PC08', N'g49')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (750, N'PC08', N'g50')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (751, N'PC08', N'g51')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (752, N'PC08', N'g52')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (753, N'PC08', N'g53')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (754, N'PC08', N'g54')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (755, N'PC08', N'g55')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (756, N'PC08', N'g56')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (757, N'PC08', N'g57')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (758, N'PC08', N'g58')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (759, N'PC08', N'g59')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (760, N'PC08', N'g60')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (761, N'PC08', N'g61')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (762, N'PC08', N'g62')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (763, N'PC08', N'g63')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (764, N'PC08', N'g64')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (765, N'PC08', N'g65')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (766, N'PC08', N'g66')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (767, N'PC08', N'g67')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (768, N'PC08', N'g68')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (769, N'PC08', N'g69')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (770, N'PC08', N'g70')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (771, N'PC08', N'g71')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (772, N'PC08', N'g72')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (773, N'PC08', N'g73')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (774, N'PC08', N'g74')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (775, N'PC08', N'g75')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (776, N'PC08', N'g76')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (777, N'PC08', N'g77')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (778, N'PC08', N'g78')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (779, N'PC08', N'g79')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (780, N'PC08', N'g80')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (781, N'PC08', N'g81')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (782, N'PC08', N'g82')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (783, N'PC08', N'g83')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (784, N'PC08', N'g84')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (785, N'PC08', N'g85')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (786, N'PC08', N'g86')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (787, N'PC08', N'g87')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (788, N'PC08', N'g88')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (789, N'PC08', N'g89')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (790, N'PC08', N'g90')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (791, N'PC08', N'g91')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (792, N'PC08', N'g92')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (793, N'PC08', N'g93')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (794, N'PC08', N'g94')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (795, N'PC08', N'g95')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (796, N'PC08', N'g96')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (797, N'PC08', N'g97')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (798, N'PC08', N'g98')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (799, N'PC08', N'g99')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (800, N'PC08', N'g100')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (801, N'PC08', N'g101')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (802, N'PC08', N'g102')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (803, N'PC08', N'g103')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (804, N'PC08', N'g104')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (805, N'PC08', N'g105')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (806, N'PC08', N'g106')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (807, N'PC08', N'g107')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (808, N'PC08', N'g108')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (809, N'PC08', N'g109')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (810, N'PC08', N'g110')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (811, N'PC09', N'g1')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (812, N'PC09', N'g2')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (813, N'PC09', N'g3')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (814, N'PC09', N'g4')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (815, N'PC09', N'g5')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (816, N'PC09', N'g6')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (817, N'PC09', N'g7')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (818, N'PC09', N'g8')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (819, N'PC09', N'g9')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (820, N'PC09', N'g10')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (821, N'PC09', N'g11')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (822, N'PC09', N'g12')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (823, N'PC09', N'g13')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (824, N'PC09', N'g14')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (825, N'PC09', N'g15')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (826, N'PC09', N'g16')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (827, N'PC09', N'g17')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (828, N'PC09', N'g18')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (829, N'PC09', N'g19')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (830, N'PC09', N'g20')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (831, N'PC09', N'g21')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (832, N'PC09', N'g22')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (833, N'PC09', N'g23')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (834, N'PC09', N'g24')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (835, N'PC09', N'g25')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (836, N'PC09', N'g26')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (837, N'PC09', N'g27')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (838, N'PC09', N'g28')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (839, N'PC09', N'g29')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (840, N'PC09', N'g30')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (841, N'PC09', N'g31')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (842, N'PC09', N'g32')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (843, N'PC09', N'g33')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (844, N'PC09', N'g34')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (845, N'PC09', N'g35')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (846, N'PC09', N'g36')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (847, N'PC09', N'g37')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (848, N'PC09', N'g38')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (849, N'PC09', N'g39')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (850, N'PC09', N'g40')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (851, N'PC09', N'g41')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (852, N'PC09', N'g42')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (853, N'PC09', N'g43')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (854, N'PC09', N'g44')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (855, N'PC09', N'g45')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (856, N'PC09', N'g46')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (857, N'PC09', N'g47')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (858, N'PC09', N'g48')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (859, N'PC09', N'g49')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (860, N'PC09', N'g50')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (861, N'PC09', N'g51')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (862, N'PC09', N'g52')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (863, N'PC09', N'g53')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (864, N'PC09', N'g54')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (865, N'PC09', N'g55')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (866, N'PC09', N'g56')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (867, N'PC09', N'g57')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (868, N'PC09', N'g58')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (869, N'PC09', N'g59')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (870, N'PC09', N'g60')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (871, N'PC09', N'g61')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (872, N'PC09', N'g62')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (873, N'PC09', N'g63')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (874, N'PC09', N'g64')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (875, N'PC09', N'g65')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (876, N'PC09', N'g66')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (877, N'PC09', N'g67')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (878, N'PC09', N'g68')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (879, N'PC09', N'g69')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (880, N'PC09', N'g70')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (881, N'PC09', N'g71')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (882, N'PC09', N'g72')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (883, N'PC09', N'g73')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (884, N'PC09', N'g74')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (885, N'PC09', N'g75')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (886, N'PC09', N'g76')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (887, N'PC09', N'g77')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (888, N'PC09', N'g78')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (889, N'PC09', N'g79')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (890, N'PC09', N'g80')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (891, N'PC09', N'g81')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (892, N'PC09', N'g82')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (893, N'PC09', N'g83')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (894, N'PC09', N'g84')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (895, N'PC09', N'g85')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (896, N'PC09', N'g86')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (897, N'PC09', N'g87')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (898, N'PC09', N'g88')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (899, N'PC09', N'g89')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (900, N'PC09', N'g90')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (901, N'PC09', N'g91')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (902, N'PC09', N'g92')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (903, N'PC09', N'g93')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (904, N'PC09', N'g94')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (905, N'PC09', N'g95')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (906, N'PC09', N'g96')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (907, N'PC09', N'g97')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (908, N'PC09', N'g98')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (909, N'PC09', N'g99')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (910, N'PC09', N'g100')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (911, N'PC09', N'g101')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (912, N'PC09', N'g102')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (913, N'PC09', N'g103')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (914, N'PC09', N'g104')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (915, N'PC09', N'g105')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (916, N'PC09', N'g106')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (917, N'PC09', N'g107')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (918, N'PC09', N'g108')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (919, N'PC09', N'g109')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (920, N'PC09', N'g110')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (921, N'PC10', N'g1')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (922, N'PC10', N'g2')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (923, N'PC10', N'g3')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (924, N'PC10', N'g4')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (925, N'PC10', N'g5')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (926, N'PC10', N'g6')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (927, N'PC10', N'g7')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (928, N'PC10', N'g8')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (929, N'PC10', N'g9')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (930, N'PC10', N'g10')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (931, N'PC10', N'g11')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (932, N'PC10', N'g12')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (933, N'PC10', N'g13')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (934, N'PC10', N'g14')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (935, N'PC10', N'g15')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (936, N'PC10', N'g16')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (937, N'PC10', N'g17')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (938, N'PC10', N'g18')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (939, N'PC10', N'g19')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (940, N'PC10', N'g20')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (941, N'PC10', N'g21')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (942, N'PC10', N'g22')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (943, N'PC10', N'g23')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (944, N'PC10', N'g24')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (945, N'PC10', N'g25')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (946, N'PC10', N'g26')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (947, N'PC10', N'g27')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (948, N'PC10', N'g28')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (949, N'PC10', N'g29')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (950, N'PC10', N'g30')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (951, N'PC10', N'g31')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (952, N'PC10', N'g32')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (953, N'PC10', N'g33')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (954, N'PC10', N'g34')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (955, N'PC10', N'g35')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (956, N'PC10', N'g36')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (957, N'PC10', N'g37')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (958, N'PC10', N'g38')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (959, N'PC10', N'g39')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (960, N'PC10', N'g40')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (961, N'PC10', N'g41')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (962, N'PC10', N'g42')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (963, N'PC10', N'g43')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (964, N'PC10', N'g44')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (965, N'PC10', N'g45')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (966, N'PC10', N'g46')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (967, N'PC10', N'g47')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (968, N'PC10', N'g48')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (969, N'PC10', N'g49')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (970, N'PC10', N'g50')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (971, N'PC10', N'g51')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (972, N'PC10', N'g52')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (973, N'PC10', N'g53')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (974, N'PC10', N'g54')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (975, N'PC10', N'g55')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (976, N'PC10', N'g56')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (977, N'PC10', N'g57')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (978, N'PC10', N'g58')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (979, N'PC10', N'g59')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (980, N'PC10', N'g60')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (981, N'PC10', N'g61')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (982, N'PC10', N'g62')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (983, N'PC10', N'g63')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (984, N'PC10', N'g64')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (985, N'PC10', N'g65')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (986, N'PC10', N'g66')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (987, N'PC10', N'g67')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (988, N'PC10', N'g68')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (989, N'PC10', N'g69')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (990, N'PC10', N'g70')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (991, N'PC10', N'g71')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (992, N'PC10', N'g72')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (993, N'PC10', N'g73')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (994, N'PC10', N'g74')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (995, N'PC10', N'g75')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (996, N'PC10', N'g76')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (997, N'PC10', N'g77')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (998, N'PC10', N'g78')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (999, N'PC10', N'g79')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1000, N'PC10', N'g80')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1001, N'PC10', N'g81')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1002, N'PC10', N'g82')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1003, N'PC10', N'g83')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1004, N'PC10', N'g84')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1005, N'PC10', N'g85')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1006, N'PC10', N'g86')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1007, N'PC10', N'g87')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1008, N'PC10', N'g88')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1009, N'PC10', N'g89')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1010, N'PC10', N'g90')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1011, N'PC10', N'g91')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1012, N'PC10', N'g92')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1013, N'PC10', N'g93')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1014, N'PC10', N'g94')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1015, N'PC10', N'g95')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1016, N'PC10', N'g96')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1017, N'PC10', N'g97')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1018, N'PC10', N'g98')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1019, N'PC10', N'g99')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1020, N'PC10', N'g100')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1021, N'PC10', N'g101')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1022, N'PC10', N'g102')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1023, N'PC10', N'g103')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1024, N'PC10', N'g104')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1025, N'PC10', N'g105')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1026, N'PC10', N'g106')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1027, N'PC10', N'g107')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1028, N'PC10', N'g108')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1029, N'PC10', N'g109')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1030, N'PC10', N'g110')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1031, N'PC11', N'g1')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1032, N'PC11', N'g2')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1033, N'PC11', N'g3')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1034, N'PC11', N'g4')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1035, N'PC11', N'g5')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1036, N'PC11', N'g6')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1037, N'PC11', N'g7')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1038, N'PC11', N'g8')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1039, N'PC11', N'g9')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1040, N'PC11', N'g10')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1041, N'PC11', N'g11')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1042, N'PC11', N'g12')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1043, N'PC11', N'g13')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1044, N'PC11', N'g14')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1045, N'PC11', N'g15')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1046, N'PC11', N'g16')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1047, N'PC11', N'g17')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1048, N'PC11', N'g18')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1049, N'PC11', N'g19')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1050, N'PC11', N'g20')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1051, N'PC11', N'g21')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1052, N'PC11', N'g22')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1053, N'PC11', N'g23')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1054, N'PC11', N'g24')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1055, N'PC11', N'g25')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1056, N'PC11', N'g26')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1057, N'PC11', N'g27')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1058, N'PC11', N'g28')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1059, N'PC11', N'g29')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1060, N'PC11', N'g30')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1061, N'PC11', N'g31')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1062, N'PC11', N'g32')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1063, N'PC11', N'g33')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1064, N'PC11', N'g34')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1065, N'PC11', N'g35')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1066, N'PC11', N'g36')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1067, N'PC11', N'g37')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1068, N'PC11', N'g38')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1069, N'PC11', N'g39')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1070, N'PC11', N'g40')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1071, N'PC11', N'g41')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1072, N'PC11', N'g42')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1073, N'PC11', N'g43')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1074, N'PC11', N'g44')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1075, N'PC11', N'g45')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1076, N'PC11', N'g46')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1077, N'PC11', N'g47')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1078, N'PC11', N'g48')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1079, N'PC11', N'g49')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1080, N'PC11', N'g50')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1081, N'PC11', N'g51')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1082, N'PC11', N'g52')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1083, N'PC11', N'g53')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1084, N'PC11', N'g54')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1085, N'PC11', N'g55')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1086, N'PC11', N'g56')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1087, N'PC11', N'g57')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1088, N'PC11', N'g58')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1089, N'PC11', N'g59')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1090, N'PC11', N'g60')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1091, N'PC11', N'g61')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1092, N'PC11', N'g62')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1093, N'PC11', N'g63')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1094, N'PC11', N'g64')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1095, N'PC11', N'g65')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1096, N'PC11', N'g66')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1097, N'PC11', N'g67')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1098, N'PC11', N'g68')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1099, N'PC11', N'g69')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1100, N'PC11', N'g70')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1101, N'PC11', N'g71')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1102, N'PC11', N'g72')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1103, N'PC11', N'g73')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1104, N'PC11', N'g74')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1105, N'PC11', N'g75')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1106, N'PC11', N'g76')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1107, N'PC11', N'g77')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1108, N'PC11', N'g78')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1109, N'PC11', N'g79')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1110, N'PC11', N'g80')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1111, N'PC11', N'g81')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1112, N'PC11', N'g82')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1113, N'PC11', N'g83')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1114, N'PC11', N'g84')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1115, N'PC11', N'g85')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1116, N'PC11', N'g86')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1117, N'PC11', N'g87')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1118, N'PC11', N'g88')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1119, N'PC11', N'g89')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1120, N'PC11', N'g90')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1121, N'PC11', N'g91')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1122, N'PC11', N'g92')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1123, N'PC11', N'g93')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1124, N'PC11', N'g94')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1125, N'PC11', N'g95')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1126, N'PC11', N'g96')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1127, N'PC12', N'g1')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1128, N'PC12', N'g2')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1129, N'PC12', N'g3')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1130, N'PC12', N'g4')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1131, N'PC12', N'g5')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1132, N'PC12', N'g6')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1133, N'PC12', N'g7')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1134, N'PC12', N'g8')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1135, N'PC12', N'g9')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1136, N'PC12', N'g10')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1137, N'PC12', N'g11')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1138, N'PC12', N'g12')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1139, N'PC12', N'g13')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1140, N'PC12', N'g14')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1141, N'PC12', N'g15')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1142, N'PC12', N'g16')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1143, N'PC12', N'g17')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1144, N'PC12', N'g18')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1145, N'PC12', N'g19')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1146, N'PC12', N'g20')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1147, N'PC12', N'g21')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1148, N'PC12', N'g22')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1149, N'PC12', N'g23')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1150, N'PC12', N'g24')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1151, N'PC12', N'g25')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1152, N'PC12', N'g26')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1153, N'PC12', N'g27')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1154, N'PC12', N'g28')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1155, N'PC12', N'g29')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1156, N'PC12', N'g30')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1157, N'PC12', N'g31')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1158, N'PC12', N'g32')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1159, N'PC12', N'g33')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1160, N'PC12', N'g34')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1161, N'PC12', N'g35')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1162, N'PC12', N'g36')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1163, N'PC12', N'g37')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1164, N'PC12', N'g38')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1165, N'PC12', N'g39')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1166, N'PC12', N'g40')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1167, N'PC12', N'g41')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1168, N'PC12', N'g42')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1169, N'PC12', N'g43')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1170, N'PC12', N'g44')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1171, N'PC12', N'g45')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1172, N'PC12', N'g46')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1173, N'PC12', N'g47')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1174, N'PC12', N'g48')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1175, N'PC12', N'g49')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1176, N'PC12', N'g50')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1177, N'PC12', N'g51')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1178, N'PC12', N'g52')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1179, N'PC12', N'g53')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1180, N'PC12', N'g54')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1181, N'PC12', N'g55')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1182, N'PC12', N'g56')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1183, N'PC12', N'g57')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1184, N'PC12', N'g58')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1185, N'PC12', N'g59')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1186, N'PC12', N'g60')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1187, N'PC12', N'g61')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1188, N'PC12', N'g62')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1189, N'PC12', N'g63')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1190, N'PC12', N'g64')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1191, N'PC12', N'g65')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1192, N'PC12', N'g66')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1193, N'PC12', N'g67')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1194, N'PC12', N'g68')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1195, N'PC12', N'g69')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1196, N'PC12', N'g70')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1197, N'PC12', N'g71')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1198, N'PC12', N'g72')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1199, N'PC12', N'g73')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1200, N'PC12', N'g74')
GO
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1201, N'PC12', N'g75')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1202, N'PC12', N'g76')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1203, N'PC12', N'g77')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1204, N'PC12', N'g78')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1205, N'PC12', N'g79')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1206, N'PC12', N'g80')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1207, N'PC12', N'g81')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1208, N'PC12', N'g82')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1209, N'PC12', N'g83')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1210, N'PC12', N'g84')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1211, N'PC12', N'g85')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1212, N'PC12', N'g86')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1213, N'PC12', N'g87')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1214, N'PC12', N'g88')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1215, N'PC12', N'g89')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1216, N'PC12', N'g90')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1217, N'PC12', N'g91')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1218, N'PC12', N'g92')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1219, N'PC12', N'g93')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1220, N'PC12', N'g94')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1221, N'PC12', N'g95')
INSERT [dbo].[chi_tiet_ghe] ([ma_ctghe], [ma_phong], [ma_ghe]) VALUES (1222, N'PC12', N'g96')
GO
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP01', N'LP01')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP01', N'LP06')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP02', N'LP05')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP03', N'LP01')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP04', N'LP01')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP04', N'LP06')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP05', N'LP01')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP05', N'LP02')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP06', N'LP02')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP07', N'LP07')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP08', N'LP01')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP08', N'LP06')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP09', N'LP01')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP09', N'LP08')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP10', N'LP07')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP10', N'LP09')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP11', N'LP04')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP11', N'LP05')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP12', N'LP05')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP13', N'LP05')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP13', N'LP07')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP14', N'LP05')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP14', N'LP07')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP15', N'LP03')
INSERT [dbo].[chi_tiet_phim] ([ma_phim], [ma_the_loai]) VALUES (N'MP15', N'LP06')
GO
INSERT [dbo].[chuc_vu] ([ma_cv], [ten_cv]) VALUES (N'CV1', N'Quản trị')
INSERT [dbo].[chuc_vu] ([ma_cv], [ten_cv]) VALUES (N'CV2', N'Nhân viên quản lí vé')
INSERT [dbo].[chuc_vu] ([ma_cv], [ten_cv]) VALUES (N'CV3', N'Nhân viên quản lí phim')
INSERT [dbo].[chuc_vu] ([ma_cv], [ten_cv]) VALUES (N'CV4', N'Nhân viên quản lí phòng chiếu')
INSERT [dbo].[chuc_vu] ([ma_cv], [ten_cv]) VALUES (N'CV5', N'Nhân viên quản lí lịch chiếu')
INSERT [dbo].[chuc_vu] ([ma_cv], [ten_cv]) VALUES (N'CV6', N'Ban quản lí')
INSERT [dbo].[chuc_vu] ([ma_cv], [ten_cv]) VALUES (N'CV7', N'Khách hàng')
GO
INSERT [dbo].[csvc] ([MaCSVC], [TenCSVC], [Hinh]) VALUES (N'VC1', N'Máy chiếu', N'vc1.png')
INSERT [dbo].[csvc] ([MaCSVC], [TenCSVC], [Hinh]) VALUES (N'VC2', N'Camera', N'vc2.png')
INSERT [dbo].[csvc] ([MaCSVC], [TenCSVC], [Hinh]) VALUES (N'VC3', N'Máy lạnh', N'vc3.png')
INSERT [dbo].[csvc] ([MaCSVC], [TenCSVC], [Hinh]) VALUES (N'VC4', N'Cảm biến báo khói ', N'vc4.png')
INSERT [dbo].[csvc] ([MaCSVC], [TenCSVC], [Hinh]) VALUES (N'VC5', N'Bình xịt chữa cháy', N'vc5.png')
GO
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC01', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC02', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC03', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC04', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC05', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC06', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC07', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC08', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC09', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC10', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC11', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC12', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC13', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC14', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC15', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC16', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC17', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC18', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC19', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC20', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC21', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC22', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC23', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC24', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC25', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC26', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC27', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC28', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC29', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC30', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC31', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC32', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC33', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC34', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC35', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC36', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC37', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC38', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC39', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC40', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC41', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC42', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC43', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC44', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC45', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC46', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC47', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC48', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC49', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC1', N'PC50', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC01', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC02', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC03', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC04', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC05', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC06', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC07', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC08', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC09', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC10', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC11', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC12', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC13', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC14', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC15', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC16', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC17', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC18', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC19', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC20', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC21', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC22', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC23', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC24', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC25', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC26', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC27', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC28', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC29', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC30', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC31', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC32', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC33', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC34', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC35', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC36', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC37', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC38', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC39', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC40', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC41', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC42', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC43', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC44', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC45', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC46', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC47', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC48', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC49', 6)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC2', N'PC50', 6)
GO
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC01', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC02', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC03', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC04', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC05', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC06', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC07', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC08', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC09', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC10', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC11', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC12', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC13', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC14', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC15', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC16', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC17', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC18', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC19', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC20', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC21', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC22', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC23', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC24', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC25', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC26', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC27', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC28', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC29', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC30', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC31', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC32', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC33', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC34', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC35', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC36', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC37', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC38', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC39', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC40', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC41', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC42', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC43', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC44', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC45', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC46', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC47', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC48', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC49', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC3', N'PC50', 2)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC01', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC02', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC03', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC04', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC05', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC06', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC07', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC08', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC09', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC10', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC11', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC12', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC13', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC14', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC15', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC16', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC17', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC18', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC19', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC20', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC21', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC22', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC23', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC24', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC25', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC26', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC27', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC28', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC29', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC30', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC31', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC32', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC33', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC34', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC35', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC36', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC37', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC38', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC39', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC40', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC41', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC42', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC43', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC44', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC45', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC46', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC47', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC48', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC49', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC4', N'PC50', 1)
GO
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC01', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC02', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC03', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC04', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC05', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC06', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC07', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC08', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC09', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC10', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC11', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC12', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC13', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC14', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC15', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC16', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC17', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC18', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC19', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC20', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC21', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC22', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC23', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC24', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC25', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC26', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC27', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC28', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC29', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC30', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC31', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC32', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC33', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC34', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC35', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC36', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC37', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC38', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC39', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC40', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC41', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC42', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC43', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC44', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC45', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC46', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC47', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC48', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC49', 1)
INSERT [dbo].[ct_csvc] ([MaCSVC], [MaPhong], [SoLuong]) VALUES (N'VC5', N'PC50', 1)
GO
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g1', N'A1', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g10', N'A10', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g100', N'J4', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g101', N'J5', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g102', N'J6', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g103', N'J7', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g104', N'J8', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g105', N'J9', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g106', N'J10', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g107', N'J11', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g108', N'J12', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g109', N'J13', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g11', N'A11', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g110', N'J14', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g111', N'A13', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g112', N'A14', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g113', N'A15', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g114', N'A16', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g115', N'A17', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g116', N'A18', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g117', N'B13', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g118', N'B14', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g119', N'B15', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g12', N'A12', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g120', N'B16', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g121', N'B17', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g122', N'B18', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g123', N'C13', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g124', N'C14', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g125', N'C15', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g126', N'C16', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g127', N'C17', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g128', N'C18', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g129', N'D13', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g13', N'B1', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g130', N'D14', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g131', N'D15', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g132', N'D16', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g133', N'D17', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g134', N'D18', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g135', N'E13', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g136', N'E14', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g137', N'E15', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g138', N'E16', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g139', N'E17', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g14', N'B2', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g140', N'E18', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g141', N'F18', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g142', N'F13', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g143', N'F14', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g144', N'F15', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g145', N'F16', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g146', N'F17', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g147', N'F18', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g148', N'G13', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g149', N'G14', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g15', N'B3', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g150', N'G15', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g151', N'G16', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g152', N'G17', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g153', N'G18', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g154', N'H13', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g155', N'H14', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g156', N'H15', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g157', N'H16', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g158', N'H17', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g159', N'H18', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g16', N'B4', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g17', N'B5', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g18', N'B6', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g19', N'B7', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g2', N'A2', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g20', N'B8', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g21', N'B9', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g22', N'B10', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g23', N'B11', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g24', N'B12', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g25', N'C1', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g26', N'C2', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g27', N'C3', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g28', N'C4', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g29', N'C5', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g3', N'A3', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g30', N'C6', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g31', N'C7', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g32', N'C8', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g33', N'C9', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g34', N'C10', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g35', N'C11', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g36', N'C12', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g37', N'D1', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g38', N'D2', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g39', N'D3', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g4', N'A4', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g40', N'D4', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g41', N'D5', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g42', N'D6', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g43', N'D7', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g44', N'D8', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g45', N'D9', 3)
GO
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g46', N'D10', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g47', N'D11', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g48', N'D12', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g49', N'E1', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g5', N'A5', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g50', N'E2', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g51', N'E3', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g52', N'E4', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g53', N'E5', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g54', N'E6', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g55', N'E7', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g56', N'E8', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g57', N'E9', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g58', N'E10', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g59', N'E11', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g6', N'A6', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g60', N'E12', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g61', N'F1', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g62', N'F2', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g63', N'F3', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g64', N'F4', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g65', N'F5', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g66', N'F6', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g67', N'F7', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g68', N'F8', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g69', N'F9', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g7', N'A7', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g70', N'F10', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g71', N'F11', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g72', N'F12', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g73', N'G1', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g74', N'G2', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g75', N'G3', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g76', N'G4', 1)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g77', N'G5', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g78', N'G6', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g79', N'G7', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g8', N'A8', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g80', N'G8', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g81', N'G9', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g82', N'G10', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g83', N'G11', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g84', N'G12', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g85', N'H1', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g86', N'H2', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g87', N'H3', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g88', N'H4', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g89', N'H5', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g9', N'A9', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g90', N'H6', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g91', N'H7', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g92', N'H8', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g93', N'H9', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g94', N'H10', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g95', N'H11', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g96', N'H12', 2)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g97', N'J1', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g98', N'J2', 3)
INSERT [dbo].[ghe] ([ma_ghe], [ten_ghe], [ma_loai]) VALUES (N'g99', N'J3', 3)
GO
SET IDENTITY_INSERT [dbo].[khach_hang] ON 

INSERT [dbo].[khach_hang] ([ma_kh], [ten_kh], [mat_khau], [email], [sodt], [dia_chi], [gioi_tinh], [id_FB], [hinh_FB]) VALUES (1, N'Nguyễn Thị Thư', N'12345678', N'thunt123@gmail.com', N'0875963214', N'Thuận An, Bình Dương', 0, NULL, NULL)
INSERT [dbo].[khach_hang] ([ma_kh], [ten_kh], [mat_khau], [email], [sodt], [dia_chi], [gioi_tinh], [id_FB], [hinh_FB]) VALUES (2, N'Lê Minh Hoàng', N'12345678', N'hoangle54@gmail.com', N'0320394978', N'Bình Lợi, TP HCM', 1, NULL, NULL)
INSERT [dbo].[khach_hang] ([ma_kh], [ten_kh], [mat_khau], [email], [sodt], [dia_chi], [gioi_tinh], [id_FB], [hinh_FB]) VALUES (3, N'Phan Huỳnh Tuấn Kiệt', N'12345678', N'kiett328@gmail.com', N'0908664177', N'Dĩ An, Bình Dương', 1, NULL, NULL)
INSERT [dbo].[khach_hang] ([ma_kh], [ten_kh], [mat_khau], [email], [sodt], [dia_chi], [gioi_tinh], [id_FB], [hinh_FB]) VALUES (4, N'Nguyễn Xuân Cường', N'12345678', N'xuancuong2442003@gmail.com', N'0369475443', N'Bình Thạnh, TP HCM', 1, NULL, NULL)
INSERT [dbo].[khach_hang] ([ma_kh], [ten_kh], [mat_khau], [email], [sodt], [dia_chi], [gioi_tinh], [id_FB], [hinh_FB]) VALUES (5, N'Nguyễn Văn Khánh', N'12345678', N'kytan011103@gmail.com', N'0342881452', N'Bình Thạnh, TP HCM', 1, NULL, NULL)
INSERT [dbo].[khach_hang] ([ma_kh], [ten_kh], [mat_khau], [email], [sodt], [dia_chi], [gioi_tinh], [id_FB], [hinh_FB]) VALUES (6, NULL, N'112233', N'haonguyennhat@gmail.com', NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[khach_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[lich_lam_viec] ON 

INSERT [dbo].[lich_lam_viec] ([ID_LLV], [NgayLam], [ThoiGianBatDau], [ThoiGianKetThuc], [LuongCoBan], [MaNV], [MaCN]) VALUES (1, CAST(N'2023-10-02' AS Date), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), 25000, N'NV01', N'CN1')
INSERT [dbo].[lich_lam_viec] ([ID_LLV], [NgayLam], [ThoiGianBatDau], [ThoiGianKetThuc], [LuongCoBan], [MaNV], [MaCN]) VALUES (2, CAST(N'2023-10-02' AS Date), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), 25000, N'NV02', N'CN1')
INSERT [dbo].[lich_lam_viec] ([ID_LLV], [NgayLam], [ThoiGianBatDau], [ThoiGianKetThuc], [LuongCoBan], [MaNV], [MaCN]) VALUES (3, CAST(N'2023-10-02' AS Date), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), 25000, N'NV03', N'CN1')
INSERT [dbo].[lich_lam_viec] ([ID_LLV], [NgayLam], [ThoiGianBatDau], [ThoiGianKetThuc], [LuongCoBan], [MaNV], [MaCN]) VALUES (4, CAST(N'2023-10-02' AS Date), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), 25000, N'NV04', N'CN1')
INSERT [dbo].[lich_lam_viec] ([ID_LLV], [NgayLam], [ThoiGianBatDau], [ThoiGianKetThuc], [LuongCoBan], [MaNV], [MaCN]) VALUES (5, CAST(N'2023-10-02' AS Date), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), 25000, N'NV05', N'CN1')
INSERT [dbo].[lich_lam_viec] ([ID_LLV], [NgayLam], [ThoiGianBatDau], [ThoiGianKetThuc], [LuongCoBan], [MaNV], [MaCN]) VALUES (6, CAST(N'2023-10-02' AS Date), CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), 25000, N'NV06', N'CN1')
INSERT [dbo].[lich_lam_viec] ([ID_LLV], [NgayLam], [ThoiGianBatDau], [ThoiGianKetThuc], [LuongCoBan], [MaNV], [MaCN]) VALUES (7, CAST(N'2023-10-02' AS Date), CAST(N'18:00:00' AS Time), CAST(N'23:59:59' AS Time), 25000, N'NV07', N'CN1')
INSERT [dbo].[lich_lam_viec] ([ID_LLV], [NgayLam], [ThoiGianBatDau], [ThoiGianKetThuc], [LuongCoBan], [MaNV], [MaCN]) VALUES (8, CAST(N'2023-10-02' AS Date), CAST(N'18:00:00' AS Time), CAST(N'23:59:59' AS Time), 25000, N'NV08', N'CN1')
SET IDENTITY_INSERT [dbo].[lich_lam_viec] OFF
GO
INSERT [dbo].[loai_ghe] ([ma_loai], [ten_loai], [phu_thu]) VALUES (1, N'Thường', 45000)
INSERT [dbo].[loai_ghe] ([ma_loai], [ten_loai], [phu_thu]) VALUES (2, N'Đôi', 60000)
INSERT [dbo].[loai_ghe] ([ma_loai], [ten_loai], [phu_thu]) VALUES (3, N'Vip', 75000)
GO
SET IDENTITY_INSERT [dbo].[ngay_chieu] ON 

INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (1, CAST(N'2023-10-12' AS Date), CAST(N'13:00:00' AS Time), N'MP04')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (2, CAST(N'2023-10-12' AS Date), CAST(N'14:00:00' AS Time), N'MP01')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (3, CAST(N'2023-10-12' AS Date), CAST(N'15:00:00' AS Time), N'MP01')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (4, CAST(N'2023-10-12' AS Date), CAST(N'16:00:00' AS Time), N'MP01')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (5, CAST(N'2023-10-12' AS Date), CAST(N'17:00:00' AS Time), N'MP02')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (6, CAST(N'2023-10-12' AS Date), CAST(N'18:00:00' AS Time), N'MP02')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (7, CAST(N'2023-10-12' AS Date), CAST(N'19:00:00' AS Time), N'MP03')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (8, CAST(N'2023-10-12' AS Date), CAST(N'20:00:00' AS Time), N'MP03')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (9, CAST(N'2023-10-12' AS Date), CAST(N'21:00:00' AS Time), N'MP03')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (10, CAST(N'2023-10-12' AS Date), CAST(N'22:00:00' AS Time), N'MP04')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (11, CAST(N'2023-10-12' AS Date), CAST(N'23:00:00' AS Time), N'MP04')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (12, CAST(N'2023-10-13' AS Date), CAST(N'13:30:00' AS Time), N'MP01')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (13, CAST(N'2023-10-13' AS Date), CAST(N'14:30:00' AS Time), N'MP04')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (14, CAST(N'2023-10-13' AS Date), CAST(N'15:30:00' AS Time), N'MP05')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (15, CAST(N'2023-10-13' AS Date), CAST(N'16:00:00' AS Time), N'MP05')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (16, CAST(N'2023-10-13' AS Date), CAST(N'17:45:00' AS Time), N'MP05')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (17, CAST(N'2023-10-13' AS Date), CAST(N'18:00:00' AS Time), N'MP05')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (18, CAST(N'2023-10-13' AS Date), CAST(N'19:30:00' AS Time), N'MP06')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (19, CAST(N'2023-10-13' AS Date), CAST(N'20:15:00' AS Time), N'MP06')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (20, CAST(N'2023-10-13' AS Date), CAST(N'21:00:00' AS Time), N'MP06')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (21, CAST(N'2023-10-13' AS Date), CAST(N'22:00:00' AS Time), N'MP07')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (22, CAST(N'2023-10-13' AS Date), CAST(N'23:00:00' AS Time), N'MP07')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (23, CAST(N'2023-10-14' AS Date), CAST(N'13:00:00' AS Time), N'MP07')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (24, CAST(N'2023-10-14' AS Date), CAST(N'14:00:00' AS Time), N'MP07')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (25, CAST(N'2023-10-14' AS Date), CAST(N'15:00:00' AS Time), N'MP08')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (26, CAST(N'2023-10-14' AS Date), CAST(N'16:00:00' AS Time), N'MP08')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (27, CAST(N'2023-10-14' AS Date), CAST(N'17:00:00' AS Time), N'MP08')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (28, CAST(N'2023-10-14' AS Date), CAST(N'18:00:00' AS Time), N'MP09')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (29, CAST(N'2023-10-14' AS Date), CAST(N'19:00:00' AS Time), N'MP09')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (30, CAST(N'2023-10-14' AS Date), CAST(N'20:00:00' AS Time), N'MP09')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (31, CAST(N'2023-10-14' AS Date), CAST(N'21:00:00' AS Time), N'MP10')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (32, CAST(N'2023-10-14' AS Date), CAST(N'22:00:00' AS Time), N'MP10')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (33, CAST(N'2023-10-14' AS Date), CAST(N'23:00:00' AS Time), N'MP10')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (34, CAST(N'2022-10-15' AS Date), CAST(N'13:00:00' AS Time), N'MP11')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (35, CAST(N'2022-10-15' AS Date), CAST(N'14:00:00' AS Time), N'MP11')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (36, CAST(N'2022-10-15' AS Date), CAST(N'15:00:00' AS Time), N'MP11')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (37, CAST(N'2022-10-15' AS Date), CAST(N'16:00:00' AS Time), N'MP12')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (38, CAST(N'2022-10-15' AS Date), CAST(N'17:00:00' AS Time), N'MP12')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (39, CAST(N'2022-10-15' AS Date), CAST(N'18:00:00' AS Time), N'MP12')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (40, CAST(N'2022-10-15' AS Date), CAST(N'19:00:00' AS Time), N'MP13')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (41, CAST(N'2022-10-15' AS Date), CAST(N'20:00:00' AS Time), N'MP13')
INSERT [dbo].[ngay_chieu] ([stt], [ngay], [gio_bat_dau], [ma_phim]) VALUES (42, CAST(N'2022-10-15' AS Date), CAST(N'21:00:00' AS Time), N'MP13')
SET IDENTITY_INSERT [dbo].[ngay_chieu] OFF
GO
INSERT [dbo].[nhan_vien] ([ma_nv], [ho_ten], [gioi_tinh], [mat_khau], [ngay_sinh], [so_dt], [ma_cv], [email]) VALUES (N'NV01', N'Nguyễn Xuân Cường', 1, N'123', CAST(N'2003-01-01' AS Date), N'0123456778', N'CV1', N'xuancuong11@gmail.com')
INSERT [dbo].[nhan_vien] ([ma_nv], [ho_ten], [gioi_tinh], [mat_khau], [ngay_sinh], [so_dt], [ma_cv], [email]) VALUES (N'NV02', N'Phan Huỳnh Tuấn Kiệt', 1, N'123', CAST(N'2002-01-01' AS Date), N'0169912464', N'CV1', N'kiett328@gmail.com')
INSERT [dbo].[nhan_vien] ([ma_nv], [ho_ten], [gioi_tinh], [mat_khau], [ngay_sinh], [so_dt], [ma_cv], [email]) VALUES (N'NV03', N'Nguyễn Văn Khánh', 1, N'123', CAST(N'2003-01-01' AS Date), N'0245613789', N'CV2', NULL)
INSERT [dbo].[nhan_vien] ([ma_nv], [ho_ten], [gioi_tinh], [mat_khau], [ngay_sinh], [so_dt], [ma_cv], [email]) VALUES (N'NV04', N'Hồ Thanh Kiệt', 1, N'123', CAST(N'2003-01-01' AS Date), N'0907845612', N'CV3', NULL)
INSERT [dbo].[nhan_vien] ([ma_nv], [ho_ten], [gioi_tinh], [mat_khau], [ngay_sinh], [so_dt], [ma_cv], [email]) VALUES (N'NV05', N'Nguyễn Trung Hiếu', 1, N'123', CAST(N'2003-01-01' AS Date), N'0378945612', N'CV4', NULL)
INSERT [dbo].[nhan_vien] ([ma_nv], [ho_ten], [gioi_tinh], [mat_khau], [ngay_sinh], [so_dt], [ma_cv], [email]) VALUES (N'NV06', N'Nguyễn Thị Minh Anh', 0, N'123', CAST(N'2003-01-01' AS Date), N'0987654321', N'CV5', NULL)
INSERT [dbo].[nhan_vien] ([ma_nv], [ho_ten], [gioi_tinh], [mat_khau], [ngay_sinh], [so_dt], [ma_cv], [email]) VALUES (N'NV07', N'Bùi Thị Thu Hương', 0, N'123', CAST(N'2003-01-01' AS Date), N'0145623789', N'CV6', NULL)
INSERT [dbo].[nhan_vien] ([ma_nv], [ho_ten], [gioi_tinh], [mat_khau], [ngay_sinh], [so_dt], [ma_cv], [email]) VALUES (N'NV08', N'Lê Thị Thảo', 0, N'123', CAST(N'2003-01-01' AS Date), N'0234567891', N'CV7', NULL)
GO
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP01', N'Biệt Đội Đánh Thuê 4', N'Jason Statham, Sylvester Stallone, Megan Fox', 2023, N'MP01.jpg', N'Scott Waughh', N'Mỹ', N'103 phút', N'Biệt Đội Đánh Thuê, bao gồm các chiến binh kỳ cựu và tân binh, đang đối mặt với nhiệm vụ nguy hiểm: ngăn chặn Suharato Rahmat, một tên buôn vũ khí nguy hiểm, khỏi giao kíp nổ hạt nhân cho Ocelot, một kẻ độc ác đe dọa thế giới. Hành trình từ một nhà máy vũ khí cũ ở Qadhafi đến con thuyền Jantara sẽ hé lộ những bí mật và sự thật đáng kinh ngạc về Ocelot.', N'https://www.youtube.com/embed/TQpve2zTDSQ', N'DC', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP02', N'Ác Quỷ Ma Sơ 2', N'Taissa Farmiga, Bonnie Aarons, Storm Reid, Jonas Bloquet, Anna Popplewell', 2023, N'MP02.jpg', N'Michael Chaves', N'Mỹ', N'110 phút', N'Valak trở lại với "Ác Quỷ Ma Sơ 2". Đây sẽ là phần hậu truyện của Ác Quỷ Ma Sơ và đồng thời là phần phim thứ chín thuộc Vũ trụ The Conjuring. Lấy bối cảnh nước Pháp năm 1956, cùng cái chết bí ẩn của một linh mục, một giai thoại đáng sợ và ám ảnh sẽ mở ra. Phần phim tiếp tục xoay quanh nhân vật chính - Sơ Irene - do Taissa Farmiga thủ vai.', N'https://www.youtube.com/embed/otM2V_g8Kqo', N'DC', CAST(N'2023-09-08' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP03', N'Người Dơi Bắt Đầu', N'Christian Bale, Michael Caine, Liam Neeson, Katie Holmes, Cillian Murphy, Ken Wanatabe, Gary Oldman', 2023, N'MP03.png', N'Christopher Nolan', N'Mỹ', N'140 phút', N'Người Dơi Bắt Đầu là phần đầu tiên trong trilogy thành công bậc nhất hai thập niên đầu thế kỷ 21, xoay quanh câu chuyện về nhân vật siêu anh hùng lẫy lừng vũ trụ DC - Bruce Wayne/ Batman. Phần phim đầu sẽ cùng khán giả lật mở những bí mật trong quá khứ của nhân vật đình đám này: Từ nỗi sợ của Bruce Wayne với loài dơi đến cái chết của cha mẹ anh, hành trình trở thành Batman chống lại những ác nhân hoành hành tại thành phố tội ác Gotham.', N'https://www.youtube.com/embed/DB18OGB-ABM', N'DC', CAST(N'2023-09-27' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP04', N'PAW Patrol: Phim Siêu Đẳng', N'Kim Roberts, Chris Rock, Saint West, Nylan Parthipan, Christian Corrao', 2023, N'MP04.png', N'Cal Brunker', N'Mỹ', N'93 phút', N'Một mảnh thiên thạch kỳ diệu đã rơi xuống Thành Phố Phiêu Lưu, mang đến siêu năng lực cho những chú cún PAW Patrol và biến chúng thành Những Chú Cún Quyền Năng.', N'https://www.youtube.com/embed/6rVUn7TKHS4', N'DC', CAST(N'2023-09-29' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP05', N'Giao Lộ 8675', N'Isaac, Rocker Nguyễn, La Thành, Emma Lê, Lợi Trần, Ngọc Hồ', 2023, N'MP05.png', N'Tân DS', N'Việt Nam', N'107 phút', N'Bộ phim xoay quanh câu chuyện về các bạn trẻ dù xuất hiện tại những bối cảnh khác nhau và đối mặt vấn đề riêng, tất cả cùng có chung một điểm là những người trẻ đang đứng trước những ''''ngọn núi" phải chinh phục của chính mình.', N'https://www.youtube.com/embed/RqFV-tHeNeg', N'SC', CAST(N'2023-10-06' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP06', N'Nhân Duyên Tiền Đình', N'Woo Hyeon, Ko A-sung, Yim Si-wan, Yeom Hye-ran, Jung Woo-Sung', 2023, N'MP06.jpg', N'Lee Han', N'Hàn Quốc', N'118 phút', N'Chuyện phim xoay quanh nhân vật Chi-ho (Yoo Hae-jin) - nhà nghiên cứu bánh snack với khả năng nếm vị xuất chúng, nhưng lại ngờ nghệch với mọi thứ xung quanh. Chi-ho là một người hướng nội điển hình, thích ở một mình và sống như một cái máy được lập trình sẵn mà không hề mắc lỗi dù chỉ một giây. Trong lúc phải đi trả nợ thay cho người anh trai nghiện cờ bạc (Cha In-pyo), Chi-ho tình cờ gặp gỡ “nhân viên đòi nợ” Il-young - người phụ nữ hướng ngoại, luôn suy nghĩ tích cực về cuộc sống dù đang ở trong hoàn cảnh khó khăn của một bà mẹ đơn thân.', N'https://www.youtube.com/embed/jsGOuqU6SBQ', N'SC', CAST(N'2023-09-15' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP07', N'Đất Rừng Phương Nam', N'Hồng Ánh, Huỳnh Hạo Khang, Mai Tài Phến, Công Ninh, Hứa Vĩ Văn, Tuyền Mập, Tuấn Trần', 2023, N'MP07.jpg', N'Nguyễn Quang Dũng', N'Việt Nam', N'100 phút', N'Đất Rừng Phương Nam phiên bản điện ảnh được kế thừa và phát triển từ tiểu thuyết cùng tên của nhà văn Đoàn Giỏi và tác phẩm truyền hình nổi tiếng “Đất Phương Nam” của đạo diễn Nguyễn Vinh Sơn. Bộ phim kể về hành trình phiêu lưu của An - một cậu bé chẳng may mất mẹ trên đường đi tìm cha. Cùng với An, khán giả sẽ trải nghiệm sự trù phú của thiên nhiên và nét đẹp văn hoá đặc sắc của vùng đất Nam Kì Lục Tỉnh, sự hào hiệp của những người nông dân bám đất bám rừng và tinh thần yêu nước kháng Pháp đầu thế kỉ 20. Bên cạnh đó, tình cảm gia đình, tình bạn, tình người, tình thầy trò, tình yêu nước là những cung bậc cảm xúc sâu sắc sẽ đọng lại qua mỗi bước chân của An và đồng bạn.', N'https://www.youtube.com/embed/yrMDJduy4wI', N'DC', CAST(N'2023-10-20' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP08', N'Kẻ Kiến Tạo', N'John David Washington, Gemma Chan, Ken Watanabe, Sturgill Simpson, Madeleine Yuna Voyles', 2023, N'MP08.jpg', N'Gareth Edwards', N'Mỹ', N'133 phút', N'Trong tương lai, thế giới xảy ra một cuộc chiến tranh kéo dài giữa loài người và trí tuệ nhân tạo (AI). Joshua (John David Washington) - 1 cựu đặc vụ lì lợm, được thuê để giết “The Creator” - kẻ được xem là đầu não của AI và đã tạo ra 1 loại vũ khí bí ẩn đủ mạnh để kết thúc cuộc chiến và quét sạch nhân loại.', N'https://www.youtube.com/embed/Aognln5uNwA', N'SC', CAST(N'2023-09-29' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP09', N'Thảm Họa Mưa Axit', N'Guillaume Canet, Laetitia Dosch, Patience Munchenbach', 2023, N'MP09.jpg', N'Just Philippot', N'Mỹ', N'101 phút', N'Giữa một đợt nắng nóng bất thường, thì mây mưa giống như làn gió xua tan oi bức. Nhưng những đám mây kỳ lạ trên bầu trời nước Pháp lại đem tới cho con người sự huỷ diệt và chết chóc. Hàng loạt trận mưa axit đổ xuống, đốt cháy mạng sống của vạn vật dưới mặt đất. Trước sự huỷ diệt tàn bạo của thiên nhiên, một cô gái 15 tuổi phải cùng với cha mẹ mình tìm cách chạy trốn khỏi những cơn mưa axit.', N'https://www.youtube.com/embed/7pFH2HffdKA', N'SC', CAST(N'2023-09-29' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP10', N'Án Mạng Ở Venice', N'Kenneth Branagh, Michelle Yeoh, Jamie Dornan, Tina Fey, Jude Hill', 2023, N'MP10.jpg', N'Kenneth Branagh', N'Mỹ', N'103 phút', N'Dựa trên tiểu thuyết Hallowe''en Party của nhà văn Agatha Christie, hành trình phá án của thám tử Hercule Poirot tiếp tục được đưa lên màn ảnh rộng.', N'https://www.youtube.com/embed/maw2FnYE_a0', N'SC', CAST(N'2023-09-14' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP11', N'Ánh Dương Sau Hoàng Hôn', N'Zee Pruk Panich, NuNew Chawarin Perdpiriyawong', 2023, N'MP11.jpg', N'Aod Bhandit Thongdee', N'Thái Lan', N'105 phút', N'Aod Bhandit Thongdee'',N''Thái Lan'',''105 phút'',''Nhân duyên trời định giữa 2 con người xa lạ được khởi nguồn từ lời nguyền gia tộc buộc Quý nam Phra Ploeng (Zee Pruk Panich) phải ghép tử vi kịp thời với tri kỷ của mình là Saeng Rawee (NuNew Chawarin Perdpiriyawong) nếu không muốn kiếp nạn đại hung sẽ ứng nghiệm vào năm 25 tuổi.', N'https://www.youtube.com/embed/pY_DSSkgAK0', N'SC', CAST(N'2023-07-20' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP12', N'Kumanthong: Quỷ Linh Nhi', N'Thanachat Tullayachat, Savika Chaiyadej, Denkhun Ngamnet, Panisara Rikulsurakan', 2023, N'MP12.png', N'Thitipan Raksasat', N'Thái Lan', N'87 phút', N'Ging đưa con trai đi nghỉ mát ở căn nhà gỗ nằm giữa rừng cây. Tuy nhiên, cậu bé đã bị bắt cóc vào lúc nửa đêm. Sau bao nỗ lực tìm kiếm, manh mối duy nhất của vụ án đều hướng về người đàn ông tên In, làm nghề mai táng ở đền thờ. Quá tuyệt vọng, Ging đành nhờ cậy thầy đồng địa phương thực hiện nghi lễ hiến tế giữa rừng để tìm tung tích con trai. Những bí ẩn trong ngôi nhà ven rừng dần lộ ra, những cơn ác mộng máu me và hàng loạt cái chết đột ngột ập tới, liệu Ging có đang vướng vào một âm mưu tà ám. Và rằng con trai cô có thật sự đang mất tích?', N'https://www.youtube.com/embed/XC3ftnZ1WYk', N'DC', CAST(N'2023-10-06' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP13', N'Live - Phát Trực Tiếp', N'Quốc Khánh, Ngọc Phước, Ngân 98', 2023, N'MP13.png', N'Khương Ngọc', N'Việt Nam', N'91 phút', N'“Live - #PhátTrựcTiếp” lựa chọn hai câu chuyện: MUKBANG và REVIEW để lột tả một cách rõ nét được hiện thực của cuộc sống, sự trần trụi của xã hội hiện đại, công nghệ 4.0 đã khiến con người làm đủ mọi cách để nổi tiếng, kể cả hành hạ bản thân mình nhằm nhận được sự tung hô, hào nhoáng bằng những lời khen tặng với dòng text vô thưởng, vô phạt, kiếm tiền bằng “tặng hoa”.', N'https://www.youtube.com/embed/3r_MJiI9Hr8', N'DC', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP14', N'Mộng Du', N'Lee Sun Kyun, Jung Yu Mi, Kim Gook Hee', 2023, N'MP14.png', N'Jason Yu', N'Hàn Quốc', N'94 phút', N'Được Bong Joon Ho nhận xét là “phim kinh dị độc đáo nhất của thập kỷ", ngôi vương phòng vé Hàn Quốc - MỘNG DU xoay quanh chuỗi sự kiện ma quái quấy rối giấc ngủ của một cặp vợ chồng trẻ. “Nó" sẽ thức tỉnh lúc nửa đêm.', N'https://www.youtube.com/embed/WvffHiNHS8Q', N'SC', CAST(N'2023-10-06' AS Date))
INSERT [dbo].[phim] ([ma_phim], [ten_phim], [dien_vien], [namsx], [hinh], [dao_dien], [quoc_gia], [thoi_luong], [mo_ta], [trailer], [trang_thai], [ngay_khoi_chieu]) VALUES (N'MP15', N'Leo Da Vinci: Truy Tìm Kho Báu', N'Johnny Yong Bosch, Cherami Leigh, Bryce Papenbrook', 2023, N'MP15.jpg', N'Sergio Manfio', N'Ý-Ba Lan', N'85 phút', N'Cuộc sống trôi qua một cách yên bình ở Vinci: Leonardo đang vật lộn với những phát minh đáng kinh ngạc của mình, Lorenzo giúp đỡ anh ấy và Gioconda quan sát chúng một cách chế giễu. Trở về sau chuyến đi đến hồ, những người bạn của chúng tôi gặp phải một bất ngờ không mong muốn: ngôi nhà và cánh đồng của Gioconda đã bốc cháy một cách bí ẩn. Gioconda phải được giúp đỡ! Giải pháp dường như đã sẵn sàng khi có sự xuất hiện của một người kể chuyện kỳ ​​lạ nói về một kho báu ẩn giấu. Và thế là bắt đầu một cuộc phiêu lưu tuyệt vời!', N'https://www.youtube.com/embed/7MpYLU3f0OU', N'DB', CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC01', N'Phòng 1', N'CN1')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC02', N'Phòng 2', N'CN1')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC03', N'Phòng 3', N'CN1')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC04', N'Phòng 4', N'CN1')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC05', N'Phòng 5', N'CN1')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC06', N'Phòng 6', N'CN1')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC07', N'Phòng 7', N'CN1')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC08', N'Phòng 8', N'CN1')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC09', N'Phòng 9', N'CN1')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC10', N'Phòng 10', N'CN1')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC11', N'Phòng 1', N'CN2')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC12', N'Phòng 2', N'CN2')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC13', N'Phòng 3', N'CN2')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC14', N'Phòng 4', N'CN2')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC15', N'Phòng 5', N'CN2')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC16', N'Phòng 6', N'CN2')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC17', N'Phòng 7', N'CN2')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC18', N'Phòng 8', N'CN2')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC19', N'Phòng 9', N'CN2')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC20', N'Phòng 10', N'CN2')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC21', N'Phòng 1', N'CN3')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC22', N'Phòng 2', N'CN3')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC23', N'Phòng 3', N'CN3')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC24', N'Phòng 4', N'CN3')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC25', N'Phòng 5', N'CN3')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC26', N'Phòng 6', N'CN3')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC27', N'Phòng 7', N'CN3')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC28', N'Phòng 8', N'CN3')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC29', N'Phòng 9', N'CN3')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC30', N'Phòng 10', N'CN3')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC31', N'Phòng 1', N'CN4')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC32', N'Phòng 2', N'CN4')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC33', N'Phòng 3', N'CN4')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC34', N'Phòng 4', N'CN4')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC35', N'Phòng 5', N'CN4')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC36', N'Phòng 6', N'CN4')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC37', N'Phòng 7', N'CN4')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC38', N'Phòng 8', N'CN4')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC39', N'Phòng 9', N'CN4')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC40', N'Phòng 10', N'CN4')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC41', N'Phòng 1', N'CN5')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC42', N'Phòng 2', N'CN5')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC43', N'Phòng 3', N'CN5')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC44', N'Phòng 4', N'CN5')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC45', N'Phòng 5', N'CN5')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC46', N'Phòng 6', N'CN5')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC47', N'Phòng 7', N'CN5')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC48', N'Phòng 8', N'CN5')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC49', N'Phòng 9', N'CN5')
INSERT [dbo].[phong_chieu] ([MaPhong], [TenPhong], [MaCN]) VALUES (N'PC50', N'Phòng 10', N'CN5')
GO
SET IDENTITY_INSERT [dbo].[tai_khoan] ON 

INSERT [dbo].[tai_khoan] ([id], [username], [password], [roles], [ma_KH], [ma_nv]) VALUES (1, N'kietpht', N'1234', N'CV7', 3, NULL)
INSERT [dbo].[tai_khoan] ([id], [username], [password], [roles], [ma_KH], [ma_nv]) VALUES (2, N'xuancuong', N'112233', N'CV1', NULL, N'NV01')
SET IDENTITY_INSERT [dbo].[tai_khoan] OFF
GO
INSERT [dbo].[the_loai] ([ma_the_loai], [ten_the_loai]) VALUES (N'LP01', N'Hành động')
INSERT [dbo].[the_loai] ([ma_the_loai], [ten_the_loai]) VALUES (N'LP02', N'Hài')
INSERT [dbo].[the_loai] ([ma_the_loai], [ten_the_loai]) VALUES (N'LP03', N'Hoạt hình')
INSERT [dbo].[the_loai] ([ma_the_loai], [ten_the_loai]) VALUES (N'LP04', N'Tình cảm')
INSERT [dbo].[the_loai] ([ma_the_loai], [ten_the_loai]) VALUES (N'LP05', N'Kinh dị')
INSERT [dbo].[the_loai] ([ma_the_loai], [ten_the_loai]) VALUES (N'LP06', N'Phiêu Lưu')
INSERT [dbo].[the_loai] ([ma_the_loai], [ten_the_loai]) VALUES (N'LP07', N'Tâm Lý')
INSERT [dbo].[the_loai] ([ma_the_loai], [ten_the_loai]) VALUES (N'LP08', N'Hồi Hộp')
INSERT [dbo].[the_loai] ([ma_the_loai], [ten_the_loai]) VALUES (N'LP09', N'Tội Phạm')
GO
INSERT [dbo].[topping] ([ma_topping], [ten_topping], [so_luong_dang_co], [gia], [hinh]) VALUES (N'TP01', N'Bắp rang bơ', 20, 60000, N'tp01.jpg')
INSERT [dbo].[topping] ([ma_topping], [ten_topping], [so_luong_dang_co], [gia], [hinh]) VALUES (N'TP02', N'Coca Cola', 50, 39000, N'tp02.jpg')
INSERT [dbo].[topping] ([ma_topping], [ten_topping], [so_luong_dang_co], [gia], [hinh]) VALUES (N'TP03', N'Sting', 70, 39000, N'tp03.jpg')
INSERT [dbo].[topping] ([ma_topping], [ten_topping], [so_luong_dang_co], [gia], [hinh]) VALUES (N'TP04', N'Snack', 33, 40000, N'tp04.jpg')
GO
SET IDENTITY_INSERT [dbo].[xuat_chieu] ON 

INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (1, 55000, 1, N'PC01', N'MP01')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (2, 80000, 2, N'PC02', N'MP02')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (3, 65000, 3, N'PC03', N'MP03')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (4, 70000, 4, N'PC04', N'MP04')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (5, 65000, 5, N'PC05', N'MP05')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (6, 65000, 6, N'PC06', N'MP06')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (7, 65000, 7, N'PC07', N'MP07')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (8, 65000, 8, N'PC08', N'MP08')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (9, 65000, 9, N'PC09', N'MP09')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (10, 65000, 10, N'PC10', N'MP10')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (11, 70000, 11, N'PC11', N'MP11')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (12, 70000, 12, N'PC05', N'MP01')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (13, 70000, 13, N'PC06', N'MP02')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (14, 70000, 14, N'PC07', N'MP03')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (15, 70000, 15, N'PC08', N'MP04')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (16, 70000, 16, N'PC09', N'MP05')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (17, 70000, 17, N'PC10', N'MP06')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (18, 65000, 18, N'PC11', N'MP07')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (19, 65000, 19, N'PC12', N'MP08')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (20, 65000, 20, N'PC13', N'MP09')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (21, 65000, 21, N'PC14', N'MP10')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (22, 65000, 22, N'PC15', N'MP11')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (23, 80000, 23, N'PC01', N'MP01')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (24, 80000, 24, N'PC02', N'MP02')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (25, 80000, 25, N'PC03', N'MP03')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (26, 80000, 26, N'PC04', N'MP04')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (27, 80000, 27, N'PC05', N'MP05')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (28, 80000, 28, N'PC06', N'MP06')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (29, 80000, 29, N'PC07', N'MP07')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (30, 80000, 30, N'PC08', N'MP08')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (31, 80000, 31, N'PC09', N'MP09')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (32, 80000, 32, N'PC10', N'MP10')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (33, 80000, 33, N'PC11', N'MP11')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (34, 55000, 34, N'PC07', N'MP01')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (35, 55000, 35, N'PC08', N'MP02')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (36, 55000, 36, N'PC09', N'MP03')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (37, 55000, 37, N'PC10', N'MP04')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (38, 55000, 38, N'PC11', N'MP05')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (39, 55000, 39, N'PC12', N'MP06')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (40, 55000, 40, N'PC13', N'MP07')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (41, 55000, 41, N'PC14', N'MP08')
INSERT [dbo].[xuat_chieu] ([stt], [gia_xuat_chieu], [ma_ngay_chieu], [ma_phong], [ma_phim]) VALUES (42, 55000, 42, N'PC15', N'MP09')
SET IDENTITY_INSERT [dbo].[xuat_chieu] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__A9D1053472F57581]    Script Date: 12/2/2023 1:40:17 PM ******/
ALTER TABLE [dbo].[khach_hang] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chi_tiet_ghe]  WITH CHECK ADD  CONSTRAINT [fk_ctghe_ghe] FOREIGN KEY([ma_ghe])
REFERENCES [dbo].[ghe] ([ma_ghe])
GO
ALTER TABLE [dbo].[chi_tiet_ghe] CHECK CONSTRAINT [fk_ctghe_ghe]
GO
ALTER TABLE [dbo].[chi_tiet_ghe]  WITH CHECK ADD  CONSTRAINT [fk_ctghe_phong] FOREIGN KEY([ma_phong])
REFERENCES [dbo].[phong_chieu] ([MaPhong])
GO
ALTER TABLE [dbo].[chi_tiet_ghe] CHECK CONSTRAINT [fk_ctghe_phong]
GO
ALTER TABLE [dbo].[chi_tiet_phim]  WITH CHECK ADD  CONSTRAINT [fk_ctphim_phim] FOREIGN KEY([ma_phim])
REFERENCES [dbo].[phim] ([ma_phim])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chi_tiet_phim] CHECK CONSTRAINT [fk_ctphim_phim]
GO
ALTER TABLE [dbo].[chi_tiet_phim]  WITH CHECK ADD  CONSTRAINT [fk_ctphim_theloai] FOREIGN KEY([ma_the_loai])
REFERENCES [dbo].[the_loai] ([ma_the_loai])
GO
ALTER TABLE [dbo].[chi_tiet_phim] CHECK CONSTRAINT [fk_ctphim_theloai]
GO
ALTER TABLE [dbo].[chi_tiet_topping]  WITH CHECK ADD  CONSTRAINT [fk_ctTopping_Topping] FOREIGN KEY([MaTopping])
REFERENCES [dbo].[topping] ([ma_topping])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chi_tiet_topping] CHECK CONSTRAINT [fk_ctTopping_Topping]
GO
ALTER TABLE [dbo].[chi_tiet_topping]  WITH CHECK ADD  CONSTRAINT [fk_ctTopping_Ve] FOREIGN KEY([IdVe])
REFERENCES [dbo].[ve] ([IdVe])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chi_tiet_topping] CHECK CONSTRAINT [fk_ctTopping_Ve]
GO
ALTER TABLE [dbo].[ct_csvc]  WITH CHECK ADD  CONSTRAINT [fk_ctcsvc_csvc] FOREIGN KEY([MaCSVC])
REFERENCES [dbo].[csvc] ([MaCSVC])
GO
ALTER TABLE [dbo].[ct_csvc] CHECK CONSTRAINT [fk_ctcsvc_csvc]
GO
ALTER TABLE [dbo].[ct_csvc]  WITH CHECK ADD  CONSTRAINT [fk_ctcsvc_phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[phong_chieu] ([MaPhong])
GO
ALTER TABLE [dbo].[ct_csvc] CHECK CONSTRAINT [fk_ctcsvc_phong]
GO
ALTER TABLE [dbo].[ghe]  WITH CHECK ADD  CONSTRAINT [fk_ghe_loaighe] FOREIGN KEY([ma_loai])
REFERENCES [dbo].[loai_ghe] ([ma_loai])
GO
ALTER TABLE [dbo].[ghe] CHECK CONSTRAINT [fk_ghe_loaighe]
GO
ALTER TABLE [dbo].[lich_lam_viec]  WITH CHECK ADD  CONSTRAINT [fk_llv_cn] FOREIGN KEY([MaCN])
REFERENCES [dbo].[chi_nhanh] ([ma_cn])
GO
ALTER TABLE [dbo].[lich_lam_viec] CHECK CONSTRAINT [fk_llv_cn]
GO
ALTER TABLE [dbo].[lich_lam_viec]  WITH CHECK ADD  CONSTRAINT [fk_llv_nv] FOREIGN KEY([MaNV])
REFERENCES [dbo].[nhan_vien] ([ma_nv])
GO
ALTER TABLE [dbo].[lich_lam_viec] CHECK CONSTRAINT [fk_llv_nv]
GO
ALTER TABLE [dbo].[ngay_chieu]  WITH CHECK ADD  CONSTRAINT [fk_ngaychieu_phim] FOREIGN KEY([ma_phim])
REFERENCES [dbo].[phim] ([ma_phim])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ngay_chieu] CHECK CONSTRAINT [fk_ngaychieu_phim]
GO
ALTER TABLE [dbo].[nhan_vien]  WITH CHECK ADD  CONSTRAINT [fk_nv_cv] FOREIGN KEY([ma_cv])
REFERENCES [dbo].[chuc_vu] ([ma_cv])
GO
ALTER TABLE [dbo].[nhan_vien] CHECK CONSTRAINT [fk_nv_cv]
GO
ALTER TABLE [dbo].[phong_chieu]  WITH CHECK ADD  CONSTRAINT [fk_pc_cn] FOREIGN KEY([MaCN])
REFERENCES [dbo].[chi_nhanh] ([ma_cn])
GO
ALTER TABLE [dbo].[phong_chieu] CHECK CONSTRAINT [fk_pc_cn]
GO
ALTER TABLE [dbo].[tai_khoan]  WITH CHECK ADD FOREIGN KEY([ma_KH])
REFERENCES [dbo].[khach_hang] ([ma_kh])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tai_khoan]  WITH CHECK ADD FOREIGN KEY([ma_nv])
REFERENCES [dbo].[nhan_vien] ([ma_nv])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tai_khoan]  WITH CHECK ADD FOREIGN KEY([roles])
REFERENCES [dbo].[chuc_vu] ([ma_cv])
GO
ALTER TABLE [dbo].[ve]  WITH CHECK ADD  CONSTRAINT [fk_ve_ctghe] FOREIGN KEY([Ma_CTGhe])
REFERENCES [dbo].[chi_tiet_ghe] ([ma_ctghe])
GO
ALTER TABLE [dbo].[ve] CHECK CONSTRAINT [fk_ve_ctghe]
GO
ALTER TABLE [dbo].[ve]  WITH CHECK ADD  CONSTRAINT [fk_ve_khachhang] FOREIGN KEY([Ma_KH])
REFERENCES [dbo].[khach_hang] ([ma_kh])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ve] CHECK CONSTRAINT [fk_ve_khachhang]
GO
ALTER TABLE [dbo].[xuat_chieu]  WITH CHECK ADD FOREIGN KEY([ma_ngay_chieu])
REFERENCES [dbo].[ngay_chieu] ([stt])
GO
ALTER TABLE [dbo].[xuat_chieu]  WITH CHECK ADD  CONSTRAINT [fk_xuatchieu_phim] FOREIGN KEY([ma_phim])
REFERENCES [dbo].[phim] ([ma_phim])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[xuat_chieu] CHECK CONSTRAINT [fk_xuatchieu_phim]
GO
ALTER TABLE [dbo].[xuat_chieu]  WITH CHECK ADD  CONSTRAINT [fk_xuatchieu_phong] FOREIGN KEY([ma_phong])
REFERENCES [dbo].[phong_chieu] ([MaPhong])
GO
ALTER TABLE [dbo].[xuat_chieu] CHECK CONSTRAINT [fk_xuatchieu_phong]
GO
USE [master]
GO
ALTER DATABASE [RapPhim] SET  READ_WRITE 
GO
