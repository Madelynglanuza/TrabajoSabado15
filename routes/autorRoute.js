import { Router } from 'express';

import {
    listarTodosAutores,
    listarAutorPorId,
    crearAutor,
    actualizarAutor,
    eliminarAutor
} from '../controllers/autorController.js';

const AutoresRouter = Router();

AutoresRouter.get('/', listarTodosAutores);
AutoresRouter.get('/:id', listarAutorPorId);
AutoresRouter.post('/', crearAutor);
AutoresRouter.put('/:id', actualizarAutor);
AutoresRouter.delete('/:id', eliminarAutor);

export default AutoresRouter;