// Authentication & Authorization
var crypto = require('crypto')
	, mongoose = require('mongoose')
  , Schema = mongoose.Schema;

// Defining user schema and model
var UserSchema = new Schema({
  id : String,
  name : String,
  roles : [String],
  salt : String,
  pass: String
});

var User = mongoose.model('User', UserSchema);

mongoose.connect('mongodb://localhost:27017/deshack');

exports.user = {
	User: User
	, loadUsersFromDb: loadUsersFromDb
	, adduser: function(req, res) {
	  var id = req.body.userid;
	  var name = req.body.username;
	  var pass = req.body.password;

	  var user = users[id];

	  if (user) {
		req.session.error = 'User already exists!';
		res.redirect('/admin');
	  } else {
	  	user = new User();
	  	user.id = id;
	  	user.name = name;
	  	user.roles = ['participant'];
	  	user.salt = 'randomly-generated-' + Date.now() + id;
	  	user.pass = hash(pass, user.salt);

	  	user.save(function (err) {
  		  if (!err) {
  		  	req.session.success = "User added successfully!";
  		  	users[user.id] = user; 
  		  } else {
  		  	req.session.error = "An exception occured while creating the user";
  		  }
  		  res.redirect('/admin');
		});
	  }
	}
}

function loadUsersFromDb() {
	users = {};
	User.find({}, function (err, docs) {
  		if (!err) {
  			for (var i = docs.length - 1; i >= 0; i--) {
  				var user = docs[i];
  				users[user.id] = user;
   			};
  		}
	});
}

loadUsersFromDb();


// Generate a salt for the user to prevent rainbow table attacks
// for better security take a look at the bcrypt c++ addon:
// https://github.com/ncb000gt/node.bcrypt.js
var users = {
};

// Used to generate a hash of the plain-text password + salt
function hash(msg, key) {
  return crypto
    .createHmac('sha256', key)
    .update(msg)
    .digest('hex');
}

exports.checkAdmin = function (req, res, next) {
  var user = req.session.user;
  if (!user) {
  	req.session.error = 'Access denied!';
  	res.redirect('/login');
  } else {
	  authorize(user, "admin", function(err, usr) {
	  	if (usr)
	  		next();
	  	else {
	  		req.session.error = "Not authorized to view the page!";
	  		res.redirect('/');
	  	}
	  });
	}
}

var authorize = function(user, role, fn) {
  if (user.roles.indexOf(role) != -1)
    fn(null, user);
  else
  	fn(new Error('Not authorized to view the page!'));
}

exports.restrict = restrict = function(req, res, next) {
  if (req.session.user) {
    next();
  } else {
    req.session.error = 'Access denied!';
    res.redirect('/login');
  }
}

exports.admin = function(req, res) {
  res.render('admin', { title: 'DESIS Hackathon 2012', subTitle: '', page: 'admin' });
}

exports.logout = function(req, res){
  req.session.destroy(function(){
    res.redirect('/login');
  });
}

exports.login = function(req, res) {
  if (req.session.user) {
    res.redirect('/');
  } else
    res.render('login', { title: 'DESIS Hackathon 2012', subTitle: '', page: 'login' });
}

exports.loginPost = function(req, res) {
  var id = req.body.userid;
  var pass = req.body.password;

  var user = users[id];

  if (!user) {
  	req.session.error = 'Incorrect username or password!';
  	res.redirect('/login');
  } else {
	  // apply the same algorithm to the POSTed password, applying
	  // the hash against the pass / salt, if there is a match we
	  // found the user
	  if (user.pass == hash(pass, user.salt)) {
	  	req.session.regenerate(function(){
	      req.session.user = user;
	      res.redirect('/');
	    });
	  } else {
	  	req.session.error = 'Incorrect username or password!';
	  	res.redirect('/login');
	  }
	}
}

exports.socket_authorization = function (sessionStore) {
  return function (data, accept) {
    if (data.headers.cookie) {
      data.cookie = parseCookie(data.headers.cookie);
      console.log(data.cookie);
      data.sessionID = data.cookie['connect.sid'];

      console.log(data.sessionID);
      // (literally) get the session data from the session store
      sessionStore.get(data.sessionID, function (err, session) {
          if (err || !session) {
              // if we cannot grab a session, turn down the connection
              accept('Error', false);
          } else {
              // save the session data and accept the connection
              data.session = session;
              accept(null, true);
          }
      });
    } else {
      return accept('No cookie transmitted.', false);
    }
  };
}

exports.parseCookie = parseCookie = function(str){
  var obj = {}
    , pairs = str.split(/[;,] */);
  for (var i = 0, len = pairs.length; i < len; ++i) {
    var pair = pairs[i]
      , eqlIndex = pair.indexOf('=')
      , key = pair.substr(0, eqlIndex).trim()
      , val = pair.substr(++eqlIndex, pair.length).trim();

    // quoted values
    if ('"' == val[0]) val = val.slice(1, -1);

    // only assign once
    if (undefined == obj[key]) {
      val = val.replace(/\+/g, ' ');
      try {
        obj[key] = decodeURIComponent(val);
      } catch (err) {
        if (err instanceof URIError) {
          obj[key] = val;
        } else {
          throw err;
        }
      }
    }
  }
  return obj;
};