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
	//res.render('officer', {table: table})
	console.log('officer rendered');
	//console.log(con);
  	//app.get('/#', function (req, res){
	//	console.log('listening to officer')
		//console.log(con);
		let sql = "select * from Astronaut";
        	con.query(sql, function (err, result) {
                	if (err) throw err;
			//console.log(table);
			res.render('officer', {table: result});
		});
	//});
	//console.log(table)
	//res.render('officer', {table: table});

	app.post('/astro', function (req, res){
	//	console.log('got request');
		var astroID = req.body.AstroID;
		var name = req.body.Name;
		console.log(req.body)
		if (astroID == "" && name == "") {
			sql = "select * from Astronaut";
		} else {
			sql = "select *  from Astronaut where ";
			if (astroID != "") sql += "AstroID = " + astroID + " AND ";
			if (name != "") sql += "Name = '" + name + "'" + " AND ";
			sql = sql.slice(0, -5);
		}
		console.log(sql);
		con.query(sql, function (err, result) {
                        if (err) throw err;
                        //console.log(table);
                        res.render('officer', {table: result});
                });
	

	});
    }
  });
})

app.listen(8080, function () {
  console.log('Example app listening on port 8080!')
})

