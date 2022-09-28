const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require("path");
const PORT = process.env.PORT || 8080;

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// --- this line code for assets public access
app.use("/assets",express.static('assets'));
app.use("/upload",express.static('upload'));


var corsOptions = {
  origin: "http://localhost:4200",
  credentials: true,
};
app.use(cors(corsOptions));

app.use(function (req, res, next) {
  //Enabling CORS
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept, x-client-key, x-client-token, x-client-secret, Authorization"
  );
  next();
});



app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});

app.get("/", (req, res) => {
  res.json({ message: "Welcome into UBS API" });
});

var sql = require("./app/config/db.connection.js")

// main Routes
app.use("/", require("./app/routes/main.routes.js"));
