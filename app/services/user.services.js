const bcrypt = require("bcrypt");
const otpGenerator = require("otp-generator");
const crypto = require("crypto");
const key = "otp-secret-key";

async function createOtp(params, callback) {
  const otp = otpGenerator.generate(4, {
    alphabets: false,
    upperCase: false,
    specialChars: false,
  });

  const expires = Date.now() + 5 * 60 * 1000;
  const data = `${params.phone}.${otp}.${expires}`;
  const hash = crypto.createHash("sha256", key).update(data).digest("hex");
  const fulHash = `${hash}.${expires}`;

  console.log(`Your OTP is ${otp}`);

  return callback(null, fulHash);
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

module.exports = {
  createOtp,
  verifyOtp,
};

