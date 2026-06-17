import express from 'express';
import routes from './routes';
import path from 'path';

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Servir archivos estáticos (para acceder a los DNI subidos)
app.use('/uploads', express.static(path.join(__dirname, '../uploads')));

app.use('/api', routes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`API running on port ${PORT}`);
});