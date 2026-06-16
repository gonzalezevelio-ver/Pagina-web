# 🔄 Flujo de Peticiones

## Arquitectura general

1. El usuario interactúa con la interfaz web (Django) en el puerto `8000`.
2. Django actúa como cliente HTTP y consume la API interna (Node.js) en `http://api:3000`.
3. La API consulta la base de datos MySQL y devuelve JSON.
4. Django renderiza las plantillas HTML con los datos recibidos.

## Diagrama de secuencia

```mermaid
sequenceDiagram
    participant Usuario
    participant Django as Web (Django)
    participant API as API (Node.js)
    participant MySQL

    Usuario->>Django: GET /
    Django->>API: GET /api/catalogo
    API->>MySQL: SELECT * FROM catalogo
    MySQL-->>API: Filas
    API-->>Django: JSON
    Django-->>Usuario: HTML con lista

    Usuario->>Django: GET /usuarios/
    Django->>API: GET /api/usuarios
    API->>MySQL: SELECT * FROM usuarios
    MySQL-->>API: Filas
    API-->>Django: JSON
    Django-->>Usuario: HTML con usuarios