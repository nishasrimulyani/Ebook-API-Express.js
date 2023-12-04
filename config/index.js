const conf = {};
conf.environment = 'development';
conf.sequelize = {};
conf.sequelize.username = 'root'; //database username
conf.sequelize.password = 'Root12345.'; //database password kosongkan jika tidak pakai password
conf.sequelize.database = 'diread'; //isi dengan nama database
conf.sequelize.host = '127.0.0.1';
conf.sequelize.dialect = 'mysql';
conf.sequelize.port = 3000;
conf.sequelize.define = {
charset: 'utf8mb4',
dialectOptions: {
collate: 'utf8mb4_unicode_ci'
}
}
conf.ROUND_SALT = 8;
module.exports = conf;