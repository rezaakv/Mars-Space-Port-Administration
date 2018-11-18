SELECT RocketID, capacity
FROM Rocket
WHERE capacity > '700';


SELECT A.AstroID, A.Name
FROM Crew C, Astronaut A, Company Cm
WHERE C.AstroID = A.AstroID AND Cm.CompanyID = C.CompanyID 
				AND Cm.Name = 'Ledner LLC';
                

INSERT INTO Rocket (RocketID, Model, Capacity, CompanyID)
VALUES ('7263', 'BFR-03', '3000', '1105');


DELETE FROM Astronaut
WHERE AstroID = '114550';

UPDATE Rocket
SET Model= 'BFR-04', Capacity= '3500'
WHERE RocketID = '7263';


SELECT CargoType, weight, StartDate, EndDate, StartTime, Endtime
FROM Cargo, ShipmentLaunchpadSlot
WHERE invoiceNum = '635128';

SELECT R.RocketID
FROM Rocket R, Company C
WHERE R.CompanyID = C.CompanyID AND C.Name = 'SpaceXI';

SELECT C.CompanyID, sum(weight)
FROM Cargo C, Company Cm
WHERE C.CompanyID = Cm.CompanyID
GROUP BY CompanyID;
--need testing
INSERT INTO Reservation(ReserveID, RequestedDate, Destination, CompanyID, RocketID)
VALUES('5356787', '2080-10-29', 'MarsCity', '100906', '906023');
--need testing
SELECT Invoicenum
FROM ShipmentLaunchpadSlot S JOIN Reservation R
ON S.ReserveID = R.ReserveID
WHERE Destination = 'MarsCity';
--need testing
SELECT P.AstroID, RequiresAssistance
FROM CarryPassengerShipment C JOIN Passenger P
ON C.AstroID = P.AstroID
WHERE RequiresAssistance IS NOT NULL AND invoicenum = '22334';


Create View Crewview AS
 SELECT CompanyID, CargoID, CargoType, weight
 From Cargo;







