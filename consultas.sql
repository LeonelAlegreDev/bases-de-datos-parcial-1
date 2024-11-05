#Listar el nombre de los empleados sin horas cargada 
SELECT nombre FROM empleados 
INNER JOIN movimientos 
ON empleados.IdEmpleado = movimientos.IdEmpleado 
WHERE movimientos.CantHoras = 0;

#Listar la cantidad de horas por año y mes