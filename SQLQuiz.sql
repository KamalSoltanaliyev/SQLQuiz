CREATE DATABASE Store

USE Store

CREATE TABLE Categories (
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) UNIQUE
)

CREATE TABLE Products (
	Id INT PRIMARY KEY IDENTITY,
	ProductCode NVARCHAR(50) UNIQUE,
	CategoryId INT,
	FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
)

CREATE TABLE Stock (
	Id INT PRIMARY KEY IDENTITY,
	ProductId INT,
	CreatedDate date DEFAULT GETDATE(),
	[Count] INT,
	FOREIGN KEY (ProductId) REFERENCES Products(Id)
)

CREATE TABLE Sizes (
	ID INT PRIMARY KEY IDENTITY,
	Letter VARCHAR(10),
	[Min] INT,
	[Max] INT
)

INSERT INTO Categories(Name)
VALUES ('T-shirt')

INSERT INTO Categories(Name)
VALUES ('Jeans')

INSERT INTO Categories(Name)
VALUES ('Shoes')	

INSERT INTO Categories(Name)
VALUES ('Jacket')	





CREATE VIEW Quiz AS
SELECT p.ProductCode AS [Product Code],
	c.Name AS [Category Name],
	s.CreatedDate AS [Created date],
	s.Count,
	s.Size
FROM Products p
JOIN Stock s on p.Id = s.ProductId
JOIN Categories c on p.CategoryId = c.Id

SELECT * FROM Quiz

SELECT * FROM Quiz
WHERE Size = 'XL';

SELECT [Category Name],COUNT(*) AS Total
FROM Quiz
Group by [Category Name]

SELECT * FROM Products
WHERE CategoryId = 2

SELECT * FROM Quiz
WHERE [Count] > (SELECT AVG([Count]) FROM Quiz)