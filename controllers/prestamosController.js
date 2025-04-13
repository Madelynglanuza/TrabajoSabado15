// controllers/pedidosController.js
import {
    listarTodosPrestamosQuery,
    listarPrestamoPorIdQuery,
    crearPrestamoQuery,
    actualizarPrestamoQuery,
    eliminarPrestamoQuery
  } from "../db/prestamosQuery.js";
  
  /**
   * Obtener todas los Prestamos de la base de datos
   */
  const listarTodosPrestamos = async (req, res) => {
    try {
      const prestamos = await listarTodosPrestamosQuery();
      res.json(prestamos);
    } catch (error) {
      res.status(500).send(error);
    }
  };
  
  /**
   * Obtener el Prestamo con el ID especificado en la query / url
   */
  const listarPrestamoPorId = async (req, res) => { 
    try {
      const prestamo = await listarPrestamoPorIdQuery(req.params.id);
      if (prestamo.length === 0) {
        return res.status(404).json({ mensaje: 'Prestamo no encontrado' });
      }
      res.json(prestamo[0]); // Devuelve el primer prestamo encontrado
    } catch (error) {
      res.status(500).send(error);
    }
  };
  
  /**
   * Crear un Prestamo
   */
  const crearPrestamo = async (req, res) => {
    try {
      const datosPrestamo = req.body;
      const resultado = await crearPrestamoQuery(datosPrestamo);
      res.status(201).json({ mensaje: 'Prestamo creado con éxito', prestamo: resultado });
    } catch (error) {
      res.status(500).send(error);
    }
  };
  
  /**
   * Actualizar los datos de un Prestamo
   */
  const actualizarPrestamo = async (req, res) => {
    try {
      const id = req.params.id;
      const datosPrestamo = req.body;
      const resultado = await actualizarPrestamoQuery(id, datosPrestamo);
      if (!resultado) {
        return res.status(404).json({ mensaje: 'Prestamo no encontrado' });
      }
      res.json({ mensaje: 'Prestamo actualizado con éxito', prestamo: resultado });
    } catch (error) {
      res.status(500).send(error);
    }
  };
  
  /**
   * Eliminar un Prestamo
   */
  const eliminarPrestamo = async (req, res) => {
    try {
      const id = req.params.id;
      const resultado = await eliminarPrestamoQuery(id);
      if (!resultado) {
        return res.status(404).json({ mensaje: 'Prestamo no encontrado' });
      }
      res.json({ mensaje: 'Prestamo eliminado con éxito' });
    } catch (error) {
      res.status(500).json({ mensaje: 'Error al eliminar el Prestamo', error: error.message });
    }
  };
  
  export {
    listarTodosPrestamos,
    listarPrestamoPorId,
    crearPrestamo,
    actualizarPrestamo,
    eliminarPrestamo,
  };