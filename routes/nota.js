const connection = require('../configs/dbcontroller');

function getCurentDate() {
    return new Date().toISOString().slice(0, 19).replace('T', ' ');
}

module.exports = function (app) {

    //insertar comentario
    app.post('/api/v1/comentario/', (req, resp) => {

        const data = req.body;

        connection.query(
            "INSERT INTO `comentario`(`parent_dir`, `comentario`, `fechadecreacion`, `idusuario`, `idnota`) "
            + "VALUES (?,?,?,?,?)", [parseInt(data.parent_dir), data.comentario, getCurentDate(),
            parseInt(data.idusuario), parseInt(data.idnota)],
            function (error, rows, fields) {
                if (!!error) {
                    console.log(error);
                    console.log("Error en el query");
                } else {
                    console.log("éxito al insertar comentario");
                    console.log(rows);
                }
            }
        );
    });

    //obtener nota específica y nombre de usuario creador
    app.get('/api/v1/nota/:id', (req, resp) => {

        const data = req.params;
        let nota = [];
        let idnota = parseInt(data.id);

        connection.query(
            "SELECT n.idnota, n.titulo, n.descripcion, n.fechadecreacion, n.idpersonal, u.nombre, u.apepaterno, u.apematerno FROM `nota` n "
            + "INNER JOIN `personal` p ON n.idpersonal = p.idpersonal "
            + "INNER JOIN `usuario` u ON p.idusuario = u.idusuario "
            + "WHERE idnota = ?", [idnota],
            function (error, rows, fields) {
                if (!!error) {
                    console.log(error);
                    console.log("Error en el query");
                }
                else {

                    console.log("Éxito al obtener datos de nota y usuario creador");
                    nota = rows[0];

                    resp.render('pages/nota', {
                        nota: rows[0]
                    });
                }
            });
    });

    //obtener comentarios de nota específica
    app.get('/api/v1/nota/:id/comentarios/', (req, resp) => {

        const data = req.params;
        let idnota = parseInt(data.id);

        //Obtiene para la nota ? 
        //Todos los campos de comentario
        //Nombre compuesto de usuario que creo el comentario y si es usuario externo
        //Nombre compuesto de usuario que creo el comentario que fue respondido (en caso de ser respuesta)
        connection.query("SELECT c.idcomentario, c.parent_dir, c.fechadecreacion, c.comentario,"
            + "c.fechadecreacion, u.apematerno, u.apepaterno, u.nombre, u.externo,"
            + "u2.apepaterno as respondioapepaterno, u2.apematerno as respondioapematerno,"
            + "u2.nombre as respondionombre FROM comentario c "
            + "INNER JOIN nota n ON c.idnota = n.idnota "
            + "INNER JOIN usuario u ON c.idusuario = u.idusuario "
            + "LEFT JOIN comentario c2 on c2.idcomentario = c.parent_dir "
            + "LEFT JOIN usuario u2 ON c2.idusuario = u2.idusuario "
            + "WHERE n.idnota = ? ORDER BY c.fechadecreacion ASC", [idnota],
            function (error, rows, fields) {
                if (!!error) {
                    console.log(error);
                    console.log("Error en la query");
                } else {
                    console.log('Éxito al obtener comentarios de nota')

                    resp.status(200).send({ message: "Success", rows: rows });
                }
            });

    });
}