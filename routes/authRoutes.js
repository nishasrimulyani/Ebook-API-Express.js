'use strict';

const express = require('express');
const auth = require('../controllers/authController');
const { check, validationResult } = require('express-validator');
const passwordHash = require('password-hash');
const router = express.Router();

const checkValidation = [
    check('name').not().isEmpty().withMessage('Name is required').isAlphanumeric(),
    check('email').not().isEmpty().withMessage('Email is required').isEmail(),
    check('password').not().isEmpty().withMessage('Password is required').isAlphanumeric()
];

const checkValidationLogin = [
    check('email').not().isEmpty().withMessage('Email is required').isEmail(),
    check('password').not().isEmpty().withMessage('Password is required').isAlphanumeric()
];

const postParam = (req) => {
    const passwordToSave = passwordHash.generate(req.body.password);
    const data = {
        name: req.body.name.trim(),
        email: req.body.email,
        password: passwordToSave
    };
    return data;
};

router.post('/users/diRead/auth/register', [checkValidation], (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(422).json(errors.array());
    }
    auth.register(postParam(req), res);
});

router.post('/users/diRead/auth/login', [checkValidationLogin], (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(422).json(errors.array());
    }
    auth.authentication(req, res);
});

module.exports = router;
