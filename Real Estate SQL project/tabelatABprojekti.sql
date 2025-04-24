Create TABLE Buyer(
      BuyerID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
      FirstName varchar(50) not null,
      LastName varchar(50),
      Email varchar(100),
      Phone varchar(20),
      Address varchar(50),
      City varchar(50) not null,
      State char(3),
      ZipCode varchar(20)
);

select * from Buyer

--INSERT INTO	Buyer( FirstName, LastName, Email, Phone, Address, City, State, ZipCode)
--VALUES
--('John', 'Doe', 'john.doe@example.com','1234567890', '123 Main St', 'New York', 'NY', '10001'),
--('Jane', 'Smith', 'jane.smith@example.com','9876543210', '456 Elm St', 'Los Angeles', 'CA', '90001'),
--('Michael', 'Johnson', 'michael.johnson@example.com','5551234567', '789 Oak St', 'Chicago', 'IL',' 60001'),
--('Emily', 'Williams', 'emily.williams@example.com','9876543210', '123 Maple St', 'San Francisco', 'CA',' 94101'),
--('James', 'Brown', 'james.brown@example.com','5551234567', '456 Walnut St', 'Boston', 'MA',' 02101'),
--('Jessica', 'Davis', 'jessica.davis@example.com','1234567890', '789 Pine St', 'Seattle', 'WA',' 98101'),
--('Robert', 'Wilson', NULL,'9876543210', '123 Oak St', 'Denver', 'CO',' 80201'),
--('Jennifer', 'Martinez', 'jennifer.martinez@example.com','5551234567', '456 Cedar St', 'Austin', 'TX',' 78701'),
--('William', 'Anderson', 'william.anderson@example.com','1234567890', '789 Birch St', 'Portland', 'OR',' 97201'),
--('Sarah', 'Taylor', 'sarah.taylor@example.com','9876543210', '123 Cherry St', 'Miami', 'FL',' 33101'),
--('Daniel', 'Thomas', NULL,'5551234567', '456 Maple St', 'San Diego', 'CA',' 92101'),
--('Elizabeth', 'Hernandez', 'elizabeth.hernandez@example.com','1234567890', '789 Cedar St', 'Philadelphia', 'PA',' 19101'),
--('Christopher', 'Martinez', 'christopher.martinez@example.com','1234567890', '123 Oak St', 'Houston', 'TX',' 77001'),
--('Michelle', 'Lopez', 'michelle.lopez@example.com','9876543210', '456 Pine St', 'Phoenix', 'AZ',' 85001'),
--('Richard', 'Wright', NULL,'5551234567', '789 Cedar St', 'Atlanta', 'GA',' 30301'),
--('Christine', 'Gonzalez', 'christine.gonzalez@example.com','1234567890', '123 Maple St', 'Detroit', 'MI',' 48201'),
--('David', 'Perez', NULL,'9876543210', '456 Elm St', 'Dallas', 'TX',' 75201'),
--('Stephanie', 'Sanchez', 'stephanie.sanchez@example.com','5551234567', '789 Oak St', 'Las Vegas', 'NV',' 89101'),
--('Brandon', 'Flores', 'brandon.flores@example.com','1234567890', '123 Walnut St', 'Charlotte', 'NC',' 28201'),
--('Rebecca', 'Rivera', NULL,'9876543210', '456 Pine St', 'Minneapolis', 'MN',' 55401'),
--('Thomas', 'Long', 'thomas.long@example.com','5551234567', '789 Elm St', 'Tampa', 'FL',' 33601'),
--('Stephanie', 'Torres', 'stephanie.torres@example.com','1234567890', '123 Cedar St', 'Orlando', 'FL',' 32801'),
--('Steven', 'Ward', NULL,'9876543210', '456 Maple St', 'Nashville', 'TN',' 37201'),
--('Anna', 'Foster', 'anna.foster@example.com','5551234567', '789 Oak St', 'Indianapolis', 'IN',' 46201'),
--('Jonathan', 'Martinez', 'jonathan.martinez@example.com','1234567890', '123 Oak St', 'Houston', 'TX',' 77001');

CREATE TABLE Agent (
    AgentID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20),
    Email VARCHAR(100),
    Phone Varchar(50) NOT NULL,
    CommissionRate DECIMAL(5,2) NOT NULL
);

--drop table Agent

--INSERT INTO Agent (FirstName, LastName, Email, Phone, CommissionRate)
--VALUES
--('David', 'Wilson', 'david.wilson@example.com','1234567890',' 0.05'),
--('Jennifer', 'Miller', 'jennifer.miller@example.com','9876543210',' 0.06'),
--('Christopher', 'Davis', 'christopher.davis@example.com','5551234567',' 0.07'),
--('Jessica', 'Martinez', NULL,'1234567890',' 0.08'),
--('Matthew', 'Hernandez', 'matthew.hernandez@example.com','9876543210',' 0.09'),
--('Amanda', 'Young', 'amanda.young@example.com','5551234567',' 0.10'),
--('Daniel', 'Lee', 'daniel.lee@example.com','1234567890',' 0.11'),
--('Ashley', 'King', NULL,'9876543210',' 0.12'),
--('Michael', 'Wright', 'michael.wright@example.com','5551234567',' 0.13'),
--('Emily', 'Lopez', 'emily.lopez@example.com','1234567890',' 0.14');
