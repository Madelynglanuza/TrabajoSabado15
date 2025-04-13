// db/prestamos.js
import pool from './db.js';

/**
 * Cargar todos los prestamos
 */
const listarTodosPrestamosQuery = async () => {
    try {
        const result = await pool.query('SELECT * FROM prestamos');
        return result.rows; // Devuelve las filas obtenidas
    } catch (err) {
        console.error(err);
        throw err; // Lanza el error para que pueda ser manejado en otro lugar
    }
};

/**
 * Buscar un prestamo por su ID
 */
const listarPrestamoPorIdQuery = async (id) => {
    try {
        const result = await pool.query('SELECT * FROM prestamos WHERE id = $1 LIMIT 1', [id]);
        return result.rows; // Devuelve las filas obtenidas
    } catch (err) {
        console.error(err);
        throw err;
    }
};

/**
 * Guardar un nuevo prestamo
 */
const crearPrestamoQuery = async (datosprestamo) => {
    const { usuario_id, libro_id, fecha_prestamo, fecha_devolucion, estado, multa, notas } = datosprestamo;
    try {
        const sql = 'INSERT INTO prestamos (usuario_id, libro_id, fecha_prestamo, fecha_devolucion, estado, multa, notas) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *';
        const result = await pool.query(sql, [usuario_id, libro_id, fecha_prestamo, fecha_devolucion, estado, multa, notas]);
        return result.rows[0]; // Devuelve el prestamo creada
    } catch (err) {
        console.error(err);
        throw err;
    }
};

/**
 * Actualizar un prestamo por su ID
 */
const actualizarPrestamoQuery = async (id, datosprestamo) => {
    const { usuario_id, libro_id, fecha_prestamo, fecha_devolucion, estado, multa, notas } = datosprestamo;
    try {
        const sql = 'UPDATE prestamos SET usuario_id = $1, libro_id = $2, fecha_prestamo = $3, fecha_devolucion = $4, estado = $5, multa = $6, notas = $7 WHERE id = $8 RETURNING *';
        const result = await pool.query(sql, [usuario_id, libro_id, fecha_prestamo, fecha_devolucion, estado, multa, notas, id]);
        return result.rows[0]; // Devuelve el prestamo actualizado
    } catch (err) {
        console.error(err);
        throw err;
    }
};

/**
 * Eliminar un prestamo por su ID
 */
const eliminarPrestamoQuery = async (id) => {
    try {
        const sql = 'DELETE FROM prestamos WHERE id = $1 RETURNING *';
        const result = await pool.query(sql, [id]);
        return result.rows[0]; // Devuelve el prestamo eliminado
    } catch (err) {
        console.error(err);
        throw err;
    }
};

// Exportar todas las funciones definidas en este archivo
export {
    listarTodosPrestamosQuery,
    listarPrestamoPorIdQuery,
    crearPrestamoQuery,
    actualizarPrestamoQuery,
    eliminarPrestamoQuery   
};