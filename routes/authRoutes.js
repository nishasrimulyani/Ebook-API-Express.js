'use strict'
const express = require('express')
const auth = require('../controllers/authController')
const { check, validationResult } = require('express-validator')
const passwordHash = require('password-hash') 
const router = express.Router()

const checkValidation = [
    // isAlphanumeric adalah fungsi mengecek inputan kita harus angka atau huruf
    // isemail mengeck email
    check('name').not().isEmpty().withMessage('required value').isAlphanumeric(),
    check('email').not().isEmpty().withMessage('required value').isEmail(),
    check('password').not().isEmpty().withMessage('required value').isAlphanumeric()
];

const checkValidationLogin = [
    // isAlphanumeric adalah fungsi mengecek inputan kita harus angka atau huruf
    check('email').not().isEmpty().withMessage('required value').isEmail(),
    check('password').not().isEmpty().withMessage('required value').isAlphanumeric()
];

const postParam = (req) => {
    // hash password dengan  library password hash
    const passwordToSave = passwordHash.generate(req.body.password),
        data = {
            name: req.body.name.trim(),
            email: req.body.email,
            password: passwordToSave
        };
    return data;
}

router.post(`/diRead/auth/register`, [checkValidation], (req, res) =>  {
    // mengecek ke middleware apakah kondisi validasi terpenuhi atau tidak
    const errors = validationResult(req);

    // jika error kirim pesan error jikat tidak lanjut ke simpan data
    (!errors.isEmpty() ? res.status(422).json(errors) : auth.register(postParam(req), res))
})
router.post(`/diRead/auth/login`, [checkValidationLogin], (req, res) => {
     // mengecek ke middleware apakah kondisi validasi terpenuhi atau tidak
     const errors = validationResult(req);

     // jika error kirim pesan error jikat tidak lanjut ke simpan data
     (!errors.isEmpty() ? res.status(422).json(errors) : auth.authentication(req, res))
})

module.exports = router