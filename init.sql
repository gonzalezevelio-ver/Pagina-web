-- ============================================
-- BASE DE DATOS: app_db (CON RESET)
-- ============================================

DROP DATABASE IF EXISTS app_db;
CREATE DATABASE app_db;
USE app_db;

-- ============================================
-- TABLAS
-- ============================================

CREATE TABLE catalogo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- DATOS DE EJEMPLO (SIEMPRE FRESCOS)
-- ============================================

INSERT INTO catalogo (nombre, descripcion, precio) VALUES
('Old Forester 1920 Prohibition Style', 'Bourbon de alta graduacion (57.5 porciento ABV), notas de caramelo, roble tostado y frutas oscuras. Version que rememora la epoca de la prohibicion.', 89.99),
('Hibiki Japanese Harmony', 'Blend armonioso de whiskies japoneses, con notas de miel, flor de naranjo y roble blanco. Suave y elegante.', 129.99),
('Jack Daniel''s Old No. 7', 'El clasico de Tennessee, filtrado con carbon de arce azucarero. Notas de vainilla, caramelo y roble.', 49.99),
('Glenfiddich 12 Year Old', 'Single Malt escoces de las Speydie. Notas de pera, roble y ligeras especias. Uno de los whiskies mas vendidos del mundo.', 59.99);

-- usuario de ejemplo
INSERT INTO usuarios (nombre, email) VALUES
('Marco Antonio Solis', 'MarcoSolis@gmail.com'),
('Usuario Demo', 'demo@gmail.com');