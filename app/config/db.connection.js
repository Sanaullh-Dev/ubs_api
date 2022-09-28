const mysql = require("mysql");
const dbconfig = require("./db.config.js");

// Create a conneaction to the database
const conn = mysql.createConnection({
    host : dbconfig.host,
    user : dbconfig.user,
    password : dbconfig.password,
    database : dbconfig.database,
    port : dbconfig.port,
    connectTimeout: 30000
});

conn.connect(error => {
    if(error) throw error;
    console.log("Successfully connected to the database");
});

module.exports = conn;
