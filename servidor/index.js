// Carga paquete de express, librería de Node que proporciona la escritura de manejadores de peticiones con varios HTTP
const express = require("express");
const app = express();
// Carga paquete MySql para conectar la db
const mysql = require("mysql");
// Carga cors
const cors = require("cors");

const bodyParser = require("body-parser");

// Ejecución antes de que el usuario acceda al registro
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "hotel_perseo",
});
// Método registrar
app.post("/create", (req, res) => {
  const id_tipoDocumento = req.body.id_tipoDocumento;
  const numero_documento = req.body.numero_documento;
  const nombre = req.body.nombre;
  const apellido = req.body.apellido;
  const email = req.body.email;
  const telefono = req.body.telefono;
  const id_tipoPersona = req.body.id_tipoPersona;

  // Consulta pata insertar los datos cargados a la base de datos
  db.query(
    "INSERT INTO persona(id_tipoDocumento, numero_documento, nombre, apellido, email, telefono, id_tipoPersona) VALUES (?,?,?,?,?,?,?)",
    [
      id_tipoDocumento,
      numero_documento,
      nombre,
      apellido,
      email,
      telefono,
      id_tipoPersona,
    ],
    (error, result) => {
      if (error) {
        console.log(error);
      } else {
        res.send("Registro exitoso");
      }
    }
  );
});

/*
INICIO DE SESION
 */

// Middleware para procesar datos JSON
app.use(bodyParser.json());

// Ruta para la autenticación
app.post("/autenticar", (req, res) => {
  const usuario = req.body.usuario;
  const contraseña = req.body.contraseña;
  db.query(
    "SELECT * FROM usuario WHERE email = ? AND contraseña = ?",
    [usuario, contraseña],
    (error, result) => {
      if (error) {
        console.log(error);
      }
      if (result.length > 0) {
        // Usuario autenticado correctamente
        console.log("Inicio de sesión exitoso");
      } else {
        // Credenciales incorrectas
        console.log("Credenciales incorrectas.");
      }
    }
  );
});


/*
RESERVA
 */
app.post("/reserva", (req, res) => {
      const fechaEntrada = req.body.fecha_inicio;
      const fechaSalida = req.body.fecha_fin;
      const cantidadAdultos = req.body.cantidad_adultos;
      const cantidadNinos = req.body.cantidad_niños;
      const precioCalculado = 100000;
      const numeroDocumento = req.body.numero_documento;
  
      // Realiza la inserción en la tabla reserva
      db.query(
          'INSERT INTO reserva(fecha_entrada, fecha_salida, cantidad_adultos, cantidad_niños, precio_calculado, numero_documento) VALUES (?,?,?,?,?,?)',
          [fechaEntrada, fechaSalida, cantidadAdultos, cantidadNinos, precioCalculado, numeroDocumento],
          (error, result) => {
              if (error) {
                  console.log(error);
                  // Manejo de errores
              } else {
                  res.send("Reserva Exitosa");
              }
          }
      );
  });


// Activar el puerto para la conexión
app.listen(3001, () => {
  console.log("Puerto activo");
});
