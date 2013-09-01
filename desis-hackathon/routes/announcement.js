var mongoose = require('mongoose')
  , Schema = mongoose.Schema
  , fs = require('fs')
  , chatengine = require('./chat')
  , ALBUM_BASE_PATH = './public/images/albums/';

// Defining ChatMessage schema and model
var AnnouncementSchema = new Schema({
  type: String,
  msg: String,
  folderName: String,
  albumName: String,
  timestamp: Date
});

var Announcement = mongoose.model('Announcement', AnnouncementSchema);

exports.postMessage = function(io) {
  return function(req, res) {
    var message = req.body.msg;

    var ann = new Announcement();
    ann.type = "message";
    ann.msg = message;
    ann.timestamp = new Date();

    ann.save(function (err) {
      if (err)
        req.session.error = "An error occured while posting the message";
      else {
        req.session.success = "Message posted successfully!";
        io.sockets.emit("ann:message", ann);
        postChatMessage("New message from admin! View <a href='/showPost/" + ann._id +"'>here</a>", io);
      }
      res.redirect('/admin');
    });
  }
}

exports.addAlbum = function(io) {
  return function(req, res) {
    var folderName = req.body.foldername;
    var albumName = req.body.albumname;

    var ann = new Announcement();
    ann.type = "album";
    ann.folderName = folderName;
    ann.albumName = albumName;
    ann.timestamp = new Date();

    ann.save(function (err) {
      if (err)
        req.session.error = "An error occured while posting the album";
      else {
        req.session.success = "Album posted successfully!";
        io.sockets.emit("ann:album", ann);
        postChatMessage("New album posted! View <a href='/showPost/" + ann._id +"'>here</a>", io);
      }
      res.redirect('/admin');
    });
  }
}

function postChatMessage(data, io) {
  var username = "admin";
  var date = new Date();
  var message = {username:username,msg:data,timestamp:date};
  chatengine.saveChatMessage(message);
  io.sockets.emit('chat:new', message);
}

exports.showPost = function(req, res) {
  var id = req.params.id; //4fda1bfe482c35af8e00001a
  Announcement.findById(id, function(err, doc){
    if (err || doc == null)
      req.session.error = "Page not found!";
    if (doc != null) {
      if (doc.type == "album") {
        fs.readdir(ALBUM_BASE_PATH + "/" + doc.folderName, function(err, files) {
          if (err)
            req.session.error = err;
          var filteredFiles = [];
          // Filtering files based on extension
          for (var i = files.length - 1; i >= 0; i--) {
            var file = files[i];
            var ext = file.substr(file.lastIndexOf('.') + 1).toLowerCase();
            if (ext == "jpg" || ext == "jpeg" || ext == "gif" || ext == "bmp" || ext == "png")
              filteredFiles.push(file);
          };
          doc.files = filteredFiles;
          res.render('announcement', { title: 'DESIS Hackathon 2012 - Announcement', subTitle: '', page: 'ann', ann: doc });
        });
      } else {
        res.render('announcement', { title: 'DESIS Hackathon 2012 - Announcement', subTitle: '', page: 'ann', ann: doc });
      }
    } else {
      res.render('announcement', { title: 'DESIS Hackathon 2012 - Announcement', subTitle: '', page: 'ann', ann: doc });
    }
  });
}

exports.showAnnouncements = function(req, res) {
  var query = Announcement.find({});
  query.desc('timestamp');
  query.exec(function(err, docs) {
    if (err) {
      req.session.error = "An error occured while fetching announcements!";
      res.render('announcement', { title: 'DESIS Hackathon 2012 - Announcements', subTitle: '', page: 'ann', ann: docs });
      return;
    }

    var result = {type: "group", msgs:[]};
    for (var i = 0; i < docs.length; i++) {
      var doc = docs[i];
      if (doc.type == "album")
        result.msgs.push("New album posted! View <a href='/showPost/" + doc._id +"'>here</a>");
      else if (doc.type == "message")
        result.msgs.push("New message from admin! View <a href='/showPost/" + doc._id +"'>here</a>");
    };
    res.render('announcement', { title: 'DESIS Hackathon 2012 - Announcements', subTitle: '', page: 'ann', ann: result });
  });
}