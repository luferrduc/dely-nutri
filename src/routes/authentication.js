const express = require('express');
const router = express.Router();

const passport = require('passport'); // CAMBIO ../lib/passport -> passport
const { isLoggedIn, isNotLoggedIn } = require('../lib/auth');


router.get('/signup',isNotLoggedIn, (req,res) => {
    res.render('auten/signup');
});

router.post('/signup', isNotLoggedIn, passport.authenticate('local.signup', {
    successRedirect: '/signin',
    failureRedirect: '/signup',
    failureFlash: true
}));

router.get('/signin',isNotLoggedIn, (req, res) => {
    res.render('auten/signin');
});

router.post('/signin', isNotLoggedIn, (req, res, next) => {
    passport.authenticate('local.signin', {
        successRedirect: '/perfil',
        failureRedirect: '/signin',
        failureFlash: true
    })(req, res, next);
});


router.get('/perfil', isLoggedIn, (req, res) => {
    res.render('auten/perfil');
});

router.get('/logout', (req, res) => {
    req.logout();
    res.redirect('/signin');
});

module.exports = router;


















// router.post('/signup', (req, res) =>{
//     passport.authenticate('local.signup', {
//         succesRedirect: '/perfil',
//         failureRedirect: '/signup',
//         failureFlash: true
//     });
//     console.log(req.body);
//     res.send('RECIBIDO');
// });