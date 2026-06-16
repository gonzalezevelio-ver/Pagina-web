import { Request, Response } from 'express';
import pool from '../database/connection';

export const getCatalogo = async (req: Request, res: Response) => {
  try {
    const [rows] = await pool.query('SELECT id, nombre, descripcion, precio FROM catalogo');
    res.json(rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al obtener el catálogo' });
  }
};