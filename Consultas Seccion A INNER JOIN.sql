--Consultas Sección B: LEFT JOIN / RIGHT JOIN
-- A1
SELECT 
    v.id_viaje,
    r.nombre AS ruta,
    r.origen,
    r.destino,
    c.nombre AS conductor,
    ve.placa,
    p.nombre AS pasajero,
    b.asiento,
    b.monto
FROM viajes v
INNER JOIN rutas r ON v.id_ruta = r.id_ruta
INNER JOIN conductores c ON v.id_conductor = c.id_conductor
INNER JOIN vehiculos ve ON v.id_vehiculo = ve.id_vehiculo
INNER JOIN boletos b ON v.id_viaje = b.id_viaje
INNER JOIN pasajeros p ON b.id_pasajero = p.id_pasajero;

-- A2
SELECT 
    v.id_viaje,
    r.nombre AS ruta,
    c.nombre AS conductor,
    ve.placa,
    v.estado
FROM viajes v
INNER JOIN rutas r ON v.id_ruta = r.id_ruta
INNER JOIN conductores c ON v.id_conductor = c.id_conductor
INNER JOIN vehiculos ve ON v.id_vehiculo = ve.id_vehiculo
WHERE r.estado = 'ACTIVA'
AND c.estado = 'ACTIVO'
AND ve.estado = 'DISPONIBLE';

-- A3
SELECT 
    v.id_viaje,
    r.nombre AS ruta,
    c.nombre AS conductor,
    ve.placa,
    v.fecha_salida
FROM viajes v
INNER JOIN rutas r ON v.id_ruta = r.id_ruta
INNER JOIN conductores c ON v.id_conductor = c.id_conductor
INNER JOIN vehiculos ve ON v.id_vehiculo = ve.id_vehiculo
WHERE v.fecha_salida BETWEEN SYSDATE - 30 AND SYSDATE
ORDER BY v.fecha_salida;

-- A4
SELECT 
    p.nombre AS pasajero,
    r.nombre AS ruta,
    b.asiento,
    b.fecha_compra,
    pa.metodo_pago
FROM boletos b
INNER JOIN pasajeros p ON b.id_pasajero = p.id_pasajero
INNER JOIN viajes v ON b.id_viaje = v.id_viaje
INNER JOIN rutas r ON v.id_ruta = r.id_ruta
INNER JOIN pagos pa ON b.id_boleto = pa.id_boleto
WHERE b.fecha_compra >= ADD_MONTHS(SYSDATE, -1);

-- A5
SELECT 
    p.nombre AS "Nombre del pasajero",
    r.nombre AS "Ruta asignada",
    r.origen AS "Lugar de salida",
    r.destino AS "Lugar de llegada",
    b.asiento AS "Número de asiento",
    b.monto AS "Monto pagado"
FROM boletos b
INNER JOIN pasajeros p ON b.id_pasajero = p.id_pasajero
INNER JOIN viajes v ON b.id_viaje = v.id_viaje
INNER JOIN rutas r ON v.id_ruta = r.id_ruta;

-- A6
SELECT 
    c.nombre AS conductor,
    COUNT(v.id_viaje) AS total_viajes
FROM viajes v
INNER JOIN conductores c ON v.id_conductor = c.id_conductor
INNER JOIN rutas r ON v.id_ruta = r.id_ruta
GROUP BY c.nombre;