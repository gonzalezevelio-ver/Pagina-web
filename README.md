# 🧾 API REST

## 📚 Índice

- [1. Instalación](docs/install.md)
- [2. Flujo de Peticiones](docs/flujo_peticiones.md)
- [3. Casos de Uso](docs/casos_uso.md)
- [4. Anexo](docs/anexos.md)
- [5. Estructura del Proyecto](docs/structure.md)

## 1. Información General

- **Nombre del API**: API de Aplicaciones (backend)
- **Versión**: v1.1.0
- **Responsable**: Evelio Gonzalez
- **Repositorio**: [https://github.com/gonzalezevelio-ver/Pagina-web.git](https://github.com/gonzalezevelio-ver/Pagina-web.git)
- **Fecha**: 2025-06-12
- **Descripción**: API REST para peticiones mediante un API para diferentes proyectos e incluido la solicitud de información de la base de datos.

---

### Endpoints actualmente implementados

| Método | Endpoint       | Descripción                     |
|--------|----------------|---------------------------------|
| GET    | `/api/catalogo`  | Obtiene el listado del catálogo |
| GET    | `/api/usuarios`  | Obtiene el listado de usuarios  |

> Para más detalles, consulta el [Flujo de Peticiones](docs/flujo_peticiones.md).

## 2. Autenticación

- **Tipo**: Bearer Token: JWT, CORS, OAuth2, Basic Auth.
- **Header requerido**:
  ```
  Authorization: Bearer {token}
  ```

---

## 3. Levantar el servicio

```
docker-compose up --build
```
