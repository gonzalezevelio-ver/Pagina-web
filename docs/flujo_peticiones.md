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