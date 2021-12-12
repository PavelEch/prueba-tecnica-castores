# Proyecto prueba para entrevista

# Enunciado:
    La empresa necesita para su portal web un sistema de noticias, en el cual se permita publicar varias notas (solo personal interno de la empresa) y a estas se les permita hacer comentarios por cualquier usuario registrado. Es necesario que a cualquier comentario se le pueda dar respuesta (por cualquier otro usuario).

# Objetivo general:
    Desarrollar una aplicación web para un portal de notas que permita registrar nuevas notas (si es usuario interno), permita visualizar las notas y los comentarios realizados en esta, en la sección de comentarios cualquier usuario podrá comentar y responder a otros usuarios.
	
# Requerimientos funcionales:
1. RF1 CREAR NOTAS: El usuario interno puede crear notas en la aplicación, estas son cargadas en la página principal.

2. RF2 CREAR COMENTARIO: cualquier usuario puede realizar un comentario en una nota o puede responder al comentario de otro usuario en esa misma nota, al comentar sin responder a ningún comentario este será cargado como un mensaje base (que no es respuesta de otro), si al comentar se responde a otro comentario este será cargado en una fila de comentarios respuesta de un comentario base y serán ordenados por fecha de creación.

3. RF3 MOSTRAR NOTAS: La aplicación muestra las notas creadas en la aplicación en la página principal de la aplicación.

4. RF4 MOSTRAR COMENTARIOS: La aplicación muestra los comentarios realizados en una nota específica, los comentarios incluyen la fecha de creación, el usuario que creo la nota, indican si el usuario es interno o externo, el comentario realizado, un botón para responder al comentario e incluyen el usuario y id de comentario al que se respondio en caso de ser un comentario que responde a otro comentario.

# Requerimientos no funcionales
1. RNF1 INICIO DE SESIÓN: La aplicación permitirá que el usuario ingrese a la aplicación a través de un formato de logueo al ingresar correo y contraseña, una vez ingresado tendra diferentes permisos según el tipo de usuario asignado a su sesión:

	Usuario externo: podrá ver las notas publicadas, entrar a estas y realizar comentarios o responder a otros comentarios. 

	Usuario interno: podrá crear nuevas notas, ver las notas publicadas y realizar comentarios o responder a otros comentarios. 

2. RNF2 VALIDACIÓN DE FORMULARIOS: se realizarán validaciones en cada uno de los formularios de la aplicación y se mostrarán estados y mensajes de error en la interfaz gráfica.
    
    Login: no permite valores vacíos, no permite formatos de correo no válidos, válida si usuario existe en base de datos y en caso que se ingrese un usuario válido si la contraseña ingresada es válida.

    Creación de notas: válida si se ingreso un título mayor a 12 caracteres.

    Creación de comentario: válida si el comentario es no vacío.


# Como correr este proyecto 

1. Levantar una instancia de base de datos MySQL

2. En base de datos MySQL crear base de datos: "pavel" e importar el archivo de base de datos anexado en este proyecto: "" 

3. Desde la carpeta del proyecto ejecutar el comando "npm-install" para instalar las dependencias del proyecto

4. Desde la carpeta del proyecto ejecutar el archivo "server.js" en consola de comandos utilizando el comando: "node.js server.js"

4. Visualizar el proyecto en cliente web utilizando el path: http://localhost:8080, si se tiene ocupado ese puerto cambiar el puerto en el
    archivo server.js y visualizar el proyecto en la ruta correspondiente

5. Nota: al insertar una nota o realizar un comentario actualizar página para visualizar los cambios

# Cuentas de usuario

1. Interno - correo: pavelecheveste@gmail.com contraseña: 12345.

2. Externo - correo: luiszuñiga@gmail.com contraseña: 12345.

# configuración de base de datos
1. host: 'localhost',
2. user: 'root',
3. password: '',
4. database: 'pavel'
