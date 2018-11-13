drop table CarryPassengerShipment;

drop table Passenger;

drop table CrewShipment;

drop table ShipmentLaunchpadSlot;

drop table Officer;

drop table Cargo;

drop table Crew;

drop table Reservation;

drop table Rocket;

drop table Astronaut;

drop table Company;

commit;

CREATE TABLE Astronaut(
    AstroID INT,
    Name VARCHAR(100),
    PRIMARY KEY (AstroID));

CREATE TABLE Company(
    CompanyID INT,
    Name VARCHAR(100),
    PRIMARY KEY (CompanyID));

-- CREATE TABLE AstronautShipment(
-- AstroID INT,
-- Invoice# INT,
-- PRIMARY KEY (AstroID, Invoice#),
-- FOREIGN KEY (AstroID) REFERENCES Astronaut(AstroID)
-- ON DELETE NO ACTION
-- ON UPDATE CASCADE,
-- FOREIGN KEY (Invoice#) REFERENCES ConfirmedShipment(Invoice#)
-- ON DELETE CASCADE
-- ON UPDATE NO ACTION
-- ) ;

CREATE TABLE Crew (
    AstroID INT,
    CompanyID INT,
    PRIMARY KEY (AstroID),
    FOREIGN KEY (AstroID) REFERENCES Astronaut ON DELETE CASCADE,
-- ON UPDATE CASCADE,
    FOREIGN KEY (CompanyID) REFERENCES Company ON DELETE SET NULL
-- ON UPDATE CASCADE
);

CREATE TABLE Rocket(
    RocketID INT,
    Model VARCHAR(100) NOT NULL,
    Capacity REAL,
    CompanyID INT,
    PRIMARY KEY (RocketID),
    FOREIGN KEY (CompanyID) REFERENCES Company
    ON DELETE SET NULL);

CREATE TABLE Reservation(
    ReserveID INT NOT NULL,
    RequestedDate DATE,
    Destination VARCHAR(30),
    CompanyID INT NOT NULL,
    RocketID INT NOT NULL,
    PRIMARY KEY (ReserveID),
    FOREIGN KEY (CompanyID) REFERENCES Company,
    FOREIGN KEY (RocketID) REFERENCES Rocket);

CREATE TABLE Cargo(
    CargoID INT,
    CargoType VARCHAR(100),
    Weight INT,
    Value INT,
    CompanyID INT,
    PRIMARY KEY (CargoID),
    FOREIGN KEY (CompanyID) REFERENCES Company ON DELETE SET NULL);


CREATE TABLE Officer(
    AstroID INT NOT NULL,
    PRIMARY KEY (AstroID),
    FOREIGN KEY (AstroID) REFERENCES Astronaut
    ON DELETE CASCADE);

CREATE TABLE ShipmentLaunchpadSlot(
    Invoice# INT,
    ReserveID INT,
    CargoID INT,
    Cost REAL,
    AstroID  INT,
    Location VARCHAR(100),
    Port# INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    StartTime REAL NOT NULL,
    EndTime REAL NOT NULL,
    PRIMARY KEY (Invoice#),
    CONSTRAINT LaunchpadSlot UNIQUE (Location, Port#, StartDate, EndDate, StartTime, EndTime),
    FOREIGN KEY (ReserveID) REFERENCES Reservation ON DELETE CASCADE,
    FOREIGN KEY (CargoID) REFERENCES Cargo,
    FOREIGN KEY (AstroID) REFERENCES Officer
-- ON UPDATE CASCADE
-- FOREIGN KEY (Port#, Location, StartDate, EndDate, StartTime, EndTime) REFERENCES LaunchpadSlot
-- ON DELETE NO ACTION
-- ON UPDATE NO ACTION,
);

CREATE TABLE CrewShipment(
    AstroID INT NOT NULL,
    Invoice# INT NOT NULL,
    PRIMARY KEY (AstroID, Invoice#),
    FOREIGN KEY (AstroID) REFERENCES Crew,
    FOREIGN KEY (Invoice#) REFERENCES ShipmentLaunchpadSlot ON DELETE CASCADE);

CREATE TABLE Passenger(
    AstroID INT NOT NULL,
    RequiresAssistance CHAR(3),
    PRIMARY KEY (AstroID),
    FOREIGN KEY (AstroID) REFERENCES Astronaut
    ON DELETE CASCADE);

CREATE TABLE CarryPassengerShipment(
    AstroID INT NOT NULL,
    Invoice# INT NOT NULL,
    PRIMARY KEY (AstroID, Invoice#),
    FOREIGN KEY (AstroID) REFERENCES Crew,
    FOREIGN KEY (Invoice#) REFERENCES ShipmentLaunchpadSlot ON DELETE CASCADE);

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