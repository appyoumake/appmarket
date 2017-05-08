var models  = require('../models');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('help', { 
    title: 'Mlab app market web service',
  });
});


router.post('/login', function(req, res, next) {
  res.render('index', { title: 'Ba ba black sheep' });
});

router.get('/logout', function(req, res, next) {
  res.render('index', { title: 'Ba ba black sheep' });
});

module.exports = router;
