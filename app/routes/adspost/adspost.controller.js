const sql = require("../../config/db.connection.js");
const { validationResult } = require("express-validator");

// Add new post
exports.postCreate = (req, res) => {
  if (!req.body)
    res.status(400).send({
      message: " Content can't be Empty !",
    });

  // console.log(req.body);

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
        message: " Some error on find all Ads Post selected data",
      });
    }
    // console.log("Booking_Data : " , result);
    return res.status(200).send(result);
  });
};

// Related Ads
exports.relatedAds = (req, res) => {
  if (!req.params.mainId) {
    return res.status(400).send({
      message: "Missing Main Category ID in query",
    });
  }

  var mainId = req.params.mainId;

  let query = `SELECT * FROM adspost where p_mcat=${mainId} order by p_date LIMIT 20`;

  sql.query(query, (err, result) => {
    if (err) {
      // console.log("Error :" ,err);
      return res.status(500).send({
        message: " Some error on find all Ads Post data",
      });
    }
    // console.log("Booking_Data : " , result);
    return res.status(200).send(result);
  });
};

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
        message: " Some error on find all Ads post data",
      });
    }
    return res.status(200).send(result);
  });
};

// Search result with keyword
exports.keywordSearch = (req, res) => {
  if (!req.params.keyword) {
    return res.status(400).send({
      message: "Missing keyword for get lists of keyword",
    });
  }

  var keyword = req.params.keyword;

  let query = `SELECT * FROM ubs.keyword_search where ubs.keyword_search.keyword like '${keyword}%'`;

  // console.log(query);
  sql.query(query, (err, result) => {
    if (err) {
      // console.log("Error :" ,err);
      return res.status(500).send({
        message: "Some error on find with keyword Ads Post",
      });
    }
    // console.log("Booking_Data : " , result);
    return res.status(200).send(result);
  });
};

// Search Ads list with keyword
exports.keywordWiseList = (req, res) => {
  if (!req.params.keyword) {
    return res.status(400).send({
      message: "Missing keyword for search",
    });
  }

  var keyword = req.params.keyword;

  let query = `SELECT * FROM ads_post_view where ads_post_view.p_title like \
  '%${keyword}%' or ads_post_view.p_describe like '%${keyword}%' or \
  ads_post_view.p_location like '%${keyword}%' or ads_post_view.mainCat like \
  '%${keyword}%' or ads_post_view.subCat like '%${keyword}%'`;

  // console.log(query);
  sql.query(query, (err, result) => {
    if (err) {
      // console.log("Error :" ,err);
      return res.status(500).send({
        message: "Some error on find with keyword Ads Post",
      });
    }
    // console.log("Booking_Data : " , result);
    return res.status(200).send(result);
  });
};

// User action on Ads
exports.userAction = (req, res, next) => {
  console.log(req.body);
  const error = validationResult(req);

  if (!error.isEmpty()) {
    console.log("userAction error", error);
    return res.status(503).send(error);
  }
  const body = req.body;

  sql.query(
    `select * from post_reaction where uid = "${body.uid}" and pid="${body.pid}";`,
    async (err, result) => {
      if (err) {
        return res.status(409).send({
          message: `Some error occurred while sql query :`,
          error: err,
        });
      }
      if (result.length !== 0) {
        // if data is already save than update value
        let sqlQuery = `UPDATE post_reaction SET p_favorite = ${body.p_favorite},\
         p_view = ${body.p_view} WHERE uid =${body.uid} AND pid=${body.pid}`;

        sql.query(sqlQuery, (err, result) => {
          if (err) {
            console.log("error : ", err);
            return res.status(500).send({
              message: "Some error occurred while update on post_reaction :",
              Error: err,
            });
          } else {
            return res.status(200).send({ result: result });
          }
        });
      } else {
        // if data is not found than insert into table

        const postReactionData = [
          body.uid,
          body.pid || null,
          body.p_favorite,
          body.p_view,
        ];
        
        const column = "`uid`,`pid`,`p_favorite`,`p_view`";
        let sqlQuery = `INSERT INTO post_reaction(${column}) VALUES(?,?,?,?)`;
        sql.query(sqlQuery, postReactionData, (err, result) => {
          if (err) {
            console.log("error : ", err);
            return res.status(500).send({
              message:
                "Some error occurred while insert post reaction :" ||
                err.message,
            });
          } else {
            // console.log(result.insertId);
            return res.status(200).send({ id: result.insertId, date: result });
          }
        });
      }
    }
  );
};
