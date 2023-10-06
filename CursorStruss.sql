create database CursoresEjemplo;
use CursoresEjemplo;

-- Crear una tabla de ejemplo
CREATE TABLE empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(20),
    correo VARCHAR(50)
);

-- Insertar datos de ejemplo en la tabla
INSERT INTO empleados (id, nombre, correo) VALUES
(1, 'Juan', 'juan.perez@example.com'),
(2, 'Pedro', 'carlos.gonzalez@example.com'),
(3, 'María', 'pedro.lopez@example.com'),
(4, 'Ana', 'luis.ramirez@example.com');

-- Definir el cursor
DELIMITER //
CREATE PROCEDURE conseguir_correos()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE empleado_id INT;
    DECLARE empleado_nombre VARCHAR(20);
    DECLARE empleado_correo VARCHAR(50);

    -- Declarar el cursor
    DECLARE cur CURSOR FOR SELECT 
    id, nombre, correo FROM empleados;
    -- Manejar errores
    DECLARE CONTINUE HANDLER FOR NOT 
    FOUND SET done = TRUE;
    -- Abrir el cursor
    OPEN cur;

    -- Leer los datos del cursor
    read_loop: LOOP
        -- Obtener los datos del cursor
        FETCH cur INTO empleado_id, empleado_nombre, 
        empleado_correo;
        -- Salir del bucle si no hay más datos
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Realizar operaciones con los datos 
        -- del cursor.
        -- Por ejemplo, mostrar los salarios de 
        -- los empleados.
        SELECT empleado_correo;
        END LOOP;
        -- Cerrar el cursor
        CLOSE cur;
        END //
        DELIMITER ;

-- Llamar al procedimiento almacenado para mostrar los salarios
CALL conseguir_correos();