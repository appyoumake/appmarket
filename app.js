/* 
 * (c) FFI/Sineet 2017
 */


/* var db = require('db')
db.connect({
  host: process.env.DB_HOST,
  username: process.env.DB_USER,
  password: process.env.DB_PASS
}) */

//start by loading configurations info
var express = require('dotenv');
var env       = process.env.NODE_ENV || 'development';
var config = require('./config/config.json')[env];
config["verification"] = require('./config/verify.json');

// load libraries requires
var express = require('express');
var passport = require('passport');
var session = require('express-session');
var bodyParser = require('body-parser');
//var cookieParser = require('cookie-parser');
var path = require('path');
var favicon = require('serve-favicon');
var url = require("url");
var logger = require('morgan');
var validator = require('validator');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');


//performs the actual verification, we only check for datatype
function performVerification(data, verification_data, res) {
  
  console.log("Incoming data-------------------------------");
  console.log(data);
  console.log("Verfication data----------------------------");
  console.log(verification_data);
  
  var verified;
  for (var index in verification_data) {
    
    verified = true;
    if (index == "has_verification") { continue; }
    
    if (typeof verification_data[index] == "string") {
      chk = verification_data[index].split(":");
    } else {
      chk = [verification_data[index]];
    }
    d = data[index];
    
//if it does not exist at all we just bail now
    if (typeof d == "undefined") {
      return {result: "failure", missing: index, expected: verification_data, received: data};
    }
    
//value exists, check if it is of the right type..
    switch (chk[0]) {
      case "object":
        
        break;
        
      case "string":
        if (chk.length > 1) { //length of string is specified
          if (typeof d != "string" || d.length != chk[1]) {
            verified = false;
          }
        } else {
          if (typeof d != "string") {
            verified = false;
          }
        }
        break;
        
      case "numeric":
        if (!(!isNaN(parseFloat(d)) && isFinite(d))) {
          verified = false;
        }
        break;
        
      case "email":
        if (!validator.isEmail(d) ) {
          verified = false;
        }
        break;
        
      case "token":
        var regexGuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;
        if (!regexGuid.test(d)) {
          verified = false;
        }
//token OK, check if it is out of date
        models.Token.find({ where: { token: d } })
                    .then(function(token) {
                      var now = new Date();
                      if (!token || token.expires < now) {
                        console.log("Invalid token");
                        res.json({ result: "failure", message: "Token expired or not found" });
                      }
                    })
                    .catch(function(err) {
                      console.log(err);
                      res.json({ result: "failure", error: err }); 
                    });
        break;
        
      default: //use this for arrays which are used when the value is ENUM
        if (verification_data[index].constructor === Array) {
          if (verification_data[index].indexOf(d) < 0) {
            verified = false;
          }
        }
        break;
    }
    
//if this item has failed to verify we return with details of the error.
    if (!verified) {
      return {result: "failure", missing: index, expected: verification_data, received: data};
    }
    
  }
  return {result: "success"};
}

//prepare own super-simple verification middleware 
//we use the two first parts of the URL verify the data, the verification settings are in the /config/verify.json file.
var verifyRequestData = function (req, res, next) {
  var ctype = req.get('Content-Type').split(";");
  if (ctype[0] == "multipart/form-data") {
    next();
    return;
  }

  var check = {result: "success"};
  var path_elements = url.parse(req.originalUrl).pathname.split("/");

  path_elements.shift();
  if (path_elements.length == 1) {
    if (typeof config.verification[path_elements[0]] != "undefined" && (config.verification[path_elements[0]]["has_verification"] === true)) {
      check = performVerification(req.body, config.verification[path_elements[0]], res);
    } 
  } else if (path_elements.length == 2) {
    if (typeof config.verification[path_elements[0]] !=  "undefined" && typeof config.verification[path_elements[0]][path_elements[1]] !=  "undefined") {
      check = performVerification(req.body, config.verification[path_elements[0]][path_elements[1]], res);
    } 
  }
  
  if (check.result !== "success") {
    console.log("Missing data for this operation");
    console.log(path_elements);
    console.log(check);
    res.json(check);
  } else {
    console.log("valid call and data");
    next();
  }
}


// basic preparations
app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static(path.join(__dirname, 'public')));
app.use(verifyRequestData);

//get the Passport authentication ready
// session secret
app.use(session({ secret: config.passport.key, resave: true, saveUninitialized:true })); 
app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions


// prepare the routes
var index_route = require('./routes/index');
var interactive_route = require('./routes/interactive');
var user_route = require('./routes/user');
var app_route = require('./routes/app');

// match routes with URLS
app.use('/', index_route);
app.use('/interactive', interactive_route);
app.use('/user', user_route);
app.use('/app', app_route);


//load all the models
var models = require("./models");
//Sync Database, can use { logging: console.log } as param to debug
models.sequelize.sync().then(function() {
    console.log('DB synced')
}).catch(function(err) {
    console.log(err, "Updating DB failed")
});

//load passport strategies
require('./config/passport/passport.js')(passport, models.User);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
