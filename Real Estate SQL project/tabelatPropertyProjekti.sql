--create database REM

CREATE TABLE Property (
    PropertyID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    PropertyTypeID INT NOT NULL,
    Address VARCHAR(50),
    City VARCHAR(40),
    State CHAR(3) NOT NULL,
    ZipCode INT,
    Size DECIMAL(18,2),
    NumberOfRooms INT,
    Price DECIMAL(18,2) NOT NULL,
    Status VARCHAR(40) NOT NULL,
	CONSTRAINT FK_PropertyTypeID FOREIGN KEY (PropertyTypeID) REFERENCES PropertyType(PropertyTypeID)
);

--drop table Property

CREATE TABLE PropertyType (
    PropertyTypeID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TypeName VARCHAR(50),
    FeatureID INT NOT NULL,
    CONSTRAINT FK_FeatureID FOREIGN KEY (FeatureID) REFERENCES PropertyFeature(FeatureID)
);
ALTER TABLE PropertyType
    ALTER COLUMN PropertyTypeID INT NOT NULL;
DBCC CHECKIDENT ('PropertyType', RESEED, 100);




CREATE TABLE PropertyFeature (
    FeatureID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    FeatureName VARCHAR(50),
   );

ALTER TABLE PropertyFeature
    ALTER COLUMN FeatureID INT NOT NULL;
DBCC CHECKIDENT ('PropertyFeature', RESEED, 19);

delete PropertyFeature
   


--INSERT INTO PropertyFeature (FeatureName)
--VALUES
--('Garden'),
--('Fireplace'),
--('Garage'),
--('Patio'),
--('Open Kitchen'),
--('High Ceiling'),
--('Hardwood'),
--('Balcony'),
--('Jacuzzi'),
--('Parking'),
--('Solarium'),
--('Game Room'),
--('Sauna'),
--('Library'),
--('Elevator');


--INSERT INTO PropertyType ( TypeName, FeatureID)
--VALUES
--('Apartment',20),
--('House',25),
--('Duplex',30),
--('Villa',32),
--('Cottage',20),
--('Farmhouse',28),
--( 'Mansion',34),
--( 'Penthouse',22),
--( 'Loft',27),
--( 'Ranch',25),
--( 'Cabin',23),
--( 'Beach House',31);

--INSERT INTO Property ( PropertyTypeID, Address, City, State, ZipCode, Size, NumberOfRooms, Price, Status)
--VALUES 
--(100, '123 Main St', 'New York', 'NY', 10001, 1200.50, 3, 200000.00, 'Available'),
--(108, '456 Elm St', 'Los Angeles', 'CA', 90001, 1800.75, 4, 350000.00, 'Available'),
--(111, '789 Oak St', 'Chicago', 'IL', 60001, 900.25, 2, 150000.00, 'Under Contract'),
--(101, '321 Pine St', 'San Francisco', 'CA', 94101, 1600.00, 3, 300000.00, 'Sold'),
--(100, '555 Cedar St', 'Boston', 'MA', 02101, 1100.00, 2, 250000.00, 'Available'),
--(107, '777 Maple St', 'Seattle', 'WA', 98101, 2000.00, 4, 400000.00, 'Available'),
--(103, '999 Birch St', 'Denver', 'CO', 80201, 950.00, 1, 180000.00, 'Available'),
--(102, '222 Walnut St', 'Austin', 'TX', 78701, 1300.75, 2, 220000.00, 'Under Contract'),
--(102, '444 Cherry St', 'Portland', 'OR', 97201, 2100.25, 5, 450000.00, 'Available'),
--(103, '666 Willow St', 'Miami', 'FL', 33101, 800.50, 1, 160000.00, 'Sold'),
--(104, '888 Pine St', 'San Diego', 'CA', 92101, 1700.50, 3, 320000.00, 'Available'),
--(106, '111 Oak St', 'Philadelphia', 'PA', 19101, 1250.25, 2, 230000.00, 'Available'),
--(106, '777 Oak St', 'Houston', 'TX', 77001, 2200.50, 4, 380000.00, 'Available'),
--(109, '555 Elm St', 'Phoenix', 'AZ', 85001, 1000.75, 2, 170000.00, 'Available'),
--(107, '999 Cedar St', 'Atlanta', 'GA', 30301, 1350.25, 3, 240000.00, 'Under Contract'),
--(105, '333 Maple St', 'Detroit', 'MI', 48201, 1800.00, 3, 280000.00, 'Available'),
--(104, '888 Pine St', 'Dallas', 'TX', 75201, 2500.00, 5, 420000.00, 'Available'),
--(111, '222 Birch St', 'Las Vegas', 'NV', 89101, 950.50, 2, 160000.00, 'Sold'),
--(110, '444 Oak St', 'Charlotte', 'NC', 28201, 1200.75, 2, 220000.00, 'Available'),
--(110, '666 Elm St', 'Minneapolis', 'MN', 55401, 2000.25, 4, 360000.00, 'Available'),
--(109, '111 Cedar St', 'Tampa', 'FL', 33601, 850.00, 1, 140000.00, 'Available'),
--(102, '777 Walnut St', 'San Antonio', 'TX', 78201, 1300.50, 3, 230000.00, 'Sold'),
--(107, '333 Maple St', 'Orlando', 'FL', 32801, 2400.75, 5, 440000.00, 'Available'),
--(103, '999 Elm St', 'Nashville', 'TN', 37201, 900.25, 2, 150000.00, 'Available'),
--(109, '555 Oak St', 'Indianapolis', 'IN', 46201, 1100.00, 2, 200000.00, 'Under Contract'),
--(108, '777 Pine St', 'Salt Lake City', 'UT', 84101, 2600.00, 5, 460000.00, 'Available'),
--(105, '444 Birch St', 'Raleigh', 'NC', 27601, 1000.50, 2, 180000.00, 'Available'),
--(101, '111 Cedar St', 'Kansas City', 'MO', 64101, 1250.25, 3, 220000.00, 'Available'),
--(101, '888 Oak St', 'Columbus', 'OH', 43201, 2300.50, 4, 400000.00, 'Available'),
--(100, '222 Elm St', 'Louisville', 'KY', 40201, 950.75, 2, 160000.00, 'Sold');

select * from PropertyFeature
select * from Property
select * from PropertyType
