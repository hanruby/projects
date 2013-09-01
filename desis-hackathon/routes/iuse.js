var mongoose = require('mongoose')
  , Schema = mongoose.Schema;

// Defining IUse schema and model
var IUseSchema = new Schema({
  tech: String,
  usedBy: [String]
});

var IUse = mongoose.model('IUse', IUseSchema);

exports.save = function(m, fn) {
  var update;
  if (m.operation == "add") {
    update = {$push : { usedBy : m.username }};
  } else {
    update = {$pull : { usedBy : m.username }};
  }

  IUse.update({tech: m.tech}, update, {multi: true}, function (err) {
    if (!err) {
      getCount(fn, m.tech);
    } else {
      fn(err, null);
    }
  });
}

exports.getCount = getCount = function(fn, tech) {
  var query = IUse.find({});
  if (tech)
    query = IUse.find({tech: tech});
  query.exec(function (err, docs) {
    if (!err)
      fn(err, docs);
  });
}

