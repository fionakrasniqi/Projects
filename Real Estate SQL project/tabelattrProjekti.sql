CREATE TABLE Tranzaksion (
    TransactionID INT NOT NULL PRIMARY KEY IDENTITY(10,1),
	StatusID INT NOT NULL,
	TypeID INT NOT NULL,
    PropertyID INT NOT NULL,
    BuyerID INT NOT NULL,
    AgentID INT NOT NULL,
    TransactionDate DATE,
    Price DECIMAL(18,2),
    Commission DECIMAL(18,2),
    CONSTRAINT FK_PropertyID FOREIGN KEY (PropertyID) REFERENCES [Property](PropertyID),
    CONSTRAINT FK_BuyerID FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID),
    CONSTRAINT FK_AgentID FOREIGN KEY (AgentID) REFERENCES Agent(AgentID),
	CONSTRAINT FK_StatusID FOREIGN KEY (StatusID) REFERENCES TransactionStatus(StatusID),
    CONSTRAINT FK_TypeID FOREIGN KEY (TypeID) REFERENCES TransactionType(TransactionTypeID)
);

CREATE TABLE TransactionStatus (
    StatusID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    StatusName VARCHAR(50)
);

CREATE TABLE TransactionType (
    TransactionTypeID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TypeName VARCHAR(50)
);

INSERT INTO TransactionStatus (StatusName)
VALUES
('Completed'),
('Cancelled'),
('Approved'), 
('Processing'),
('On Hold'), 
('Awaiting Payment'), 
('Payment Received');

INSERT INTO TransactionType (TypeName)
VALUES
    ('Sale'),
    ('Purchase'),
    ('Rental'),
    ('Lease'),
    ('Exchange'),
    ('Auction'),
    ('Option Contract');
  
INSERT INTO Tranzaksion (TypeID, StatusID, PropertyID, BuyerID, AgentID, TransactionDate, Price, Commission)
VALUES
(2, 6, 1,  1,  1, '2023-01-05', 350000.00, 17500.00),
(2, 7, 2,  2,  7, '2023-02-10', 250000.00, 12500.00),
(4, 3, 3,  3,  3, '2023-03-15', 400000.00, 20000.00),
(1, 7, 4,  4,  4, '2023-04-20', 300000.00, 15000.00),
(4, 2, 5,  5,  5, '2023-05-25', 275000.00, 13750.00),
(7, 5, 6,  6,  8, '2023-06-30', 320000.00, 16000.00),
(7, 5, 7,  7,  2, '2023-07-05', 450000.00, 22500.00),
(4, 4, 8,  8,  2, '2023-08-10', 280000.00, 14000.00),
(2, 6, 9,  9,  8, '2023-09-15', 380000.00, 19000.00),
(1, 7, 10, 10, 9, '2023-10-20', 310000.00, 15500.00),
(3, 1, 11, 11, 6, '2023-11-25', 370000.00, 18500.00),
(7, 5, 12, 12, 10,'2023-12-30', 420000.00, 21000.00),
(5, 3, 13, 13, 1, '2024-01-05', 290000.00, 14500.00),
(2, 7, 14, 14, 5, '2024-02-10', 480000.00, 24000.00),
(4, 1, 15, 15, 8, '2024-03-15', 350000.00, 17500.00),
(5, 6, 16, 15, 8, '2024-04-20', 395000.00, 19750.00),
(5, 6, 17, 16, 2, '2024-05-25', 410000.00, 20500.00),
(1, 3, 18, 17, 6, '2024-06-30', 320000.00, 16000.00),
(6, 4, 19, 18, 7, '2024-07-05', 380000.00, 19000.00),
(4, 2, 20, 19, 5, '2024-08-10', 290000.00, 14500.00),
(4, 2, 21, 22, 3, '2024-09-15', 475000.00, 23750.00),
(1, 5, 22, 20, 1, '2024-10-20', 340000.00, 17000.00),
(3, 1, 23,  1, 4, '2024-11-25', 385000.00, 19250.00),
(7, 2, 24, 21, 10,'2024-12-30', 415000.00, 20750.00),
(4, 6, 25, 22, 9, '2025-01-05', 300000.00, 15000.00),
(2, 7, 26, 23, 9, '2025-02-10', 360000.00, 18000.00),
(5, 3, 27,  5, 6, '2025-03-15', 425000.00, 21250.00),
(6, 4, 28, 24, 3, '2025-04-20', 310000.00, 15500.00),
(6, 4, 29,  2, 7, '2025-05-25', 470000.00, 23500.00),
(1, 5, 30, 25, 10,'2025-06-30', 325000.00, 16250.00);
