"use strict";
const { Model } = require("sequelize");

module.exports = (sequelize, DataTypes) => {
  class Books extends Model {
    static associate(models) {
      // define association here
    }
  }

  Books.init(
    {
      p_issn: DataTypes.STRING,
      e_issn: DataTypes.STRING,
      keyword: DataTypes.STRING,
      judul: DataTypes.STRING,
      penulis: DataTypes.STRING,
      tahun_terbit: DataTypes.INTEGER,
      penerbit: DataTypes.STRING,
      volume: DataTypes.INTEGER,
      no_edisi: DataTypes.INTEGER,
      jumlah_halaman: DataTypes.INTEGER,
      pdf: DataTypes.STRING,
      reference: DataTypes.STRING,
    },
    {
      sequelize,
      modelName: "Books",
      tableName: "books",
      underscored: true,
    }
  );

  return Books;
};
