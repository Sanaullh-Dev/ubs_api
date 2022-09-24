const sql = require("../../config/db.connection.js");

// Add new post
exports.postCreate = (req, res) => {
  if (!req.body)
    res.status(400).send({
      message: " Content can't be Empty !",
    });

  console.log(req.body);

  // console.log("file Lenght :" , Object.keys(req.files.).length);
  // console.log("file Lenght :" , req.files[0].path);

  const postData = [
    new Date(),
    req.body.pTitle,
    req.body.pBrand,
    req.body.pDescribe,
    // req.body.pImg1,
    Object.keys(req.files).length > 0 ? req.files[0].path : null,
    Object.keys(req.files).length > 1 ? req.files[1].path : null,
    Object.keys(req.files).length > 2 ? req.files[2].path : null,
    Object.keys(req.files).length > 3 ? req.files[3].path : null,
    Object.keys(req.files).length > 4 ? req.files[4].path : null,
    req.body.pPrice,
    req.body.pLocation,
    req.body.mcat_id,
    req.body.scat_id,
    req.body.pUid,
  ];

  const column =
    "`p_date`,`p_title`,`p_brand`,`p_describe`,`p_img1`,`p_img2`,`p_img3`,`p_img4`,`p_img5`,`p_price`,`p_location`,`p_mcat`,`p_scat`,`p_uid`";

  let sqlQuery = `INSERT INTO adspost(${column}) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)`;

  sql.query(sqlQuery, postData, (err, result) => {
    if (err) {
      console.log("error : ", err);
      return res.status(500).send({
        message:
          "Some error occurred while creating the Ads Post" || err.message,
      });
    } else {
      console.log(result.insertId);
      return res.status(200).send({ id: result.insertId, date: result });
    }
  });
};


// Find all Data function - OK
exports.recentAds = (req, res) => {
  let query = "SELECT * FROM adspost order by p_date desc LIMIT 20";

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

// Related Ads
exports.relatedAds = (req , res) => {
  
  if(!req.params.mainId) {
    return res.status(400).send({
      message: "Missing Main Category ID in query",
    });
  }

  var mainId = req.params.mainId;

  let query = `SELECT * FROM adspost where p_mcat =${mainId} order by p_date LIMIT 20`;

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

}

// Find all Data function - OK
exports.filterAds = (req, res) => {
  console.log(req.query);

  if (!req.query.location) {
    return res.status(400).send({
      message: "Missing Location query",
    });
  }

  var location = req.query.location;
  var mCatId = req.query.mainCat;
  var sCatId = req.query.subCat;
  var minAmt = req.query.minAmt;
  var maxAmt = req.query.maxAmt;
  var keyword = req.query.keyword;

  console.log(req.query);

  let query = `SELECT * FROM adspost WHERE p_location='${location}'`;

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
      query =
        query +
        (isAnd === true ? " AND" : "") +
        ` (p_title lIKE '%${keyword}%' OR p_describe lIKE '%${keyword}%')`;
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
