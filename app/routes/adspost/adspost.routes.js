var router = require("express").Router();
const addpostCont = require("./adspost.controller.js");
const upload = require("../../services/upload.js");
const {userActionValidation} = require("../../authentication/Validation.js");
  


// Get top 20 recent ads 
router.post("/", addpostCont.recentAds);

// Related Ads
router.get("/relatedAds/mainId-:mainId", addpostCont.relatedAds);

// Get top 20 recent ads 
router.get("/filter", addpostCont.filterAds);

// Get Search keyword list result 
router.get("/search-:keyword", addpostCont.keywordSearch);

// Get Ads list keyword wise 
router.get("/keywordSearch-:keyword", addpostCont.keywordWiseList);


// For data insert data into models-profile
router.post("/", upload.array("ads_image", 5), addpostCont.postCreate);

// add user favorites and view Ads
router.post("/userAction",userActionValidation, addpostCont.userAction);

module.exports = router;