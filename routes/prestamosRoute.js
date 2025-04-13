// routes/prestamosRoute.js
import { Router } from 'express';

import {
    listarTodosPrestamos,
    listarPrestamoPorId,
    crearPrestamo,
    actualizarPrestamo,
    eliminarPrestamo,
} from '../controllers/prestamosController.js';

const prestamosRouter = Router();

prestamosRouter.get('/', listarTodosPrestamos);
prestamosRouter.get('/:id', listarPrestamoPorId);
prestamosRouter.post('/', crearPrestamo);
prestamosRouter.put('/:id', actualizarPrestamo);
prestamosRouter.delete('/:id', eliminarPrestamo);

export default prestamosRouter;