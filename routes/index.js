
const connection = require('../configs/dbcontroller');

function getCurentDate() {
    return new Date().toISOString().slice(0, 19).replace('T', ' ');
}

module.exports = function (app) {

    //Renderizar página index
    app.get('/', (req, resp) => {
        let rows = [];

        //Obtener todas las notas de la aplicación.
        connection.query(
            "SELECT * FROM `nota` WHERE 1",
            function (error, rows, fields) {
                if (!!error) {
                    console.log(error);
                    console.log("Error en el query");
                    resp.render('pages/index', {
                        rows: rows
                    });
                }
                else {
                    console.log("Éxito al obtener notas");
                    resp.render('pages/index', {
                        rows: rows
                    });
                }
            });
    });

    //Insertar nota
    app.post('/api/v1/nota/', (req, resp) => {

        const data = req.body;
        let idpersonal;

        console.log(data);

        //Obtener idpersonal donde id usuario es ?
        connection.query("SELECT personal.idpersonal FROM personal INNER JOIN usuario "
            + "ON personal.idusuario = usuario.idusuario WHERE usuario.idusuario = ? ", [parseInt(data.idusuario)],
            function (error, rows, fields) {
                if (!!error) {
                    console.log(error);
                    console.log("Error in the query");
                } else {

                    idpersonal = rows[0].idpersonal;

                    //Insertar nota
                    connection.query(
                        "INSERT INTO `nota`(`titulo`, `descripcion`, `fechadecreacion`, `idpersonal`)"
                        + "VALUES (?,?,?,?)", [data.titulo, data.descripcion, getCurentDate(), idpersonal],
                        function (error, rows, fields) {
                            if (!!error) {
                                console.log(error);
                                console.log("Error en el query");
                            } else {
                                console.log("Éxito al insertar nota");
                                resp.redirect('/');
                            }
                        }
                    );
                }
            });
    });
}