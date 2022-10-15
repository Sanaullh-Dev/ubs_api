const sql = require("../../config/db.connection.js");
const { body, validationResult, check } = require("express-validator");
const bcrypt = require("bcrypt");

exports.otpLogin = (req, res, next) => {
  userServices.createOtp(req.body, (error, result) => {
    if (error) return next(error);

    return res.status(200).send({
      message: "Success",
      data: result,
    });
  });
};

exports.verifyOtp = (req, res, next) => {
  userServices.verifyOtp(req.body, (error, result) => {
    if (error) return next(error);

    return res.status(200).send({
      message: "Success",
      data: result,
    });
  });
};

// for User Register
exports.signUp = (req, res, next) => {
  const error = validationResult(req);

  if (!error.isEmpty()) {
    return res.status(503).send(error);
  }

  if (req.body.login_with === "phone" && req.body.u_phone === "") {
    return res.status(503).send({
      error: "If you have Login with Phone than can't be empty",
    });
  }
  if (req.body.login_with === "email" && req.body.u_email === "") {
    return res.status(503).send({
      error: "If you have Login with Email than can't be empty",
    });
  }

  const loginId =
    req.body.login_with === "phone" ? req.body.u_phone : req.body.u_email;

  sql.query(
    `select * from users where u_phone = "${loginId}" or u_email="${loginId}";`,
    async (err, result) => {
      if (result.length) {
        return res.status(409).send({
          message: `This ${req.body.login_with} already register`,
        });
      } 
      else {        
        const salt = await bcrypt.genSalt(10);
        bcrypt.hash(req.body.log_pass, salt, (err, hashCode) => {
          if (err) {
            return res.status(500).send({
              error: "Hash Err :" + err,
            });
          } else {
            const userData = [
              req.body.log_id,
              hashCode,
              req.body.u_name,
              req.body.u_about || null,
              req.body.u_country || null,
              req.body.u_phone || null,
              req.body.u_email || null,
              req.body.u_photo || null,
              req.body.login_with,
            ];
            const column =
              "`log_id`,`log_pass`,`u_name`,`u_about`,\
            `u_country`,`u_phone`,`u_email`,`u_photo`,`login_with`";

            let sqlQuery = `INSERT INTO users(${column}) VALUES(?,?,?,?,?,?,?,?,?)`;

            sql.query(sqlQuery, userData, (err, result) => {
              if (err) {
                console.log("error : ", err);
                return res.status(500).send({
                  message:
                    "Some error occurred while creating the SignUp :" ||
                    err.message,
                });
              } else {
                // console.log(result.insertId);
                return res
                  .status(200)
                  .send({ id: result.insertId, date: result });
              }
            });
          }
        });
      }
    }
  );
};

exports.logIn = (req, res, next) => {
  const error = validationResult(req);

  if (!error.isEmpty()) {
    return res.status(503).send(error);
  }

  const body = req.body;

  let sqlQuery = `select * from users where\
  u_phone="${body.loginId}" or u_email="${body.loginId}"`;

  sql.query(sqlQuery, (err, result) => {
    if (err) {
      console.log("error : ", err);
      return res.status(500).send({
        message: "Some error occurred while Login :" || err.message,
      });
    }
    console.log("data:", result);
    if (result.length == 0) {
      return res.status(404).send({
        message: "Login Id is not registered" || err.message,
      });
    } else {
      console.log("pass", body.password);
      console.log("pass", result[0]["log_pass"]);

      bcrypt
        .compare(body.password, result[0]["log_pass"])
        .then((rsult) => {
          console.log("has rsult: ", rsult);
          return res.status(403).send(`Yours password : ${rsult}`);
        })
        .catch((err) => {
          console.log("has ero: ", rsult);
        });

      // return res.status(200).send({ id: result.insertId, date: result });
    }
  });
};
// Promise Funcation for User Login
// function getLogin(userId, userData) {
//   return new Promise((resolve, reject) => {
//     const token = jwt.sign({ id: userId }, "the-super-strong-secrect", {
//       expiresIn: "1h",
//     });
//     sql.query(
//       "Update users set last_login=now() where id=" + userId,
//       (err, upResult) => {
//         if (err) {
//           console.log("SQL err:", err);
//           reject({ message: "Social user can't updated" });
//         }
//         if (upResult) {
//           resolve({
//             message: "Logged In!",
//             token: token,
//             user: getUserJson(userData),
//           });
//         }
//       }
//     );
//   });
// }

// function getUserJson(userdata) {
//   return {
//     name: userdata[0],
//     email: userdata[1],
//     loginWith: userdata[2],
//     uid: userdata[3],
//   };
// }

// exports.getUser = (req, res) => {
//   // console.log("req.headers",req.headers);

//   if (
//     !req.headers.authorization ||
//     !req.headers.authorization.startsWith("Bearer") ||
//     !req.headers.authorization.split(" ")[1]
//   ) {
//     return res.status(422).json({
//       message: "Please provide the token",
//     });
//   }

//   const theToken = req.headers.authorization.split(" ")[1];
//   jwt.verify(theToken, "the-super-strong-secrect", (err, decode) => {
//     if (err) {
//       // console.log("Decode error :", err.name);
//       return res.status(401).send(err.name);
//     }
//     // console.log("User ID :" , decode.id);
//     if (decode.id) {
//       // console.log("userId", userId);
//       sql.query("select * from users where id=?", decode.id, (err, result) => {
//         if (err) throw err;
//         return res.status(200).send({
//           error: false,
//           data: result[0],
//           message: "Fetch Successfully.",
//         });
//       });
//     }
//   });
// };

// exports.getSuccess = (req, res) => {
//   res.status(200).send({
//     Message : "User Content."
//   });
// }

// var dateTime = require("node-datetime");
// const sql = require("../../config/db.js");
// const jwt = require("jsonwebtoken");

// const { validationResult } = require("express-validator");
// const bcrypt = require("bcrypt");

// const userServices = require("../../services/user.services.js");

// dateTime = dateTime.create().format("Y-m-d H:M:S");

// // Insert Data function
// exports.register = (req, res) => {
//   const erro = validationResult(req);
//   if (!erro.isEmpty()) {
//     return res.status(400).json({ errors: erro.array() });
//   }

//   sql.query(
//     `Select * from user_info where lower(u_email)=lower(${sql.escape(
//       req.body.u_email
//     )});`,
//     (err, result) => {
//       if (result.length) {
//         return res.status(409).send({
//           message: "This email already register",
//         });
//       } else {
//         bcrypt.hash(req.body.u_password, 10, (err, hashCode) => {
//           if (err) {
//             return res.status(500).send({
//               error: "Hash Err :" + err,
//             });
//           } else {
//             const user = [
//               req.body.u_name,
//               req.body.u_email,
//               hashCode,
//               req.body.login_with,
//               req.body.uid || "NA",
//             ];

//             let sqlQuery =
//               "INSERT INTO users(`u_name`, `u_email`, `u_password`, `login_with`,`uid`) VALUES(?,?,?,?,?)";

//             sql.query(sqlQuery, user, (err, result) => {
//               if (err) {
//                 console.log("error : ", err);
//                 return res.status(500).send({
//                   message:
//                     "Some error occurred while creating the Users" ||
//                     err.message,
//                 });
//               } else {
//                 // console.log("Created user : ", {
//                 //   id: result.insertId,
//                 //   ...user,
//                 //   result: result,
//                 // });
//                 return res.send({ id: res.insertId, result: result });
//               }
//             });
//           }
//         });
//       }
//     }
//   );
// };

// exports.social = (req, MainRes) => {
//   if (!req) {
//     return MainRes.status(400).send({
//       message: "Login Content not provider in body",
//     });
//   }

//   const userData = [
//     req.body.u_name,
//     req.body.u_email,
//     req.body.login_with,
//     req.body.uid,
//   ];

//   sql.query(
//     `select * from users where lower(u_email)='${req.body.u_email}'`,
//     (err, res_email) => {
//       // console.log("search Email getLogin :", res_email);
//       // console.log(res_email.length);
//       if (err) {
//         return MainRes.status(400).send({ msg: err });
//       }
//       if (res_email.length == 0) {
//         registerUser(userData)
//           .then((res) => {
//             return MainRes.status(200).send(res);
//           })
//           .catch((err) => {
//             return MainRes.send(err);
//           });
//       } else {
//         // console.log("if already register then",res_email[0]['id']);
//         getLogin(res_email[0]["id"], userData)
//           .then((res) => MainRes.send(res))
//           .catch((err) => MainRes.status(400).send(err));
//       }
//     }
//   );
// };
