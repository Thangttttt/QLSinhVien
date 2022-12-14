USE [master]
GO
/****** Object:  Database [QLSV]    Script Date: 12/12/2021 11:20:02 AM ******/
CREATE DATABASE [QLSV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLSV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLSV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLSV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLSV] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLSV] SET  MULTI_USER 
GO
ALTER DATABASE [QLSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLSV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLSV] SET QUERY_STORE = OFF
GO
USE [QLSV]
GO
/****** Object:  Table [dbo].[DangKyThiLai]    Script Date: 12/12/2021 11:20:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKyThiLai](
	[MaSV] [nvarchar](10) NOT NULL,
	[MaKhoa] [nvarchar](10) NOT NULL,
	[MaLop] [varchar](10) NOT NULL,
	[MaMH] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[TrangThai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 12/12/2021 11:20:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[MaGV] [varchar](10) NOT NULL,
	[TenGV] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[SDT] [varchar](15) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Hinh] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KetQua]    Script Date: 12/12/2021 11:20:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQua](
	[MaSV] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](30) NULL,
	[MaLop] [varchar](10) NOT NULL,
	[MaMH] [varchar](10) NOT NULL,
	[HocKi] [int] NULL,
	[DiemThi] [float] NULL,
	[DiemTB] [float] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaLop] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 12/12/2021 11:20:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKHoa] [varchar](10) NOT NULL,
	[TenKhoa] [nvarchar](30) NOT NULL,
	[NamThanhLap] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 12/12/2021 11:20:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[MaKhoa] [varchar](10) NOT NULL,
	[MaLop] [varchar](10) NOT NULL,
	[TenLop] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 12/12/2021 11:20:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMH] [varchar](10) NOT NULL,
	[TenMH] [nvarchar](30) NULL,
	[MaGV] [varchar](10) NOT NULL,
	[HocKi] [int] NOT NULL,
	[MaKHoa] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 12/12/2021 11:20:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[MaLop] [varchar](10) NOT NULL,
	[Hinh] [nvarchar](50) NOT NULL,
	[Email] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/12/2021 11:20:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDangNhap] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](30) NOT NULL,
	[VaiTro] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DangKyThiLai] ([MaSV], [MaKhoa], [MaLop], [MaMH], [HoTen], [TrangThai]) VALUES (N'PS11111', N'CNTT', N'LS56319', N'CSDL', N'Tran Ngoc Trang Kieu', N'Chưa Thanh Toán')
INSERT [dbo].[DangKyThiLai] ([MaSV], [MaKhoa], [MaLop], [MaMH], [HoTen], [TrangThai]) VALUES (N'PS12233', N'CNTT', N'UD16315', N'CSDL', N'Tran Phuc Hau', N'Đã Thanh Toán')
INSERT [dbo].[DangKyThiLai] ([MaSV], [MaKhoa], [MaLop], [MaMH], [HoTen], [TrangThai]) VALUES (N'PS15783', N'CNTT', N'UD16315', N'JAVA', N'Tran Quoc Thang', N'Đã Thanh Toán')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [GioiTinh], [SDT], [Email], [Hinh]) VALUES (N'GV001', N'Le Anh Tu', 1, N'0375265891', N'tula@gmail.com', N'gv2.jpg')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [GioiTinh], [SDT], [Email], [Hinh]) VALUES (N'GV002', N'Le Van Phung', 1, N'0374668695', N'phunglv@gmail.com', N'gv3.jpg')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [GioiTinh], [SDT], [Email], [Hinh]) VALUES (N'GV003', N'Cao Hoang Phuc', 1, N'0373455821', N'phucch@gmail.com', N'gv4.jpg')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [GioiTinh], [SDT], [Email], [Hinh]) VALUES (N'GV004', N'Nguyen Thi Huong', 0, N'0375345823', N'huongnt@gmail.com', N'')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [GioiTinh], [SDT], [Email], [Hinh]) VALUES (N'GV005', N'Nguyen Thi Hong Nga', 0, N'0375875845', N'nganth@gmail.com', N'')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [GioiTinh], [SDT], [Email], [Hinh]) VALUES (N'GV006', N'Bui Quan Vien', 1, N'0375283901', N'vien@gmail.com', N'gv1.jpg')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [GioiTinh], [SDT], [Email], [Hinh]) VALUES (N'GV007', N'Ngo Hong Linh', 1, N'0385670286', N'linh@gmail.com', N'gv2.jpg')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [GioiTinh], [SDT], [Email], [Hinh]) VALUES (N'GV008', N'Nguyen Hoang Duy', 1, N'0357689406', N'duy@gmai.com', N'gv5.jpg')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [GioiTinh], [SDT], [Email], [Hinh]) VALUES (N'GV009', N'Nguyen Thanh Ngan', 0, N'0358694689', N'ngan@gmail.com', N'gv6.jpg')
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [GioiTinh], [SDT], [Email], [Hinh]) VALUES (N'GV010', N'Nguyen Tien Tai', 1, N'0385738596', N'tai2@gmail.com', N'gv1.jpg')
INSERT [dbo].[KetQua] ([MaSV], [HoTen], [MaLop], [MaMH], [HocKi], [DiemThi], [DiemTB], [GhiChu]) VALUES (N'PS11243', N'Hoang Manh Dung', N'UD16315', N'CSDL', 1, 1, 2.5, N'Thi Lai')
INSERT [dbo].[KetQua] ([MaSV], [HoTen], [MaLop], [MaMH], [HocKi], [DiemThi], [DiemTB], [GhiChu]) VALUES (N'PS12233', N'Tran Phuc Hau', N'UD16315', N'CSDL', 1, 8, 8.5, N'')
INSERT [dbo].[KetQua] ([MaSV], [HoTen], [MaLop], [MaMH], [HocKi], [DiemThi], [DiemTB], [GhiChu]) VALUES (N'PS12453', N'Nguyen Huu Hai Phuoc', N'UD16315', N'JAVA', 1, 9, 9.5, N'')
INSERT [dbo].[KetQua] ([MaSV], [HoTen], [MaLop], [MaMH], [HocKi], [DiemThi], [DiemTB], [GhiChu]) VALUES (N'PS15631', N'Huynh Huu Vinh', N'UD16315', N'JAVA', 1, 10, 10, N'')
INSERT [dbo].[KetQua] ([MaSV], [HoTen], [MaLop], [MaMH], [HocKi], [DiemThi], [DiemTB], [GhiChu]) VALUES (N'PS15783', N'Tran Quoc Thang', N'UD16315', N'JAVA', 1, 5.5, 6, N'')
INSERT [dbo].[Khoa] ([MaKHoa], [TenKhoa], [NamThanhLap]) VALUES (N'CNTT', N'Cong Nghe Thong Tin', 1890)
INSERT [dbo].[Khoa] ([MaKHoa], [TenKhoa], [NamThanhLap]) VALUES (N'KT', N'Kien Truc', 1895)
INSERT [dbo].[Khoa] ([MaKHoa], [TenKhoa], [NamThanhLap]) VALUES (N'KTT', N'Ke Toan', 1895)
INSERT [dbo].[Khoa] ([MaKHoa], [TenKhoa], [NamThanhLap]) VALUES (N'LS', N'Luat Su', 1890)
INSERT [dbo].[Khoa] ([MaKHoa], [TenKhoa], [NamThanhLap]) VALUES (N'QLKS', N'Quan Li Khach San', 1895)
INSERT [dbo].[Khoa] ([MaKHoa], [TenKhoa], [NamThanhLap]) VALUES (N'QTKD', N'Quan Tri Kinh Doanh', 1890)
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'KTT', N'KTT36317', N'Ke Toan Kinh Te')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'KTT', N'KTT36318', N'Ke Toan Kinh Te')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'KTT', N'KTT36319', N'Ke Toan Kinh Te')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'KTT', N'KTT36320', N'Ke Toan Kinh Te')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'LS', N'LS56319', N'Luat Kinh Te')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'LS', N'LS56320', N'Luat Kinh Te')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'LS', N'LS56321', N'Luat Kinh Te')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'LS', N'LS56322', N'Luat Kinh Te')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'KT', N'NT26316', N'Thiet Ke Noi That')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'KT', N'NT26317', N'Thiet Ke Noi That')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'KT', N'NT26318', N'Thiet Ke Noi That')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'KT', N'NT26319', N'Thiet Ke Noi That')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'QLKS', N'QL46318', N'Quan Li Nha Hang - Khac San')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'QLKS', N'QL46319', N'Quan Li Nha Hang - Khac San')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'QLKS', N'QL46320', N'Quan Li Nha Hang - Khac San')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'CNTT', N'UD16315', N'Ung Dung Phan Mem')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'CNTT', N'UD16316', N'Ung Dung Phan Mem')
INSERT [dbo].[Lop] ([MaKhoa], [MaLop], [TenLop]) VALUES (N'CNTT', N'UD16317', N'Ung Dung Phan Mem')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [MaGV], [HocKi], [MaKHoa]) VALUES (N'AV', N'Anh Van', N'GV009', 1, N'LS')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [MaGV], [HocKi], [MaKHoa]) VALUES (N'CSDL', N'Co So Du Lieu', N'GV001', 1, N'CNTT')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [MaGV], [HocKi], [MaKHoa]) VALUES (N'JAVA', N'Lap Trinh Java Co Ban', N'GV001', 1, N'CNTT')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [MaGV], [HocKi], [MaKHoa]) VALUES (N'PL', N'Phap Luat', N'GV010', 1, N'KT')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [MaGV], [HocKi], [MaKHoa]) VALUES (N'TCC', N'Toan Cao Cap', N'GV002', 1, N'KTT')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [MaGV], [HocKi], [MaKHoa]) VALUES (N'TCRR', N'Toan Roi Rac', N'GV002', 1, N'KTT')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [MaGV], [HocKi], [MaKHoa]) VALUES (N'TH', N'Triet Hoc', N'GV008', 1, N'KT')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [MaLop], [Hinh], [Email]) VALUES (N'PS11111', N'Tran Ngoc Trang Kieu', CAST(N'2002-10-20' AS Date), 0, N'An Giang', N'LS56319', N'anhthe1.jpg', N'kieu@gmail.com')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [MaLop], [Hinh], [Email]) VALUES (N'PS11221', N'Dao Nhat Anh', CAST(N'2002-10-22' AS Date), 1, N'Binh Duong', N'KTT36317', N'sv7.jpg', N'anh@gmail.com')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [MaLop], [Hinh], [Email]) VALUES (N'PS11243', N'Hoang Manh Dung', CAST(N'2002-02-02' AS Date), 1, N'Hai Phong', N'UD16315', N'at1.PNG', N'dung@gmail.com')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [MaLop], [Hinh], [Email]) VALUES (N'PS12233', N'Tran Phuc Hau', CAST(N'2002-04-06' AS Date), 1, N'Vinh Long', N'UD16315', N'at2.PNG', N'hau@gmail.com')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [MaLop], [Hinh], [Email]) VALUES (N'PS12333', N'Nguyen Quoc Dat', CAST(N'2002-11-11' AS Date), 1, N'Go Vap', N'KTT36317', N'sv8.jpg', N'dat@gmail.com')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [MaLop], [Hinh], [Email]) VALUES (N'PS12453', N'Nguyen Huu Hai Phuoc', CAST(N'2002-01-07' AS Date), 1, N'Long An', N'UD16315', N'at3.PNG', N'phuoc@gmail.com')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [MaLop], [Hinh], [Email]) VALUES (N'PS15631', N'Huynh Huu Vinh', CAST(N'2002-03-01' AS Date), 1, N'Da Nang', N'UD16315', N'anhthe10.jpg', N'vinh@gmail.com')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [MaLop], [Hinh], [Email]) VALUES (N'PS15783', N'Tran Quoc Thang', CAST(N'2002-07-09' AS Date), 1, N'An Giang', N'UD16315', N'at1.PNG', N'thang@gmail.com')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [MaLop], [Hinh], [Email]) VALUES (N'PS22111', N'Do Thi Anh Hong', CAST(N'2002-11-21' AS Date), 0, N'An Giang', N'KTT36317', N'sv5.jpg', N'hong@gmail.com')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [MaLop], [Hinh], [Email]) VALUES (N'PS33221', N'Tran Trung Kien', CAST(N'2002-02-03' AS Date), 1, N'Vinh Long', N'LS56319', N'sv2.jpg', N'kien@gmail.com')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [MaLop], [Hinh], [Email]) VALUES (N'PS43211', N'Nguyen Van Vu', CAST(N'2002-11-04' AS Date), 1, N'Ca Mau', N'NT26316', N'sv10.jpg', N'vu@gmail.com')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [MaLop], [Hinh], [Email]) VALUES (N'PS64221', N'Tran Cong Thu', CAST(N'2002-07-23' AS Date), 1, N'Kien Giang', N'NT26316', N'sv9.jpg', N'thu@gmail.com')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [VaiTro], [Email]) VALUES (N'GV01', N'111', N'Giang Vien', N'tula@gmail.com')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [VaiTro], [Email]) VALUES (N'PS11243', N'321', N'Sinh Vien', N'wikodung123@gmail.com')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [VaiTro], [Email]) VALUES (N'PS15783', N'123', N'Sinh Vien', N'tranquocthang972002@gmail.com')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [VaiTro], [Email]) VALUES (N'TeoNV', N'123', N'Can Bo Dao Tao', N'teo@gmail.com')
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[MonHoc] ([MaMH])
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK__Lop__MaKhoa__4D94879B] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKHoa])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK__Lop__MaKhoa__4D94879B]
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD  CONSTRAINT [FK__MonHoc__MaGV__5070F446] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MonHoc] CHECK CONSTRAINT [FK__MonHoc__MaGV__5070F446]
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD  CONSTRAINT [FK__MonHoc__MaKHoa__5165187F] FOREIGN KEY([MaKHoa])
REFERENCES [dbo].[Khoa] ([MaKHoa])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MonHoc] CHECK CONSTRAINT [FK__MonHoc__MaKHoa__5165187F]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK__SinhVien__Email__5441852A] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK__SinhVien__Email__5441852A]
GO
/****** Object:  StoredProcedure [dbo].[sp_LopTheoKhoa]    Script Date: 12/12/2021 11:20:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LopTheoKhoa]
@MaKhoa varchar(10)
AS BEGIN
	SELECT
	    k.TenKhoa,
		k.NamThanhLap,
		l.MaLop,
		l.TenLop
	FROM Lop l
		JOIN Khoa k ON k.MaKhoa = l.MaKhoa
	WHERE l.MaKhoa = @MaKhoa
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SinhVienTheoLop]    Script Date: 12/12/2021 11:20:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SinhVienTheoLop]
@MaLop varchar(10)
AS BEGIN
	SELECT
	    l.TenLop,
		sv.MaSV,
		sv.HoTen,
		sv.NgaySinh,
		sv.GioiTinh	
	FROM SinhVien sv
		JOIN Lop l ON l.MaLop = sv.MaLop
	WHERE sv.MaLop = @MaLop
END
GO
/****** Object:  StoredProcedure [dbo].[TKDSV_K]    Script Date: 12/12/2021 11:20:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TKDSV_K] 
@keyk varchar(10)
AS
BEGIN

	CREATE TABLE #mktl (
	ml VARCHAR(10)
	)
    
	insert into #mktl select DISTINCT MaLop from lop where makhoa = @keyk
    
    Select ketqua.diemtb from ketqua join #mktl ON ketqua.malop =ml
	drop table #mktl;

END
GO
/****** Object:  StoredProcedure [dbo].[TKTop]    Script Date: 12/12/2021 11:20:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TKTop]
AS
BEGIN
	CREATE TABLE #mltsv (
		ml VARCHAR(10));
	CREATE TABLE #msvdc (
		msv VARCHAR(10));
	CREATE TABLE #makhoa (
		mk varchar(10),
		msv VARCHAR(10));
		CREATE TABLE #bantam (
		
        msv varchar(10),
        hoten varchar(50),
        diemtb Float(10),
        mk varchar(10)
        );
		CREATE TABLE #bantam2 (
		
		msv VARCHAR(10) ,
        hoten varchar(50),
        diemtb float,
        makhoa varchar(10)
        );

		CREATE TABLE #bantam3(
		STT int Identity(1,1),
		msv VARCHAR(10) ,
        hoten varchar(50),
        diemtb float,
        makhoa varchar(10)
        );
    
	insert into #msvdc select masv from ketqua
		order by DiemTB DESC 
	insert into #mltsv select sinhvien.malop from sinhvien join #msvdc
		on sinhvien.masv = #msvdc.msv
	insert into #makhoa select lop.makhoa,ketqua.masv from (( lop join #mltsv ON lop.malop = #mltsv.ml) join ketqua ON ketqua.malop=#mltsv.ml)

	insert into #bantam(msv,hoten,diemtb,mk) select #makhoa.msv,  ketqua.hoten,ketqua.diemtb,#makhoa.mk from #makhoa 
		join ketqua on #makhoa.msv=ketqua.masv 
	
	insert into #bantam2 select distinct * from #bantam order by msv desc;
	insert into #bantam3 select top(5) * from #bantam2 order by DiemTB desc;
	select * from #bantam3;
	drop table #mltsv;
    drop table #msvdc;
    drop table #makhoa;
    drop table #bantam;
	drop table #bantam2;
	drop table #bantam3;
END
GO
USE [master]
GO
ALTER DATABASE [QLSV] SET  READ_WRITE 
GO
