CREATE TABLE IF NOT EXISTS Astronaut(
    AstroID INT,
    Name VARCHAR(100),
    PRIMARY KEY (AstroID));

CREATE TABLE IF NOT EXISTS Company(
    CompanyID INT,
    Name VARCHAR(100),
    PRIMARY KEY (CompanyID));

CREATE TABLE IF NOT EXISTS Crew (
    AstroID INT,
    CompanyID INT REFERENCES Company,
    PRIMARY KEY (AstroID),
    FOREIGN KEY (AstroID) REFERENCES Astronaut (AstroID),
    FOREIGN KEY (CompanyID) REFERENCES Company (CompanyID)
    );

CREATE TABLE IF NOT EXISTS Rocket(
    RocketID INT,
    Model VARCHAR(100),
    Capacity REAL,
    CompanyID INT,
    PRIMARY KEY (RocketID),
	FOREIGN KEY (CompanyID) REFERENCES Company (CompanyID)
    -- ON DELETE SET NULL
    );

CREATE TABLE IF NOT EXISTS Reservation(
    ReserveID INT NOT NULL,
    RequestedDate DATE,
    Destination VARCHAR(30),
    CompanyID INT NOT NULL,
    RocketID INT NOT NULL,
    PRIMARY KEY (ReserveID),
    FOREIGN KEY (CompanyID) REFERENCES Company (CompanyID),
    FOREIGN KEY (RocketID) REFERENCES Rocket (RocketID));

CREATE TABLE IF NOT EXISTS Cargo(
    CargoID INT,
    CargoType VARCHAR(100),
    Weight INT,
    Value INT,
    CompanyID INT,
    PRIMARY KEY (CargoID),
    FOREIGN KEY (CompanyID) REFERENCES Company (CompanyID)
    -- ON DELETE SET NULL
    );


CREATE TABLE IF NOT EXISTS Officer(
    AstroID INT NOT NULL,
    PRIMARY KEY (AstroID),
    FOREIGN KEY (AstroID) REFERENCES Astronaut (AstroID)
    -- ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS ShipmentLaunchpadSlot(
    InvoiceNum INT,
    ReserveID INT,
    CargoID INT,
    Cost REAL,
    AstroID  INT,
    Location VARCHAR(100),
    PortNum INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    StartTime REAL NOT NULL,
    EndTime REAL NOT NULL,
    PRIMARY KEY (InvoiceNum),
    CONSTRAINT LaunchpadSlot UNIQUE (Location, PortNum, StartDate, EndDate, StartTime, EndTime),
    FOREIGN KEY (ReserveID) REFERENCES Reservation (ReserveID)
    -- ON DELETE CASCADE
    ,
    FOREIGN KEY (CargoID) REFERENCES Cargo (CargoID),
    FOREIGN KEY (AstroID) REFERENCES Officer (AstroID)
-- ON UPDATE CASCADE
-- FOREIGN KEY (Port#, Location, StartDate, EndDate, StartTime, EndTime) REFERENCES LaunchpadSlot
-- ON DELETE NO ACTION
-- ON UPDATE NO ACTION,
);

CREATE TABLE IF NOT EXISTS CrewShipment(
    AstroID INT NOT NULL,
    InvoiceNum INT NOT NULL,
    PRIMARY KEY (AstroID, InvoiceNum),
    FOREIGN KEY (AstroID) REFERENCES Crew (AstroID),
    FOREIGN KEY (InvoiceNum) REFERENCES ShipmentLaunchpadSlot (InvoiceNum)
    -- ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS Passenger(
    AstroID INT NOT NULL,
    RequiresAssistance CHAR(3),
    PRIMARY KEY (AstroID),
    FOREIGN KEY (AstroID) REFERENCES Astronaut (AstroID)
    -- ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS CarryPassengerShipment(
    AstroID INT NOT NULL,
    InvoiceNum INT NOT NULL,
    PRIMARY KEY (AstroID, InvoiceNum),
    FOREIGN KEY (AstroID) REFERENCES Crew (AstroID),
    FOREIGN KEY (InvoiceNum) REFERENCES ShipmentLaunchpadSlot (InvoiceNum)
    -- ON DELETE CASCADE
    );

-- CREATE TABLE OfficerReserveShipment(
-- AstroID INT,
-- Invoice# INT,
-- Date DATE,
-- PRIMARY KEY (Invoice#),
-- FOREIGN KEY (AstroID) REFERENCES Officer(AstroID)
-- ON DELETE NO ACTION
-- ON UPDATE NO ACTION,
-- FOREIGN KEY (Invoice#) REFERENCES ConfirmedShipment(Invoice#)
-- ON DELETE CASCADE
-- ON UPDATE NO ACTION
-- ) ;

-- CREATE TABLE Launchpad(
-- Port# INT,
-- Location VARCHAR(100)
-- PRIMARY KEY (Port#, Location)
-- ) ;

-- CREATE TABLE LaunchpadSlot(
-- -- SlotID INT,
-- Location VARCHAR(100),
-- Port# INT,
-- StartDate DATE NOT NULL,
-- EndDate DATE NOT NULL,
-- StartTime REAL NOT NULL,
-- EndTime REAL NOT NULL,
-- PRIMARY KEY (Location, Port#, StartDate, EndDate, StartTime, EndTime)
-- ) ;

-- CREATE TABLE ShipmentLaunchpadSlot(
-- Invoice# INT,
-- Port# INT,
-- Location VARCHAR(100),
-- SlotID INT,
-- Cost REAL,
-- PRIMARY KEY (Invoice#),
-- UNIQUE (Port#, Location, SlotID),
-- FOREIGN KEY (Invoice#) REFERENCES ShipmentLaunchpadSlot(Invoice#)
-- ON DELETE CASCADE
-- ON UPDATE CASCADE,
-- FOREIGN KEY (Port#, Location) REFERENCES Launchpad(Port#, Location)
-- ON DELETE NO ACTION
-- ON UPDATE NO ACTION,
-- FOREIGN KEY (SlotID) REFERENCES AvailabilitySlot(SlotID)
-- ON DELETE NO ACTION
-- ON UPDATE NO ACTION
-- ) ;

commit;