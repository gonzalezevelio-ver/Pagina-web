proyecto/
│
├── api/                      # API en Node.js + TypeScript
│   ├── src/
│   │   ├── controllers/
│   │   │   ├── authController.ts       # Login y generación de JWT
│   │   │   ├── catalogoController.ts   # Listado de productos
│   │   │   ├── documentoController.ts  # Subida de DNI
│   │   │   ├── facturaController.ts    # Historial de facturas
│   │   │   └── morosidadController.ts  # Consulta de deuda
│   │   ├── database/
│   │   │   └── connection.ts           # Conexión a MySQL
│   │   ├── middleware/
│   │   │   └── auth.ts                 # Verificación de JWT
│   │   ├── routes/
│   │   │   └── index.ts                # Definición de endpoints
│   │   ├── utils/
│   │   │   └── jwt.ts                  # Generación/verificación de tokens
│   │   └── app.ts                      # Punto de entrada de la API
│   ├── uploads/                        # Carpeta para archivos subidos (DNI)
│   │   └── dni/
│   ├── Dockerfile
│   ├── package.json
│   ├── tsconfig.json
│   └── .env                            # Variables de entorno (opcional)
│
├── web/                      # Aplicación Django
│   ├── core/
│   │   ├── templates/
│   │   │   ├── base.html               # Plantilla base con navegación y buscador
│   │   │   ├── index.html              # Catálogo de productos
│   │   │   ├── login.html              # Formulario de inicio de sesión
│   │   │   ├── dashboard.html          # Panel con pestañas (DNI, Historial, Morosidad)
│   │   │   ├── historial.html          # (Opcional, redirige a dashboard)
│   │   │   └── morosidad.html          # (Opcional, redirige a dashboard)
│   │   ├── urls.py                     # Rutas de Django
│   │   └── views.py                    # Vistas que consumen la API
│   ├── config/
│   │   ├── settings.py                 # Configuración de Django
│   │   ├── urls.py                     # URL raíz
│   │   └── wsgi.py
│   ├── manage.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── docs/                     # Documentación del proyecto
│   ├── anexos.md
│   ├── casos_uso.md
│   ├── detall.md
│   ├── flujo_peticiones.md
│   ├── infographic.md
│   ├── install.md
│   └── structure.md
│
├── docker-compose.yml        # Orquestación de contenedores (API, Web, DB)
├── init.sql                  # Script de inicialización de BD (tablas + datos de ejemplo)
└── README.md                 # Descripción general del proyecto