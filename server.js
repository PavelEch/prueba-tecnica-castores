//Imports
const express = require('express');
const app = express();

//Definir vistas y views engine
app.set('view engine', 'ejs');
app.use('/public', express.static(__dirname + "/public"));

//Procesar peticiones post
app.use(express.json({ limit: '1mb' }));
app.use(express.urlencoded({
    extended: true
}));

require('./routes/index')(app);
require('./routes/login')(app);
require('./routes/nota')(app);

//servidor escucha en puerto 8080
//ver en cliente web como http:\\localhost:8080
app.listen(8080);



