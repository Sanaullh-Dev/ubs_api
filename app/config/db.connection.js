const mysql = require("mysql");
const dbconfig = require("./db.config.js");

// Create a conneaction to the database
const conn = mysql.createConnection({
    host : dbconfig.HOST,
    user : dbconfig.USER,
    password : dbconfig.PASSWORD,
    database : dbconfig.DB
});

conn.connect(error => {
    if(error) throw error;
    console.log("Successfully connected to the database");
});

module.exports = conn;
