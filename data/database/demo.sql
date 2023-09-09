USE [master]
GO
/****** Object:  Database [BookStores]    Script Date: 09/09/2023 15:25:04 ******/
CREATE DATABASE [BookStores]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStores', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookStores.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStores_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookStores_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookStores] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStores].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStores] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStores] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStores] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStores] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStores] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStores] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStores] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStores] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStores] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStores] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStores] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStores] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStores] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStores] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStores] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStores] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStores] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStores] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStores] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStores] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStores] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStores] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStores] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStores] SET  MULTI_USER 
GO
ALTER DATABASE [BookStores] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStores] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStores] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStores] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStores] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStores] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookStores] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookStores] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookStores]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 09/09/2023 15:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[maHD] [nvarchar](50) NOT NULL,
	[maSach] [nvarchar](50) NOT NULL,
	[soLuong] [int] NOT NULL,
	[thanhTien] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuaHang]    Script Date: 09/09/2023 15:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuaHang](
	[maCH] [nvarchar](50) NOT NULL,
	[tenCuaHang] [nvarchar](50) NOT NULL,
	[diaChi] [nvarchar](50) NOT NULL,
	[soDienThoai] [nvarchar](10) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[soLuongNhanVien] [int] NOT NULL,
	[gioHoatDong] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CuaHang] PRIMARY KEY CLUSTERED 
(
	[maCH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DungCuHocTap]    Script Date: 09/09/2023 15:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DungCuHocTap](
	[maDCHT] [nvarchar](50) NOT NULL,
	[tenDCHT] [nvarchar](50) NOT NULL,
	[gia] [int] NOT NULL,
	[nhaCungCap] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DungCuHocTap] PRIMARY KEY CLUSTERED 
(
	[maDCHT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DungCuHocTapTonKho]    Script Date: 09/09/2023 15:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DungCuHocTapTonKho](
	[maCuaHang] [nvarchar](50) NOT NULL,
	[maDCHT] [nvarchar](50) NOT NULL,
	[soLuong] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 09/09/2023 15:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHD] [nvarchar](50) NOT NULL,
	[maNV] [nvarchar](50) NOT NULL,
	[maCH] [nvarchar](50) NOT NULL,
	[maKH] [nvarchar](50) NOT NULL,
	[ngayXuatHD] [date] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 09/09/2023 15:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKH] [nvarchar](50) NOT NULL,
	[tenKH] [nvarchar](50) NOT NULL,
	[tuoi] [int] NOT NULL,
	[gioiTinh] [nvarchar](50) NOT NULL,
	[CCCD] [nvarchar](12) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[soDienThoai] [nvarchar](10) NOT NULL,
	[diaChi] [nvarchar](110) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSach]    Script Date: 09/09/2023 15:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSach](
	[maLoaiSach] [nvarchar](50) NOT NULL,
	[tenLoaiSach] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiSach] PRIMARY KEY CLUSTERED 
(
	[maLoaiSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 09/09/2023 15:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNV] [nvarchar](50) NOT NULL,
	[maCH] [nvarchar](50) NOT NULL,
	[tenNV] [nvarchar](50) NOT NULL,
	[diaChi] [nvarchar](120) NOT NULL,
	[gioiTinh] [nvarchar](10) NOT NULL,
	[ngaySinh] [date] NOT NULL,
	[ngayVaoLam] [date] NOT NULL,
	[CCCD] [nvarchar](12) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[soDienThoai] [nvarchar](10) NOT NULL,
	[chucVu] [nvarchar](50) NOT NULL,
	[taiKhoan] [nvarchar](50) NOT NULL,
	[luong] [int] NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[maNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NXB]    Script Date: 09/09/2023 15:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NXB](
	[maNXB] [nvarchar](50) NOT NULL,
	[tenNXB] [nvarchar](50) NOT NULL,
	[diaChi] [nvarchar](110) NOT NULL,
	[soDienThoai] [nvarchar](10) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NXB] PRIMARY KEY CLUSTERED 
(
	[maNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 09/09/2023 15:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[maSach] [nvarchar](50) NOT NULL,
	[maNXB] [nvarchar](50) NOT NULL,
	[maLoaiSach] [nvarchar](50) NOT NULL,
	[tenSach] [nvarchar](50) NOT NULL,
	[xuatXu] [nvarchar](50) NOT NULL,
	[tacGia] [nvarchar](50) NOT NULL,
	[soTrang] [int] NOT NULL,
	[gia] [int] NOT NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SachTonKho]    Script Date: 09/09/2023 15:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SachTonKho](
	[maCuaHang] [nvarchar](50) NOT NULL,
	[maSach] [nvarchar](50) NOT NULL,
	[soLuong] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 09/09/2023 15:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[taiKhoan] [nvarchar](50) NOT NULL,
	[matKhau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[taiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHoaDon] ([maHD], [maSach], [soLuong], [thanhTien]) VALUES (N'HD001', N'S001', 10, 10000)
GO
INSERT [dbo].[CuaHang] ([maCH], [tenCuaHang], [diaChi], [soDienThoai], [email], [soLuongNhanVien], [gioHoatDong]) VALUES (N'CH001', N'hjb', N'ehfu', N'84uj', N'únvu', 9, N'hbh')
GO
INSERT [dbo].[DungCuHocTap] ([maDCHT], [tenDCHT], [gia], [nhaCungCap]) VALUES (N'DCHT001', N'Thước kẻ', 5000, N'Thiên Long')
GO
INSERT [dbo].[DungCuHocTapTonKho] ([maCuaHang], [maDCHT], [soLuong]) VALUES (N'CH001', N'DCHT001', 10)
GO
INSERT [dbo].[HoaDon] ([maHD], [maNV], [maCH], [maKH], [ngayXuatHD]) VALUES (N'HD001', N'NV001', N'CH001', N'KH001', CAST(N'2023-01-02' AS Date))
GO
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [tuoi], [gioiTinh], [CCCD], [email], [soDienThoai], [diaChi]) VALUES (N'KH001', N'Phạm Văn Thành', 20, N'Nam', N'206381313', N'thanhpham21112003@gmail.com', N'0934004524', N'Gò Xoài')
GO
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS001', N'Khoa học')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS002', N'Thiếu nhi')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS003', N'Giáo trình')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS004', N'Tâm linh, tôn giáo')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS005', N'Văn học')
GO
INSERT [dbo].[NhanVien] ([maNV], [maCH], [tenNV], [diaChi], [gioiTinh], [ngaySinh], [ngayVaoLam], [CCCD], [email], [soDienThoai], [chucVu], [taiKhoan], [luong]) VALUES (N'NV001', N'CH001', N'Phạm Văn Thành', N'Gò Xoài', N'Nam', CAST(N'2003-11-21' AS Date), CAST(N'2023-01-01' AS Date), N'929435645612', N'thanh@gmail.com', N'0912312345', N'Quản trị hệ thống', N'NV001', 1000000)
INSERT [dbo].[NhanVien] ([maNV], [maCH], [tenNV], [diaChi], [gioiTinh], [ngaySinh], [ngayVaoLam], [CCCD], [email], [soDienThoai], [chucVu], [taiKhoan], [luong]) VALUES (N'NV002', N'CH001', N'Mai Lưu Hữu Vinh', N'Gò Vấp', N'Nam', CAST(N'2003-11-08' AS Date), CAST(N'2023-09-09' AS Date), N'5648', N'vinh@gmail.com', N'0912312345', N'Bán hàng', N'NV002', 1000000)
INSERT [dbo].[NhanVien] ([maNV], [maCH], [tenNV], [diaChi], [gioiTinh], [ngaySinh], [ngayVaoLam], [CCCD], [email], [soDienThoai], [chucVu], [taiKhoan], [luong]) VALUES (N'NV003', N'CH001', N'Mai Lưu Hữu Vinh', N'Gò Vấp', N'Nam', CAST(N'2003-11-08' AS Date), CAST(N'2023-09-09' AS Date), N'5648', N'vinh@gmail.com', N'0912312345', N'Bán hàng', N'NV003', 1000000)
GO
INSERT [dbo].[NXB] ([maNXB], [tenNXB], [diaChi], [soDienThoai], [email]) VALUES (N'NXB001', N'Nhà Xuất Bản Trẻ', N'161B Lý Chính Thắng, phường Võ Thị Sáu, Quận 3, TP. Hồ Chí Minh', N'0239316289', N'hopthubandoc@nxbtre.com.vn 
')
INSERT [dbo].[NXB] ([maNXB], [tenNXB], [diaChi], [soDienThoai], [email]) VALUES (N'NXB002', N'Nhà Xuất Bản Kim Đồng', N'55 Quang Trung, Hà Nội, Việt Nam ', N'0239434730', N'info@nxbkimdong.com.vn ')
INSERT [dbo].[NXB] ([maNXB], [tenNXB], [diaChi], [soDienThoai], [email]) VALUES (N'NXB003', N'Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh', N'62 Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, TP. HCM ', N'0238256804', N'nstonhop@gmail.com ')
INSERT [dbo].[NXB] ([maNXB], [tenNXB], [diaChi], [soDienThoai], [email]) VALUES (N'NXB004', N'Nhà xuất bản Hội Nhà Văn', N'65 Nguyễn Du - Hà Nội', N'0243222135', N'nxbhoinhavan65@gmail.com')
GO
INSERT [dbo].[Sach] ([maSach], [maNXB], [maLoaiSach], [tenSach], [xuatXu], [tacGia], [soTrang], [gia]) VALUES (N'S001', N'NXB001', N'LS001', N'De Men', N'Việt Nam', N'Kim Đồng', 200, 10000)
INSERT [dbo].[Sach] ([maSach], [maNXB], [maLoaiSach], [tenSach], [xuatXu], [tacGia], [soTrang], [gia]) VALUES (N'S002', N'NXB001', N'LS001', N'De Men', N'Việt Nam', N'Kim Đồng', 200, 10000)
INSERT [dbo].[Sach] ([maSach], [maNXB], [maLoaiSach], [tenSach], [xuatXu], [tacGia], [soTrang], [gia]) VALUES (N'S003', N'NXB001', N'LS001', N'De Men', N'Việt Nam', N'Kim Đồng', 200, 10000)
INSERT [dbo].[Sach] ([maSach], [maNXB], [maLoaiSach], [tenSach], [xuatXu], [tacGia], [soTrang], [gia]) VALUES (N'S004', N'NXB001', N'LS001', N'De Men', N'Việt Nam', N'Kim Đồng', 200, 10000)
INSERT [dbo].[Sach] ([maSach], [maNXB], [maLoaiSach], [tenSach], [xuatXu], [tacGia], [soTrang], [gia]) VALUES (N'S005', N'NXB001', N'LS001', N'De Men', N'Việt Nam', N'Kim Đồng', 200, 10000)
GO
INSERT [dbo].[SachTonKho] ([maCuaHang], [maSach], [soLuong]) VALUES (N'CH001', N'S001', 10)
GO
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau]) VALUES (N'NV001', N'NV001')
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau]) VALUES (N'NV002', N'NV002')
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau]) VALUES (N'NV003', N'NV003')
GO
ALTER TABLE [dbo].[DungCuHocTapTonKho]  WITH CHECK ADD  CONSTRAINT [FK_DungCuHocTapTonKho_CuaHang] FOREIGN KEY([maCuaHang])
REFERENCES [dbo].[CuaHang] ([maCH])
GO
ALTER TABLE [dbo].[DungCuHocTapTonKho] CHECK CONSTRAINT [FK_DungCuHocTapTonKho_CuaHang]
GO
ALTER TABLE [dbo].[DungCuHocTapTonKho]  WITH CHECK ADD  CONSTRAINT [FK_DungCuHocTapTonKho_DungCuHocTap] FOREIGN KEY([maDCHT])
REFERENCES [dbo].[DungCuHocTap] ([maDCHT])
GO
ALTER TABLE [dbo].[DungCuHocTapTonKho] CHECK CONSTRAINT [FK_DungCuHocTapTonKho_DungCuHocTap]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_ChiTietHoaDon] FOREIGN KEY([maHD])
REFERENCES [dbo].[ChiTietHoaDon] ([maHD])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_ChiTietHoaDon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_CuaHang] FOREIGN KEY([maCH])
REFERENCES [dbo].[CuaHang] ([maCH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_CuaHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([maKH])
REFERENCES [dbo].[KhachHang] ([maKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_CuaHang] FOREIGN KEY([maCH])
REFERENCES [dbo].[CuaHang] ([maCH])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_CuaHang]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TaiKhoan] FOREIGN KEY([taiKhoan])
REFERENCES [dbo].[TaiKhoan] ([taiKhoan])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TaiKhoan]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_LoaiSach] FOREIGN KEY([maLoaiSach])
REFERENCES [dbo].[LoaiSach] ([maLoaiSach])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_LoaiSach]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NXB] FOREIGN KEY([maNXB])
REFERENCES [dbo].[NXB] ([maNXB])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_NXB]
GO
ALTER TABLE [dbo].[SachTonKho]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamTonKho_CuaHang] FOREIGN KEY([maCuaHang])
REFERENCES [dbo].[CuaHang] ([maCH])
GO
ALTER TABLE [dbo].[SachTonKho] CHECK CONSTRAINT [FK_SanPhamTonKho_CuaHang]
GO
ALTER TABLE [dbo].[SachTonKho]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamTonKho_Sach1] FOREIGN KEY([maSach])
REFERENCES [dbo].[Sach] ([maSach])
GO
ALTER TABLE [dbo].[SachTonKho] CHECK CONSTRAINT [FK_SanPhamTonKho_Sach1]
GO
USE [master]
GO
ALTER DATABASE [BookStores] SET  READ_WRITE 
GO
