var router = require("express").Router();
// const auth = require("../../authentication/authenticateToken.js")

// const { signupValidation, loginValidation } = require("../../authentication/Validation.js");

const userController = require("./user_login.controller.js");


// For User register - local
// router.post("/register", signupValidation, userController.register);

// For User login - local
// router.post("/login",loginValidation , userController.login);

// For User login - social 
// router.post("/social", userController.social);

// For User Authentication
// router.post("/get_user", auth.authenticateToke, userController.getUser);
// router.post("/get_user", userController.getUser);


// Get Test user toke
// router.get("/test_Toke", userController.getSuccess);
// router.get("/test_Toke",auth.verifyToken, userController.getUser);
// 


// router.post("/get_user", auth.authenticateToke, userController.getUser);
router.post("/otpLogin", userController.otpLogin);

// router.post("/get_user", auth.authenticateToke, userController.getUser);
router.post("/verifyOtp", userController.verifyOtp);


router.get("/demo", userController.demo);


module.exports = router;
