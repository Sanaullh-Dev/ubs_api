const mysql = require("mysql2");
const dbConfig = require("./db.config.js");

// Create a conneaction to the database
const conn = mysql.createConnection({
    host : dbConfig.host,
    user : dbConfig.user,
    password : dbConfig.password,
    database : dbConfig.database,
    port : dbConfig.port,
});

conn.connect(error => {
    if(error) throw error;
    console.log("Successfully connected to the database");
});

module.exports = conn;
