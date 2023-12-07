"use strict";
var path = require("path");

const express = require("express");
const multer = require("multer");

const book = require("../controllers/booksController");
const router = express.Router();
const upload = multer({ dest: "uploads/" });

router.post(
  `/diRead/storeCsvBook`,
  upload.single("csvFile"),
  book.storeBooksCsv
);
router.get(`/diRead/books`, book.getBooks);
router.get("/diRead/Books/:bookName", function (req, res) {
  var bookName = req.params.bookName;
  var filePath = path.join(__dirname, "../Books", bookName); // Update the path here
  res.sendFile(filePath, function (err) {
    if (err) {
      console.error(err);
      res.status(err.status).end();
    } else {
      console.log("Sent:", filePath);
    }
  });
});

module.exports = router;
