import { Router } from 'express';
import { getCatalogo } from '../controllers/catalogoController';
import { getUsuarios } from '../controllers/usuarioController';

const router = Router();

router.get('/catalogo', getCatalogo);
router.get('/usuarios', getUsuarios);

export default router;