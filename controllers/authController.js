const db = require("../database/models")
const Users = db.Users
const jwt = require('jsonwebtoken')
const passwordHash = require('password-hash')
require("dotenv").config()

const register = async (input, res) => {
    try {
        /* input mengambil dari route hasil validasi 
           jadi di controller sudha bersih tidak ada logic pengecekan lagi
        */
       console.log(input);
        const save = await Users.create(input)
        console.log(save);
        res.json(save).status(200)
    } catch (error) {
        res.json(error).status(422)
    }
}
const authentication = async (req, res) => {
    try {
        const email = req.body.email.trim();
        const password = req.body.password.trim();

        // Find the user by email
        const user = await Users.findOne({ where: { email: email } });

        if (!user) {
            return res.status(422).json({ msg: 'User not found' });
        }

        // Verify the password
        const isPasswordValid = passwordHash.verify(password, user.password);

        if (!isPasswordValid) {
            return res.status(422).json({ msg: 'Incorrect password' });
        }

        // Generate a token
        const jwtKey = process.env.JWT_KEY || 'defaultSecretKey';
        jwt.sign({ userToken: { id: user.id, email: user.email } }, jwtKey, { expiresIn: '365d' }, (err, token) => {
            if (err) {
                console.error('JWT Error:', err);
                return res.status(500).json({ msg: 'Error generating token', error: err.message });
            }

            // Return the token on successful login
            res.status(200).json({ token: token });
        });
    } catch (error) {
        console.error('Authentication Error:', error);
        res.status(500).json({ msg: 'Internal server error', error: error.message });
    }
};


module.exports = {
    register, authentication
}