var dateTime = require("node-datetime");
const sql = require("../../config/db.js");
const jwt = require("jsonwebtoken");

const { validationResult } = require("express-validator");
const bcrypt = require("bcrypt");

dateTime = dateTime.create().format("Y-m-d H:M:S");

// Insert Data function
exports.register = (req, res) => {
  const erro = validationResult(req);
  if (!erro.isEmpty()) {
    return res.status(400).json({ errors: erro.array() });
  }

  sql.query(
    `Select * from user_info where lower(u_email)=lower(${sql.escape(
      req.body.u_email
    )});`,
    (err, result) => {
      if (result.length) {
        return res.status(409).send({
          message: "This email already register",
        });
      } else {
        bcrypt.hash(req.body.u_password, 10, (err, hashCode) => {
          if (err) {
            return res.status(500).send({
              error: "Hash Err :" + err,
            });
          } else {
            const user = [
              req.body.u_name,
              req.body.u_email,
              hashCode,
              req.body.login_with,
              req.body.uid || "NA",
            ];

            let sqlQuery =
              "INSERT INTO users(`u_name`, `u_email`, `u_password`, `login_with`,`uid`) VALUES(?,?,?,?,?)";

            sql.query(sqlQuery, user, (err, result) => {
              if (err) {
                console.log("error : ", err);
                return res.status(500).send({
                  message:
                    "Some error occurred while creating the Users" ||
                    err.message,
                });
              } else {
                // console.log("Created user : ", {
                //   id: result.insertId,
                //   ...user,
                //   result: result,
                // });
                return res.send({ id: res.insertId, result: result });
              }
            });
          }
        });
      }
    }
  );
};

exports.login = (req, res) => {
  // checking validation
  const erro = validationResult(req);
  if (!erro.isEmpty()) {
    return res.status(400).json({ errors: erro.array() });
  }

  sql.query(
    `select * from users where lower(u_email)=${sql.escape(req.body.u_email)};`,
    (err, result) => {
      if (err) {
        return res.status(400).send({ msg: err });
      }
      if (!result.length) {
        return res.status(401).send({
          msg: "Email or password is incorrect!",
        });
      }
      // check password
      bcrypt.compare(
        req.body.u_password,
        result[0]["u_password"],
        (berr, bresult) => {
          if (berr) {
            return res.status(401).send({
              msg: "Your password is incorrect!",
            });
          } else if (bresult) {
            const token = jwt.sign(
              { id: result[0]["id"] },
              "the-super-strong-secrect",
              { expiresIn: "1h" }
            );
            sql.query(
              "Update users set last_login=now() where id=" + result[0].id,
              (err, upResult) => {
                if (err) {
                  console.log("SQL err:", err);
                }
                if (upResult) {
                  // console.log();
                  return res.status(200).send({
                    message: "Logged In!",
                    token: token,
                    user: {
                      name: result[0]["u_name"],
                      email: result[0]["u_email"],
                      loginWith: result[0]["login_with"],
                      uid: result[0]["uid"],
                    },
                  });
                }
              }
            );
          } else {
            return res.status(401).send({
              msg: "Your password is incorrect!",
            });
          }
        }
      );
    }
  );
};

exports.social = (req, MainRes) => {
  if (!req) {
    return MainRes.status(400).send({
      message: "Login Content not provider in body",
    });
  }

  const userData = [
    req.body.u_name,
    req.body.u_email,
    req.body.login_with,
    req.body.uid,
  ];

  sql.query(
    `select * from users where lower(u_email)='${req.body.u_email}'`,
    (err, res_email) => {
      // console.log("search Email getLogin :", res_email);
      // console.log(res_email.length);
      if (err) {
        return MainRes.status(400).send({ msg: err });
      }
      if (res_email.length == 0) {
        registerUser(userData)
          .then((res) => {
            return MainRes.status(200).send(res);
          })
          .catch((err) => {
            return MainRes.send(err);
          });
      } else {
        // console.log("if already register then",res_email[0]['id']);
        getLogin(res_email[0]["id"], userData)
          .then((res) => MainRes.send(res))
          .catch((err) => MainRes.status(400).send(err));
      }
    }
  );
};

// Promise Funcation for User Register
function registerUser(user) {
  return new Promise((resolve, reject) => {
    let sqlQuery =
      "INSERT INTO users(`u_name`, `u_email`, `login_with`,`uid`) VALUES(?,?,?,?)";
    sql.query(sqlQuery, user, (err, insert_res) => {
      if (err) {
        // console.log("sql", err);
        reject({
          message:
            "Some error occurred while signUp with Social :" || err.message,
        });
      } else {
        // console.log("after register User getLogin :", insert_res.insertId);
        getLogin(insert_res.insertId, user)
          .then((res) => resolve(res))
          .catch((err) => reject(err));
      }
    });
  });
}
// Promise Funcation for User Login
function getLogin(userId, userData) {
  return new Promise((resolve, reject) => {
    const token = jwt.sign({ id: userId }, "the-super-strong-secrect", {
      expiresIn: "1h",
    });
    sql.query(
      "Update users set last_login=now() where id=" + userId,
      (err, upResult) => {
        if (err) {
          console.log("SQL err:", err);
          reject({ message: "Social user can't updated" });
        }
        if (upResult) {
          resolve({
            message: "Logged In!",
            token: token,
            user: getUserJson(userData),
          });
        }
      }
    );
  });
}

function getUserJson(userdata) {
  return {
    name: userdata[0],
    email: userdata[1],
    loginWith: userdata[2],
    uid: userdata[3],
  };
}
exports.getUser = (req, res) => {
  // console.log("req.headers",req.headers);

  if (
    !req.headers.authorization ||
    !req.headers.authorization.startsWith("Bearer") ||
    !req.headers.authorization.split(" ")[1]
  ) {
    return res.status(422).json({
      message: "Please provide the token",
    });
  }

  const theToken = req.headers.authorization.split(" ")[1];
  jwt.verify(theToken, "the-super-strong-secrect", (err, decode) => {
    if (err) {
      // console.log("Decode error :", err.name);
      return res.status(401).send(err.name);
    }
    // console.log("User ID :" , decode.id);
    if (decode.id) {
      // console.log("userId", userId);
      sql.query("select * from users where id=?", decode.id, (err, result) => {
        if (err) throw err;
        return res.status(200).send({
          error: false,
          data: result[0],
          message: "Fetch Successfully.",
        });
      });
    }
  });
};

exports.getSuccess = (req, res) => {
  res.status(200).send({
    Message : "User Content."
  });
}
