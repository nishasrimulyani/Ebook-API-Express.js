var express = require('express');

const auth = require('../routes/authRoutes')
const actorRouter = require('./actorRoutes')
const bookRouter = require('./bookRoutes')
const dictionaryRouter = require('./dictionaryRoutes')
const router = express()

/* GET home page. */
router.get('/diRead', function (req, res) {
  res.json({
    "message": "Welcome"
  })
});

router.use(auth)
router.use(actorRouter)
router.use(bookRouter)
router.use(dictionaryRouter)

module.exports = router;
