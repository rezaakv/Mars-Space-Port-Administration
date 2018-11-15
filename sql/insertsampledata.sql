#
# TABLE STRUCTURE FOR: Astronaut
#



INSERT INTO `Astronaut` (`AstroID`, `Name`) VALUES (106850, 'Briana Pagac MD');
INSERT INTO `Astronaut` (`AstroID`, `Name`) VALUES (114550, 'Alexandrine Satterfield');
INSERT INTO `Astronaut` (`AstroID`, `Name`) VALUES (120918, 'Lela Hyatt MD');
INSERT INTO `Astronaut` (`AstroID`, `Name`) VALUES (128410, 'Jackson Ritchie');
INSERT INTO `Astronaut` (`AstroID`, `Name`) VALUES (161923, 'Graham Bartoletti');
INSERT INTO `Astronaut` (`AstroID`, `Name`) VALUES (204561, 'Violet Crist III');
INSERT INTO `Astronaut` (`AstroID`, `Name`) VALUES (238178, 'Miss Celine Gleason DVM');
INSERT INTO `Astronaut` (`AstroID`, `Name`) VALUES (242997, 'Alysa Robel');
INSERT INTO `Astronaut` (`AstroID`, `Name`) VALUES (246625, 'Prof. Haskell Herman Jr.');
INSERT INTO `Astronaut` (`AstroID`, `Name`) VALUES (277496, 'Jeffrey Runte');

#
# TABLE STRUCTURE FOR: Company
#



INSERT INTO `Company` (`CompanyID`, `Name`) VALUES (1105, 'Ledner LLC');
INSERT INTO `Company` (`CompanyID`, `Name`) VALUES (1159, 'Koelpin and Sons');
INSERT INTO `Company` (`CompanyID`, `Name`) VALUES (3328, 'Ryan, O\'Connell and Herzog');
INSERT INTO `Company` (`CompanyID`, `Name`) VALUES (4549, 'Hackett, Torphy and Emard');
INSERT INTO `Company` (`CompanyID`, `Name`) VALUES (6633, 'Kling-Abbott');
INSERT INTO `Company` (`CompanyID`, `Name`) VALUES (7059, 'Block, Waelchi and Hammes');
INSERT INTO `Company` (`CompanyID`, `Name`) VALUES (7718, 'Moore, Goldner and Halvorson');
INSERT INTO `Company` (`CompanyID`, `Name`) VALUES (8221, 'Beahan Group');
INSERT INTO `Company` (`CompanyID`, `Name`) VALUES (8988, 'Hodkiewicz PLC');
INSERT INTO `Company` (`CompanyID`, `Name`) VALUES (9153, 'Prosacco Ltd');

#
# TABLE STRUCTURE FOR: Crew
#



INSERT INTO `Crew` (`AstroID`, `CompanyID`) VALUES (106850, 1105);
INSERT INTO `Crew` (`AstroID`, `CompanyID`) VALUES (114550, 1159);
INSERT INTO `Crew` (`AstroID`, `CompanyID`) VALUES (120918, 3328);
INSERT INTO `Crew` (`AstroID`, `CompanyID`) VALUES (128410, 4549);
INSERT INTO `Crew` (`AstroID`, `CompanyID`) VALUES (161923, 6633);
INSERT INTO `Crew` (`AstroID`, `CompanyID`) VALUES (204561, 7059);
INSERT INTO `Crew` (`AstroID`, `CompanyID`) VALUES (238178, 7718);
INSERT INTO `Crew` (`AstroID`, `CompanyID`) VALUES (242997, 8221);
INSERT INTO `Crew` (`AstroID`, `CompanyID`) VALUES (246625, 8988);
INSERT INTO `Crew` (`AstroID`, `CompanyID`) VALUES (277496, 9153);

#

#
# TABLE STRUCTURE FOR: Rocket
#



INSERT INTO `Rocket` (`RocketID`, `Model`, `Capacity`, `CompanyID`) VALUES (89411, '#00cccc', '1235.64', 8221);
INSERT INTO `Rocket` (`RocketID`, `Model`, `Capacity`, `CompanyID`) VALUES (105083, '#00eebb', '533.31', 8988);
INSERT INTO `Rocket` (`RocketID`, `Model`, `Capacity`, `CompanyID`) VALUES (116331, '#00bbcc', '1056.68', 9153);
INSERT INTO `Rocket` (`RocketID`, `Model`, `Capacity`, `CompanyID`) VALUES (131529, '#00ee66', '1354.94', 4549);
INSERT INTO `Rocket` (`RocketID`, `Model`, `Capacity`, `CompanyID`) VALUES (148759, '#00ccdd', '1109.11', 6633);
INSERT INTO `Rocket` (`RocketID`, `Model`, `Capacity`, `CompanyID`) VALUES (221060, '#00ee99', '726.84', 1159);
INSERT INTO `Rocket` (`RocketID`, `Model`, `Capacity`, `CompanyID`) VALUES (260439, '#003355', '407.16', 3328);
INSERT INTO `Rocket` (`RocketID`, `Model`, `Capacity`, `CompanyID`) VALUES (270344, '#0033aa', '691.68', 7718);
INSERT INTO `Rocket` (`RocketID`, `Model`, `Capacity`, `CompanyID`) VALUES (413578, '#005566', '892.2', 7059);
INSERT INTO `Rocket` (`RocketID`, `Model`, `Capacity`, `CompanyID`) VALUES (471646, '#00ee77', '613.7', 1105);


# TABLE STRUCTURE FOR: Reservation
#



INSERT INTO `Reservation` (`ReserveID`, `RequestedDate`, `Destination`, `CompanyID`, `RocketID`) VALUES (100520, '1987-01-17', 'Norway', 1159, 105083);
INSERT INTO `Reservation` (`ReserveID`, `RequestedDate`, `Destination`, `CompanyID`, `RocketID`) VALUES (110029, '1978-05-22', 'British Indian Ocean Territory', 3328, 116331);
INSERT INTO `Reservation` (`ReserveID`, `RequestedDate`, `Destination`, `CompanyID`, `RocketID`) VALUES (124905, '2001-09-16', 'Christmas Island', 8988, 413578);
INSERT INTO `Reservation` (`ReserveID`, `RequestedDate`, `Destination`, `CompanyID`, `RocketID`) VALUES (194459, '2001-01-10', 'Niger', 6633, 148759);
INSERT INTO `Reservation` (`ReserveID`, `RequestedDate`, `Destination`, `CompanyID`, `RocketID`) VALUES (254163, '2010-05-08', 'Equatorial Guinea', 7718, 260439);
INSERT INTO `Reservation` (`ReserveID`, `RequestedDate`, `Destination`, `CompanyID`, `RocketID`) VALUES (257995, '2009-12-07', 'Marshall Islands', 1105, 89411);
INSERT INTO `Reservation` (`ReserveID`, `RequestedDate`, `Destination`, `CompanyID`, `RocketID`) VALUES (265454, '1975-04-05', 'Zimbabwe', 9153, 471646);
INSERT INTO `Reservation` (`ReserveID`, `RequestedDate`, `Destination`, `CompanyID`, `RocketID`) VALUES (327437, '1999-05-17', 'Egypt', 7059, 221060);
INSERT INTO `Reservation` (`ReserveID`, `RequestedDate`, `Destination`, `CompanyID`, `RocketID`) VALUES (334509, '1985-06-24', 'Cuba', 4549, 131529);
INSERT INTO `Reservation` (`ReserveID`, `RequestedDate`, `Destination`, `CompanyID`, `RocketID`) VALUES (335348, '2012-10-18', 'Antigua and Barbuda', 8221, 270344);

#
# TABLE STRUCTURE FOR: Cargo
#



INSERT INTO `Cargo` (`CargoID`, `CargoType`, `Weight`, `Value`, `CompanyID`) VALUES (109640, 'LightCoral', 27827, 1384109, 7059);
INSERT INTO `Cargo` (`CargoID`, `CargoType`, `Weight`, `Value`, `CompanyID`) VALUES (166072, 'Orange', 74780, 2162459, 7718);
INSERT INTO `Cargo` (`CargoID`, `CargoType`, `Weight`, `Value`, `CompanyID`) VALUES (190220, 'HoneyDew', 56361, 683056, 8988);
INSERT INTO `Cargo` (`CargoID`, `CargoType`, `Weight`, `Value`, `CompanyID`) VALUES (205012, 'Navy', 77419, 4637060, 4549);
INSERT INTO `Cargo` (`CargoID`, `CargoType`, `Weight`, `Value`, `CompanyID`) VALUES (216224, 'PaleVioletRed', 98831, 1519758, 3328);
INSERT INTO `Cargo` (`CargoID`, `CargoType`, `Weight`, `Value`, `CompanyID`) VALUES (250213, 'GoldenRod', 69956, 370765, 8221);
INSERT INTO `Cargo` (`CargoID`, `CargoType`, `Weight`, `Value`, `CompanyID`) VALUES (264853, 'LightGray', 6295, 2788036, 6633);
INSERT INTO `Cargo` (`CargoID`, `CargoType`, `Weight`, `Value`, `CompanyID`) VALUES (280254, 'MediumAquaMarine', 23285, 1097510, 1105);
INSERT INTO `Cargo` (`CargoID`, `CargoType`, `Weight`, `Value`, `CompanyID`) VALUES (324186, 'DarkSlateGray', 53518, 357417, 9153);
INSERT INTO `Cargo` (`CargoID`, `CargoType`, `Weight`, `Value`, `CompanyID`) VALUES (345594, 'Cornsilk', 75677, 1866297, 1159);

#
# TABLE STRUCTURE FOR: Officer
#



INSERT INTO `Officer` (`AstroID`) VALUES (106850);
INSERT INTO `Officer` (`AstroID`) VALUES (114550);
INSERT INTO `Officer` (`AstroID`) VALUES (120918);

#
# TABLE STRUCTURE FOR: ShipmentLaunchpadSlot
#



INSERT INTO `ShipmentLaunchpadSlot` (`InvoiceNum`, `ReserveID`, `CargoID`, `Cost`, `AstroID`, `Location`, `PortNum`, `StartDate`, `EndDate`, `StartTime`, `EndTime`) VALUES (399763, 100520, 109640, '197719285.78', 106850, '38839 Angelita Loop Suite 531\nGorczanyville, MA 05923', 0, '1997-03-17', '2004-12-02', '16', '15');
INSERT INTO `ShipmentLaunchpadSlot` (`InvoiceNum`, `ReserveID`, `CargoID`, `Cost`, `AstroID`, `Location`, `PortNum`, `StartDate`, `EndDate`, `StartTime`, `EndTime`) VALUES (635128, 110029, 166072, '62527870.7', 114550, '0129 Spinka Neck\nNew Ruby, MI 59599', 0, '1981-10-08', '1981-11-16', '23', '17');
INSERT INTO `ShipmentLaunchpadSlot` (`InvoiceNum`, `ReserveID`, `CargoID`, `Cost`, `AstroID`, `Location`, `PortNum`, `StartDate`, `EndDate`, `StartTime`, `EndTime`) VALUES (655299, 124905, 190220, '782065644.49', 120918, '7815 Katharina Summit Suite 806\nWilkinsonville, AL 51763-3244', 0, '1982-07-06', '2001-11-07', '19', '0');





#
# TABLE STRUCTURE FOR: CrewShipment
#



INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (106850, 399763);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (106850, 635128);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (114550, 635128);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (114550, 655299);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (120918, 399763);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (120918, 655299);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (128410, 399763);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (128410, 635128);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (161923, 635128);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (161923, 655299);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (204561, 399763);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (204561, 655299);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (238178, 399763);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (238178, 635128);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (242997, 635128);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (242997, 655299);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (246625, 399763);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (246625, 655299);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (277496, 399763);
INSERT INTO `CrewShipment` (`AstroID`, `InvoiceNum`) VALUES (277496, 635128);




#
# TABLE STRUCTURE FOR: Passenger
#



INSERT INTO `Passenger` (`AstroID`, `RequiresAssistance`) VALUES (106850, '');
INSERT INTO `Passenger` (`AstroID`, `RequiresAssistance`) VALUES (114550, '1');
INSERT INTO `Passenger` (`AstroID`, `RequiresAssistance`) VALUES (120918, '');
INSERT INTO `Passenger` (`AstroID`, `RequiresAssistance`) VALUES (128410, '');


#
# TABLE STRUCTURE FOR: CarryPassengerShipment
#


INSERT INTO `CarryPassengerShipment` (`AstroID`, `InvoiceNum`) VALUES (106850, 399763);
INSERT INTO `CarryPassengerShipment` (`AstroID`, `InvoiceNum`) VALUES (114550, 635128);
INSERT INTO `CarryPassengerShipment` (`AstroID`, `InvoiceNum`) VALUES (120918, 655299);
INSERT INTO `CarryPassengerShipment` (`AstroID`, `InvoiceNum`) VALUES (128410, 399763);
INSERT INTO `CarryPassengerShipment` (`AstroID`, `InvoiceNum`) VALUES (161923, 635128);
INSERT INTO `CarryPassengerShipment` (`AstroID`, `InvoiceNum`) VALUES (204561, 655299);
INSERT INTO `CarryPassengerShipment` (`AstroID`, `InvoiceNum`) VALUES (238178, 399763);
INSERT INTO `CarryPassengerShipment` (`AstroID`, `InvoiceNum`) VALUES (242997, 635128);
INSERT INTO `CarryPassengerShipment` (`AstroID`, `InvoiceNum`) VALUES (246625, 655299);
INSERT INTO `CarryPassengerShipment` (`AstroID`, `InvoiceNum`) VALUES (277496, 399763);






