var express = require("express");
var path = require("path");
var serveStatic = require("serve-static");
var cookieParser = require("cookie-parser");
var logger = require("morgan");

var indexRouter = require("./routes/index.js");
var usersRouter = require("./routes/authRoutes.js");
var actorRouter = require("./routes/actorRoutes.js");
var booksRouter = require("./routes/bookRoutes.js");

var app = express();

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(serveStatic(path.join(__dirname, "Books")));
app.use(serveStatic(path.join(__dirname, "public")));

app.use("/", indexRouter);
// app.use("/users", usersRouter);
// app.use("/actors", actorRouter);
// app.use("/books", booksRouter);

module.exports = app;
