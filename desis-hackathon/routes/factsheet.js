var mongoose = require('mongoose')
  , Schema = mongoose.Schema;

// Defining ChatMessage schema and model
var FactSchema = new Schema({
  fact: String,
  random: Number
});

var Fact = mongoose.model('Fact', FactSchema);

exports.getFacts = function(fn) {
  var query = Fact.find({random: {$lte: Math.random()}});
  query.limit(10);
  query.exec(function (err, docs) {
    if (docs == null) {
      query = Fact.find({random: {$gte: Math.random()}});
      query.exec(function (err, docs) {
        if (!err)
          fn(err, docs);
      });
    }
    if (!err)
      fn(err, docs);
  });
}

