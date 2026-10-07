 CREATE DATABASE IF NOT EXISTS
 biblioteca_centro;
 USE biblioteca_centro;

 CREATE TABLE Autor (
    codigo_autor  INT  PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
 );

 CREATE  TABLE Libro (
    codigo_libro INT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ISBN VARCHAR(20),
    editorial VARCHAR(100),
    numero_paginas INT
     );

CREATE TABLE Ejemplar (
    codigo_ejemplar INT PRIMARY KEY,
    localizacion VARCHAR(100),
    codigo_libro INT NOT NULL,

    FOREIGN KEY (codigo_libro)
    REFERENCES Libro(codigo_libro)
);

 CREATE TABLE usuario (
    codigo_usuario INT PRIMARY  KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150),
    telefono VARCHAR(20)
   );

CREATE TABLE Autor_libro (
    codigo_autor INT NOT NULL,
    codigo_libro INT NOT NULL,

    PRIMARY KEY (codigo_autor , codigo_libro),

    FOREIGN KEY (codigo_autor)
        REFERENCES Autor(codigo_autor),

    FOREIGN KEY (codigo_libro)
        REFERENCES Libro(codigo_libro)
    );

CREATE TABLE Prestamo(
        codigo_usuario INT NOT NULL,
        codigo_ejemplar  INT NOT NULL,
        fecha_prestamo DATE NOT NULL,
        fecha_devolucion DATE,

        PRIMARY KEY (
            codigo_usuario,
            codigo_ejemplar,
            fecha_prestamo
        ),

        FOREIGN KEY (codigo_usuario) 
            REFERENCES Usuario(codigo_usuario),

        FOREIGN KEY  (codigo_ejemplar)
            REFERENCES Ejemplar(codigo_ejemplar)

);

