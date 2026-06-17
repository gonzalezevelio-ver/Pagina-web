# Detalle Técnico del Proyecto

## 1. Visión General

**Destilería Highland – Sistema de Gestión para Tienda de Whisky**

Este proyecto es una aplicación full‑stack desplegada con microservicios Docker. Proporciona un catálogo de productos, autenticación de usuarios, gestión de documentos (DNI), historial de compras y control de morosidad. La arquitectura está desacoplada en tres servicios:

- **API** (Node.js + TypeScript + Express) – Backend REST.
- **Web** (Django) – Frontend que consume la API y renderiza plantillas.
- **BD** (MySQL) – Almacenamiento persistente.

## 2. Tecnologías

| Capa         | Tecnologías |
|--------------|-------------|
| **API**      | Node.js 18, TypeScript, Express, jsonwebtoken, multer, uuid, mysql2 |
| **Web**      | Python 3.11, Django 5.2, requests |
| **BD**       | MySQL 8 |
| **Orquestación** | Docker, Docker Compose |

## 3. Estructura de Carpetas
proyecto/
├── api/ # API Node.js
│ ├── src/
│ │ ├── controllers/ # Controladores
│ │ │ ├── authController.ts
│ │ │ ├── catalogoController.ts
│ │ │ ├── documentoController.ts
│ │ │ ├── facturaController.ts
│ │ │ └── morosidadController.ts
│ │ ├── database/
│ │ │ └── connection.ts
│ │ ├── middleware/
│ │ │ └── auth.ts # Verificación JWT
│ │ ├── routes/
│ │ │ └── index.ts
│ │ ├── utils/
│ │ │ └── jwt.ts
│ │ └── app.ts
│ ├── Dockerfile
│ ├── package.json
│ └── tsconfig.json
├── web/ # Django
│ ├── core/
│ │ ├── templates/
│ │ │ ├── base.html
│ │ │ ├── index.html
│ │ │ ├── login.html
│ │ │ ├── dashboard.html
│ │ │ ├── historial.html
│ │ │ └── morosidad.html
│ │ ├── urls.py
│ │ └── views.py
│ ├── config/
│ │ ├── settings.py
│ │ └── urls.py
│ ├── manage.py
│ ├── requirements.txt
│ └── Dockerfile
├── docker-compose.yml
├── init.sql
└── README.md