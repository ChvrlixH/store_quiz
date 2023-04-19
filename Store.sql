CREATE DATABASE Store

USE Store

CREATE TABLE Categories(
	Id int primary key identity,
	Name nvarchar(255) NOT NULL
)

CREATE TABLE Products(
	Id int primary key identity,
	ProductCode nvarchar(255) NOT NULL,
	CategoryId int foreign key references Categories(Id)
)

CREATE TABLE Stock(
	Id int primary key identity,
	ProductId int foreign key references Products(Id),
	CreatedDate datetime2 DEFAULT GETDATE() NOT NULL,
	Count int
)

CREATE TABLE Sizes(
	Id int primary key identity,
	Letter nvarchar(255),
	Min int NOT NULL,
	Max int NOT NULL
)

ALTER TABLE Stock
ADD Size int 

INSERT INTO Categories
VALUES('T-shirt'),
		('Jeans'),
		('Shoes'),
		('Jacket')

INSERT INTO Products
VALUES('Gucci',1),
		('Stefano',1),
		('Chvrlix',2),
		('Palma',2),
		('MainTrue',3),
		('S-Gate',3),
		('Armani',4),
		('Shame',4)

INSERT INTO Stock (ProductId,Count,Size)
VALUES(1,35,32),
      (1,30,31),
	  (1,40,30),
	  (2,32,34),
	  (2,25,27),
	  (2,15,29),
	  (3,55,30),
	  (3,53,34),
	  (3,23,35),
	  (4,25,31),
	  (4,65,29),
	  (4,72,34)


CREATE VIEW AllData AS 
SELECT p.ProductCode 'Code', cate.Name 'Category', s.CreatedDate 'date', s.Count, s.Size FROM Categories cate
JOIN Products p
ON cate.Id=p.CategoryId
JOIN Stock s
ON s.ProductId=p.Id


SELECT * FROM AllData

INSERT INTO Products
VALUES('Seen',2)

CREATE TRIGGER NewProduct (@Product nvarchar, @Id int)
AS
BEGIN
SELECT * FROM AllData
END