SELECT *
From Company;

SELECT * 
FROM Rocket;

SELECT * 
FROM Astronaut;

SELECT *
FROM ShipmentLaunchpadSlot;


INSERT INTO Company (CompanyId, Name)
VALUES ('13322','SpaceXI');

INSERT INTO Rocket (RocketID, Model, Capacity, CompanyID)
VALUES ('7223', 'BFR-03', '3000', '13322');

SELECT Cm.CompanyID, sum(capacity)
FROM Rocket R, Company Cm
WHERE R.CompanyID = Cm.CompanyID
GROUP BY CompanyID;

SELECT * 
FROM Crewview;
