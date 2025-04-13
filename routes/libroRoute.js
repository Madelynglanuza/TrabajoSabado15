import { Router } from 'express';

import {
    listarTodosLibros,
    listarLibroPorId,
    crearLibro,
    actualizarLibro,
    eliminarLibro
} from '../controllers/libroController.js';

const librosRouter = Router();

librosRouter.get('/', listarTodosLibros);
librosRouter.get('/:id', listarLibroPorId);
librosRouter.post('/', crearLibro);
librosRouter.put('/:id', actualizarLibro);
librosRouter.delete('/:id', eliminarLibro);

export default librosRouter;