--Consultas Sección B: LEFT JOIN / RIGHT JOIN 
--B1
SELECT 
    p.id_pasajero,
    p.nombre
FROM pasajeros p
LEFT JOIN boletos b ON p.id_pasajero = b.id_pasajero
WHERE b.id_boleto IS NULL;

-- B2
SELECT 
    ve.id_vehiculo,
    ve.placa,
    ve.modelo
FROM vehiculos ve
LEFT JOIN viajes v ON ve.id_vehiculo = v.id_vehiculo
WHERE v.id_viaje IS NULL;

-- B3
SELECT 
    r.id_ruta,
    r.nombre
FROM rutas r
LEFT JOIN viajes v ON r.id_ruta = v.id_ruta
WHERE v.id_viaje IS NULL;

-- B4
SELECT 
    p.nombre AS pasajero,
    CASE 
        WHEN b.id_boleto IS NULL THEN 'SIN VIAJES'
        ELSE 'CON VIAJES'
    END AS estado_actividad
FROM pasajeros p
LEFT JOIN boletos b ON p.id_pasajero = b.id_pasajero;

-- B5
SELECT 
    v.id_viaje,
    ve.placa,
    ve.modelo
FROM viajes v
RIGHT JOIN vehiculos ve ON v.id_vehiculo = ve.id_vehiculo
WHERE v.id_viaje IS NULL;

-- B6
SELECT 
    c.nombre AS conductor,
    CASE 
        WHEN v.id_viaje IS NULL THEN 'SIN VIAJES ASIGNADOS'
        ELSE 'CON VIAJES ASIGNADOS'
    END AS estado_asignacion
FROM conductores c
LEFT JOIN viajes v ON c.id_conductor = v.id_conductor;