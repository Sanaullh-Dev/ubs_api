var router = require("express").Router();
const { body, validationResult, check } = require("express-validator");
// const auth = require("../../authentication/authenticateToken.js")

// const {signupValidation , loginValidation } = require("../../authentication/Validation.js");
const {
  signUpValidation,
  loginValidation,
} = require("../../authentication/Validation.js");

const userController = require("./user_login.controller.js");

// For User signUp
router.post("/singUp",signUpValidation, userController.signUp);

// For User signUp
router.post("/logIn",loginValidation, userController.logIn);


// router.post("/get_user", auth.authenticateToke, userController.getUser);
router.post("/otpLogin", userController.otpLogin);

// router.post("/get_user", auth.authenticateToke, userController.getUser);
router.post("/verifyOtp", userController.verifyOtp);

module.exports = router;

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
