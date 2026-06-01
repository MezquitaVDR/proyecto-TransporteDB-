# proyecto-TransporteDB-
proyecto base de datos tema 10

## 1. Definición del Propósito de la Base de Datos

## ¿Qué problema o necesidad resolverá la base de datos?

El sistema automatiza y optimiza la operación de la empresa de transportes resolviendo tres necesidades críticas mediante controles lógicos y relacionales:

### Prevención de Conflictos de Asignación: 
Resuelve el riesgo logístico de programar un mismo conductor o vehículo en múltiples viajes simultáneos. Centraliza la asignación en la entidad de control operacional, permitiendo validar la disponibilidad de recursos antes de confirmar un itinerario.

### Control de Capacidad y Evitación de Sobreventa: 
Detiene la venta de boletos cuando esta alcanza el límite físico de asientos del vehículo asignado (capacidad). Físicamente, el modelo implementa una restricción de unicidad (UQ_BOLETO_ASIENTO) que impide que dos pasajeros ocupen el mismo asiento en un mismo viaje.

### Trazabilidad General y Auditoría Histórica: 
Registra el historial exacto de traslados y transacciones financieras (conectando pasajeros, boletos, pagos y viajes). Además, incorpora infraestructura de seguridad mediante tablas de auditoría de estados (AUDITORIA_VIAJES) y registro de excepciones (LOG_ERRORES).


## 2. Modelo Conceptual y Relacional
## ¿Qué entidades y relaciones se deben modelar?

Para satisfacer las reglas de negocio descritas, el diseño de la base de datos se compone de las siguientes entidades organizadas jerárquicamente:

### A. Entidades Maestras (Catálogos Base)

| Entidad | Descripción / Propósito |
| :--- | :--- |
| **RUTAS** | Define los trayectos autorizados origen-destino y su distancia en kilómetros. |
| **VEHICULOS** | Registra la flota operativa portando atributos clave como la placa, el modelo y la capacidad total de pasajeros. |
| **CONDUCTORES** | Almacena la información del personal de manejo y el estado de su licencia de conducir. |
| **PASAJEROS** | Identifica a los usuarios del servicio mediante su respectivo Documento Único de Identidad (DUI). |

### B. Entidades Operativas y de Control

| Entidad | Descripción / Operación |
| :--- | :--- |
| **VIAJES** | Entidad pivote que consolida la planificación del servicio, asociando una ruta, un vehículo y un conductor a una fecha y hora de salida específicas. |
| **BOLETOS** | Controla la reservación individual de un espacio físico dentro de un viaje para un pasajero determinado. |
| **PAGOS** | Registra el detalle contable y el método de pago asociado a la emisión de cada boleto. |

### C. Relaciones y Restricciones del Modelo

| Entidad Origen | Entidad Destino | Cardinalidad | Llave Foránea / Restricción | Regla de Negocio |
| :--- | :--- | :---: | :--- | :--- |
| **RUTAS** | VIAJES | 1:N | - | Una ruta fija puede ser asignada a múltiples viajes programados cronológicamente. |
| **VEHICULOS** | VIAJES | 1:N | `FK_VIAJES_VEHICULOS` | Un vehículo realiza diferentes viajes en el tiempo. |
| **CONDUCTORES** | VIAJES | 1:N | `FK_VIAJES_CONDUCTORES` | Un chofer opera múltiples viajes de forma secuencial. |
| **VIAJES** | BOLETOS | 1:N | - | Un viaje genera la venta de múltiples boletos individuales hasta agotar la capacidad del transporte. |
| **PASAJEROS** | BOLETOS | 1:N | - | Un cliente puede adquirir múltiples boletos para trasladarse en distintas ocasiones. |
| **Relación Boleto** | PAGO | (1:1) | - | Cada boleto emitido genera un registro obligatorio de cobro referenciado por FK_PAGOS_BOLETOS.
