import { Request, Response } from 'express';
import pool from '../database/connection';

export const getMorosidad = async (req: Request, res: Response) => {
    try {
        const usuario = (req as any).usuario;

        // Obtener nombre del cliente
        const [clienteRows]: any = await pool.query('SELECT nombre FROM clientes WHERE id = ?', [usuario.id]);
        const nombre = clienteRows[0]?.nombre || 'Cliente';

        // Calcular deuda total pendiente
        const [deudaRows]: any = await pool.query(
            `SELECT SUM(monto) as total_deuda FROM cuentas_por_cobrar 
             WHERE cliente_id = ? AND estado = 'PENDIENTE'`,
            [usuario.id]
        );
        const deudaTotal = parseFloat(deudaRows[0]?.total_deuda) || 0;

        // Calcular días de retraso (tomar la fecha de vencimiento más antigua pendiente)
        const [vencimientoRows]: any = await pool.query(
            `SELECT fecha_vencimiento FROM cuentas_por_cobrar 
             WHERE cliente_id = ? AND estado = 'PENDIENTE' 
             ORDER BY fecha_vencimiento ASC LIMIT 1`,
            [usuario.id]
        );

        let diasVencidos = 0;
        if (vencimientoRows.length > 0) {
            const fechaVenc = new Date(vencimientoRows[0].fecha_vencimiento);
            const hoy = new Date();
            const diffTime = hoy.getTime() - fechaVenc.getTime();
            diasVencidos = Math.max(0, Math.ceil(diffTime / (1000 * 60 * 60 * 24)));
        }

        const estado = deudaTotal > 0 ? 'MOROSO' : 'AL_DIA';

        res.json({
            cliente: nombre,
            deuda_total: deudaTotal,
            dias_vencidos: diasVencidos,
            estado
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al consultar la morosidad' });
    }
};