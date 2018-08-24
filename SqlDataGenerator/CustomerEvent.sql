CREATE TABLE [dbo].[CustomerEvent]
(
	[CustomerEventId] INT NOT NULL PRIMARY KEY, 
    [EventType] NCHAR(50) NULL, 
    [EventTimeStamp] DATETIME NULL DEFAULT GETUTCDATE(), 
    [CustomerID] INT NOT NULL, 
    CONSTRAINT [FK_CustomerEvent_Customer] FOREIGN KEY ([CustomerID]) REFERENCES Customer ([CustomerID])
)
