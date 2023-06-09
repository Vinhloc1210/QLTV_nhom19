USE [master]
GO
/****** Object:  Database [Quanlythuvien1]    Script Date: 12/15/2022 17:29:41 ******/
CREATE DATABASE [Quanlythuvien1]

GO
USE [Quanlythuvien1]
GO
create function [dbo].[ma_tang](@idnv varchar(6), @bottom varchar(3), @sizeid int)
returns varchar(6)
as
begin
if(@idnv='')
set @idnv= @bottom + REPLICATE(0,@sizeid - LEN(@bottom))
declare @num int, @next varchar(6)
set @idnv=LTRIM(RTRIM(@idnv))
set @num = REPLACE(@idnv,@bottom,'')+1
set @sizeid =@sizeid - LEN(@bottom)
set @next = @bottom + REPLICATE(0,@sizeid - LEN(@bottom))
set @next = @bottom + RIGHT(REPLICATE(0,@sizeid) + CONVERT(varchar(Max), @num ),@sizeid)
return @next
end
GO
/****** Object:  Table [dbo].[DocGia]    Script Date: 12/15/2022 17:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGia](
	[MaDocGia] [varchar](6) NOT NULL,
	[TenDocGia] [nvarchar](50) NULL,
	[MaSo] [varchar](50) NULL,
	[NgaySinh] [date] NULL,
	[Khoa] [int] NULL,
	[SDT] [varchar](10) NULL,
	[GioiTinh] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 12/15/2022 17:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenKhoa] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuonSach]    Script Date: 12/15/2022 17:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuonSach](
	[MaPhieu] [varchar](6) NOT NULL,
	[MaDocGia] [varchar](6) NULL,
	[NgayMuon] [date] NULL,
	[NgayHenTra] [date] NULL,
	[NgayLapPhieu] [date] NULL,
	[MaNV] [varchar](6) NULL,
	[MaSach] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/15/2022 17:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](6) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[SDT] [varchar](10) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[UserName] [nvarchar](100) NULL,
	[PassWord] [nvarchar](100) NULL,
	[HinhAnh] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 12/15/2022 17:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheThanhVien](
	[MaThe] [varchar](6) NOT NULL,
	[MaDocGia] [varchar](6) NULL,
	[NgayHetHan] [date] NULL,
	[TinhTrang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 12/15/2022 17:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [varchar](6) NOT NULL,
	[TenSach] [nvarchar](200) NULL,
	[Id_TL] [int] NULL,
	[TacGia] [nvarchar](100) NULL,
	[NhaXB] [nvarchar](100) NULL,
	[TinhTrang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 12/15/2022 17:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [MaSo], [NgaySinh], [Khoa], [SDT], [GioiTinh]) VALUES (N'DG0001', N'hải nam', N'1221221', CAST(N'2022-12-08' AS Date), 2, N'0899765776', N'Nam')
INSERT [dbo].[DocGia] ([MaDocGia], [TenDocGia], [MaSo], [NgaySinh], [Khoa], [SDT], [GioiTinh]) VALUES (N'DG0002', N'hải đăng', N'999', CAST(N'2022-11-28' AS Date), 1, N'0866952669', N'Nữ')
GO
SET IDENTITY_INSERT [dbo].[Khoa] ON 

INSERT [dbo].[Khoa] ([Id], [TenKhoa]) VALUES (1, N'CNTT')
INSERT [dbo].[Khoa] ([Id], [TenKhoa]) VALUES (2, N'Kế toán')
SET IDENTITY_INSERT [dbo].[Khoa] OFF
GO
INSERT [dbo].[MuonSach] ([MaPhieu], [MaDocGia], [NgayMuon], [NgayHenTra], [NgayLapPhieu], [MaNV], [MaSach]) VALUES (N'P00001', N'DG0001', CAST(N'2022-11-28' AS Date), CAST(N'2022-12-15' AS Date), CAST(N'2022-11-28' AS Date), N'NV0002', N'S00001')
INSERT [dbo].[MuonSach] ([MaPhieu], [MaDocGia], [NgayMuon], [NgayHenTra], [NgayLapPhieu], [MaNV], [MaSach]) VALUES (N'P00002', N'DG0001', CAST(N'2021-12-27' AS Date), CAST(N'2022-11-30' AS Date), CAST(N'2022-11-28' AS Date), N'NV0002', N'S00003')
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT], [GioiTinh], [UserName], [PassWord], [HinhAnh]) VALUES (N'NV0001', N'Phúc', CAST(N'2002-10-12' AS Date), N'086952668', N'Nam', N'user1', N'123', N'avatar.jpg')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT], [GioiTinh], [UserName], [PassWord], [HinhAnh]) VALUES (N'NV0002', N'Quỳnh', CAST(N'1998-04-14' AS Date), N'086952668', N'Nam', N'user2', N'123', N'thang.jpg')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT], [GioiTinh], [UserName], [PassWord], [HinhAnh]) VALUES (N'NV0003', N'Phạm Văn Quỳnh 0000', CAST(N'2022-11-29' AS Date), N'0866952668', N'Nam', N'user3', N'123', N'hinh-anh-cac-loai-banh-kem-sinh-nhat-dep-doc-dao-the-gioi-4.jpg')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT], [GioiTinh], [UserName], [PassWord], [HinhAnh]) VALUES (N'NV0004', N'Nguyễn Hùng', CAST(N'2022-02-01' AS Date), N'0866952669', N'Nữ', N'user4', N'123', N'sinh-to-bo-la-gi.jpg')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT], [GioiTinh], [UserName], [PassWord], [HinhAnh]) VALUES (N'NV0005', N'Hoàng', CAST(N'2022-11-29' AS Date), N'0899765779', N'Nữ', N'user5', N'123', N'images.jpg')
GO
INSERT [dbo].[TheThanhVien] ([MaThe], [MaDocGia], [NgayHetHan], [TinhTrang]) VALUES (N'T0001', N'DG0001', CAST(N'2022-11-28' AS Date), 1)
INSERT [dbo].[TheThanhVien] ([MaThe], [MaDocGia], [NgayHetHan], [TinhTrang]) VALUES (N'T0002', N'DG0001', CAST(N'2022-12-28' AS Date), 2)
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [Id_TL], [TacGia], [NhaXB], [TinhTrang]) VALUES (N'S00001', N'Sách 1', 2, N'Nguyễn Huy Liệu', N'Kim đồng', 3)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [Id_TL], [TacGia], [NhaXB], [TinhTrang]) VALUES (N'S00002', N'Tôi là ai', 1, N'Trần Kỳ', N'Kim đồng', 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [Id_TL], [TacGia], [NhaXB], [TinhTrang]) VALUES (N'S00003', N'Thất Tình Không Sao', 2, N'Nguyễn Ngọc Thạch', N'Tuổi trẻ', 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [Id_TL], [TacGia], [NhaXB], [TinhTrang]) VALUES (N'S00004', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ', 1, N'Nguyễn Nhật Ánh', N'Kim đồng ', 4)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [Id_TL], [TacGia], [NhaXB], [TinhTrang]) VALUES (N'S00005', N'Bức Xúc Không Làm Ta Vô Can', 1, N'Đặng Hoàng Giang', N'Tuổi trẻ ', 5)

GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([Id], [TenLoai]) VALUES (1, N'Truyện')
INSERT [dbo].[TheLoai] ([Id], [TenLoai]) VALUES (2, N'Giáo trình')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
USE [master]
GO
ALTER DATABASE [Quanlythuvien1] SET  READ_WRITE 
GO
 