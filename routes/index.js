var models  = require('../models');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
	models.User.findAll({ include: [ models.Device ] }).then(function(users) {
    res.render('help', { 
			title: 'Mlab app market',
      users: users
    });
  });
  
});

router.post('/login', function(req, res, next) {
  res.render('index', { title: 'Ba ba black sheep' });
});

router.get('/logout', function(req, res, next) {
  res.render('index', { title: 'Ba ba black sheep' });
});

module.exports = router;
