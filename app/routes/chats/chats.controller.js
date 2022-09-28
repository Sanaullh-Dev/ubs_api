const sql = require("../../config/db.connection.js");


// Get Main Category
exports.history = (req, res) => {
  
  if(!req.query.userId1 || !req.query.userId2){
    return res.status(400).send({
      message : "Between 2 Users are can't be empty"
    });
  }
  var userId1 = req.query.userId1;
  var userId2 = req.query.userId2;

  let query = `SELECT * FROM chats_info where (user_from = ${userId1} AND user_to = ${userId2}) OR (user_from = ${userId2} AND user_to = ${userId1}) ORDER BY chat_date`;

  sql.query(query, (err, result) => {
    if (err) {
      // console.log("Error :" ,err);
      return res.status(500).send({
        message: " Some error on find all Charts data",
      });
    }
    // console.log("Booking_Data : " , result);
    return res.status(200).send(result);
  });
};


// Get Last Seen user
exports.lastSeen = (req, res) => {
  if(!req.query.userId){
    return res.status(400).send({
      message : "User can't be empty"
    });
  }

  var userId = req.query.userId;

  let query = `SELECT chat_date as lastSeen FROM chats_info WHERE user_from = ${userId} OR user_to = ${userId} ORDER BY chat_date DESC limit 1`;

  sql.query(query, (err, result) => {
    if (err) {
      // console.log("Error :" ,err);
      return res.status(500).send({
        message: " Some error on find all Chats data",
      });
    }
    // console.log("Booking_Data : " , result);
    return res.status(200).send(result);
  });

};



// Message Send save message
exports.messageSend = (req, res) => {

  
  if (!req.body)
    res.status(400).send({
      message: " Content can't be Empty !",
  });

    const messageData = [
      new Date(req.body.chatDate),
      req.body.message,
      req.body.FromUser,
      req.body.ToUser,
      "send"
    ];

  const column =
    "chat_date, message, user_from, user_to, chat_status";

  let sqlQuery = `INSERT INTO chats_info(${column}) VALUES(?,?,?,?,?)`;
  
  sql.query(sqlQuery, messageData, (err, result) => {
    if (err) {
      console.log("error : ", err);
      return res.status(500).send({
        message:
          "Some error occurred while creating the Message" || err.message,
      });
    } else {
      // console.log(result.insertId);
      return res.send({ id: result.insertId, result: result });
    }
  });

}