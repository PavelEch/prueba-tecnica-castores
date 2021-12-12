const connection = require('../configs/dbcontroller');

function returnBoolean(number) {
    if (number === 0)
        return false;

    if (number === 1)
        return true;
}


module.exports = function (app) {


    //Login Page
    app.get('/login', (req, res) => {
        res.render('pages/login');
    });


    //Log In
    app.post('/api/v1/usuarios/', (req, resp) => {

        const data = req.body;

        console.log(data);

        //Obtener usuario donde correo es ?
        connection.query(
            "SELECT * FROM `usuario` WHERE usuario.correo = ?", [data.correo],
            function (error, rows, fields) {
                if (!!error) {
                    console.log(error);
                    console.log("Error en el query");
                }
                else {
                    //Válida que el usuario exista
                    if (rows.length > 0) {
                        //Obtiene usuario validando el usuario y contraseña proporcionados
                        connection.query("SELECT * FROM `usuario` WHERE usuario.correo = ? AND usuario.contraseña = ?",
                            [data.correo, data.contraseña],
                            function (error, rows, fields) {
                                if (!!error) {
                                    console.log("Error");
                                    console.log("Error en el query");
                                }
                                else {
                                    //Usuario encontrado
                                    if (rows.length > 0) {
                                        console.log("Rows: ", rows);
                                        //resp.redirect('/login');

                                        return resp.status(200).send({
                                            message: "Usuario encontrado.",
                                            validado: true, user: rows[0].idusuario, externo: returnBoolean(rows[0].externo)
                                        });
                                    }
                                    //Contraseña no válida 
                                    else {
                                        return resp.status(200).send({ message: "Contraseña incorrecta.", validado: false, error: 101 });
                                    }
                                }
                            });
                    }
                    //El usuario no existe
                    else {
                        return resp.status(200).send({ message: "El Usuario no existe.", validado: false, error: 100 });
                    }
                }
            });
    });

}