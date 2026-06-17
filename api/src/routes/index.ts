import { Router } from 'express';
import { getCatalogo } from '../controllers/catalogoController';
import { login } from '../controllers/authController';
import { subirDNI } from '../controllers/documentoController';
import { getFacturas } from '../controllers/facturaController';
import { getMorosidad } from '../controllers/morosidadController';
import { authMiddleware } from '../middleware/auth';
import multer from 'multer';

const router = Router();
const upload = multer({ dest: 'uploads/temp/' }); // Para manejar archivos temporales

// Rutas públicas
router.post('/login', login);
router.get('/catalogo', getCatalogo); // Catálogo puede ser público

// Rutas protegidas (requieren JWT)
router.post('/store/createdoc', authMiddleware, upload.single('archivo'), subirDNI);
router.post('/store/getdocuments', authMiddleware, getFacturas);
router.post('/student/morosidad', authMiddleware, getMorosidad);

export default router;