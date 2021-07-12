create database tiki

use tiki

create table tablet
(ma_sp char(16),
ten_sp ntext,
gia_sp int,
status char(1),
so_luong int )

INSERT INTO tablet values (1, N'Quần',50000,'H', 50)
INSERT INTO tablet values (2, N'Áo', 60000, 'M', 69)
INSERT INTO tablet values (3, N'Túi', 70000, 'M', 99)
INSERT INTO tablet values (4, N'Cặp', 80000, 'K', 79)
INSERT INTO tablet values (5, N'Balo', 90000, 'M', 49)

select * from tablet

update tablet set ten_sp=N'Gấu bông' where ma_sp=1

delete from tablet where ma_sp=4



create database customer

use customer

create table tablet2
(CusID char(16),
name ntext,
email varchar(20),
phone int,
level int,
status char(1))

INSERT INTO tablet2 values (123, N'Nguyễn Văn A','nguyenvana@gmail.com',123456, 10,'M')
INSERT INTO tablet2 values (112, N'Nguyễn Văn B','nguyenvanb@gmail.com',15456, 2,'F')
INSERT INTO tablet2 values (115, N'Nguyễn Văn C','nguyenvanc@gmail.com',123458, 156, 'M')
INSERT INTO tablet2 values (119, N'Nguyễn Văn D','nguyenvand@gmail.com',878562, 147, 'F')
INSERT INTO tablet2 values (191, N'Nguyễn Văn E','nguyenvane@gmail.com',46465, 1234, 'M')

select * from tablet2

update tablet2 set name=N'Nguyễn Văn H' where CusID=123

delete from tablet2 where CusID=119