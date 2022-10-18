// module.exports = {
//     HOST : "localhost",
//     USER : "root",
//     PASSWORD : "Sanaulla0405",
//     PASSWORD : "Shakti@123",
//     DB : "ubs"
// }

// online database free sql database
// module.exports = {
//     host : "sql6.freesqldatabase.com",
//     user : "sql6522714",
//     password : "hNY39EPh6g",
//     database : "sql6522714",
//     port : 3306
// }

const dotenv = require("dotenv");
dotenv.config();

// AWS mysql database
module.exports = {
  host: "3.92.227.92",
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_SECRET,
  database: process.env.MYSQL_DB,
  port: process.env.RDS_PORT,
};


// host: process.env.DBHOST,
// user: process.env.USER,
// password: process.env.PASSWORD,
// database: process.env.DATABASE,
// port: process.env.PORT,