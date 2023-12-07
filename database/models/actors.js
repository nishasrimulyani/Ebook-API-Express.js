"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Actors extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  const ENUM_VAL = ["admin", "reader"];
  Actors.init(
    {
      name: DataTypes.STRING,
      email: DataTypes.STRING,
      password: DataTypes.STRING,
      role: {
        type: DataTypes.ENUM,
        values: ENUM_VAL,
        allowNull: false,
        validate: {
          notNull: { msg: "Role is quired" },
          isIn: {
            args: [ENUM_VAL],
            msg: "Role must be admin",
          },
        },
      },
    },
    {
      sequelize,
      modelName: "Actors",
    }
  );
  return Actors;
};
