'use strict'
const express = require('express')
const actor = require('../controllers/actorController')
const router = express.Router()

router.get(`/diRead/actor`, actor.index)
router.post(`/diRead/actor`, actor.store)
router.get(`/diRead/actor/:id`, actor.show)
router.put(`/diRead/actor/:id`, actor.update)
router.delete(`/diRead/actor/:id`, actor.destroy)

module.exports = router;