var express = require('express');
var uuidV4 = require('uuid/v4');
var router = express.Router();
var models  = require('../models');
var passport = require('passport');


/**
 * The root is a simple help page, this is the only one that sends back a HTML file
 */
router.get('/', function(req, res, next) {
  res.render('help', { 
    title: 'Mlab app market web service',
  });
});

/**
 * Login using Passportjs authentication. 
 * This will create a token and store this in the database if it is successful
 */
router.post('/login', function(req, res, next) {
  console.log("Inside login");
  passport.authenticate('local-signin', function(err, user, info) {
    console.log("Inside passport");
//check for errors
    if (err) { console.log("Authentication setup error"); return next(err); }
    if (!user) { console.log("No user record"); return res.json({"result": "failure"}); }
    req.logIn(user, function(err) {
      if (err) { console.log("Login error");  return next(err); }
      
//successfully logged in, we now need to:
//generate token, 
//look up the device, if it does not already exist we add it
//check if they are logged in from the same device already, in which case we delete the old token record
//finally store the token record and return to caller
      var new_token = uuidV4(); 
      console.log("New token generated: " + new_token);

      models.Device.findOrCreate({  where: { uid: req.body.device_id }, 
                                    defaults: {
                                      userId: user.id,
                                      uid: req.body.device_id,
                                      os: req.body.os,
                                      osVersion: req.body.os_version,
                                      lastAccess: new Date() }})
                    .spread(function(dev, created) {
                      if (created) {
                        console.log('Device created');
                      } else {
                        console.log('Device exists');
                      }
                      
//now erase old tokens for this device and create the new one
                      models.Token.destroy({ where: { deviceId: dev.id } })
                        .then(function() {
                          var exp = new Date();
                          exp.setHours( exp.getHours() + 1 );
                          models.Token.create({
                              deviceId: dev.id,
                              token: new_token,
                              expires: exp
                            })
                            .then(function(token) { //we're at the finishing line, return data
                              res.json({result: "success", token: token.token, email: user.email});
                            })
                            .catch(function(err) {
                              console.log('Caught error! ' + err);
                              res.json({result: "failure"});
                          });
                        });
                    }); //end spread
    }); //end login
  })(req, res, next);//end authentication
});





router.get('/logout', function(req, res, next) {
  
});


module.exports = router;
