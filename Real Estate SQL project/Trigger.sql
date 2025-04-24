CREATE TRIGGER rritje
ON Tranzaksion
AFTER INSERT
AS
BEGIN
    UPDATE t
    SET t.Commission = t.Commission + 
        CASE 
            WHEN i.Price >= 450000 THEN (i.Price - 450000) * a.CommissionRate
            ELSE 0
        END
    FROM inserted i
    JOIN Agent a ON i.AgentID = a.AgentID
    JOIN Tranzaksion t ON i.TransactionID = t.TransactionID
END;

select * from Tranzaksion
select * from Agent

--Delete from Tranzaksion
--where TransactionID=40 and StatusID=4 and TypeID=6 and PropertyID=29 and BuyerID=2 AND AgentID=7

--iNSERT INTO Tranzaksion(StatusID, TypeID, PropertyID, BuyerID, AgentID, TransactionDate, Price, Commission)
--VALUES (4, 6, 29,  2, 7, '2025-05-25', 470000.00, 23500.00)