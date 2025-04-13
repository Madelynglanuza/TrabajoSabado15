// db/editorial.js
import pool from './db.js';

/**
 * Cargar todos los editorial
 */
const listarTodosEditorialQuery = async () => {
    try {
        const result = await pool.query('SELECT * FROM editorial');
        return result.rows; // Devuelve las filas obtenidas
    } catch (err) {
        console.error(err);
        throw err; // Lanza el error para que pueda ser manejado en otro lugar
    }
};

/**
 * Buscar un editorial por su ID
 */
const listarEditorialPorIdQuery = async (id) => {
    try {
        const result = await pool.query('SELECT * FROM editorial WHERE id = $1 LIMIT 1', [id]);
        return result.rows; // Devuelve las filas obtenidas
    } catch (err) {
        console.error(err);
        throw err;
    }
};

/**
 * Guardar un nuevo editorial
 */
const crearEditorialQuery = async (Datoseditorial) => {
    const { nombre } = Datoseditorial;
    try {
        const sql = 'INSERT INTO editorial (nombre) VALUES ($1) RETURNING *';
        const result = await pool.query(sql, [nombre]);
        return result.rows[0]; // Devuelve el editorial creada
    } catch (err) {
        console.error(err);
        throw err;
    }
};

/**
 * Actualizar un editorial por su ID
 */
const actualizarEditorialQuery = async (id, datoseditorial) => {
    const { nombre } = datoseditorial;
    try {
        const sql = 'UPDATE editorial SET nombre = $1 WHERE id = $2 RETURNING *';
        const result = await pool.query(sql, [nombre, id]);
        return result.rows[0]; // Devuelve el editorial actualizado
    } catch (err) {
        console.error(err);
        throw err;
    }
};

/**
 * Eliminar un editorial por su ID
 */
const eliminarEditorialQuery = async (id) => {
    try {
        const sql = 'DELETE FROM editorial WHERE id = $1 RETURNING *';
        const result = await pool.query(sql, [id]);
        return result.rows[0]; // Devuelve el editorial eliminado
    } catch (err) {
        console.error(err);
        throw err;
    }
};

// Exportar todas las funciones definidas en este archivo
export {
    listarTodosEditorialQuery,
    listarEditorialPorIdQuery,
    crearEditorialQuery,
    actualizarEditorialQuery,
    eliminarEditorialQuery   
};