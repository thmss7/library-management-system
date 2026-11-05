-- Crear base de datos
CREATE DATABASE biblioteca;
USE biblioteca;

-- TABLAS PRINCIPALES


CREATE TABLE Editorial (
    id_editorial INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    pais VARCHAR(50),
    sitio_web VARCHAR(100),
    correo VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion VARCHAR(255)
);

CREATE TABLE Autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    nacionalidad VARCHAR(50)
);

CREATE TABLE Facultad (
    id_facultad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);

CREATE TABLE Carrera (
    id_carrera INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    id_facultad INT,
    FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad)
);

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    mail VARCHAR(100),
    telefono VARCHAR(20),
    tipo_usuario VARCHAR(50),
    estado VARCHAR(50),
    fecha_registro DATE,
    id_carrera INT,
    FOREIGN KEY (id_carrera) REFERENCES Carrera(id_carrera)
);


-- LIBROS


CREATE TABLE Libro (
    id_libro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150),
    sitio_web VARCHAR(100),
    anio_publicacion VARCHAR(10),
    id_editorial INT,
    id_categoria INT,
    FOREIGN KEY (id_editorial) REFERENCES Editorial(id_editorial),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Libro_Autor (
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro),
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor)
);


-- EJEMPLARES


CREATE TABLE Ejemplar (
    id_ejemplar INT PRIMARY KEY AUTO_INCREMENT,
    id_libro INT,
    numero_ejemplar INT,
    sitio_web VARCHAR(100),
    ubicacion VARCHAR(100),
    fecha_adquisicion DATE,
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);


-- PRESTAMOS


CREATE TABLE Prestamo (
    id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
    id_ejemplar INT,
    id_usuario INT,
    fecha_prestamo DATE,
    tipo_prestamo VARCHAR(50),
    renovaciones INT,
    FOREIGN KEY (id_ejemplar) REFERENCES Ejemplar(id_ejemplar),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Devolucion (
    id_devolucion INT PRIMARY KEY AUTO_INCREMENT,
    id_prestamo INT,
    fecha_devolucion DATE,
    condicion VARCHAR(100),
    FOREIGN KEY (id_prestamo) REFERENCES Prestamo(id_prestamo)
);

-- RESERVAS

CREATE TABLE Reserva (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_libro INT,
    fecha_reserva DATE,
    fecha_expiracion DATE,
    estado VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);

-- SANCIONES

CREATE TABLE Sancion (
    id_sancion INT PRIMARY KEY AUTO_INCREMENT,
    id_prestamo INT,
    id_usuario INT,
    motivo VARCHAR(255),
    monto DECIMAL(10,2),
    estado VARCHAR(50),
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_prestamo) REFERENCES Prestamo(id_prestamo),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- FACULTAD
INSERT INTO Facultad (nombre) VALUES
('Ingenieria'),('Salud'),('Educacion'),('Derecho'),('Economia'),
('Arte'),('Ciencias'),('Arquitectura'),('Psicologia'),('Turismo');

-- CARRERA
INSERT INTO Carrera (nombre,id_facultad) VALUES
('Sistemas',1),('Medicina',2),('Docencia',3),('Leyes',4),('Admin',5),
('Diseño',6),('Fisica',7),('Arquitectura',8),('Psicologia',9),('Hoteleria',10);

-- CATEGORIA
INSERT INTO Categoria VALUES
(NULL,'Novela','Ficción'),
(NULL,'Historia','Eventos'),
(NULL,'Ciencia','Investigación'),
(NULL,'Tecnología','IT'),
(NULL,'Arte','Creatividad'),
(NULL,'Matemática','Cálculo'),
(NULL,'Filosofía','Pensamiento'),
(NULL,'Educación','Aprendizaje'),
(NULL,'Salud','Medicina'),
(NULL,'Deporte','Actividad');

-- EDITORIAL
INSERT INTO Editorial VALUES
(NULL,'Santillana','España','web','correo','111'),
(NULL,'Planeta','México','web','correo','222'),
(NULL,'Pearson','USA','web','correo','333'),
(NULL,'McGraw','USA','web','correo','444'),
(NULL,'Anaya','España','web','correo','555'),
(NULL,'Oxford','UK','web','correo','666'),
(NULL,'Cambridge','UK','web','correo','777'),
(NULL,'Norma','Colombia','web','correo','888'),
(NULL,'Alfaguara','España','web','correo','999'),
(NULL,'Edebe','España','web','correo','101');

-- AUTOR
INSERT INTO Autor VALUES
(NULL,'Gabriel','Garcia','COL'),
(NULL,'Mario','Vargas','PER'),
(NULL,'Julio','Cortazar','ARG'),
(NULL,'Isabel','Allende','CHI'),
(NULL,'Borges','Luis','ARG'),
(NULL,'Neruda','Pablo','CHI'),
(NULL,'Stephen','King','USA'),
(NULL,'Rowling','JK','UK'),
(NULL,'Dan','Brown','USA'),
(NULL,'Orwell','George','UK');

-- LIBRO
INSERT INTO Libro VALUES
(NULL,'Libro1','web',2000,1,1),
(NULL,'Libro2','web',2001,2,2),
(NULL,'Libro3','web',2002,3,3),
(NULL,'Libro4','web',2003,4,4),
(NULL,'Libro5','web',2004,5,5),
(NULL,'Libro6','web',2005,6,6),
(NULL,'Libro7','web',2006,7,7),
(NULL,'Libro8','web',2007,8,8),
(NULL,'Libro9','web',2008,9,9),
(NULL,'Libro10','web',2009,10,10);

-- LIBRO_AUTOR
INSERT INTO Libro_Autor VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10);

-- EJEMPLAR
INSERT INTO Ejemplar VALUES
(NULL,1,1,'web','A1','2024-01-01'),
(NULL,2,1,'web','A2','2024-01-02'),
(NULL,3,1,'web','A3','2024-01-03'),
(NULL,4,1,'web','A4','2024-01-04'),
(NULL,5,1,'web','A5','2024-01-05'),
(NULL,6,1,'web','A6','2024-01-06'),
(NULL,7,1,'web','A7','2024-01-07'),
(NULL,8,1,'web','A8','2024-01-08'),
(NULL,9,1,'web','A9','2024-01-09'),
(NULL,10,1,'web','A10','2024-01-10');

-- USUARIO
INSERT INTO Usuario VALUES
(NULL,'Juan','Perez','mail','111','est','activo','2024-01-01',1),
(NULL,'Ana','Lopez','mail','222','est','activo','2024-01-02',1),
(NULL,'Luis','Gomez','mail','333','est','activo','2024-01-03',1),
(NULL,'Maria','Diaz','mail','444','est','activo','2024-01-04',1),
(NULL,'Pedro','Vega','mail','555','est','activo','2024-01-05',1),
(NULL,'Sofia','Rojas','mail','666','est','activo','2024-01-06',1),
(NULL,'Jose','Castro','mail','777','est','activo','2024-01-07',1),
(NULL,'Elena','Mora','mail','888','est','activo','2024-01-08',1),
(NULL,'David','Solano','mail','999','est','activo','2024-01-09',1),
(NULL,'Carlos','Ramirez','mail','000','est','activo','2024-01-10',1);

-- PRESTAMO
INSERT INTO Prestamo VALUES
(NULL,1,1,'2024-02-01','normal',0),
(NULL,2,2,'2024-02-02','normal',0),
(NULL,3,3,'2024-02-03','normal',0),
(NULL,4,4,'2024-02-04','normal',0),
(NULL,5,5,'2024-02-05','normal',0),
(NULL,6,6,'2024-02-06','normal',0),
(NULL,7,7,'2024-02-07','normal',0),
(NULL,8,8,'2024-02-08','normal',0),
(NULL,9,9,'2024-02-09','normal',0),
(NULL,10,10,'2024-02-10','normal',0);

-- DEVOLUCION
INSERT INTO Devolucion VALUES
(NULL,1,'2024-02-11','bueno'),
(NULL,2,'2024-02-12','bueno'),
(NULL,3,'2024-02-13','bueno'),
(NULL,4,'2024-02-14','bueno'),
(NULL,5,'2024-02-15','bueno'),
(NULL,6,'2024-02-16','bueno'),
(NULL,7,'2024-02-17','bueno'),
(NULL,8,'2024-02-18','bueno'),
(NULL,9,'2024-02-19','bueno'),
(NULL,10,'2024-02-20','bueno');

-- RESERVA
INSERT INTO Reserva VALUES
(NULL,1,1,'2024-03-01','2024-03-05','activa'),
(NULL,2,2,'2024-03-02','2024-03-06','activa'),
(NULL,3,3,'2024-03-03','2024-03-07','activa'),
(NULL,4,4,'2024-03-04','2024-03-08','activa'),
(NULL,5,5,'2024-03-05','2024-03-09','activa'),
(NULL,6,6,'2024-03-06','2024-03-10','activa'),
(NULL,7,7,'2024-03-07','2024-03-11','activa'),
(NULL,8,8,'2024-03-08','2024-03-12','activa'),
(NULL,9,9,'2024-03-09','2024-03-13','activa'),
(NULL,10,10,'2024-03-10','2024-03-14','activa');

-- SANCION
INSERT INTO Sancion VALUES
(NULL,1,1,'Atraso',10,'pendiente','2024-04-01','2024-04-05'),
(NULL,2,2,'Atraso',20,'pendiente','2024-04-02','2024-04-06'),
(NULL,3,3,'Atraso',30,'pendiente','2024-04-03','2024-04-07'),
(NULL,4,4,'Atraso',40,'pendiente','2024-04-04','2024-04-08'),
(NULL,5,5,'Atraso',50,'pendiente','2024-04-05','2024-04-09'),
(NULL,6,6,'Atraso',60,'pendiente','2024-04-06','2024-04-10'),
(NULL,7,7,'Atraso',70,'pendiente','2024-04-07','2024-04-11'),
(NULL,8,8,'Atraso',80,'pendiente','2024-04-08','2024-04-12'),
(NULL,9,9,'Atraso',90,'pendiente','2024-04-09','2024-04-13'),
(NULL,10,10,'Atraso',100,'pendiente','2024-04-10','2024-04-14');


-- join
SELECT l.titulo, c.nombre FROM Libro l JOIN Categoria c ON l.id_categoria=c.id_categoria;

SELECT u.nombre, p.fecha_prestamo FROM Usuario u JOIN Prestamo p ON u.id_usuario=p.id_usuario;

SELECT l.titulo, a.nombre 
FROM Libro l 
JOIN Libro_Autor la ON l.id_libro=la.id_libro
JOIN Autor a ON la.id_autor=a.id_autor;

-- sql case

SELECT nombre,
CASE 
WHEN estado='activo' THEN 'Habilitado'
ELSE 'Bloqueado'
END AS estado_usuario
FROM Usuario;

SELECT monto,
CASE 
WHEN monto > 50 THEN 'Alta'
ELSE 'Baja'
END AS tipo_multa
FROM Sancion;


-- VIEWS


CREATE VIEW vista_libros_detalle AS
SELECT l.id_libro, l.titulo, l.anio_publicacion,
       e.nombre AS editorial,
       c.nombre AS categoria
FROM Libro l
JOIN Editorial e ON l.id_editorial = e.id_editorial
JOIN Categoria c ON l.id_categoria = c.id_categoria;

CREATE VIEW vista_usuarios_detalle AS
SELECT u.id_usuario, u.nombre, u.apellido,
       u.tipo_usuario, u.estado,
       c.nombre AS carrera,
       f.nombre AS facultad
FROM Usuario u
JOIN Carrera c ON u.id_carrera = c.id_carrera
JOIN Facultad f ON c.id_facultad = f.id_facultad;

CREATE VIEW vista_prestamos_activos AS
SELECT p.id_prestamo,
       u.nombre AS usuario,
       l.titulo,
       p.fecha_prestamo
FROM Prestamo p
JOIN Usuario u ON p.id_usuario = u.id_usuario
JOIN Ejemplar e ON p.id_ejemplar = e.id_ejemplar
JOIN Libro l ON e.id_libro = l.id_libro
LEFT JOIN Devolucion d ON p.id_prestamo = d.id_prestamo
WHERE d.id_devolucion IS NULL;

CREATE VIEW vista_reservas_activas AS
SELECT r.id_reserva,
       u.nombre AS usuario,
       l.titulo,
       r.fecha_reserva,
       r.estado
FROM Reserva r
JOIN Usuario u ON r.id_usuario = u.id_usuario
JOIN Libro l ON r.id_libro = l.id_libro
WHERE r.estado = 'activa';

CREATE VIEW vista_sanciones_usuario AS
SELECT u.nombre, u.apellido,
       s.motivo, s.monto, s.estado
FROM Sancion s
JOIN Usuario u ON s.id_usuario = u.id_usuario;

-- PROCEDURES


DELIMITER //

CREATE PROCEDURE registrar_prestamo(IN p_id_ejemplar INT, IN p_id_usuario INT)
BEGIN
    INSERT INTO Prestamo (id_ejemplar, id_usuario, fecha_prestamo, tipo_prestamo, renovaciones)
    VALUES (p_id_ejemplar, p_id_usuario, CURDATE(), 'normal', 0);
END //

CREATE PROCEDURE registrar_devolucion(IN p_id_prestamo INT)
BEGIN
    INSERT INTO Devolucion (id_prestamo, fecha_devolucion, condicion)
    VALUES (p_id_prestamo, CURDATE(), 'bueno');
END //

CREATE PROCEDURE crear_reserva(IN p_id_usuario INT, IN p_id_libro INT)
BEGIN
    INSERT INTO Reserva (id_usuario, id_libro, fecha_reserva, fecha_expiracion, estado)
    VALUES (p_id_usuario, p_id_libro, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 7 DAY), 'activa');
END //

DELIMITER ;


-- TRIGGERS


DELIMITER //

-- Trigger 1 CORREGIDO (detecta sanciones reales)
CREATE TRIGGER validar_usuario_sancionado
BEFORE INSERT ON Prestamo
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Sancion
        WHERE id_usuario = NEW.id_usuario
        AND estado = 'pendiente'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuario sancionado';
    END IF;
END //

-- Trigger 2 (sin cambios, está bien)
CREATE TRIGGER actualizar_reserva
AFTER INSERT ON Prestamo
FOR EACH ROW
BEGIN
    UPDATE Reserva r
    JOIN Ejemplar e ON r.id_libro = e.id_libro
    SET r.estado = 'completada'
    WHERE e.id_ejemplar = NEW.id_ejemplar
    AND r.estado = 'activa';
END //

-- Trigger 3 CORREGIDO (sí genera sanciones con tus datos)
CREATE TRIGGER generar_sancion
AFTER INSERT ON Devolucion
FOR EACH ROW
BEGIN
    DECLARE dias INT;

    SELECT DATEDIFF(NEW.fecha_devolucion, p.fecha_prestamo)
    INTO dias
    FROM Prestamo p
    WHERE p.id_prestamo = NEW.id_prestamo;

    IF dias > 7 THEN
        INSERT INTO Sancion (id_prestamo, id_usuario, motivo, monto, estado, fecha_inicio)
        SELECT p.id_prestamo, p.id_usuario,
               'Retraso', 500, 'pendiente', CURDATE()
        FROM Prestamo p
        WHERE p.id_prestamo = NEW.id_prestamo;
    END IF;
END //

DELIMITER ;