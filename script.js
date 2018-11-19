const bodyParser = require('body-parser');
const express = require('express');
let mysql = require('mysql');
const app = express();

app.set('view engine','ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use("/assets",express.static(__dirname + "/assets"));
app.use("/images",express.static(__dirname + "/images"));

app.get('/', function (req, res) {
  var err_msg = "";
  res.render('index', {err_msg: err_msg});
})


app.post('/', function (req, res) {
	// res.render('index');
  	var username = req.body.user;
  	var password = req.body.pass;
  	// console.log(username);
  	// console.log(password);
  	let con = mysql.createConnection({
  		host: '138.68.57.55',
  		port: 3306,
  		user: username,
  		password: password,
		database: "MarsSpacePortAdministration"
	});

  	con.connect(function(err) {
    	if (err) {
			console.log(err);
			var err_msg = "Permission denied. Please try again.";
			res.render('index', {err_msg: err_msg});
    	} else {
		var table = [];
		console.log('officer rendered');
		let sql = "select * from Astronaut";
    	con.query(sql, function (err, result) {
        	if (err) throw err;
			//console.log(table);
			res.render('officer', {table: result});
		});

		// Astronaut Queries

		app.post('/astro', function (req, res){
			//	console.log('got request');
			var astroID = req.body.AstroID;
			var name = req.body.Name;
			if ((astroID == undefined && name == undefined) || (astroID == "" && name == "")) { // || (name=="" && isNaN(astroID))
				sql = "select * from Astronaut";
			} else {
				sql = "select *  from Astronaut where ";
				if (astroID != "") sql += "AstroID = " + astroID + " AND ";
				if (name != "") sql += "Name = '" + name + "'" + " AND ";
				sql = sql.slice(0, -5);
			}
			console.log(sql);
			con.query(sql, function (err, result) {
                if (err) { 
                	let result = {};
                }
                //console.log(table);
                res.render('officer', {table: result});
			});
		});

		app.post('/deleteAstro', function (req, res){
			// console.log("deleteClicked")
			var astroID = req.body.AstroID;
			// console.log(astroID);
		
			sql = "delete from Astronaut where AstroID = "+astroID;
			console.log(sql);
            con.query(sql, function (err, result) {
                if (err) { 
                	let result = {};
                }
                //console.log(table);
				con.query("select * from Astronaut", function(err, result){
					if (err) throw err;
					res.render('officer', {table: result});
				})
			});
		});

		app.post('/astroInsert', function (req, res){
			//	console.log('got request');
			var astroID = req.body.AstroID;
			var name = req.body.Name;
			if ((astroID == undefined && name == undefined) || (astroID == "")) { // || (name=="" && isNaN(astroID))
				sql = "select * from Astronaut";
			} else {
				sql = "insert into Astronaut (AstroID, Name) Values ";
				sql += "(" + astroID + ", \"";
				sql += name + "\")"
			}
			console.log(sql);
			con.query(sql, function (err, result) {
                if (err) { 
                	let result = {};
                }
                //console.log(table);
				con.query("select * from Astronaut", function(err, result){
					if (err) throw err;
					res.render('officer', {table: result});
				})
			});
		});

		app.post('/astroUpdate', function (req, res){
			//	console.log('got request');
			var astroID = req.body.AstroID;
			var name = req.body.NewName;
			if ((astroID == undefined && name == undefined) || (astroID == "" && name == "")) { // || (name=="" && isNaN(astroID))
				sql = "select * from Astronaut";
			} else {
				sql = "update Astronaut set name = \"";
				if (name != "") sql += name + "\" where ";
				if (astroID != "") sql += "AstroID = " + astroID;
			}
			console.log(sql);
			con.query(sql, function (err, result) {
                if (err) { 
                	let result = {};
                }
                //console.log(table);
				con.query("select * from Astronaut", function(err, result){
					if (err) throw err;
					res.render('officer', {table: result});
				})
			});
		});

		// Company Queries

		app.post('/company', function (req, res){
			//	console.log('got request');
			var companyID = req.body.companyID;
			var name = req.body.Name;
			if ((companyID == undefined && name == undefined) || (companyID == "" && name == "")) { // || (name=="" && isNaN(astroID))
				sql = "select * from Company";
			} else {
				sql = "select *  from Company where ";
				if (companyID != "") sql += "CompanyID = " + companyID + " AND ";
				if (name != "") sql += "Name = '" + name + "'" + " AND ";
				sql = sql.slice(0, -5);
			}
			console.log(sql);
			con.query(sql, function (err, result) {
                if (err) { 
                	let result = {};
                }
                //console.log(table);
                res.render('company', {table: result});
			});
		});

		app.post('/companyCrew', function (req, res){
			//	console.log('got request');
			var companyID = req.body.companyID;
			if ((companyID == undefined) || (companyID == "")) {
				sql = "select * from Crew c, Astronaut a where c.AstroID = a.AstroID";
			} else {
				sql = "select * from Crew c, Astronaut a where ";
				sql += "c.AstroID = a.AstroID and "
				sql += "c.CompanyID = " + companyID;
			}
			console.log(sql);
			con.query(sql, function (err, result) {
                if (err) throw err;
                //console.log(table);
                res.render('company', {table: result});
			});
		});
		
		app.post('/companyRocket', function(req, res){
			var companyID = req.body.companyID;
			if ((companyID == undefined) || (companyID == "")) {
				sql = "select * from Rocket r, Company c where r.companyID = c.companyID";
			} else {
				sql = "select * from Rocket r, Company c where ";
				sql += "c.companyID = r.companyID AND r.companyID =" + companyID;
			}
			console.log(sql);
			con.query(sql, function (err, result) {
                if (err) throw err;
                //console.log(table);
                res.render('company', {table: result});
			});
		});

		app.post('/companyValue', function (req, res){
			//	console.log('got request');
			// var companyID = req.body.companyID;
			// if ((companyID == undefined) || (companyID == "")) {
			// 	sql = "select * from Company";
			// } else {
				sql = "select cm.CompanyID, cm.Name, Sum(value) AS SumOfValue from Company cm, Cargo c where ";
				sql += "cm.CompanyID = c.CompanyID";
				sql += " group by CompanyID Order by SumOfValue";
			// }
			console.log(sql);
			con.query(sql, function (err, result) {
                if (err) throw err;
                //console.log(table);
                res.render('company', {table: result});
			});
		});

		app.post('/rocketWeight', function(req, res){
			var capacity = req.body.capacity;
			// console.log(capacity);

			if ((capacity == undefined) || (capacity == "")) { // || (name=="" && isNaN(astroID))
				sql = "select R.RocketID, R.Model, R.Capacity, C.Name As Company from Rocket R, Company C where C.CompanyID = R.CompanyID";
			} else {
				sql = "select R.RocketID, R.Model, R.Capacity, C.Name As Company from Rocket R, Company C where C.CompanyID = R.CompanyID AND ";
				if (capacity != "") sql += "Capacity > "+ capacity;
			}
			// console.log(sql);
			con.query(sql, function (err, result) {
                if (err) { 
                	let result = {};
                }
				//console.log(table);
                res.render('company', {table: result}); // officer need to be changed to company view
			});
		});

		// Shipment Queries

		app.post('/shipment', function (req, res){
			//	console.log('got request');
			var invoiceNum = req.body.invoice;
			if ((invoiceNum == undefined) || (invoiceNum == "")) { // || (name=="" && isNaN(astroID))
				sql = "select S.InvoiceNum, CargoType, weight, StartDate, EndDate, StartTime, Endtime from Cargo C, ShipmentLaunchpadSlot S where S.CargoID = C.CargoID;";
			} else {
				sql = "select S.InvoiceNum, CargoType, weight, StartDate, EndDate, StartTime, Endtime from Cargo C, ShipmentLaunchpadSlot S where S.CargoID = C.CargoID AND ";
				sql += "InvoiceNum = " + invoiceNum;
			}
			console.log(sql);
			con.query(sql, function (err, result) {
                if (err) { 
                	let result = {};
                }
				// console.log(Object.keys(result[0]));
				res.render('shipment', 
				{
					table: result,
				});
			});
		});

		app.post('/shipmentDeparted', function (req, res){
				console.log('got request');
			var CID = req.body.dest;
			console.log(CID);
			if ((CID == undefined) || (CID == "")) { // || (name=="" && isNaN(astroID))
				sql = "SELECT Invoicenum, Destination, Location as Departure, PortNum FROM ShipmentLaunchpadSlot S JOIN Reservation R ON S.ReserveID = R.ReserveID";
			} else {
				sql = "SELECT Invoicenum, Destination, Location as Departure, PortNum FROM ShipmentLaunchpadSlot S JOIN Reservation R ON S.ReserveID = R.ReserveID WHERE ";
				sql += "Destination = '" + CID + "';";
			}
			console.log(sql);
			con.query(sql, function (err, result) {
                if (err) { 
                	let result = {};
                }
				// console.log(Object.keys(result[0]));
				res.render('shipment', 
				{
					table: result,});
			});
		});

		
		// Reservation

		app.post('/reqAssistance', function (req, res){

			//	console.log('got request');
			var invoiceNum = req.body.InvoiceNum;
			// console.log(invoiceNum);
			if ((invoiceNum == undefined) || (invoiceNum == "")) { // || (name=="" && isNaN(astroID))
				sql = "select p.AstroID, a.Name, p.requiresAssistance, s.invoiceNum from ShipmentLaunchpadSlot s, CarryPassengerShipment c, Passenger p, Astronaut a where ";
				sql += "s.InvoiceNum = c.InvoiceNum and c.AstroID = p.AstroID And a.AstroID = p.AstroID;";
			} else {
				sql = "select p.AstroID, a.Name, p.requiresAssistance, s.invoiceNum from ShipmentLaunchpadSlot s, CarryPassengerShipment c, Passenger p, Astronaut a where ";
				sql += "s.InvoiceNum = c.InvoiceNum and c.AstroID = p.AstroID And a.AstroID = p.AstroID And s.InvoiceNum = " + invoiceNum  + ";";
			}
			console.log(sql);
			con.query(sql, function (err, result) {
                if (err) { 
                	let result = {};
                }
				// console.log(Object.keys(result[0]));
				res.render('shipment', 
				{
					table: result,
				});
			});
		});
		
				// Reservation
		app.post('/reservation', function (req, res){
			//	console.log('got request');
			var reqDate = req.body.reqDate;
			var destination = req.body.destination;
			var companyID = req.body.companyID;
			var RocketID = req.body.RocketID;
			if ((reqDate == undefined) || (reqDate == "")) { // || (name=="" && isNaN(astroID))
				sql = "select * from Rocket";
				con.query(sql, function (err, result) {
                	if (err) { 
                		let result = {};
                	}
					// console.log(Object.keys(result[0]));
					res.render('reservation', 
					{
						table: result,
						err_msg: ""
					});
				});
			} else {

				con.query("select count(*) from Rocket where CompanyID =" + companyID + " AND RocketID=" + RocketID, function(err, result){
					if (err) throw err;
					// console.log(result);
					if (result[0]['count(*)'] == 0) {
						var err_msg="The rocket you selected does not exist";
						con.query("select * from Rocket", function (err, result) {
		                	if (err) { 
		                		let result = {};
		                	}
							// console.log(Object.keys(result[0]));
							res.render('reservation', 
							{
								table: result,
								err_msg: err_msg
							});
						});
					} else {
						// console.log("select count(*) from Reservation where CompanyID=" + companyID + " AND " + "RequestedDate='" + reqDate + "' AND " + "RocketID=" + RocketID);
						con.query("select count(*) from Reservation where CompanyID=" + companyID + " AND " + "RequestedDate='" + reqDate + "' AND " + "RocketID=" + RocketID, 
							function(err, result) {
								if (err) throw err;
								// console.log(result)
								if (result[0]['count(*)'] > 0) {
									var err_msg = "The rocket you selected is occuppied.";
									con.query("select * from Rocket", function (err, result) {
					                	if (err) { 
					                		let result = {};
					                	}
										// console.log(Object.keys(result[0]));
										res.render('reservation', 
										{
											table: result,
											err_msg: err_msg
										});
									});
								} else {
									
											function randomInt(low, high) {
  												return Math.floor(Math.random() * (high - low) + low);
											}



											var ReserveID = randomInt(100000,999999);
											sql = "INSERT INTO Reservation(ReserveID, RequestedDate, Destination, CompanyID, RocketID) VALUES(" + ReserveID + ", '"
												+ reqDate + "','" + destination + "'," + companyID + "," + RocketID + ");";

											// sql += "DROP VIEW successReserve; Create view successReserve as select * from Reservation where ReserveID=" + ReserveID;

											// sql += "; select * from successReserve;";

											console.log(sql);
											con.query(sql, function (err, result) {
								                con.query("DROP VIEW successReserve;", function(err, result) {
								                	con.query("Create view successReserve as select * from Reservation where ReserveID=" + ReserveID, function(err, result) {
								                		con.query("select * from successReserve", function(err, result) {
								                			if (err) { 
											                	let result = {};
											                }
											                var err_msg = "reservation success!"
											                // console.log(result);
															// console.log(Object.keys(result[0]));
															res.render('reservation', 
															{
																table: result,
																err_msg: err_msg
															});
								                		});

								                	});

								                });
								                
											});
								}
								
						});
					}
					
				});

			}
		});
    }
  });
})

app.listen(8080, function () {
  console.log('Example app listening on port 8080!')
})
