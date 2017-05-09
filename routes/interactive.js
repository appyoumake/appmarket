/**
 * This is used for interactive logon/off for testing purposes
 * @type Module express|Module express
 */
var express = require('express');
var router = express.Router();
var passport = require('passport');

/* URLs that relate to user management. */

/**
 * All functions can take a single entry or an array
 */

//display the self registration HTML
router.get('/start_registration', function(req, res, next) {
  res.render('register', { 
    title: 'Mlab app market web service',
  });
});

//store new user and redirect to login page
router.post('/register', passport.authenticate('local-signup', {
    successRedirect: '/interactive/start_login?msg=register_ok',
    failureRedirect: '/interactive/start_registration?msg=register_failed'
  }
));

router.get('/start_login', function(req, res, next) {
  res.render('login', { 
    title: 'Mlab app market web service',
  });
});

//login
router.post('/login', passport.authenticate('local-signin', {
    successRedirect: '/?msg=login_ok',
    failureRedirect: '/interactive/start_login?msg=login_failed'
  }
));

router.get('/logout', function(req, res, next) {
  req.session.destroy(function(err) {
      res.redirect('/interactive/start_login?msg=logout_succeeded');
  });
});

router.get('/market', function(req, res, next) {
  res.render('market', { 
    title: 'Mlab app market',
  });
});

router.get('/query', function(req, res, next) {
  res.json({});
});

module.exports = router;
