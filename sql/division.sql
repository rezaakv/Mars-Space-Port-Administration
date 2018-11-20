devision.sql

create view a as select distinct Rocket.RocketID, Res.Destination from Reservation Res, Rocket where Res.Destination = "Vancouver" OR Res.Destination = "MarsCity" OR Res.Destination = "Sweden";
create view b as select distinct Res.RocketID, Res.Destination from Reservation Res  where Res.Destination = "Vancouver" OR Res.Destination = "MarsCity" OR Res.Destination = "Sweden";
select r.RocketID from Rocket r where r.RocketID not in (select a.RocketID as RocketID from a left join b on (a.RocketID = b.RocketID and a.Destination = b.Destination) where b.RocketID is null);