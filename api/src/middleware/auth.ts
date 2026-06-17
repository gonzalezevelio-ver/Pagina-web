import { Request, Response, NextFunction } from 'express';
import { verificarToken } from '../utils/jwt';

export const authMiddleware = (req: Request, res: Response, next: NextFunction) => {
    const authHeader = req.headers.authorization;
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
        return res.status(401).json({ error: 'Token no proporcionado' });
    }

    const token = authHeader.split(' ')[1];
    const decoded = verificarToken(token);
    if (!decoded) {
        return res.status(401).json({ error: 'Token inválido o expirado' });
    }

    (req as any).usuario = decoded; // Adjuntar usuario al request
    next();
};