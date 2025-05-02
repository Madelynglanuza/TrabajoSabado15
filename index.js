// index.js
import express from 'express';
import cors from 'cors';

const app = express();
//postgresql://madelyng:pjJHLSAgT79xPlqXY3f4SJ4YVTKM84hq@dpg-d06jq1ili9vc73ef5qjg-a.oregon-postgres.render.com/biblioteca_f9hp
const PORT = process.env.PORT;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Importa las rutas
import editorialRouter from './routes/editorialRoute.js';
import prestamosRouter from './routes/prestamosRoute.js';
import usuariosRouter from './routes/usuariosRoute.js';

// Usa las rutas
app.use('/editoriales', editorialRouter);
app.use('/prestamos', prestamosRouter);
app.use('/usuarios', usuariosRouter);

app.listen(PORT, () => {
    console.log(`Servidor corriendo en el puerto ${PORT}`);
});
app.get('/', (req, res) => {
    res.send('Bienvenido a la API de biblioteca');
});