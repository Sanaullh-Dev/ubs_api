const { check } = require("express-validator");

exports.signUpValidation = [
  check("uid", "Uid is required").not().isEmpty(),
  check("log_id", "Login Id is Empty").not().isEmpty(),
  check("log_pass", "Login Password is Empty").not().isEmpty(),
  check("log_pass", "Password must be 6 or more characters").isLength({min: 6}),
  check("u_name", "User Name is Empty").not().isEmpty(),
  check("login_with", "Login with is Empty").not().isEmpty(),
  // check("u_phone", "Phone No is Empty").not().isEmpty(),
  // check("u_phone", "Invalid Phone No given").custom((info, {req}) =>  {
  //   if(info != "") {
  //     if(info.isLength != 10) return Promise.reject();
  //   }
  // });

  //---------------------------- testing if condication
  check("u_phone", "Invalid Phone No given").custom((info, {req}) =>  {
    if(info != "") {
      if(info.isLength != 10) return Promise.reject();
    }
  })
  
  // .isLength({min:10, max:10}),
  // check("u_email", "Please include a valid email")
  //   .isEmail()
  //   .normalizeEmail({ gmail_remove_dots: true }),
  
];

exports.loginValidation = [
  check("u_email", "Please include a valid email")
    .isEmail()
    .normalizeEmail({ gmail_remove_dots: true }),
  check("u_password", "Password must be 6 or more characters").isLength({
    min: 6,
  }),
];
