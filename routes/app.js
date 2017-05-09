var express = require('express');
var router = express.Router();
var models  = require('../models');
var multer  = require('multer')
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'public/apps/')
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname)
  }
})
var upload = multer({ storage: storage })
//var upload = multer({ dest: 'public/apps/' })


/* URLs that relate to app management. */

//adds or updates the meta details for an app
//will create a new record if not found, or update based on version number, OS, etc if already exists
router.post('/submitDetails', function(req, res, next) {
 
//first we look up the user to link the record to 
  models.User.find({  where: { email: req.body.email }} )
             .then(function(user) {
                if (user) {
                  var cat2 = (typeof req.body["category2"] == "undefined") ? "" : req.body["category2"];
                  var cat3 = (typeof req.body["category3"] == "undefined") ? "" : req.body["category3"];
//TODO: check replace_or_create_new_version and force new version if true, otherwise just update existing records
                  models.App.findOrCreate({ where: { mlabGuid: req.body.mlab_guid }, 
                                            defaults: {
                                              userId: user.id,
                                              packageId: req.body.package_id,
                                              mlabGuid: req.body.mlab_guid,
                                              name: req.body.name,
                                              description: req.body.description,
                                              keywords: req.body.keywords,
                                              category1: req.body.category1,
                                              category2: cat2,
                                              category3: cat3,
                                              state: req.body.state,
                                              icon: req.body.icon
                                            }})
                            .spread(function(app, created) {
                              if (app) {
                                if (created) {
                                  console.log('App created');
                                } else {
                                  console.log('App exists');
                                }
                                models.Version.findOrCreate({ where: { appId: app.id, version: req.body.version, os: req.body.os }, 
                                                defaults: {
                                                userId: user.id,
                                                appId: app.id,
                                                os: req.body.os,
                                                os_version: req.body.os_version,
                                                version: req.body.version,
                                                updateNotes: req.body.updateNotes,
                                                category1: req.body.category1,
                                                category2: cat2,
                                                category3: cat3,
                                                state: 'waiting_for_file'
                                              }})
                                    .spread(function(version, created) {
                                      if (version) {
                                        if (created) {
                                          console.log('Version created');
                                        } else {
                                          console.log('Version exists');
                                        }
                                        app.icon = "[image]";
                                        res.json({ result: "success", app: app, version: version });
                                      } else {
                                        res.json({ result: "failure", message: "Unable to create version" });
                                      }
                                    }); //end version spread
                            } else {
                              res.json({ result: "failure", message: "Unable to create apps" });
                            }
                          }); //end app spread
                    } else {
                      res.json({ result: "failure", message: "Unable to find user record" });
                    }
                  }); //end then for user
});


//receives the actual app file (APK, etc)
var appUpload = upload.fields([{ name: 'app_file', maxCount: 1 }])
router.post('/uploadFile', appUpload, function(req, res, next) {
  
  console.log("File stored in " + req.files['app_file'][0].destination + req.files['app_file'][0].filename);
  res.json({ result: "success", message: "Stored file" });
  
});

//toggles the "active" field on for apps
router.post('/publish', function(req, res, next) {
  res.send('respond with a resource');
});

//toggles the "active" field off for apps
router.post('/', function(req, res, next) {
  res.send('respond with a resource');
});

//toggles the "active" field off for apps and sets "withdrawn" to true
//next time the app "phones home" it will be told about the change in status and self destruct
router.post('/withdraw', function(req, res, next) {
  res.send('respond with a resource');
});

//downloads the app file, OS and version is specified in request
//we check if they are allowed to access it based on login, and group belonging
router.get('/get', function(req, res, next) {
  res.send('respond with a resource');
});

//function that does NOT require a token or login, 
//used by apps to find out if there are updates available or if they should delete themselves
//existing app details are submitted a a part of the request, otherwise we do not know that there is an update..
router.get('/getStatus', function(req, res, next) {
  res.send('respond with a resource');
});

//used to query the app database, returns array of apps with screenshots, icons, description, etc
router.post('/query', function(req, res, next) {
    models.App.findAll({ where: req.body.query })
             .then(function(apps) {
                if (apps) {
                  console.log('Apps found');
                  res.json({ result: "success", apps: apps});
                } else {
                  res.json({ result: "failure", message: "No apps found that matches criteria", query: req.body.query });
                }
              })
             .catch(function(err) {
                console.log(err);
                res.json({ result: "failure", error: err }); 
             });
});

//add app to a accessgroup, creates a group if it does not exist
//this means the group must have a unique name WITHIN the master group that the admin belongs to on Mlab builder
//both users and apps belong to groups, so there is a matching addToGroup in /user route
router.post('/addToGroup', function(req, res, next) {
  res.send('respond with a resource');
});

//inverse of addToGroup
router.post('/removeFromGroup', function(req, res, next) {
  res.send('respond with a resource');
});




module.exports = router;
