DROP DATABASE IF exists SPOTTHESPOT;

CREATE DATABASE SPOTTHESPOT CHARACTER SET utf8mb4;

USE SPOTTHESPOT;

CREATE TABLE usuarios (
	nombreUsuario VARCHAR(30) NOT NULL PRIMARY KEY,
    apellido1 VARCHAR(30) NOT NULL,
    contraseña VARCHAR(30) NOT NULL
);

CREATE TABLE servicios (
	codigoServicio INT auto_increment PRIMARY KEY,
    nombreServicio VARCHAR(40) NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE reservas (
	numReserva INT auto_increment PRIMARY KEY,
    nombreReserva VARCHAR(40) NOT NULL,
    fecha date not null,
    Servicio INT,
    nombreUsuario VARCHAR(30) NOT NULL,
    
    FOREIGN KEY (Servicio) references servicios(codigoServicio),
    FOREIGN KEY (nombreUsuario) references usuarios(nombreUsuario)
);

INSERT INTO usuarios VALUES('Paco','Jémez','Kdjiwm21');
INSERT INTO usuarios VALUES('Andy','Peeseekis','INOefewfn433');
INSERT INTO servicios VALUES(1,'Taco Bolos',13);
INSERT INTO servicios VALUES(2,'CINESSA',15);
INSERT INTO reservas VALUES(33,'Cine','2024-01-23',1,'Paco');
INSERT INTO reservas VALUES(642,'Restauracion', '2024-03-04',2,'Andy');

-- Consulta para mostrar todas las reservas realizadas por un usuario específico:
SELECT numReserva, nombreReserva, fecha, nombreUsuario
FROM reservas
WHERE nombreUsuario = 'Paco';


-- Consulta para ver los servicios
SELECT * 
FROM servicios;

-- Consulta para mostrar todas las reservas realizadas por un usuario con los detalles del servicio:
SELECT reservas.numReserva, reservas.nombreReserva, reservas.fecha, servicios.nombreServicio, servicios.precio
FROM reservas
JOIN servicios ON reservas.Servicio = servicios.codigoServicio
WHERE reservas.nombreUsuario = 'Paco';

-- Consulta para mostrar todos los usuarios que han reservado un servicio en una fecha específica
SELECT usuarios.nombreUsuario, reservas.nombreReserva, reservas.fecha
FROM reservas
JOIN usuarios ON reservas.nombreUsuario = usuarios.nombreUsuario
WHERE reservas.fecha = 'fecha_especifica';

-- Insercción de usuario
INSERT INTO usuarios (nombreUsuario, apellido1, contraseña)
VALUES ('Manolo', 'Escobar', 'K2e1kpda');

-- Insercción de un nuevo servicio 
INSERT INTO servicios (codigoServicio,nombreServicio, precio)
VALUES (3,'Parking', 5);

-- Modificación del precio de un servicio 
UPDATE servicios
SET precio = 25
WHERE codigoServicio = 2;

-- Modificacion de la fecha reservada
UPDATE reservas
SET fecha = '2024-03-08'
WHERE numReserva = 642;

-- Eliminación de un usuario
DELETE FROM usuarios
WHERE nombreUsuario = 'Manolo';

-- Eliminación de un servicio y todas las reservas asociadas
DELETE FROM servicios
WHERE codigoServicio = 2;

DELETE FROM reservas
WHERE Servicio = 2;

