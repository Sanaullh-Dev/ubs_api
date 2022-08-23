var router = require('express').Router();


// Routes : Category
router.use("/category", require("./category/category.routes.js"));

// Routes : Add Post
router.use("/addpost", require("./addpost/addpost.routes.js"));

// Routes : Add Post
router.use("/chats", require("./chats/chats.routes.js"));

module.exports = router;