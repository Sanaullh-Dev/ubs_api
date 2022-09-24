var router = require("express").Router();
const chatsController = require("./chats.controller.js");


// get chats History between two user
router.get("/history", chatsController.history);

// get Last Seen User
router.get("/lastseen", chatsController.lastSeen);

// chats Create 
router.post("/message", chatsController.messageSend);

module.exports = router;