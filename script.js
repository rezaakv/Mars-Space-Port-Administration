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
			console.log("deleteClicked")
			var astroID = req.body.AstroID;
			console.log(astroID);
		
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
			if ((astroID == undefined && name == undefined) || (astroID == "" && name == "")) { // || (name=="" && isNaN(astroID))
				sql = "select * from Astronaut";
			} else {
				sql = "insert into Astronaut (AstroID, Name) Values ";
				if (astroID != "") sql += "(" + astroID + ", \"";
				if (name != "") sql += name + "\")"
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
				sql = "select RocketID from Rocket, Company";
			} else {
				sql = "select RocketID from Rocket, Company where ";
				sql += "Company.companyID = Rocket.companyID AND Rocket.companyID =" + companyID;
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
				sql = "select cm.CompanyID, cm.Name, Sum(value) from Company cm, Cargo c where ";
				sql += "cm.CompanyID = c.CompanyID";
				sql += " group by CompanyID ";
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
				sql = "select * from Rocket";
			} else {
				sql = "select * from Rocket where ";
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
				sql = "select * from ShipmentLaunchpadSlot";
			} else {
				sql = "select *  from ShipmentLaunchpadSlot where ";
				sql += "InvoiceNum = " + invoiceNum;
				sql = sql.slice(0, -5);
			}
			console.log(sql);
			con.query(sql, function (err, result) {
                if (err) { 
                	let result = {};
                }
				console.log(Object.keys(result[0]));
				res.render('shipment', 
				{
					table: result,
				});
			});
		});

		
		// Reservation
		app.post('/reservation', function (req, res){
			//	console.log('got request');
			var invoiceNum = req.body.invoice;
			if ((invoiceNum == undefined) || (invoiceNum == "")) { // || (name=="" && isNaN(astroID))
				sql = "select * from Reservation";
			} else {
				sql = "select *  from ShipmentLaunchpadSlot where ";
				sql += "InvoiceNum = " + invoiceNum;
				sql = sql.slice(0, -5);
			}
			console.log(sql);
			con.query(sql, function (err, result) {
                if (err) { 
                	let result = {};
                }
				console.log(Object.keys(result[0]));
				res.render('reservation', 
				{
					table: result,
				});
			});
		});
    }
  });
})

app.listen(8080, function () {
  console.log('Example app listening on port 8080!')
})

