CREATE DATABASE clinica_vida_nueva;
USE clinica_vida_nueva;

CREATE TABLE Paciente (
    codigo_paciente INT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    apellidos VARCHAR (80) NOT NULL,
    direccion VARCHAR  (150),
    poblacion VARCHAR (80),
    Provincia VARCHAR (80),
    codigo_postal VARCHAR (10),
    telefono VARCHAR (20),
    fecha_nacimiento DATE
);

CREATE TABLE Medico (
    Codigo_Medico INT PRIMARY KEY,
    Nombre VARCHAR (50) NOT NULL,
    apellidos VARCHAR (80) NOT NULL,
    Telefono VARCHAR (20),
    Especialidad VARCHAR (80)
);

CREATE TABLE Ingresos (
    codigo_Ingreso INT AUTO_INCREMENT PRIMARY KEY,
    numero_habitacion INT,
    cama VARCHAR (10),
    fecha_ingreso DATE, 
    Codigo_Paciente INT NOT NULL,
    Codigo_Medico INT NOT NULL,

    FOREIGN KEY (codigo_Paciente)
        REFERENCES
Paciente(codigo_Paciente),

    FOREIGN  KEY (codigo_Medico)
        REFERENCES 
Medico(codigo_Medico)
);


SHOW CREATE TABLE Ingresos;