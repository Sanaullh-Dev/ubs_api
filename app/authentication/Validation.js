const { body, validationResult, check } = require("express-validator");
const validator = require("validator");

exports.signUpValidation = [
  // check("log_id", "Login Id is Empty").not().isEmpty(),
  check("log_pass", "Login Password is Empty").not().isEmpty(),
  check("log_pass", "Password must be 6 or more characters").isLength({
    min: 6,
  }),
  check("u_name", "User Name is Empty").not().isEmpty(),
  check("login_with", "Login with is Empty").not().isEmpty(),
  body("u_phone").custom((value, { req }) => {
    // this code is check if phone no is not blank than check digit will 10
    if (value !== "" && value.length !== 10) {
      return Promise.reject("Phone in 10 digit required");
    } else {
      return Promise.resolve("valid");
    }
  }),
  body("u_email").custom((value, { req }) => {
    if (value !== "" && !validator.isEmail(value)) {
      return Promise.reject("Invalid email address given");
    } else {
      return Promise.resolve("valid");
    }
  }),
];

// .isEmail()
//     .normalizeEmail({ gmail_remove_dots: true }),
exports.loginValidation = [
  check("loginId", "Please include a valid email").not().isEmpty(),    
  check("password", "Password must be 6 or more characters").isLength({
    min: 6,
  }),
];

//---------------------------- testing if condition
// check("u_phone", "Invalid Phone No given").custom((info) =>  {
//   if(info !== "") {
//     check("u_phone", "Invalid phone no")
//     // if(info.isLength != 10) return Promise.reject();
//   }
// })

// .isLength({min:10, max:10}),
// check("u_email", "Please include a valid email")
//   .isEmail()
//   .normalizeEmail({ gmail_remove_dots: true }),
