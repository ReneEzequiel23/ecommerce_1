CREATE DATABASE IF NOT EXISTS ecommerce_admin;
USE ecommerce_admin;

-- 1. Tabla Usuario (Independiente)
CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    rol VARCHAR(20) DEFAULT 'cliente' -- Fundamental para diferenciar al administrador
);

-- 2. Tabla Dirección (Depende de Usuario)
CREATE TABLE Direccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(150),
    ciudad VARCHAR(100),
    estado VARCHAR(100),
    codigo_postal VARCHAR(10), -- Corregido de "CoidoPostal" en el diagrama
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE CASCADE
);

-- 3. Tabla Categoria (Independiente)
CREATE TABLE Categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 4. Tabla Producto (Depende de Categoria)
CREATE TABLE Producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    existencia INT DEFAULT 0,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id) ON DELETE SET NULL
);

-- 5. Tabla Reseña (Depende de Usuario y Producto)
CREATE TABLE Resena (
    id INT AUTO_INCREMENT PRIMARY KEY,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
    comentario TEXT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT,
    producto_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES Producto(id) ON DELETE CASCADE
);

-- 6. Tabla Pedido (Depende de Usuario y Dirección)
CREATE TABLE Pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) DEFAULT 'Pendiente', -- Útil para la "Gestión de pedidos"
    total DECIMAL(10, 2) NOT NULL,
    usuario_id INT,
    direccion_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (direccion_id) REFERENCES Direccion(id)
);

-- 7. Tabla Pago (Depende de Pedido)
CREATE TABLE Pago (
    id INT AUTO_INCREMENT PRIMARY KEY,
    monto DECIMAL(10, 2) NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) DEFAULT 'Completado',
    pedido_id INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id) ON DELETE CASCADE
);

-- 8. Tabla Detalle_Pedido (Depende de Pedido y Producto)
CREATE TABLE Detalle_Pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT NOT NULL,
    precio_unidad DECIMAL(10, 2) NOT NULL,
    pedido_id INT,
    producto_id INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);

USE ecommerce_admin;

-- 1. Categorías (Géneros Literarios)
INSERT INTO Categoria (nombre) VALUES 
('Fantasía'), 
('Ciencia Ficción'), 
('Tecnología y Programación'), 
('Novela Histórica'), 
('Terror');

-- 2. Usuarios (1 Administrador y 2 Clientes)
-- Nota: Para este avance usaremos contraseñas en texto plano para facilitar tus pruebas, 
-- pero en el mundo real (y quizás para tu proyecto final) deberías encriptarlas en Java (ej. BCrypt).
INSERT INTO Usuario (nombre, correo, contraseña, telefono, rol) VALUES 
('Admin Librería', 'admin@libreria.com', 'admin123', '555-0000', 'admin'),
('Juan Pérez', 'juan.perez@email.com', 'cliente123', '555-1111', 'cliente'),
('Ana Gómez', 'ana.gomez@email.com', 'cliente123', '555-2222', 'cliente');

-- 3. Direcciones (Para los clientes)
INSERT INTO Direccion (calle, ciudad, estado, codigo_postal, usuario_id) VALUES 
('Calle de la Lectura 123', 'Ciudad de México', 'CDMX', '01000', 2),
('Av. Los Libros 456', 'Guadalajara', 'Jalisco', '44100', 3);

-- 4. Productos (Libros)
INSERT INTO Producto (nombre, descripcion, precio, existencia, categoria_id) VALUES 
('El Señor de los Anillos: La Comunidad del Anillo', 'Autor: J.R.R. Tolkien. Un viaje épico comienza.', 350.00, 50, 1),
('Dune', 'Autor: Frank Herbert. Obra maestra de la ciencia ficción.', 420.50, 30, 2),
('Clean Code', 'Autor: Robert C. Martin. Manual de estilo para desarrollo ágil de software.', 600.00, 15, 3),
('El Nombre de la Rosa', 'Autor: Umberto Eco. Misterio en una abadía medieval.', 280.00, 20, 4),
('Drácula', 'Autor: Bram Stoker. El clásico del terror gótico.', 200.00, 40, 5);

-- 5. Reseñas
INSERT INTO Resena (calificacion, comentario, usuario_id, producto_id) VALUES 
(5, '¡Excelente libro! Un clásico de la fantasía que no envejece.', 2, 1),
(4, 'Muy buen contenido para aprender a programar mejor, aunque un poco denso al principio.', 3, 3),
(5, 'Me mantuvo al borde del asiento, excelente lectura para octubre.', 2, 5);

-- 6. Pedidos
INSERT INTO Pedido (estado, total, usuario_id, direccion_id) VALUES 
('Entregado', 350.00, 2, 1),        -- El pedido 1 es de Juan
('Pendiente', 1020.50, 3, 2);       -- El pedido 2 es de Ana (compró 2 libros)

-- 7. Detalles de Pedido
INSERT INTO Detalle_Pedido (cantidad, precio_unidad, pedido_id, producto_id) VALUES 
(1, 350.00, 1, 1), -- Juan compró 1 copia de El Señor de los Anillos
(1, 600.00, 2, 3), -- Ana compró 1 copia de Clean Code
(1, 420.50, 2, 2); -- Ana compró 1 copia de Dune

-- 8. Pagos
INSERT INTO Pago (monto, estado, pedido_id) VALUES 
(350.00, 'Completado', 1),
(1020.50, 'Completado', 2);