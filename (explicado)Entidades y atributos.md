# 2. Identificación de Entidades y Atributos (TransporteDB)

En esta sección se detallan las tablas principales del sistema **TransporteDB**, sus estructuras de datos, tipos y las restricciones que garantizan la integridad referencial del modelo relacional.

---

## A. Entidades Maestras (Tablas Base)

### 1. RUTAS
Almacena la información geográfica de los trayectos operados por la empresa.

**Atributos:**
* `id_ruta` **(NUMBER)**: Identificador único secuencial. `[PK]`
* `nombre` **(VARCHAR2(100))**: Nombre descriptivo del trayecto. `[NOT NULL]`
* `origen` **(VARCHAR2(100))**: Terminal o ciudad de inicio. `[NOT NULL]`
* `destino` **(VARCHAR2(100))**: Terminal o ciudad de destino. `[NOT NULL]`
* `distancia_km` **(NUMBER(8,2))**: Kilometraje total del recorrido. `[NOT NULL]`
* `estado` **(VARCHAR2(20))**: Estado operativo de la ruta (Ej: 'ACTIVA', 'INACTIVA'). `[DEFAULT 'ACTIVA', NOT NULL]`

### 2. VEHICULOS
Registra los activos físicos automotores que componen la flota.

**Atributos:**
* `id_vehiculo` **(NUMBER)**: Identificador único secuencial. `[PK]`
* `placa` **(VARCHAR2(20))**: Matrícula de identificación. `[UNIQUE, NOT NULL]`
* `modelo` **(VARCHAR2(100))**: Marca y línea (Ej: 'Toyota Coaster'). `[NOT NULL]`
* `capacidad` **(NUMBER)**: Cantidad máxima de asientos. `[NOT NULL]`
* `estado` **(VARCHAR2(20))**: Situación (Ej: 'DISPONIBLE', 'MANTENIMIENTO'). `[DEFAULT 'DISPONIBLE', NOT NULL]`

### 3. CONDUCTORES
Contiene el padrón del personal técnico encargado de la operación.

**Atributos:**
* `id_conductor` **(NUMBER)**: Identificador único secuencial. `[PK]`
* `nombre` **(VARCHAR2(100))**: Nombre completo del empleado. `[NOT NULL]`
* `licencia` **(VARCHAR2(30))**: Número único de licencia. `[UNIQUE, NOT NULL]`
* `telefono` **(VARCHAR2(20))**: Número de contacto telefónico.
* `estado` **(VARCHAR2(20))**: Disponibilidad (Ej: 'ACTIVO', 'INACTIVO'). `[DEFAULT 'ACTIVO', NOT NULL]`

### 4. PASAJEROS
Registra la información de los clientes que compran servicios.

**Atributos:**
* `id_pasajero` **(NUMBER)**: Identificador único secuencial. `[PK]`
* `nombre` **(VARCHAR2(100))**: Nombre completo del pasajero. `[NOT NULL]`
* `documento` **(VARCHAR2(30))**: Documento Único de Identidad (DUI). `[UNIQUE, NOT NULL]`
* `telefono` **(VARCHAR2(20))**: Teléfono del usuario.
* `correo` **(VARCHAR2(100))**: Dirección de correo electrónico.

---

## B. Entidades Operativas (Control de Transacciones y Viajes)

### 5. VIAJES
Entidad pivote que planifica la operación conectando las entidades maestras.

**Atributos:**
* `id_viaje` **(NUMBER)**: Identificador único de la corrida. `[PK]`
* `id_ruta` **(NUMBER)**: Ruta asignada al viaje. `[FK]`
* `id_vehiculo` **(NUMBER)**: Vehículo físico asignado. `[FK]`
* `id_conductor` **(NUMBER)**: Chofer responsable. `[FK]`
* `fecha_salida` **(DATE)**: Marca de tiempo exacta de salida. `[NOT NULL]`
* `fecha_llegada` **(DATE)**: Registro del fin del viaje.
* `estado` **(VARCHAR2(20))**: Estado del itinerario (Ej: 'PROGRAMADO', 'FINALIZADO'). `[DEFAULT 'PROGRAMADO', NOT NULL]`
* `precio` **(NUMBER(10,2))**: Costo individual del pasaje. `[NOT NULL]`

### 6. BOLETOS
Modela la reserva y asignación de un asiento específico para un viaje.

**Atributos:**
* `id_boleto` **(NUMBER)**: Identificador único del pasaje. `[PK]`
* `id_viaje` **(NUMBER)**: Código de la corrida programada. `[FK]`
* `id_pasajero` **(NUMBER)**: Cliente que abordará. `[FK]`
* `asiento` **(VARCHAR2(10))**: Código de la plaza física (Ej: 'A1'). `[NOT NULL]`
* `fecha_compra` **(DATE)**: Fecha del registro de venta. `[DEFAULT SYSDATE, NOT NULL]`
* `monto` **(NUMBER(10,2))**: Valor de venta del boleto. `[NOT NULL]`
* `estado` **(VARCHAR2(20))**: Estatus del boleto (Ej: 'PAGADO', 'CANCELADO'). `[DEFAULT 'PAGADO', NOT NULL]`

> **Restricciones de Integridad Compuesta:**
> * `uq_boleto_asiento`: Clave única compuesta por (`id_viaje`, `asiento`). Asegura físicamente que no se venda el mismo asiento dos veces para el mismo viaje.

### 7. PAGOS
Documenta la transacción económica derivada de la compra de un boleto.

**Atributos:**
* `id_pago` **(NUMBER)**: Identificador de la transacción contable. `[PK]`
* `id_boleto` **(NUMBER)**: Boleto que ampara dicho cobro. `[FK]`
* `metodo_pago` **(VARCHAR2(30))**: Forma de pago (Ej: 'EFECTIVO', 'TARJETA'). `[NOT NULL]`
* `monto_pagado` **(NUMBER(10,2))**: Cantidad total abonada. `[NOT NULL]`
* `fecha_pago` **(DATE)**: Momento exacto de la transacción. `[DEFAULT SYSDATE, NOT NULL]`
* `estado` **(VARCHAR2(20))**: Situación del cobro (Ej: 'CONFIRMADO'). `[DEFAULT 'CONFIRMADO', NOT NULL]`
