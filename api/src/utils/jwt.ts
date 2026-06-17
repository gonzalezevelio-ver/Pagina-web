import jwt from 'jsonwebtoken';

const SECRET = process.env.JWT_SECRET || 'mi-secreto-super-seguro';

export const generarToken = (payload: { id: number; email: string; rol: string }) => {
    return jwt.sign(payload, SECRET, { expiresIn: '7d' });
};

export const verificarToken = (token: string) => {
    try {
        return jwt.verify(token, SECRET);
    } catch (error) {
        return null;
    }
};