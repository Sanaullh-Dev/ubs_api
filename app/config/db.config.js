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
  host: process.env.DBHOST,
  user: process.env.DBUSER,
  password: process.env.PASSWORD,
  database: process.env.DATABASE,
  port: process.env.PORT,
};
