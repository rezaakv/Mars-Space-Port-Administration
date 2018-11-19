-- D1
SELECT RocketID, capacity
FROM Rocket
WHERE capacity > '700';

-- D1
SELECT A.AstroID, A.Name
FROM Crew C, Astronaut A, Company Cm
WHERE C.AstroID = A.AstroID AND Cm.CompanyID = C.CompanyID 
				AND Cm.Name = 'Ledner LLC';
                
-- D2
INSERT INTO Rocket (RocketID, Model, Capacity, CompanyID)
VALUES ('7263', 'BFR-03', '3000', '3203');

-- D3
DELETE FROM Astronaut
WHERE AstroID = '104031';

-- D4
UPDATE Rocket
SET Model= 'BFR-04', Capacity= '3500'
WHERE RocketID = '14286';

-- D5
SELECT CargoType, weight, StartDate, EndDate, StartTime, Endtime
FROM Cargo, ShipmentLaunchpadSlot
WHERE invoiceNum = '416190';

-- D6 Run Helper for foreign key constraint
SELECT R.RocketID
FROM Rocket R, Company C
WHERE R.CompanyID = C.CompanyID AND C.Name = 'SpaceXI';

-- D7
SELECT C.CompanyID, sum(weight)
FROM Cargo C, Company Cm
WHERE C.CompanyID = Cm.CompanyID
GROUP BY CompanyID;

-- Extra Aggregation: Calculate the average capacity of rockets of all companies
SELECT Cm.CompanyID, avg(capacity)
FROM Rocket R, Company Cm
WHERE R.CompanyID = Cm.CompanyID
GROUP BY CompanyID;

-- D8
INSERT INTO Reservation(ReserveID, RequestedDate, Destination, CompanyID, RocketID)
VALUES('9836787', '2080-10-29', 'MarsCity', '13322', '14286');

INSERT INTO ShipmentLaunchpadSlot
VALUES('777', '5356787', '9999', '10000', NULL, 'PortKennedy', '24', '2035-04-03', '2035-04-06', '12', '5');

-- D9
SELECT Invoicenum
FROM ShipmentLaunchpadSlot S JOIN Reservation R
ON S.ReserveID = R.ReserveID
WHERE Destination = 'MarsCity';

-- D10
SELECT P.AstroID, RequiresAssistance
FROM CarryPassengerShipment C JOIN Passenger P
ON C.AstroID = P.AstroID
WHERE RequiresAssistance IS NOT NULL AND invoicenum = '318443';

-- D11
Create View Crewview AS
 SELECT CompanyID, CargoID, CargoType, weight
 From Cargo;



