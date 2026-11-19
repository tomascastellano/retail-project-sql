# Proyecto Retail - Preentrega 2 SQL

## Descripción del proyecto

Este proyecto fue desarrollado para la segunda preentrega del curso de SQL de Coderhouse.

El objetivo es crear una base de datos para un comercio minorista (retail), utilizando PostgreSQL.

La base de datos permite almacenar información de clientes, productos y ventas.

## Estructura de la base de datos

El proyecto contiene tres tablas:

- **clientes:** almacena los datos de los clientes, incluyendo nombre, email, edad y fecha de registro.
- **productos:** almacena los productos disponibles, sus categorías, precios y stock.
- **ventas:** registra las ventas realizadas, relacionando cada venta con un cliente y un producto.

Se utilizan claves primarias (PRIMARY KEY), claves foráneas (FOREIGN KEY) y restricciones de integridad (CHECK, NOT NULL y UNIQUE).

## Operaciones SQL incluidas

El archivo `retail_project.sql` contiene:

- Creación de las tres tablas mediante sentencias DDL.
- Inserción de cinco registros iniciales por tabla.
- Uso de una transacción con BEGIN y COMMIT.
- Actualización de precios de productos de la categoría Tecnología mediante UPDATE con WHERE.
- Eliminación de una venta de prueba mediante DELETE con WHERE.
- Consultas SELECT para verificar los datos.

## Instrucciones de ejecución

1. Crear una base de datos en PostgreSQL llamada `retail_project`.
2. Abrir DBeaver o pgAdmin.
3. Conectarse a la base de datos `retail_project`.
4. Abrir el archivo `retail_project.sql`.
5. Ejecutar el script completo, desde el principio, sobre una base de datos vacía.

El script creará las tablas, insertará los datos iniciales y realizará las operaciones de actualización y eliminación.

## Tecnologías utilizadas

- PostgreSQL
- DBeaver
- SQL
- GitHub

**Curso:** SQL - Coderhouse

**Entrega:** Preentrega 2 - Tablas principales con restricciones y datos iniciales
