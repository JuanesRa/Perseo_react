// Carga paquete de express, librería de Node que proporciona la escritura de manejadores de peticiones con varios HTTP
const express = require("express");
const app = express();
// Carga paquete MySql para conectar la db
const mysql = require("mysql");
// Carga cors
const cors = require("cors");

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
    [id_tipoDocumento, numero_documento, nombre, apellido, email, telefono, id_tipoPersona],
    (error, result) => {
      if (error) {
        console.log(error);
      } else {
        res.send("Registro exitoso");
      }
    }
  );
});

// Activar el puerto para la conexión
app.listen(3001, () => {
  console.log("Puerto activo");
});
