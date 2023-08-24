USE [master]
GO
/****** Object:  Database [BookStores]    Script Date: 24/08/2023 08:39:31 ******/
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
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 24/08/2023 08:39:32 ******/
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
/****** Object:  Table [dbo].[CuaHang]    Script Date: 24/08/2023 08:39:32 ******/
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
 CONSTRAINT [PK_CuaHang] PRIMARY KEY CLUSTERED 
(
	[maCH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 24/08/2023 08:39:32 ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 24/08/2023 08:39:32 ******/
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
/****** Object:  Table [dbo].[LoaiSach]    Script Date: 24/08/2023 08:39:32 ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 24/08/2023 08:39:32 ******/
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
/****** Object:  Table [dbo].[NXB]    Script Date: 24/08/2023 08:39:32 ******/
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
/****** Object:  Table [dbo].[Sach]    Script Date: 24/08/2023 08:39:32 ******/
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
	[gia] [int] NOT NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SachTonKho]    Script Date: 24/08/2023 08:39:32 ******/
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
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 24/08/2023 08:39:32 ******/
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
INSERT [dbo].[ChiTietHoaDon] ([maHD], [maSach], [soLuong], [thanhTien]) VALUES (N'HD001', N'S001', 1, 53000)
GO
INSERT [dbo].[CuaHang] ([maCH], [tenCuaHang], [diaChi], [soDienThoai], [email]) VALUES (N'CH001', N'Cửa hàng Cá Chép', N'211 – 213 Võ Văn Tần, phường 5, quận 3, TP. HCM.', N'0239250069', N'contact@cachep.vn.')
INSERT [dbo].[CuaHang] ([maCH], [tenCuaHang], [diaChi], [soDienThoai], [email]) VALUES (N'CH002', N'Cửa hàng Phương Nam', N'272 Lê Thánh Tôn, P. Bến Nghé, Q.1, TP. HCM', N'0888023688', N'nsvincomhcm@pnc.com.vn')
INSERT [dbo].[CuaHang] ([maCH], [tenCuaHang], [diaChi], [soDienThoai], [email]) VALUES (N'CH003', N'Cửa hàng Kim Đồng', N'số 248, đường Cống Quỳnh, quận 1, TP HCM', N'0239250170', N'info@nxbkimdong.com.vn')
INSERT [dbo].[CuaHang] ([maCH], [tenCuaHang], [diaChi], [soDienThoai], [email]) VALUES (N'CH004', N'Cửa hàng E.Book', N'86A Nguyễn Thái Sơn, P. 3, Q. Gò Vấp, TPHCM', N'0838996622', N'nhasach.ebook@gmail.com')
GO
INSERT [dbo].[HoaDon] ([maHD], [maNV], [maCH], [maKH], [ngayXuatHD]) VALUES (N'HD001', N'NV001', N'CH001', N'KH001', CAST(N'2023-08-15' AS Date))
GO
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [tuoi], [gioiTinh], [CCCD], [email], [soDienThoai], [diaChi]) VALUES (N'KH001', N'Phạm Văn Thành', 20, N'Nam', N'206381313', N'thanhpham21112003@gmail.com', N'0934004524', N'Gò Xoài')
GO
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS001', N'Khoa học')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS002', N'Thiếu nhi')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS003', N'Giáo trình')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS004', N'Tâm linh, tôn giáo')
INSERT [dbo].[LoaiSach] ([maLoaiSach], [tenLoaiSach]) VALUES (N'LS005', N'Văn học')
GO
INSERT [dbo].[NhanVien] ([maNV], [maCH], [tenNV], [diaChi], [gioiTinh], [ngaySinh], [ngayVaoLam], [CCCD], [email], [soDienThoai], [chucVu], [taiKhoan], [luong]) VALUES (N'NV001', N'CH001', N'Phạm Văn Thành', N'Gò Vấp', N'Nam', CAST(N'2003-11-21' AS Date), CAST(N'2023-08-14' AS Date), N'206381313', N'thanhpham21112003@gmail.com', N'0934004524', N'Quản trị hệ thống', N'admin', 10000000)
GO
INSERT [dbo].[NXB] ([maNXB], [tenNXB], [diaChi], [soDienThoai], [email]) VALUES (N'NXB001', N'Nhà Xuất Bản Trẻ', N'161B Lý Chính Thắng, phường Võ Thị Sáu, Quận 3, TP. Hồ Chí Minh', N'0239316289', N'hopthubandoc@nxbtre.com.vn 
')
INSERT [dbo].[NXB] ([maNXB], [tenNXB], [diaChi], [soDienThoai], [email]) VALUES (N'NXB002', N'Nhà Xuất Bản Kim Đồng', N'55 Quang Trung, Hà Nội, Việt Nam ', N'0239434730', N'info@nxbkimdong.com.vn ')
INSERT [dbo].[NXB] ([maNXB], [tenNXB], [diaChi], [soDienThoai], [email]) VALUES (N'NXB003', N'Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh', N'62 Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, TP. HCM ', N'0238256804', N'nstonhop@gmail.com ')
INSERT [dbo].[NXB] ([maNXB], [tenNXB], [diaChi], [soDienThoai], [email]) VALUES (N'NXB004', N'Nhà xuất bản Hội Nhà Văn', N'65 Nguyễn Du - Hà Nội', N'0243222135', N'nxbhoinhavan65@gmail.com')
GO
INSERT [dbo].[Sach] ([maSach], [maNXB], [maLoaiSach], [tenSach], [xuatXu], [gia]) VALUES (N'S001', N'NXB004', N'LS005', N'Hoàng Tử Bé', N'Việt Nam', 53000)
GO
INSERT [dbo].[SachTonKho] ([maCuaHang], [maSach], [soLuong]) VALUES (N'CH001', N'S001', 49)
GO
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau]) VALUES (N'admin', N'admin')
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau]) VALUES (N'thanh', N'thanh')
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
ALTER TABLE [dbo].[SachTonKho]  WITH CHECK ADD  CONSTRAINT [FK_SachTonKho_CuaHang] FOREIGN KEY([maCuaHang])
REFERENCES [dbo].[CuaHang] ([maCH])
GO
ALTER TABLE [dbo].[SachTonKho] CHECK CONSTRAINT [FK_SachTonKho_CuaHang]
GO
ALTER TABLE [dbo].[SachTonKho]  WITH CHECK ADD  CONSTRAINT [FK_SachTonKho_Sach] FOREIGN KEY([maSach])
REFERENCES [dbo].[Sach] ([maSach])
GO
ALTER TABLE [dbo].[SachTonKho] CHECK CONSTRAINT [FK_SachTonKho_Sach]
GO
USE [master]
GO
ALTER DATABASE [BookStores] SET  READ_WRITE 
GO
