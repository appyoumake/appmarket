var express = require('express');
var router = express.Router();

/* URLs that relate to user management. */

/**
 * All functions can take a single entry or an array
 */


//self registration, same as create but set to status not accepted
//MUST SPECIFY GROUP(S) THEY WANT TO BELONG TO...
router.post('/register', function(req, res, next) {
  res.send('respond with a resource');
});

//add a user to the database
router.post('/create', function(req, res, next) {
  res.send('respond with a resource');
});

//returns a list of requested users, can search by email or id
// WILL ONLY DO SEARCH INSIDE MASTER GROUPS THAT THE ADMIN INTERROGATING IS MEMBER OG
router.post('/get', function(req, res, next) {
  res.send('respond with a resource');
});

//returns a list of registered users who have not been accepted yet
// WILL ONLY DO SEARCH INSIDE MASTER GROUPS THAT THE ADMIN INTERROGATING IS MEMBER OG
router.post('/getRegistrations', function(req, res, next) {
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
