'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    const actors = [];
    {
      actors.push({
        name: `admin`,
        email: `admin@gmail.com`,
        password: `password`,
        role:  `admin`,
        createdAt: new Date(),
        updatedAt: new Date()
      });
    }
    return queryInterface.bulkInsert('Actors', actors, {});
  },

  async down (queryInterface, Sequelize) {
      return queryInterface.bulkDelete('Actors', null, {
      truncate: true
    });
  }
  
};
