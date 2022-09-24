const { check } = require("express-validator");

exports.signupValidation = [
  check("u_name", "Name is required").not().isEmpty(),
  check("u_email", "Please include a valid email")
    .isEmail()
    .normalizeEmail({ gmail_remove_dots: true }),
  check("u_password", "Password must be 6 or more characters").isLength({
    min: 6,
  }),
];

exports.loginValidation = [
  check("u_email", "Please include a valid email")
    .isEmail()
    .normalizeEmail({ gmail_remove_dots: true }),
  check("u_password", "Password must be 6 or more characters").isLength({
    min: 6,
  }),
];
