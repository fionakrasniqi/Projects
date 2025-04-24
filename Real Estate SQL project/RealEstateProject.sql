-----------------Selektoni bleresit te cilet kane blere apartamente me cmim me te madh se cmimi mesatar----------

select b.BuyerID, b.FirstName, b.LastName, b.Phone, t.Price,FORMAT(TransactionDate, 'dd/MM/yyyy')Date from Buyer b
INNER JOIN Tranzaksion t ON b.BuyerID = t.BuyerID
where b.BuyerID IN ( select BuyerID from Tranzaksion
                     where t.Price > (select AVG(Price) from Tranzaksion))

-------------------Temp Table qe shfaq te dhenat e agjenteve me commissionrate >0.1------------------

create table #TempAgents (
    AgentID INT,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    CommissionRate DECIMAL(5,2)
);

insert into #TempAgents (AgentID, FirstName, LastName, CommissionRate)
select AgentID, FirstName, LastName, CommissionRate
from Agent
where CommissionRate > 0.1;

select * from  #TempAgents

--------------- gjeni commission total te agjenteve dhe rankoni prej tabeles tranzaksioni---------------------

select  AgentID, SUM(Commission)TotalCommission, ROW_NUMBER() OVER (ORDER BY SUM(Commission) DESC) Ranking from Tranzaksion
group by AgentID
Having SUM(Commission) > 5000;

-----------------krijoni nje temp table qe tregon se sa ndertesa jane prej secilit lloj gjithashtu tregon shumen max, avg dhe totale-----------------


create table #PropertySummary (
    TypeName varchar(50),
    NumberOfProperties int,
    TotalPrice decimal(18,2),
    AveragePrice decimal(18,2),
    MaxPrice decimal(18,2)
)

insert into #PropertySummary (TypeName, NumberOfProperties, TotalPrice, AveragePrice, MaxPrice)
select pt.TypeName, (select COUNT(*) from Property p where p.PropertyTypeID = pt.PropertyTypeID)NumberOfProperties,
       SUM(p.Price)TotalPrice, AVG(p.Price)AveragePrice, MAX(p.Price)MaxPrice from PropertyType pt
inner join Property p on p.PropertyTypeID = pt.PropertyTypeID
group by pt.TypeName, pt.PropertyTypeID
Having COUNT(*)  > 0

select * from #PropertySummary


drop table #PropertySummary

-------------------krijoni nje CTE table qe tregon vetem te dhenat me kryseore(adresen, tipin, feature, statusin,cmimin etj) per ndertesat nga tri tabela----------------------

WITH PropertyDetails AS (
select  p.PropertyID, CONCAT(p.Address, ', ', p.City, ', ', p.State) AS FullAddress, p.Size, p.NumberOfRooms, p.Price, p.Status, pt.TypeName, pf.FeatureName, RANK() OVER (ORDER BY p.Price DESC) AS PriceRank
from Property p
left join PropertyType pt ON p.PropertyTypeID = pt.PropertyTypeID
left join PropertyFeature pf ON pt.FeatureID = pf.FeatureID 
)
select * from PropertyDetails

----------------Temp Table qe tregon secilin agjent dhe total commisssion te tyre gjithashtu edhe te dhenat e nderteses me te shtrenjet qe kane shitur-----

create table #AgentDetails (
    AgentID int,
    FullName varchar(100),
    TotalCommission decimal(18, 2),
    PropertyID int,
    PropertyType varchar(50),
	Price int,
    PropertyAddress varchar(100)
)

insert into #AgentDetails (AgentID, FullName, TotalCommission, PropertyID, PropertyType, Price ,PropertyAddress)
select a.AgentID, CONCAT(a.FirstName, ' ', a.LastName)FullName, SUM(t.Commission)TotalCommission, p.PropertyID, pt.TypeName as PropertyType,t.Price ,p.Address AS PropertyAddress
from Agent a
inner join Tranzaksion t on a.AgentID = t.AgentID
inner join (select AgentID,  MAX(Price)MaxPrice from Tranzaksion group by AgentID) as max_price on t.AgentID = max_price.AgentID AND t.Price = max_price.MaxPrice
inner join Property p on t.PropertyID = p.PropertyID
inner join PropertyType pt on p.PropertyTypeID = pt.PropertyTypeID
group by a.AgentID, a.FirstName, a.LastName,  p.PropertyID, pt.TypeName,t.Price ,p.Address

select * from #AgentDetails

DROP TABLE #AgentDetails
