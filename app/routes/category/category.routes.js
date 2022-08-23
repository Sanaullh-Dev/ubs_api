var router = require("express").Router();
const categoryCont = require("./category.controller.js");


// get All Main Category
router.get("/main", categoryCont.getMain);

// get All Main Category
router.get("/sub-:mainId", categoryCont.getSub);

// For data insert data into models-profile
// router.post("/", addpostCont.create);

module.exports = router;