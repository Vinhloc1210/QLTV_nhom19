create function ma_tang(@idnv varchar(6), @bottom varchar(3), @sizeid int)
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
go

create trigger next_id1 on [NhanVien]
for insert 
as
begin
declare @lastid varchar(6)
set @lastid = (select top 1 MaNV from [NhanVien] order by maNV desc)
update [NhanVien] set maNV = dbo.ma_tang(@lastid,'NV',6)
where MaNV=''
end
go

create trigger next_id2 on DocGia
for insert 
as
begin
declare @lastid varchar(6)
set @lastid = (select top 1 MaDocGia from DocGia order by MaDocGia desc)
update DocGia set MaDocGia = dbo.ma_tang(@lastid,'DG',6)
where MaDocGia=''
end
go

create trigger next_id3 on MuonSach
for insert 
as
begin
declare @lastid varchar(6)
set @lastid = (select top 1 MaPhieu from MuonSach order by MaPhieu desc)
update MuonSach set MaPhieu = dbo.ma_tang(@lastid,'P',6)
where MaPhieu=''
end
go

create trigger next_id4 on Sach
for insert 
as
begin
declare @lastid varchar(6)
set @lastid = (select top 1 MaSach from Sach order by MaSach desc)
update Sach set MaSach = dbo.ma_tang(@lastid,'S',6)
where MaSach=''
end
go

create trigger next_id5 on TheThanhVien
for insert 
as
begin
declare @lastid varchar(6)
set @lastid = (select top 1 MaThe from TheThanhVien order by MaThe desc)
update TheThanhVien set MaThe = dbo.ma_tang(@lastid,'T',6)
where MaThe=''
end
go

create trigger reset_tt on TheThanhVien
for insert,update
as 
begin 
update TheThanhVien set TinhTrang = '2'
where NgayHetHan <= GETDATE()
end
go



DROP TRIGGER reset_tt 
