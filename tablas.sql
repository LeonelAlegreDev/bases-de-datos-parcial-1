CREATE TABLE EstadosTareas (
    IdEstadoTarea INT PRIMARY KEY,
    Descripcion VARCHAR(50),
    Orden INT
);
INSERT INTO EstadosTareas (IdEstadoTarea, Descripcion, Orden)
VALUES
  (1, 'Recibida', 1),
  (2, 'En curso', 2),
  (3, 'Finalizada', 3),
  (4, 'Rechazada', 3);

CREATE TABLE Empleados (
    IdEmpleado INT PRIMARY KEY,
    Apellido VARCHAR(50),
    Nombre VARCHAR(50)
);
INSERT INTO Empleados (IdEmpleado, Apellido, Nombre)
VALUES
  (1, 'Gomez', 'Jorge'),
  (2, 'Jazmin', 'Lia'),
  (3, 'Petalo', 'Rosa'),
  (4, 'Manuel', 'Norberto');

CREATE TABLE Tareas (
    IdTarea INT PRIMARY KEY,
    Descripcion VARCHAR(100),
    FechaAlta DATE,
    idEstadoTarea INT,
    Prioridad CHAR(1),
    FOREIGN KEY (idEstadoTarea) REFERENCES EstadosTareas(IdEstadoTarea)
);
INSERT INTO Tareas (IdTarea, Descripcion, FechaAlta, idEstadoTarea, Prioridad)
VALUES
  (1, 'Reparar carburador', '2002-01-01', 1, 'A'),
  (2, 'Llevar facturas al Cliente', '2002-02-01', 2, 'M'),
  (3, 'Realizar las cobranzas', '2002-02-20', 3, 'A'),
  (4, 'Planificar exposicion', '2002-02-28', 2, 'B');

CREATE TABLE Movimientos (
    TipoMov CHAR(1) NOT NULL CHECK (TipoMov IN ('A', 'T', 'F', 'R')),
    IdTarea INT NOT NULL,
    IdEmpleado INT NOT NULL,
    FechaHoraDesde DATE,
    CantHoras INT,
    PRIMARY KEY (TipoMov, IdTarea, IdEmpleado),
    FOREIGN KEY (IdTarea) REFERENCES Tareas(IdTarea),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleados(IdEmpleado)
);
INSERT INTO Movimientos (TipoMov, IdTarea, IdEmpleado, FechaHoraDesde, CantHoras)
VALUES
  ('A', 1, 1, '2002-01-01', 0),
  ('A', 2, 2, '2002-02-01', 0),
  ('A', 3, 3, '2002-02-20', 0),
  ('A', 4, 4, '2002-02-28', 0),
  ('T', 2, 2, '2002-02-01', 10),
  ('T', 3, 3, '2002-02-03', 10),
  ('F', 3, 3, '2002-02-04', 5),
  ('T', 4, 4, '2003-03-01', 15)
;