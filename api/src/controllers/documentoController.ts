import { Request, Response } from 'express';
import pool from '../database/connection';
import path from 'path';
import fs from 'fs';
import { v4 as uuidv4 } from 'uuid';

// Asegurar que exista la carpeta de uploads
const uploadDir = path.join(__dirname, '../../uploads/dni');
if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir, { recursive: true });
}

export const subirDNI = async (req: Request, res: Response) => {
    try {
        const usuario = (req as any).usuario;
        const archivo = req.file;

        if (!archivo) {
            return res.status(400).json({ error: 'Debe subir un archivo' });
        }

        // Generar nombre único para el archivo
        const extension = path.extname(archivo.originalname);
        const nombreUnico = `${usuario.id}_${uuidv4()}${extension}`;
        const rutaDestino = path.join(uploadDir, nombreUnico);

        // Mover el archivo
        fs.renameSync(archivo.path, rutaDestino);

        // Guardar en BD
        const rutaRelativa = `/uploads/dni/${nombreUnico}`;
        await pool.query(
            'INSERT INTO documentos (cliente_id, tipo_documento, ruta_archivo) VALUES (?, ?, ?)',
            [usuario.id, 'DNI', rutaRelativa]
        );

        res.json({ mensaje: 'DNI registrado correctamente', ruta: rutaRelativa });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al subir el DNI' });
    }
};