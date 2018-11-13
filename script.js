const bodyParser = require('body-parser');
const express = require('express');
let mysql = require('mysql');
const app = express();

app.set('view engine','ejs');
app.use(bodyParser.urlencoded({ extended: true }));

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
	var err_msg = "Permission denied. Please try again.";
	res.render('index', {err_msg: err_msg});
    } else { res.render('officer');}
  	// let sql = "select * from Astronaut";
  	// con.query(sql, function (err, result) {
  	// if (err) throw err;
  	// res.send(result);
    // });
  });
})

app.listen(8080, function () {
  console.log('Example app listening on port 3000!')
})

