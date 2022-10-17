const bcrypt = require("bcrypt");
const otpGenerator = require("otp-generator");
const crypto = require("crypto");
const key = "otp-secret-key";

// for SMS
const AWS = require("aws-sdk");
const dotenv = require("dotenv");
dotenv.config();


async function createOtp(params, callback) {
  const otp = otpGenerator.generate(4, {
    upperCaseAlphabets: false,
    specialChars: false,
    lowerCaseAlphabets: false,
  });

  const expires = Date.now() + 5 * 60 * 1000;
  const data = `${params.phone}.${otp}.${expires}`;
  const hash = crypto.createHash("sha256", key).update(data).digest("hex");
  const fulHash = `${hash}.${expires}`;

  console.log(`Your OTP is ${otp}`);

  return callback(null, fulHash, otp);
}

async function verifyOtp(params, callback) {
  let [hashValue, expires] = params.hash.split(".");

  let now = Date.now();
  if (now > parseInt(expires)) return callback("OTP Expired");

  let data = `${params.phone}.${params.otp}.${expires}`;
  let newCalculateHash = crypto
    .createHash("sha256", key)
    .update(data)
    .digest("hex");

  if (newCalculateHash == hashValue) {
    return callback(null, "Success");
  }

  return callback("Invalid OTP");
}

function sendSMS(params, OTP, callback) {
  var mobile = params.phone;  
  var msg = {
    Message: `${OTP} is your OTP(One Time Password) to register with BIS-India. Only valid for 5min.`,
    PhoneNumber: mobile,
  };

  AWS.config.update({
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
    region: process.env.AWS_REGION,
  });

  new AWS.SNS({ apiVersion: `2010-03-31` })
    .publish(msg)
    .promise()
    .then((message) => {
      return callback(null, "OTP send success");
    })
    .catch((err) => {
      console.log("Error " + err);
      return callback(err, null);
    });
}

module.exports = {
  createOtp,
  verifyOtp,
  sendSMS,
};
