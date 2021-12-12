const mysql = require('mysql');

//MySQL conexión a base de datos
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'pavel'
});

connection.connect(function (error) {
    if (!!error) {
        console.log('Error');
    } else {
        console.log('Connected');
    }
});

module.exports = connection;