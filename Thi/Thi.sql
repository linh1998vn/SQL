CREATE DATABASE SellingPoint
USE SellingPoint
GO

CREATE TABLE Categories(
CateID char(6) Primary Key,
CateName nvarchar(100) NOT NULL,
Description nvarchar(200),
)
GO

INSERT INTO Categories Values(1,N'Ram',N'Ram 8gb')
INSERT INTO Categories Values(2,N'CPU',N'Core I7')
INSERT INTO Categories Values(3,N'HDD',N'HDD 1TB')
GO

SELECT *FROM Categories
GO

CREATE TABLE Parts(
PartID int IDENTITY,
PartName nvarchar(100) NOT NULL,
CateID char(6) FOREIGN KEY REFERENCES Categories(CateID),
Description nvarchar(1000),
Price money DEFAULT('0') NOT NULL,
Quantity int DEFAULT('0'),
Warranty int DEFAULT('1'),
Photo nvarchar(200) DEFAULT('photo/nophoto.png'),
CONSTRAINT PK_PartID PRIMARY KEY(PartID)
)
GO

INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty) VALUES(N'Nexon',1,N'Good Quality',2000,20,15)
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty) VALUES (N'Neon',2,N'Good Quality',3000,15,20)
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty) VALUES (N'Leon',3,N'Good Quality',100,20,10)
GO

SELECT * FROM Parts
GO

SELECT * FROM Parts
WHERE Price > 100
GO

SELECT * FROM Parts a JOIN Categories b ON a.CateID = b.CateID
WHERE CateName = 'CPU'
GO

CREATE VIEW v_Parts AS
SELECT PartID, PartName, CateName, Price, Quantity FROM Parts a
JOIN Categories b ON a.CateID = b.CateID
GO

SELECT * FROM v_Parts
GO

CREATE VIEW v_TopParts AS
SELECT TOP(5) * FROM Parts
ORDER By Price
GO

SELECT * FROM v_TopParts
GO