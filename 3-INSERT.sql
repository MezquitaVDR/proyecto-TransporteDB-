INSERT INTO rutas VALUES (seq_rutas.NEXTVAL, 'Ruta Centro Norte', 'San Salvador', 'Santa Ana', 65.50, 'ACTIVA');
INSERT INTO rutas VALUES (seq_rutas.NEXTVAL, 'Ruta Oriental', 'San Salvador', 'San Miguel', 138.00, 'ACTIVA');
INSERT INTO rutas VALUES (seq_rutas.NEXTVAL, 'Ruta Costera', 'La Libertad', 'Usulután', 120.00, 'ACTIVA');
INSERT INTO rutas VALUES (seq_rutas.NEXTVAL, 'Ruta Occidente', 'Sonsonate', 'Ahuachapán', 42.00, 'INACTIVA');

INSERT INTO vehiculos VALUES (seq_vehiculos.NEXTVAL, 'AB1234', 'Toyota Coaster', 30, 'DISPONIBLE');
INSERT INTO vehiculos VALUES (seq_vehiculos.NEXTVAL, 'CD5678', 'Hyundai County', 28, 'DISPONIBLE');
INSERT INTO vehiculos VALUES (seq_vehiculos.NEXTVAL, 'EF9012', 'Mercedes Sprinter', 20, 'MANTENIMIENTO');
INSERT INTO vehiculos VALUES (seq_vehiculos.NEXTVAL, 'GH3456', 'Nissan Civilian', 25, 'DISPONIBLE');

INSERT INTO conductores VALUES (seq_conductores.NEXTVAL, 'Carlos Méndez', 'LIC001', '70000001', 'ACTIVO');
INSERT INTO conductores VALUES (seq_conductores.NEXTVAL, 'Mario López', 'LIC002', '70000002', 'ACTIVO');
INSERT INTO conductores VALUES (seq_conductores.NEXTVAL, 'José Ramírez', 'LIC003', '70000003', 'INACTIVO');
INSERT INTO conductores VALUES (seq_conductores.NEXTVAL, 'Luis Hernández', 'LIC004', '70000004', 'ACTIVO');

INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, 'Ana Pérez', 'DUI001', '71000001', 'ana@email.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, 'Roberto García', 'DUI002', '71000002', 'roberto@email.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, 'Marta Flores', 'DUI003', '71000003', 'marta@email.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, 'Daniel Torres', 'DUI004', '71000004', 'daniel@email.com');
INSERT INTO pasajeros VALUES (seq_pasajeros.NEXTVAL, 'Sofía Martínez', 'DUI005', '71000005', 'sofia@email.com');

INSERT INTO viajes VALUES (seq_viajes.NEXTVAL, 1, 1, 1, SYSDATE - 20, SYSDATE - 20 + 3/24, 'FINALIZADO', 5.00);
INSERT INTO viajes VALUES (seq_viajes.NEXTVAL, 2, 2, 2, SYSDATE - 10, SYSDATE - 10 + 4/24, 'FINALIZADO', 9.00);
INSERT INTO viajes VALUES (seq_viajes.NEXTVAL, 3, 4, 4, SYSDATE - 5, NULL, 'PROGRAMADO', 7.50);
INSERT INTO viajes VALUES (seq_viajes.NEXTVAL, 1, 1, 1, SYSDATE + 2, NULL, 'PROGRAMADO', 5.00);

INSERT INTO boletos VALUES (seq_boletos.NEXTVAL, 1, 1, 'A1', SYSDATE - 21, 5.00, 'PAGADO');
INSERT INTO boletos VALUES (seq_boletos.NEXTVAL, 1, 2, 'A2', SYSDATE - 21, 5.00, 'PAGADO');
INSERT INTO boletos VALUES (seq_boletos.NEXTVAL, 2, 3, 'B1', SYSDATE - 11, 9.00, 'PAGADO');
INSERT INTO boletos VALUES (seq_boletos.NEXTVAL, 2, 4, 'B2', SYSDATE - 11, 9.00, 'PAGADO');
INSERT INTO boletos VALUES (seq_boletos.NEXTVAL, 3, 1, 'C1', SYSDATE - 6, 7.50, 'PAGADO');

INSERT INTO pagos VALUES (seq_pagos.NEXTVAL, 1, 'EFECTIVO', 5.00, SYSDATE - 21, 'CONFIRMADO');
INSERT INTO pagos VALUES (seq_pagos.NEXTVAL, 2, 'TARJETA', 5.00, SYSDATE - 21, 'CONFIRMADO');
INSERT INTO pagos VALUES (seq_pagos.NEXTVAL, 3, 'EFECTIVO', 9.00, SYSDATE - 11, 'CONFIRMADO');
INSERT INTO pagos VALUES (seq_pagos.NEXTVAL, 4, 'TRANSFERENCIA', 9.00, SYSDATE - 11, 'CONFIRMADO');
INSERT INTO pagos VALUES (seq_pagos.NEXTVAL, 5, 'TARJETA', 7.50, SYSDATE - 6, 'CONFIRMADO');

COMMIT;


