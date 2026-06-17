# Anexos

## Tecnologías Utilizadas

- **Node.js** (v18+): Entorno de ejecución para JavaScript.
- **TypeScript**: Superset tipado de JavaScript.
- **Express**: Framework web para Node.js.
- **MySQL**: Sistema de gestión de bases de datos relacional.
- **Docker**: Plataforma para contenerización.
- **Django**: Framework web de alto nivel para Python.

## Bibliotecas adicionales (API)

| Librería | Uso |
|----------|-----|
| `jsonwebtoken` | Generación y verificación de tokens JWT |
| `bcrypt` | (No usado en desarrollo, pero disponible para producción) |
| `multer` | Manejo de subida de archivos (DNI) |
| `uuid` | Generación de nombres únicos para archivos |

## Herramientas de Desarrollo

- **PM2**: Administrador de procesos para Node.js en producción.
- **ts-node-dev**: Reinicio automático durante el desarrollo.
- **Docker Compose**: Orquestación de contenedores.

## Nuevas Funcionalidades

| Módulo | Descripción |
|--------|-------------|
| **Autenticación JWT** | Login con generación de token y middleware de verificación. |
| **Subida de DNI** | Permite a clientes subir su documento de identidad (almacenado localmente). |
| **Historial de facturas** | Listado de compras previas por cliente. |
| **Morosidad** | Consulta de deuda pendiente y días de retraso. |
| **Dashboard con pestañas** | Interfaz unificada que agrupa las tres funcionalidades protegidas. |

## Estructura de Base de Datos

| Tabla | Descripción |
|-------|-------------|
| `clientes` | Usuarios con email, contraseña (texto plano en desarrollo), rol y nombre. |
| `catalogo` | Productos con nombre, descripción, precio e imagen. |
| `documentos` | Registro de archivos subidos (DNI) con relación a cliente. |
| `facturas` | Historial de compras con total y productos. |
| `cuentas_por_cobrar` | Deudas pendientes con fecha de vencimiento y estado. |

## Variables de Entorno

| Variable | Descripción | Valor por Defecto |
|----------|-------------|-------------------|
| `DB_HOST` | Host de la base de datos | `db` |
| `DB_USER` | Usuario de la base de datos | `root` |
| `DB_PASSWORD` | Contraseña de la base de datos | `root` |
| `DB_NAME` | Nombre de la base de datos | `app_db` |
| `PORT` | Puerto de la API | `3000` |
| `JWT_SECRET` | Secreto para firmar tokens | `mi-secreto-super-seguro` |

## Enlaces Útiles

- [Documentación de Docker](https://docs.docker.com/)
- [Documentación de Django](https://docs.djangoproject.com/)
- [Documentación de MySQL](https://dev.mysql.com/doc/)
- [Repositorio del Proyecto](https://github.com/gonzalezevelio-ver/Pagina-web.git)

## Glosario

- **API REST**: Interfaz de programación de aplicaciones que sigue los principios de REST.
- **JWT**: JSON Web Token, estándar para crear tokens de acceso.
- **CORS**: Intercambio de recursos de origen cruzado.
- **MVC**: Modelo-Vista-Controlador, patrón de arquitectura de software.
- **ORM**: Mapeo objeto-relacional.