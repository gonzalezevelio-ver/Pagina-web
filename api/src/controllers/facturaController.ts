import { Request, Response } from 'express';
import pool from '../database/connection';

export const getFacturas = async (req: Request, res: Response) => {
    try {
        const usuario = (req as any).usuario;
        const { fecha_desde, fecha_hasta } = req.body;

        let query = 'SELECT id, fecha, total, productos FROM facturas WHERE cliente_id = ?';
        const params: any[] = [usuario.id];

        if (fecha_desde) {
            query += ' AND fecha >= ?';
            params.push(fecha_desde);
        }
        if (fecha_hasta) {
            query += ' AND fecha <= ?';
            params.push(fecha_hasta);
        }

        query += ' ORDER BY fecha DESC';

        const [rows] = await pool.query(query, params);
        res.json({ historial: rows });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al obtener el historial de facturas' });
    }
};