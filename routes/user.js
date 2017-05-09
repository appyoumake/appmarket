var express = require('express');
var router = express.Router();
var passport = require('passport');
var models  = require('../models');

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

//temp test
router.post('/register', passport.authenticate('local-signup', {
        successRedirect: '/',
        failureRedirect: '/start_registration'
    }
));

//self registration, same as create but set to status not accepted
//MUST SPECIFY GROUP(S) THEY WANT TO BELONG TO...
/*router.post('/register', function(req, res, next) {
  res.json({"foo": "bar"});
});*/

//add a user to the database
router.post('/create', function(req, res, next) {
  models.User.findOrCreate({  where: { email: req.body.email }, 
                              defaults: {
                                email: req.body.email,
                                firstName: req.body.first_name,
                                lastName: req.body.last_name,
                                password: req.body.password,
                                role: req.body.role,
                                state: req.body.state }})
              .spread(function(user, created) {
                if (user) {
                  if (created) {
                    console.log('User created');
                  } else {
                    console.log('User exists');
                  }
                  res.json({ result: "success", user: user});
                } else {
                  res.json({ result: "failure", message: "unable to create user" });
                }
              });
});

//returns a list of requested users, search is submitted as a key/value object
// WILL ONLY DO SEARCH INSIDE MASTER GROUPS THAT THE ADMIN INTERROGATING IS MEMBER OG
router.post('/get', function(req, res, next) {
  models.User.findAll({  where: req.body.query })
             .then(function(user) {
                if (user) {
                  console.log('User exists');
                  res.json({ result: "success", user: user});
                } else {
                  res.json({ result: "failure", message: "No user found that matches criteria", query: req.body.query });
                }
              })
             .catch(function(err) {
                console.log(err);
                res.json({ result: "failure", error: err }); 
             });
});

//returns a list of registered users who have not been accepted yet
// WILL ONLY DO SEARCH INSIDE MASTER GROUPS THAT THE ADMIN INTERROGATING IS MEMBER OG
router.get('/getRegistrations', function(req, res, next) {
  res.send('respond with a resource');
});

//turn on or off the enabled state for a user
router.post('/setState', function(req, res, next) {
  res.send('respond with a resource');
});

//add users to a sub-group, creates a group if it does not exist
//this means the group must have a unique name WITHIN the master group that the admin belongs to on Mlab builder
//both users and apps belong to groups, so there is a matching addToGroup in /app route
router.post('/addToGroup', function(req, res, next) {
  res.send('respond with a resource');
});

//inverse of addToGroup
router.post('/removeFromGroup', function(req, res, next) {
  res.send('respond with a resource');
});

module.exports = router;
