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
    FOREIGN KEY (AstroID) REFERENCES Astronaut (AstroID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (CompanyID) REFERENCES Company (CompanyID)
    );

CREATE TABLE IF NOT EXISTS Rocket(
    RocketID INT,
    Model VARCHAR(100),
    Capacity REAL,
    CompanyID INT,
    PRIMARY KEY (RocketID),
    FOREIGN KEY (CompanyID) REFERENCES Company (CompanyID)
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
     ON DELETE SET NULL
     ON UPDATE SET NULL
    );


CREATE TABLE IF NOT EXISTS Officer(
    AstroID INT NOT NULL,
    PRIMARY KEY (AstroID),
    FOREIGN KEY (AstroID) REFERENCES Astronaut (AstroID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );

CREATE TABLE IF NOT EXISTS ShipmentLaunchpadSlot(
    InvoiceNum INT,
    ReserveID INT,
    CargoID INT,
    Cost REAL,
    AstroID  INT,
    Location VARCHAR(100) NOT NULL,
    PortNum INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    StartTime REAL NOT NULL,
    EndTime REAL NOT NULL,
    PRIMARY KEY (InvoiceNum),
    CONSTRAINT LaunchpadSlot UNIQUE (Location, PortNum, StartDate, EndDate, StartTime, EndTime),
    FOREIGN KEY (ReserveID) REFERENCES Reservation (ReserveID),
    FOREIGN KEY (CargoID) REFERENCES Cargo (CargoID)
    ON DELETE SET NULL
    ON UPDATE SET NULL,
    FOREIGN KEY (AstroID) REFERENCES Officer (AstroID)
    ON DELETE SET NULL
    ON UPDATE SET NULL
    );


CREATE TABLE IF NOT EXISTS CrewShipment(
    AstroID INT NOT NULL,
    InvoiceNum INT NOT NULL,
    PRIMARY KEY (AstroID, InvoiceNum),
    FOREIGN KEY (AstroID) REFERENCES Crew (AstroID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (InvoiceNum) REFERENCES ShipmentLaunchpadSlot (InvoiceNum)

    );

CREATE TABLE IF NOT EXISTS Passenger(
    AstroID INT NOT NULL,
    RequiresAssistance CHAR(3),
    PRIMARY KEY (AstroID),
    FOREIGN KEY (AstroID) REFERENCES Astronaut (AstroID)
    ON DELETE CASCADE
    ON UPDATE CASCADE

    );

CREATE TABLE IF NOT EXISTS CarryPassengerShipment(
    AstroID INT NOT NULL,
    InvoiceNum INT NOT NULL,
    PRIMARY KEY (AstroID, InvoiceNum),
    FOREIGN KEY (AstroID) REFERENCES Crew (AstroID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (InvoiceNum) REFERENCES ShipmentLaunchpadSlot (InvoiceNum)

    );

commit;