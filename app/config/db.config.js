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
  host: "%",
  user: "ec2-user",
  password: "Sana#0405",
  database: "ubs",
  port: "3306",
};


// host: process.env.DBHOST,
// user: process.env.USER,
// password: process.env.PASSWORD,
// database: process.env.DATABASE,
// port: process.env.PORT,