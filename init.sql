-- ============================================
-- BASE DE DATOS: app_db (CON RESET)
-- ============================================

DROP DATABASE IF EXISTS app_db;
CREATE DATABASE app_db;
USE app_db;

-- ============================================
-- TABLAS
-- ============================================

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,   -- Contraseña en texto plano (para desarrollo)
    rol ENUM('cliente', 'admin') DEFAULT 'cliente',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE catalogo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2),
    imagen_url VARCHAR(255) DEFAULT 'https://via.placeholder.com/150',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE documentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    tipo_documento VARCHAR(50) DEFAULT 'DNI',
    ruta_archivo VARCHAR(255) NOT NULL,
    fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

CREATE TABLE facturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    productos TEXT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

CREATE TABLE cuentas_por_cobrar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    estado ENUM('PENDIENTE', 'PAGADO') DEFAULT 'PENDIENTE',
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- ============================================
-- DATOS DE EJEMPLO
-- ============================================

-- Clientes (contraseña: 123456 para todos)
INSERT INTO clientes (nombre, email, password, rol) VALUES
('Marco Antonio Solis', 'MarcoSolis@gmail.com', '123456', 'cliente'),
('Usuario Demo', 'demo@gmail.com', '123456', 'cliente'),
('Ana María Pérez', 'ana.perez@gmail.com', '123456', 'cliente'),
('Carlos López', 'carlos.lopez@hotmail.com', '123456', 'cliente'),
('Laura Fernández', 'laura.fernandez@yahoo.com', '123456', 'cliente');

-- Catálogo de whiskies (con imágenes placeholder)
-- Catálogo de whiskies, bourbons, licores y rones (4 por categoría)
INSERT INTO catalogo (nombre, descripcion, precio, imagen_url) VALUES
-- WHISKY (4)
('Glenfiddich 12 Year Old', 'Single Malt escoces de las Speyside. Notas de pera, roble y ligeras especias.', 59.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Glenfiddich'),
('Macallan 18 Sherry Oak', 'Single malt envejecido en barricas de jerez. Notas de frutas secas, especias y roble.', 299.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Macallan+18'),
('Lagavulin 16 Year Old', 'Single malt de Islay. Ahumado con notas de turba, sal marina y caramelo.', 119.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Lagavulin+16'),
('Hibiki Japanese Harmony', 'Blend armonioso de whiskies japoneses. Notas de miel, flor de naranjo y roble blanco.', 129.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Hibiki'),
-- BOURBON (4)
('Old Forester 1920 Prohibition Style', 'Bourbon de alta graduacion (57.5% ABV). Notas de caramelo, roble tostado y frutas oscuras.', 89.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=OF+1920'),
('Bulleit Bourbon', 'Bourbon de alta graduacion. Notas de caramelo, especias y roble tostado.', 39.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Bulleit'),
('Woodford Reserve Double Oaked', 'Bourbon envejecido en dos barricas. Notas de miel, vainilla y roble intenso.', 79.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Woodford+Reserve'),
('Maker''s Mark', 'Bourbon suave con notas de caramelo, vainilla y frutas rojas.', 34.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Makers+Mark'),
-- LICOR (4)
('Baileys Irish Cream', 'Crema irlandesa con whisky. Notas de chocolate, vainilla y caramelo.', 29.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Baileys'),
('Kahlua', 'Licor de cafe mexicano. Notas de cafe, caramelo y vainilla.', 24.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Kahlua'),
('Cointreau', 'Licor de naranja frances. Notas de naranja dulce y amarga.', 34.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Cointreau'),
('Jagermeister', 'Licor de hierbas aleman. Notas de regaliz, anis y hierbas medicinales.', 19.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Jagermeister'),
-- RON (4)
('Havana Club 7 Year Old', 'Ron cubano anejo. Notas de caramelo, madera y frutas tropicales.', 29.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Havana+Club+7'),
('Diplomatico Reserva Exclusiva', 'Ron venezolano premium. Notas de chocolate, caramelo y frutas secas.', 49.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Diplomatico'),
('Zacapa 23 Solera', 'Ron guatemalteco. Notas de caramelo, vainilla y roble.', 59.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Zacapa+23'),
('Bacardi 8 Year Old', 'Ron puertorriqueno anejo. Notas de frutas, caramelo y especias.', 34.99, 'https://via.placeholder.com/150/4f46e5/ffffff?text=Bacardi+8');
-- Facturas de ejemplo
INSERT INTO facturas (cliente_id, total, productos) VALUES
(1, 150.00, 'Macallan 18, Jack Daniel''s'),
(1, 89.99, 'Old Forester 1920'),
(2, 129.99, 'Hibiki Japanese Harmony'),
(3, 249.99, 'Johnnie Walker Blue Label'),
(3, 59.99, 'Glenfiddich 12 Year Old'),
(4, 299.99, 'Macallan 18 Sherry Oak'),
(5, 119.99, 'Lagavulin 16 Year Old');

-- Deudas (morosidad)
INSERT INTO cuentas_por_cobrar (cliente_id, monto, fecha_vencimiento, estado) VALUES
(1, 450.00, '2025-05-15', 'PENDIENTE'),
(2, 0.00, '2025-06-01', 'PAGADO'),
(3, 120.00, '2025-06-10', 'PENDIENTE'),
(4, 0.00, '2025-06-20', 'PAGADO'),
(5, 200.00, '2025-05-30', 'PENDIENTE');