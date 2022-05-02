const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/listar', isLoggedIn ,async (req,res) => {
    const productos = await pool.query('SELECT nombre_producto, calorias, precio, m.nombre_marca FROM producto p JOIN marca m ON p.id_marca = m.id_marca WHERE p.id_categoria');
    res.render('productos/listar', {productos});
});

router.post('/listar', (req, res) =>{
    console.log(req.body);
    res.send('RECIBIDO');
});

module.exports = router;
