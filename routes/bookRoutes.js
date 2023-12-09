"use strict";
var path = require("path");

const express = require("express");
const multer = require("multer");

const book = require("../controllers/booksController");
const { searchBooksByName } = book;
const router = express.Router();
const upload = multer({ dest: "uploads/" });

router.post(
  `/diRead/storeCsvBook`,
  upload.single("csvFile"),
  book.storeBooksCsv
);


router.get(`/diRead/books`, book.getBooks);


router.get("/diRead/books/search/:bookName", searchBooksByName);

module.exports = router;
