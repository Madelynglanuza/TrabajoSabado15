// routes/editorialRoute.js
import { Router } from 'express';

import {
    listarTodosEditorial,
    listarEditorialPorId,
    crearEditorial,
    actualizarEditorial,
    eliminarEditorial,
} from '../controllers/editorialController.js';

const editorialRouter = Router();

editorialRouter.get('/', listarTodosEditorial);
editorialRouter.get('/:id', listarEditorialPorId);
editorialRouter.post('/', crearEditorial);
editorialRouter.put('/:id', actualizarEditorial);
editorialRouter.delete('/:id', eliminarEditorial);

export default editorialRouter;