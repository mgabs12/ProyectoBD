----------------------------- 5 ---------------------------------
SELECT m.Nombre, md.FechaInicio, md.FechaFin, tm.Tipo
FROM Maquina m
JOIN Mantenimiento_Detalle md ON m.idMaquina = md.idMaquina
JOIN Mantenimiento tm ON md.idTipoMan = tm.idTipoMan
WHERE md.FechaFin IS NULL OR md.FechaFin > GETDATE();
--------------------------
SELECT 
    m.Nombre AS NombreMaquina,
    tm.Tipo,
    md.FechaInicio,
    md.FechaFin
FROM 
    Mantenimiento_Detalle md
INNER JOIN 
    Mantenimiento tm ON md.idTipoMan = tm.idTipoMan
INNER JOIN 
    Maquina m ON md.idMaquina = m.idMaquina
WHERE md.FechaFin IS NULL OR md.FechaFin > GETDATE()
ORDER BY 
    m.Nombre, md.FechaInicio;


------------------------------ 6 ----------------------------
SELECT o.idOperario, o.Nombre, o.Apellido
FROM Operario o
WHERE NOT EXISTS (
    SELECT 1
    FROM Pedido p
    JOIN Prenda_Detalle pd ON p.idPedido = pd.idPedido
    JOIN Prenda pr ON pd.idPrenda = pr.idEstilo
    JOIN Operacion oper ON pr.idEstilo = oper.idOperacion
    WHERE p.idEstado = 1
    AND o.idOperario= o.idOperario
);
