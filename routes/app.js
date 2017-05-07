var express = require('express');
var router = express.Router();

/* URLs that relate to user management. */

//adds of updates the meta details for an app
//will create a new record if not found, or update based on version number, OS, etc if already exists
router.post('/submitDetails', function(req, res, next) {
  res.send('respond with a resource');
});

//receives the actual app file (APK, etc)
router.post('/uploadFile', function(req, res, next) {
  res.send('respond with a resource');
});

//toggles the "active" field on for apps
router.post('/publish', function(req, res, next) {
  res.send('respond with a resource');
});

//toggles the "active" field off for apps
router.post('/unPublish', function(req, res, next) {
  res.send('respond with a resource');
});

//toggles the "active" field off for apps and sets "withdrawn" to true
//next time the app "phones home" it will be told about the change in status and self destruct
router.post('/withdraw', function(req, res, next) {
  res.send('respond with a resource');
});

//downloads the app file, OS and version is specified in request
//we check if they are allowed to access it based on login, and group belonging
router.post('/get', function(req, res, next) {
  res.send('respond with a resource');
});

//function that does NOT require a token or login, 
//used by apps to find out if there are updates available or if they should delete themselves
//existing app details are submitted a a part of the request, otherwise we do not know that there is an update..
router.post('/getStatus', function(req, res, next) {
  res.send('respond with a resource');
});

//add users to a sub-group, creates a group if it does not exist
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
