var router = require("express").Router();
const { body, validationResult, check } = require("express-validator");
// const auth = require("../../authentication/authenticateToken.js")

// const {signupValidation , loginValidation } = require("../../authentication/Validation.js");
const {
  signUpValidation,
  loginValidation,
} = require("../../authentication/Validation.js");

const userController = require("./user_login.controller.js");

// For check User Registration 
router.post("/checkUser", userController.checkUser);

// For User signUp/ registration 
router.post("/singUp",signUpValidation, userController.signUp);

// For User Login
router.post("/logIn",loginValidation, userController.logIn);

// For Update User data
router.put("/updateUserProfile", userController.updateUserProfile);

// For Get Otp
router.post("/otpLogin", userController.getOtp);

// for verification of OTP code
router.post("/verifyOtp", userController.verifyOtp);

// for Send SMS  ******** this test current not available
// router.post("/sendSMS", userController.sendSMS);


module.exports = router;

