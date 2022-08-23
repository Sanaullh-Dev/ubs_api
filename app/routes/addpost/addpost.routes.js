var router = require("express").Router();
const addpostCont = require("./addpost.controller.js");


// Get top 20 recent ads 
router.get("/", addpostCont.recentAds);

// Get top 20 recent ads 
router.get("/filter", addpostCont.filterAds);

// For data insert data into models-profile
router.post("/", addpostCont.postCreate);

// For data insert data with upload files
// router.post("/", upload.array("m_image", 4), modelController.create);

module.exports = router;