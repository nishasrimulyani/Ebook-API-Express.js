"use strict";
const passwordHash = require("password-hash");
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    const users = [];
    for (let i = 0; i < 100; i++) {
      users.push({
        name: `user${i}`,
        email: `user${i}@gmail.com`,
        password: passwordHash.generate(`user${i}`),
        createdAt: new Date(),
        updatedAt: new Date(),
      });
    }
    return queryInterface.bulkInsert("Users", users, {});
  },

  async down(queryInterface, Sequelize) {
    return queryInterface.bulkDelete("Users", null, {
      truncate: true,
    });
  },
};
