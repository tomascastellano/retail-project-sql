-- PREENTREGA 2 - PROYECTO RETAIL
-- Base de datos: retail_project
-- Motor: PostgreSQL
--
-- INSTRUCCIONES:
-- 1. Crear una base de datos llamada retail_project.
-- 2. Conectarse a retail_project desde DBeaver.
-- 3. Ejecutar este script completo sobre una base vacia.
--
-- El script crea las tablas clientes, productos y ventas,
-- incorpora restricciones de integridad, carga datos
-- iniciales y realiza operaciones UPDATE y DELETE.

-- TABLA 1: CLIENTES

CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    edad INT NOT NULL,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT chk_edad_cliente CHECK (edad >= 18)
);

-- TABLA 2: PRODUCTOS

CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,

    CONSTRAINT chk_precio_positivo CHECK (precio > 0),
    CONSTRAINT chk_stock_no_negativo CHECK (stock >= 0)
);

-- TABLA 3: VENTAS

CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_venta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(cliente_id),

    CONSTRAINT fk_venta_producto
        FOREIGN KEY (producto_id)
        REFERENCES productos(producto_id),

    CONSTRAINT chk_cantidad_positiva
        CHECK (cantidad > 0)
);

-- PARTE 2: CARGA INICIAL DE DATOS
-- Inicio de la transaccion

BEGIN;

-- Insertar cinco clientes

INSERT INTO clientes (nombre, email, edad)
VALUES
    ('Juan Perez', 'juan.perez@gmail.com', 28),
    ('Maria Lopez', 'maria.lopez@gmail.com', 35),
    ('Carlos Gomez', 'carlos.gomez@gmail.com', 42),
    ('Lucia Fernandez', 'lucia.fernandez@gmail.com', 24),
    ('Pedro Martinez', 'pedro.martinez@gmail.com', 31);

SELECT COUNT(*) AS total_clientes
FROM clientes;

-- Insertar cinco productos

INSERT INTO productos (nombre, categoria, precio, stock)
VALUES
    ('Notebook Lenovo', 'Tecnologia', 850000, 10),
    ('Mouse Logitech', 'Tecnologia', 25000, 30),
    ('Teclado Redragon', 'Tecnologia', 45000, 20),
    ('Silla de oficina', 'Muebles', 180000, 15),
    ('Escritorio', 'Muebles', 250000, 8);

SELECT cliente_id, nombre FROM clientes ORDER BY cliente_id;

SELECT producto_id, nombre FROM productos ORDER BY producto_id;

-- Insertar cinco ventas

INSERT INTO ventas (cliente_id, producto_id, cantidad)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 2);

-- Finalizar la transacción
COMMIT;

-- Consultar los productos de Tecnología antes de actualizar
SELECT producto_id, nombre, categoria, precio
FROM productos
WHERE categoria = 'Tecnologia';

-- Aumentar un 10 % los precios de Tecnologia

UPDATE productos
SET precio = precio * 1.10
WHERE categoria = 'Tecnologia';

-- Verificar los precios después del aumento
SELECT producto_id, nombre, categoria, precio
FROM productos
WHERE categoria = 'Tecnologia';

-- Consultar las ventas antes de eliminar una
SELECT venta_id, cliente_id, producto_id, cantidad
FROM ventas
ORDER BY venta_id;

-- Crear una venta de prueba con un ID conocido
INSERT INTO ventas (venta_id, cliente_id, producto_id, cantidad)
VALUES (1000, 1, 2, 1);

-- Verificar la venta antes de eliminarla
SELECT *
FROM ventas
WHERE venta_id = 1000;

-- Eliminar solamente la venta de prueba
DELETE FROM ventas
WHERE venta_id = 1000;