CREATE DATABASE BTVN
USE BTVN
GO
CREATE TABLE PhongBan
(MaPB varchar(7),
TenPB nvarchar(50),
CONSTRAINT PM_PhongBan PRIMARY KEY (MaPB)
)
INSERT INTO PhongBan values (0001,N'Phong 1')
INSERT INTO PhongBan values (0002,N'Phong 2')
INSERT INTO PhongBan values (0003,N'Phong 3')
INSERT INTO PhongBan values (0004,N'Phong 4')
INSERT INTO PhongBan values (0005,N'Phong 5')
GO

CREATE TABLE NhanVien
(MaNV varchar(7) PRIMARY KEY NOT NULL,
TenNV nvarchar(50),
NgaySinh datetime CHECK (NgaySinh < getdate()),
SoCMND char(9),
GioiTinh char(1) DEFAULT ('M') CHECK (GioiTinh = 'M' OR GioiTinh = 'F'),
DiaChi nvarchar(100),
NgayVaoLam datetime,
MaPB varchar(7),
CONSTRAINT FK_Mapb FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB)
Constraint Check_NgayVaoLam CHECK (year(NgayVaoLam) >= ( year(NgaySinh) + 20)),
)

Insert into NhanVien values(01,N'hùng','4/4/1993', 12695423,'F',N'lào cai','4/5/2020',0001)
Insert into NhanVien values(02,N'nam','5/4/1992', 12695423,'M',N'thái nguyên','4/5/2020',0002)
Insert into NhanVien values(03,N'hoàng','2/20/1996', 12695423,'M',N'bắc kạn','4/5/2020',0003)
Insert into NhanVien values(04,N'huy','4/10/1995', 12695423,'F',N'hồ chí minh','4/5/2020',0004)
Insert into NhanVien values(05,N'khánh','4/20/1994', 12695423,'M',N'bắc ninh','4/5/2020',0005)
Insert into NhanVien values(06,N'khánh2','4/20/1994', 12695423,'M',N'bắc ninh','4/5/2020',0005)

CREATE TABLE LuongDA
(MaDA varchar(8),
MaNV varchar(7) ,
NgayNhan datetime NOT NULL default(GETDATE()),
SoTien money CHECK (SoTien > 0),
CONSTRAINT PM_Ma PRIMARY KEY (MaDA,MaNV),
CONSTRAINT FK_MaNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
Insert into LuongDA values(159,01,'12/30/2020',50000)
Insert into LuongDA values(357,02,'12/30/2020',20000)
Insert into LuongDA values(258,03,'12/30/2020',41000)
Insert into LuongDA values(456,04,'12/30/2020',70000)
Insert into LuongDA values(856,05,'12/30/2020',60000)
Insert into LuongDA values(486,06,'12/30/2020',60000)

select * from PhongBan
select * from NhanVien
select * from LuongDA

select GioiTinh from NhanVien where GioiTinh = 'F'

select top(1) * from PhongBan
select top(1)* from NhanVien
select top(1)* from LuongDA

select MaNV,SUM(SoTien) AS Tong_tien from LuongDA GROUP BY MaNV 

select MaNV,TenPB from  NhanVien as a inner join PhongBan as b on a.MaPB = b.MaPB

select SoTien,TenPB from LuongDA as a inner join PhongBan as b on a.MaNV= b.MaPB where MaPB = 1

select TenPB, COUNT(MaNV) AS so_luong from NhanVien as a inner join PhongBan as b on a.MaPB = b.MaPB GROUP BY TenPB

select TenPB, COUNT(MaNV) AS so_luong into #soluongnv from NhanVien as a inner join PhongBan as b on a.MaPB = b.MaPB GROUP BY TenPB
SELECT Max(TenPB) AS so_phong, MAX(so_luong) As so_luong FROM #soluongnv

SELECT a.MaNV,SUM(SoTien) AS Tong_tien, SoCMND
FROM LuongDA as a join NhanVien as b ON a.MaNV = b.MaNV 
WHERE SoCMND like '%9'
GROUP BY a.MaNv, SoCMND

DECLARE @maxluong numeric(16,2)
SELECT @maxluong = MAX(SoTien) 
FROM LuongDA

SELECT MaNV,SoTien 
FROM LuongDA
WHERE SoTien = @maxluong


SELECT a.MaNV,a.GioiTinh,c.SoTien 
FROM NhanVien as a	JOIN PhongBan b ON a.MaPB = b.MaPB 
					JOIN LuongDA c ON a.MaNV = c.MaNV  
WHERE b.MaPB = 1 AND a.GioiTinh = 'F' AND c.SoTien > 1200

select TenPB,SUM(SoTien) AS Tong_tien 
from LuongDA as a JOIN NhanVien b ON a.MaNV = b.MaNV
				   JOIN PhongBan c ON c.MaPB = b.MaPB
GROUP BY TenPB

SELECT * FROM NhanVien
WHERE TenNV Like 'n%'

DELETE FROM LuongDA WHERE SoTien= 20000

DELETE FROM NhanVien WHERE MaNV= 2

UPDATE NhanVien set NgayVaoLam = '12/02/2015' WHERE MaPB = 5 
