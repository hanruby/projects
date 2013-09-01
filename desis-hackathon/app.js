
/**
 * Module dependencies.
 */

var express = require('express')
  , routes = require('./routes')
  , auth = require('./routes/auth')
  , ann = require('./routes/announcement')
  , savekeys = require('./routes/savekeys')
  , chatengine = require('./routes/chat')
  , commitengine = require('./routes/commit')
  , iuse = require('./routes/iuse')
  , url = require('url')
  , fs = require('fs')
  , MemoryStore = express.session.MemoryStore;

var app = module.exports = express.createServer();
var io = require('socket.io').listen(app);
var sessionStore = new MemoryStore();

var userInput = new Object();

// ------------------------------------------------------------------------------------

// Configuration
app.configure(function(){
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.cookieParser('H@ck@thon cookieParser'));
  app.use(express.session({ 
    secret: "H@ck@thon sessionStore",
    store: sessionStore,
    cookie: {maxAge : 3 * 24 * 60 * 60 * 1000, expiress: new Date(Date.now() + 3 * 24 * 60 * 60 * 1000)}, //3 days
  }));
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function(){
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

app.configure('production', function(){
  app.use(express.errorHandler());
});
// ------------------------------------------------------------------------------------

// Helpers
// Session-persisted message middleware
app.dynamicHelpers({
  msg: function(req, res){
    if (req.session) {
      var err = req.session.error
      , msg = req.session.success;
      delete req.session.error;
      delete req.session.success;
      
      res.locals.message = '';
      
      if (err) res.locals.message = '<p class="msg error">' + err + '</p>';
      if (msg) res.locals.message = '<p class="msg success">' + msg + '</p>';

      return res.locals.message;
    }
    return '';
  }
  , username: function(req, res) {
    if (req.session && req.session.user) {
      var user = req.session.user;
      return user.name;
    } else {
      return "NullUser";
    }
  }
})
// ------------------------------------------------------------------------------------

// Routes
app.get('/logout', auth.logout);
app.get('/login', auth.login);
app.post('/login', auth.loginPost);
app.get('/', auth.restrict, routes.index);
app.get('/graffiti', auth.restrict, routes.graffiti);
app.get('/factsheet', auth.restrict, routes.factsheet);
app.get('/iuse', auth.restrict, routes.iuse);
app.get('/userdetails', auth.restrict, routes.userdetails);
app.get('/postcommit', commitengine.postcommit, io);
app.get('/help', auth.restrict, routes.help);
app.post('/saveuserdetails', savekeys.saveUserDetails);
app.get('/admin', auth.restrict, auth.checkAdmin, auth.admin);
app.post('/admin/adduser', auth.restrict, auth.checkAdmin, auth.user.adduser);
app.get('/admin/cleargraffiti', auth.restrict, auth.checkAdmin, function(req, res) { imageStore = []; res.redirect('/admin') });
app.post('/admin/addalbum', auth.restrict, auth.checkAdmin, ann.addAlbum(io));
app.post('/admin/postmessage', auth.restrict, auth.checkAdmin, ann.postMessage(io));
app.get('/showpost/:id', auth.restrict, ann.showPost);
app.get('/announcements', auth.restrict, ann.showAnnouncements);
app.get('/timer', auth.restrict, routes.timer);

app.listen(3000, function(){
  console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
});

// Socket io
var active_connections = 0;
var imageStore = [];

io.set('authorization', auth.socket_authorization(sessionStore));
io.sockets.on('connection', function (socket) {
  var hs = socket.handshake;
  active_connections++;
  io.sockets.emit('user:connect', active_connections);
  
  // Send the existing chat messages to the newly connected client
  chatengine.getChatMessages(function(err, docs) {
    if (!err)
      socket.emit('chat:init', docs);
  });

  // Send the initial IUse message
  iuse.getCount(function(err, docs) {
    if (!err)
      socket.emit('iuse:init', docs);
  });
 
  // Pushing all the existing paths
  for (var i = 0; i < imageStore.length; i++) {
    socket.emit(imageStore[i].event, imageStore[i].uid, imageStore[i].co_ordinates);
  }

  socket.on('disconnect', function () {
    active_connections--;
    io.sockets.emit('user:disconnect', active_connections);
  });

  // EVENT: User stops drawing something
  socket.on('draw:progress', function (uid, co_ordinates) {
    imageStore.push({'event': 'draw:progress', 'uid': uid, 'co_ordinates': co_ordinates});
    io.sockets.emit('draw:progress', uid, co_ordinates)
  });

  // EVENT: User stops drawing something
  socket.on('draw:end', function (uid, co_ordinates) {
    imageStore.push({'event': 'draw:end', 'uid': uid, 'co_ordinates': co_ordinates});
    io.sockets.emit('draw:end', uid, co_ordinates)
  });
  
  // when the client emits 'chat:new', this listens and broadcast to other clients
  socket.on('chat:new', function (data) {
		// we tell the client to execute 'updatechat' with 2 parameters
		var username = hs.session.user.name;
		var date = new Date();
		var message = {username:username,msg:data,timestamp:date};
		chatengine.saveChatMessage(message);
		io.sockets.emit('chat:new', message);
	});

  socket.on('iuse:update', function (data) {
    var username = hs.session.user.name;
    data.username = username;
    iuse.save(data, function(err, docs){
      if (!err)
        io.sockets.emit('iuse:update', docs);
    })
  });

  socket.on('view:load', function(url) {
    io.sockets.emit('view:load', url);
  });
	
});

