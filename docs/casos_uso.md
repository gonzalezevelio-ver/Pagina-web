
---

## 📄 `casos_uso.md` – Casos de Uso y Diagramas

```markdown
# Casos de Uso

## Índice
- [1. Actores](#1-actores)
- [2. Casos de Uso](#2-casos-de-uso)
- [3. Diagrama de Secuencia General](#3-diagrama-de-secuencia-general)

---

## 1. Actores

- **Cliente** (usuario registrado): Puede iniciar sesión, ver catálogo, subir su DNI, consultar su historial de compras y su estado de morosidad.
- **Visitante** (no autenticado): Solo puede ver el catálogo de productos.

---

## 2. Casos de Uso

### CU-01: Iniciar sesión
- **Actor**: Cliente
- **Descripción**: El cliente introduce email y contraseña. El sistema valida las credenciales y devuelve un token JWT.
- **Precondición**: El cliente debe estar registrado en la base de datos.
- **Postcondición**: El cliente obtiene un token que se almacena en la sesión de Django.
- **Flujo alternativo**: Credenciales inválidas → mensaje de error.

### CU-02: Ver catálogo
- **Actor**: Visitante / Cliente
- **Descripción**: El sistema muestra todos los productos disponibles (nombre, descripción, precio, imagen). El cliente puede filtrar en tiempo real mediante la barra de búsqueda.
- **Precondición**: Ninguna.
- **Postcondición**: Se muestra la lista de productos.

### CU-03: Subir DNI
- **Actor**: Cliente (autenticado)
- **Descripción**: El cliente sube una imagen o PDF de su documento de identidad. El sistema guarda el archivo y registra la ruta en la base de datos.
- **Precondición**: El cliente debe haber iniciado sesión.
- **Postcondición**: El documento queda asociado al cliente.
- **Flujo alternativo**: Archivo no válido o error de conexión → mensaje de error.

### CU-04: Consultar historial de facturas
- **Actor**: Cliente (autenticado)
- **Descripción**: El cliente visualiza la lista de sus compras anteriores (fecha, total, productos).
- **Precondición**: Sesión iniciada.
- **Postcondición**: Se muestra el historial en el dashboard.

### CU-05: Consultar morosidad
- **Actor**: Cliente (autenticado)
- **Descripción**: El cliente visualiza su deuda pendiente, días de retraso y estado (MOROSO o AL_DIA).
- **Precondición**: Sesión iniciada.
- **Postcondición**: Se muestra la información de morosidad.

---

## 3. Diagrama de Secuencia General

```mermaid
sequenceDiagram
    participant Cliente
    participant Django as Web (Django)
    participant API as API (Node.js)
    participant MySQL

    %% Autenticación
    Cliente->>Django: POST /login (email, password)
    Django->>API: POST /api/login
    API->>MySQL: SELECT * FROM clientes WHERE email=?
    MySQL-->>API: Datos del cliente
    API-->>Django: Token JWT + nombre + id
    Django-->>Cliente: Redirige a /dashboard/

    %% Dashboard - Subir DNI
    Cliente->>Django: POST /dashboard/ (archivo)
    Django->>API: POST /api/store/createdoc (multipart + JWT)
    API->>API: Verifica JWT
    API->>MySQL: INSERT INTO documentos
    MySQL-->>API: Confirmación
    API-->>Django: Éxito / Error
    Django-->>Cliente: Mensaje en dashboard

    %% Dashboard - Historial
    Cliente->>Django: Click en pestaña "Historial"
    Django->>API: POST /api/store/getdocuments (JWT)
    API->>API: Verifica JWT
    API->>MySQL: SELECT * FROM facturas WHERE cliente_id=?
    MySQL-->>API: Lista de facturas
    API-->>Django: JSON con historial
    Django-->>Cliente: Renderiza historial en dashboard

    %% Dashboard - Morosidad
    Cliente->>Django: Click en pestaña "Morosidad"
    Django->>API: POST /api/student/morosidad (JWT)
    API->>API: Verifica JWT
    API->>MySQL: SELECT deuda y vencimiento
    MySQL-->>API: Resultados
    API-->>Django: JSON con morosidad
    Django-->>Cliente: Renderiza morosidad en dashboard