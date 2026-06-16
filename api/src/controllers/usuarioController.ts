import { Request, Response } from 'express';
import pool from '../database/connection';

export const getUsuarios = async (req: Request, res: Response) => {
  try {
    const [rows] = await pool.query('SELECT id, nombre, email FROM usuarios');
    res.json(rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al obtener los usuarios' });
  }
};