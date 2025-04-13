import {config} from '../config.js';

/**
 * Carga la lista de Autores
 */
const listarTodosAutoresQuery = () => {
    // Una promesa es una forma de que siempre se devuelva un resultado al quien llama (sea error o éxito)
    // Si la consulta no genera error, entonces resuelve/cumple la promesa con el resultado
    // Si hay algun error entonces rechaza la consulta e informa la razón 
    return new Promise((resolve, reject) => {
        config.query('SELECT * FROM Autores', (err, filas) => {
            // Si genera error, mostramos en la consola que es lo que falla
            if (err) {
                console.log(err);
                reject(err);
            } else {
                // Si no hay error, devolvemos los datos de la tabla 
                resolve(filas);
            }
        });
    });
};

/**
 * Buscar un Autor por su ID (llave primaria)
 */
const listarAutorPorIdQuery = (id) => {
    return new Promise((resolve, reject) => {
        config.query('SELECT * FROM Autores WHERE id = ? LIMIT 1', [id], (err, filas) => {
            if (err) {
                console.log(err);
                reject(err);
            } else {
                resolve(filas);
            }
        });
    });
};


/**
 * Guardar un nuevo Autor
 */
const crearAutorQuery = async (Autor) => {
    const { nombres } = Autor;
    return new Promise((resolve, reject) => {
        const sql = 'INSERT INTO Autores (nombres) VALUES (?)';
        config.query(sql, [nombres], (err, resultado) => {
            if (err) {
                reject(err);
            } else {
                resolve(resultado);
            }
        });
    });
};

/**
 * Actualizar un Autor por su ID
 */
const actualizarAutorQuery = (id, Autor) => {
    const { nombre } = Autor;
    return new Promise((resolve, reject) => {
        const sql = 'UPDATE Autores SET nombres = ? WHERE id = ?';
        config.query(sql, [nombre,  id], (err, resultado) => {
            if (err) {
                reject(err);
            } else {
                resolve(resultado);
            }
        });
    });
};

/**
 * Eliminar un Autor por su ID
 */
const eliminarAutorQuery = (id) => {
    return new Promise((resolve, reject) => {
        const sql = 'DELETE FROM Autores WHERE id = ?';
        config.query(sql, [id], (err, resultado) => {
            if (err) {
                reject(err);
            } else {
                resolve(resultado);
            }
        });
    });
};

// Exportar todas las funciones definidas en este archivo
export {
    listarTodosAutoresQuery,
    listarAutorPorIdQuery,
    crearAutorQuery,
    actualizarAutorQuery,
    eliminarAutorQuery   
}