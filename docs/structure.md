proyecto/
│
├── api/                      # API en Node.js + TypeScript
│   ├── src/
│   │   ├── controllers/      # Controladores de la API
│   │   │   ├── catalogoController.ts
│   │   │   └── usuarioController.ts
│   │   ├── database/         # Configuración de base de datos
│   │   │   └── connection.ts
│   │   ├── routes/           # Definición de rutas
│   │   │   └── index.ts
│   │   └── app.ts            # Punto de entrada de la API
│   ├── Dockerfile
│   ├── package.json
│   ├── tsconfig.json
│   └── .env                  # Variables de entorno (opcional)
│
├── web/                      # Aplicación Django
│   ├── core/                 # Aplicación principal
│   │   ├── templates/        # Plantillas HTML
│   │   │   ├── index.html
│   │   │   └── usuarios.html
│   │   ├── urls.py
│   │   └── views.py
│   ├── config/               # Configuración del proyecto Django
│   │   ├── settings.py
│   │   └── urls.py
│   ├── manage.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── docs/                     # Documentación del proyecto
│   ├── anexos.md
│   ├── casos_uso.md
│   ├── detall.md
│   ├── ecosystem.config.ts
│   ├── flujo_peticiones.md
│   ├── infographic.md
│   ├── install.md
│   └── structure.md
│
├── docker-compose.yml        # Orquestación de contenedores
├── init.sql                  # Script de inicialización de BD
└── README.md                 # Descripción general del proyecto