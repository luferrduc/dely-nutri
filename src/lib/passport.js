const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('../lib/helpers');

passport.use('local.signin', new LocalStrategy({
    usernameField: 'usuario',
    passwordField: 'contrasena',
    passReqToCallback: true
}, async(req, usuario, contrasena, done) => {
   const rows = await pool.query('SELECT * FROM usuarios where usuario = ?', [usuario]);
   if (rows.length > 0) {
       const user = rows[0];
       const validPassword = await helpers.matchPass(contrasena, user.contrasena);
       if (validPassword){
           done(null, user, req.flash('Bienvenido' + user.usuario));
       }else {
           done(null, false, req.flash('Contraseña incorrecta'));
       }
   }else{
       return done(null, false, req.flash('El usuario ingresado no existe'));
   }

}));











passport.use('local.signup', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async(req, nombre_usuario, contrasena, done) => {
    const {email} = req.body;
    const newUser = {
        usuario: nombre_usuario,
        email: email,
        contrasena: contrasena,
        direccion: '',
        tipo_usuario: 1
    };
    newUser.contrasena = await helpers.encryptPassword(contrasena);
    const result = await pool.query('INSERT INTO usuarios SET ?', [newUser]);
    newUser.idUsuario = result.insertId;
    return done(null, newUser);
    // console.log(result);
}));

passport.serializeUser((user, done) => {
    done(null, user.idUsuario);
});

passport.deserializeUser(async (idUsuario, done) => {
    const rows = await pool.query('SELECT * FROM usuarios WHERE idUsuario = ?', [idUsuario]);
    done(null, rows[0]);
});