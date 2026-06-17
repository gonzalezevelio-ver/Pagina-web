import { Request, Response } from 'express';
import pool from '../database/connection';
import bcrypt from 'bcrypt';
import { generarToken } from '../utils/jwt';

export const login = async (req: Request, res: Response) => {
    try {
        const { email, password } = req.body;

        if (!email || !password) {
            return res.status(400).json({ error: 'Email y contraseña son requeridos' });
        }

        const [rows]: any = await pool.query('SELECT id, nombre, email, password, rol FROM clientes WHERE email = ?', [email]);
        if (rows.length === 0) {
            return res.status(401).json({ error: 'Credenciales inválidas' });
        }

        const usuario = rows[0];
        const passwordValida = (password === usuario.password);
        if (!passwordValida) {
            return res.status(401).json({ error: 'Credenciales inválidas' });
        }

        const token = generarToken({ id: usuario.id, email: usuario.email, rol: usuario.rol });
        res.json({ token, nombre: usuario.nombre, id: usuario.id });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al iniciar sesión' });
    }
};