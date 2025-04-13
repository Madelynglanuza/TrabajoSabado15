// controllers/editorialController.js
import {
    listarTodosEditorialQuery,
    listarEditorialPorIdQuery,
    crearEditorialQuery,
    actualizarEditorialQuery,
    eliminarEditorialQuery
  } from "../db/editorialQuery.js";
  
  /**
   * Obtener todas los Editorial de la base de datos
   */
  const listarTodosEditorial = async (req, res) => {
    try {
      const editorial = await listarTodosEditorialQuery();
      res.json(editorial);
    } catch (error) {
      res.status(500).send(error);
    }
  };
  
  /**
   * Obtener el Editorial con el ID especificado en la query / url
   */
  const listarEditorialPorId = async (req, res) => { 
    try {
      const editorial = await listarEditorialPorIdQuery(req.params.id);
      if (editorial.length === 0) {
        return res.status(404).json({ mensaje: 'Editorial no encontrado' });
      }
      res.json(editorial[0]); // Devuelve el primer editorial encontrado
    } catch (error) {
      res.status(500).send(error);
    }
  };
  
  /**
   * Crear un Editorial
   */
  const crearEditorial = async (req, res) => {
    try {
      const datosEditorial = req.body;
      const resultado = await crearEditorialQuery(datosEditorial);
      res.status(201).json({ mensaje: 'Editorial creado con éxito', editorial: resultado });
    } catch (error) {
      res.status(500).send(error);
    }
  };
  
  /**
   * Actualizar los datos de un Editorial
   */
  const actualizarEditorial = async (req, res) => {
    try {
      const id = req.params.id;
      const datosEditorial = req.body;
      const resultado = await actualizarEditorialQuery(id, datosEditorial);
      if (!resultado) {
        return res.status(404).json({ mensaje: 'Editorial no encontrado' });
      }
      res.json({ mensaje: 'Editorial actualizado con éxito', editorial: resultado });
    } catch (error) {
      res.status(500).send(error);
    }
  };
  
  /**
   * Eliminar un Editorial
   */
  const eliminarEditorial = async (req, res) => {
    try {
      const id = req.params.id;
      const resultado = await eliminarEditorialQuery(id);
      if (!resultado) {
        return res.status(404).json({ mensaje: 'Editorial no encontrado' });
      }
      res.json({ mensaje: 'Editorial eliminado con éxito' });
    } catch (error) {
      res.status(500).json({ mensaje: 'Error al eliminar el Editorial', error: error.message });
    }
  };
  
  export {
    listarTodosEditorial,
    listarEditorialPorId,
    crearEditorial,
    actualizarEditorial,
    eliminarEditorial,
  };