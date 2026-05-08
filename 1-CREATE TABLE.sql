CREATE TABLE rutas (
    id_ruta NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    origen VARCHAR2(100) NOT NULL,
    destino VARCHAR2(100) NOT NULL,
    distancia_km NUMBER(8,2) NOT NULL,
    estado VARCHAR2(20) DEFAULT 'ACTIVA' NOT NULL
);

CREATE TABLE vehiculos (
    id_vehiculo NUMBER PRIMARY KEY,
    placa VARCHAR2(20) UNIQUE NOT NULL,
    modelo VARCHAR2(100) NOT NULL,
    capacidad NUMBER NOT NULL,
    estado VARCHAR2(20) DEFAULT 'DISPONIBLE' NOT NULL
);

CREATE TABLE conductores (
    id_conductor NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    licencia VARCHAR2(30) UNIQUE NOT NULL,
    telefono VARCHAR2(20),
    estado VARCHAR2(20) DEFAULT 'ACTIVO' NOT NULL
);

CREATE TABLE pasajeros (
    id_pasajero NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    documento VARCHAR2(30) UNIQUE NOT NULL,
    telefono VARCHAR2(20),
    correo VARCHAR2(100)
);

CREATE TABLE viajes (
    id_viaje NUMBER PRIMARY KEY,
    id_ruta NUMBER NOT NULL,
    id_vehiculo NUMBER NOT NULL,
    id_conductor NUMBER NOT NULL,
    fecha_salida DATE NOT NULL,
    fecha_llegada DATE,
    estado VARCHAR2(20) DEFAULT 'PROGRAMADO' NOT NULL,
    precio NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_viajes_rutas FOREIGN KEY (id_ruta) REFERENCES rutas(id_ruta),
    CONSTRAINT fk_viajes_vehiculos FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
    CONSTRAINT fk_viajes_conductores FOREIGN KEY (id_conductor) REFERENCES conductores(id_conductor)
);

CREATE TABLE boletos (
    id_boleto NUMBER PRIMARY KEY,
    id_viaje NUMBER NOT NULL,
    id_pasajero NUMBER NOT NULL,
    asiento VARCHAR2(10) NOT NULL,
    fecha_compra DATE DEFAULT SYSDATE NOT NULL,
    monto NUMBER(10,2) NOT NULL,
    estado VARCHAR2(20) DEFAULT 'PAGADO' NOT NULL,
    CONSTRAINT fk_boletos_viajes FOREIGN KEY (id_viaje) REFERENCES viajes(id_viaje),
    CONSTRAINT fk_boletos_pasajeros FOREIGN KEY (id_pasajero) REFERENCES pasajeros(id_pasajero),
    CONSTRAINT uq_boleto_asiento UNIQUE (id_viaje, asiento)
);

CREATE TABLE pagos (
    id_pago NUMBER PRIMARY KEY,
    id_boleto NUMBER NOT NULL,
    metodo_pago VARCHAR2(30) NOT NULL,
    monto_pagado NUMBER(10,2) NOT NULL,
    fecha_pago DATE DEFAULT SYSDATE NOT NULL,
    estado VARCHAR2(20) DEFAULT 'CONFIRMADO' NOT NULL,
    CONSTRAINT fk_pagos_boletos FOREIGN KEY (id_boleto) REFERENCES boletos(id_boleto)
);

CREATE TABLE auditoria_viajes (
    id_auditoria NUMBER PRIMARY KEY,
    id_viaje NUMBER,
    usuario_oracle VARCHAR2(100),
    fecha_accion DATE,
    accion VARCHAR2(20),
    estado_anterior VARCHAR2(20),
    estado_nuevo VARCHAR2(20),
    precio_anterior NUMBER(10,2),
    precio_nuevo NUMBER(10,2)
);

CREATE TABLE log_errores (
    id_error NUMBER PRIMARY KEY,
    nombre_proceso VARCHAR2(100),
    mensaje_error VARCHAR2(4000),
    fecha_error DATE DEFAULT SYSDATE,
    usuario_oracle VARCHAR2(100)
);
