var path = require("path");

const express = require("express");
const multer = require("multer");

const dictionary = require("../controllers/dictionaryController");
const { searchBooksByName } = book;
const router = express.Router();


router.get('/diRead/dictionary/:word', dictionary.getWordDefinition);

module.exports = router;