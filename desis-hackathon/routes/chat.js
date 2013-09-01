var mongoose = require('mongoose')
  , Schema = mongoose.Schema;

// Defining ChatMessage schema and model
var ChatMessageSchema = new Schema({
  username: String,
  msg: String,
  timestamp: Date
});

var ChatMessage = mongoose.model('ChatMessage', ChatMessageSchema);

exports.saveChatMessage = saveChatMessage = function(m) {
  var chatMessage = new ChatMessage();
  chatMessage.username = m.username;
  chatMessage.msg = m.msg;
  chatMessage.timestamp = m.timestamp;

  chatMessage.save(function (err) {
    // Do nothing
  });
  return;
}

exports.getChatMessages = function(fn) {
  var query = ChatMessage.find({}).sort('timestamp', 'descending');
  query.limit(10);
  query.exec(function (err, docs) {
    console.log(docs);
    console.log(err);
    if (!err)
      fn(err, docs);
  });
}

