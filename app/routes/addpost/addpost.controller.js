const sql = require("../../config/db.connection.js");

// Add new post
exports.postCreate = (req, res) => {
  if (!req.body)
    res.status(400).send({
      message: " Content can't be Empty !",
    });

  const postData = [
    new Date(req.body.pdate),
    req.body.pTitle,
    req.body.pPrice || null,
    req.body.pDescribe,
    req.body.pUid,
    req.body.pImg1,
    req.body.pImg2 || null,
    req.body.pImg3 || null,
    req.body.pLocation,
    req.body.mcat_id,
    req.body.scat_id,
  ];

  const column =
    "'p_date','p_title','p_price','p_describe','p_uid','p_imgcover','p_img2','p_img3','p_details','p_location','p_mcat','p_scat'";

  let sqlQuery = "INSERT INTO demo(${column}) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

  sql.query(sqlQuery, postData, (err, result) => {
    if (err) {
      console.log("error : ", err);
      return res.status(500).send({
        message:
          "Some error occurred while creating the Booking" || err.message,
      });
    } else {
      // console.log(result.insertId);
      return res.send({ id: result.insertId, result: result });
    }
  });
};

// Find all Data function - OK
exports.recentAds = (req, res) => {
  let query = "SELECT * FROM addpost order by p_date LIMIT 20";

  sql.query(query, (err, result) => {
    if (err) {
      // console.log("Error :" ,err);
      return res.status(500).send({
        message: " Some error on find all booking data",
      });
    }
    // console.log("Booking_Data : " , result);
    return res.status(200).send(result);
  });
};

// Find all Data function - OK
exports.filterAds = (req, res) => {

  if (!req.query.loc){
    return res.status(400).send({
      message : "Missing Location query"
    });
  }

  var location = req.query.location;
  var mCatId = req.query.mainCat;
  var sCatId = req.query.subCat;
  var minAmt = req.query.minAmt;
  var maxAmt = req.query.maxAmt;
  var keyword = req.query.keyword;

  console.log(req.query);

  let query = `SELECT * FROM addpost WHERE p_location='${location}'`;

  if (mCatId || sCatId || minAmt || maxAmt || keyword) {
    query = query + " AND";
    isAnd = false;

    if (mCatId) {
      query = query + ` p_mcat=${mCatId}`;
      isAnd = true;
    }

    if (sCatId) {
      query = query + (isAnd === true ? " AND" : "") + ` p_scat=${sCatId}`;
      isAnd = true;
      console.log(query);
    }

    if (minAmt) {
      query = query + (isAnd === true ? " AND" : "") + ` p_price >= ${minAmt}`;
      isAnd = true;
    }

    if (maxAmt) {
      query = query + (isAnd === true ? " AND" : "") + ` p_price <= ${maxAmt}`;
      isAnd = true;
    }

    if (keyword) {
      query = query + (isAnd === true ? " AND" : "") + ` (p_title lIKE '%${keyword}%' OR p_describe lIKE '%${keyword}%')`;
    }
    isAnd = false;
  }

  // console.log(query);

  sql.query(query, (err, result) => {
    if (err) {
      // console.log("Error :" ,err);
      return res.status(500).send({
        message: " Some error on find all booking data",
      });
    }
    return res.status(200).send(result);
  });
};
