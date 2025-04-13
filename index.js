// index.js
import express from 'express';
import cors from 'cors';

const app = express();
const PORT = process.env.PORT;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Importa las rutas
import editorialRouter from './routes/editorialRoute.js';
import prestamosRouter from './routes/prestamosRoute.js';
import usuariosRouter from './routes/usuariosRoute.js';

// Usa las rutas
app.use('/api/editorial', editorialRouter);
app.use('/api/prestamo', prestamosRouter);
app.use('/api/usuarios', usuariosRouter);

app.listen(PORT, () => {
    console.log(`Servidor corriendo en el puerto ${PORT}`);
});
app.get('/', (req, res) => {
    res.send('Bienvenido a la API de biblioteca');
});