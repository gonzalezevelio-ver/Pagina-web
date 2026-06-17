# Destilería Highland — Whisky Premium

Sistema de gestión para una tienda de licores premium con autenticación JWT, subida de documentos, historial de compras y control de morosidad.

---

## 📚 Índice

- [1. Información General](#1-información-general)
- [2. Tecnologías](#2-tecnologías)
- [3. Endpoints de la API](#3-endpoints-de-la-api)
- [4. Flujo de Autenticación](#4-flujo-de-autenticación)
- [5. Instalación y Ejecución](#5-instalación-y-ejecución)
- [6. Estructura del Proyecto](#6-estructura-del-proyecto)
- [7. Documentación Adicional](#7-documentación-adicional)

---

## 1. Información General

- **Nombre del proyecto**: Destilería Highland
- **Descripción**: Plataforma para gestionar clientes, catálogo de whiskies, historial de compras y estado de morosidad.
- **Responsable**: Evelio Gonzalez
- **Repositorio**: [https://github.com/gonzalezevelio-ver/Pagina-web.git](https://github.com/gonzalezevelio-ver/Pagina-web.git)
- **Fecha**: 2026-06-16
- **Versión**: v2.0.0

---

## 2. Tecnologías

| Componente | Tecnología |
|------------|------------|
| **API** | Node.js + TypeScript + Express |
| **Web** | Django (MVC) |
| **Base de datos** | MySQL |
| **Autenticación** | JWT (JSON Web Tokens) |
| **Contenerización** | Docker + Docker Compose |
| **Frontend** | HTML5, CSS3, JavaScript (Django templates) |

---

## 3. Endpoints de la API

| Método | Endpoint | Descripción | Autenticación |
|--------|----------|-------------|---------------|
| POST | `/api/login` | Iniciar sesión y obtener token JWT | ❌ No |
| GET | `/api/catalogo` | Obtener listado de productos (catálogo) | ❌ No |
| POST | `/api/store/createdoc` | Subir DNI (archivo) | ✅ JWT |
| POST | `/api/store/getdocuments` | Obtener historial de facturas | ✅ JWT |
| POST | `/api/student/morosidad` | Consultar estado de morosidad | ✅ JWT |

> Para más detalles, consulta el [Flujo de Peticiones](docs/flujo_peticiones.md).

---

## 4. Flujo de Autenticación

1. El usuario envía credenciales a `/api/login`.
2. La API valida contra la base de datos y devuelve un **token JWT**.
3. El token debe enviarse en el header `Authorization: Bearer <token>` para acceder a endpoints protegidos.
4. El token expira después de 7 días.

---

## 5. Instalación y Ejecución

### Requisitos
- Docker y Docker Compose instalados.
- Puerto 8000 (web) y 3000 (API) libres.

### Pasos
```bash
# Clonar repositorio
git clone https://github.com/gonzalezevelio-ver/Pagina-web.git
cd Pagina-web

# Levantar contenedores (con reconstrucción)
docker-compose up --build