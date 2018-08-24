CREATE TABLE [dbo].[Customer]
(
	[CustomerID] INT NOT NULL PRIMARY KEY, 
    [CustomerName] NVARCHAR(150) NULL, 
    [CustomerEnteredDateTime] DATETIME NULL, 
    [CustomerExitedDateTime] DATETIME NULL
)
