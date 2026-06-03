-- Sección C - Consultas con funciones de agregado (6 consultas, al menos 3 tablas, GROUP BY + HAVING)

-- C1 
SELECT 
    r.nombre AS ruta,
    r.origen,
    r.destino,
    COUNT(b.id_boleto) AS total_boletos_vendidos,
    SUM(b.monto) AS ingresos_totales
FROM rutas r
INNER JOIN viajes v ON r.id_ruta = v.id_ruta
INNER JOIN boletos b ON v.id_viaje = b.id_viaje
GROUP BY r.nombre, r.origen, r.destino
ORDER BY ingresos_totales DESC;

-- C2 
SELECT 
    r.nombre AS ruta,
    AVG(b.monto) AS precio_promedio_boleto,
    MAX(b.monto) AS boleto_mas_caro
FROM rutas r
INNER JOIN viajes v ON r.id_ruta = v.id_ruta
INNER JOIN boletos b ON v.id_viaje = b.id_viaje
GROUP BY r.nombre
HAVING AVG(b.monto) > 5.00
ORDER BY precio_promedio_boleto DESC;

-- C3 
SELECT 
    TO_CHAR(v.fecha_salida, 'YYYY-MM') AS periodo_mes,
    COUNT(DISTINCT v.id_viaje) AS total_viajes_realizados,
    COUNT(b.id_boleto) AS boletos_vendidos,
    SUM(b.monto) AS recaudacion_mensual
FROM viajes v
INNER JOIN rutas r ON v.id_ruta = r.id_ruta
INNER JOIN boletos b ON v.id_viaje = b.id_viaje
GROUP BY TO_CHAR(v.fecha_salida, 'YYYY-MM')
ORDER BY periodo_mes ASC;

-- C4 
SELECT 
    p.id_pasajero,
    p.nombre AS pasajero,
    p.correo,
    COUNT(b.id_boleto) AS total_boletos,
    SUM(b.monto) AS total_dinero_gastado
FROM pasajeros p
INNER JOIN boletos b ON p.id_pasajero = b.id_pasajero
INNER JOIN viajes v ON b.id_viaje = v.id_viaje
GROUP BY p.id_pasajero, p.nombre, p.correo
ORDER BY total_dinero_gastado DESC
FETCH FIRST 3 ROWS ONLY;

-- C5 
SELECT 
    r.nombre AS ruta,
    SUM(b.monto) AS recaudacion_total_ruta
FROM rutas r
INNER JOIN viajes v ON r.id_ruta = v.id_ruta
INNER JOIN boletos b ON v.id_viaje = b.id_viaje
GROUP BY r.nombre
HAVING SUM(b.monto) > (
    SELECT AVG(SUM(b2.monto)) 
    FROM rutas r2
    INNER JOIN viajes v2 ON r2.id_ruta = v2.id_ruta
    INNER JOIN boletos b2 ON v2.id_viaje = b2.id_viaje
    GROUP BY r2.id_ruta
)
ORDER BY recaudacion_total_ruta DESC;

-- C6 
SELECT 
    ve.placa AS placa_autobus,
    ve.modelo AS tipo_vehiculo,
    ve.capacidad AS capacidad_maxima,
    COUNT(DISTINCT v.id_viaje) AS viajes_operados,
    COUNT(b.id_boleto) AS pasajeros_totales_transportados,
    SUM(b.monto) AS ingresos_generados_por_unidad
FROM vehiculos ve
INNER JOIN viajes v ON ve.id_vehiculo = v.id_vehiculo
INNER JOIN boletos b ON v.id_viaje = b.id_viaje
GROUP BY ve.placa, ve.modelo, ve.capacidad
ORDER BY ingresos_generados_por_unidad DESC;
