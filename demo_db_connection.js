let mysql = require('mysql');

let con = mysql.createConnection({
  host: '138.68.57.55',
  port: 3306,
  user: "Qianqian",
  password: "Cpsc304!",
  database: "MarsSpacePortAdministration"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  let sql = "create table test(a int, b int)";
  con.query(sql, function (err, result) {
  if (err) throw err;
  console.log("1 table created");
  });
});
