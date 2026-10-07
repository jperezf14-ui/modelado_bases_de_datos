CREATE DATABASE  IF NOT EXISTS ventas_empresa;

USE ventas_empresa;

CREATE TABLE Estado (
    clave_estado INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    CargoXEnvvio DECIMAL(10,2) NOT NULL
);

CREATE TABLE Cliente (
    numero_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estatus VARCHAR(50),
    clave_estado INT NOT NULL,

    FOREIGN KEY (clave_estado)
        REFERENCES Estado(clave_estado)
);

CREATE TABLE Producto (
    numero_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    color VARCHAR(50),
    precio DECIMAL(10,2) NOT NULL 
);

CREATE TABLE Cuenta_Credito (
    numero_cuenta INT PRIMARY KEY,
    saldo DECIMAL(10,2) NOT NULL,
    numero_cliente INT NOT NULL,

    FOREIGN KEY (numero_cliente)
        REFERENCES Cliente(numero_cliente)
);

CREATE TABLE Tipo_Movimiento (
    clave_tipo_movimiento INT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL 
);

CREATE TABLE Movimiento (
    numero_cuenta INT NOT NULL,
    numero_movimiento INT NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    Clave_tipo_movimiento INT NOT NULL,

    PRIMARY KEY (numero_cuenta, numero_movimiento),

    FOREIGN KEY (numero_cuenta)
        REFERENCES Cuenta_Credito(numero_cuenta),

    FOREIGN KEY (clave_tipo_movimiento)
        REFERENCES Tipo_Movimiento(clave_tipo_movimiento)
);

CREATE TABLE Ordena(
    numero_cliente INT NOT NULL,
    numero_producto INT NOT NULL,
    cantidad INT NOT NULL,

    PRIMARY KEY (numero_cliente, numero_producto),

    FOREIGN KEY (numero_cliente)
        REFERENCES Cliente(numero_cliente),

    FOREIGN KEY (numero_producto)
        REFERENCES Producto(numero_producto)
);


