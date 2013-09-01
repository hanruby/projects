var factSheet = require('./factsheet');
/*
 * GET home page.
 */

exports.index = function(req, res) {
  res.render('index', { title: 'DESIS Hackathon 2012', subTitle: '', page: 'index' })
};

exports.graffiti = function(req, res) {
  res.render('graffiti', { title: 'DESIS Hackathon 2012 - Graffiti wall', subTitle: 'Graffiti wall', page: 'graffiti' });
}

exports.factsheet = function(req, res) {
  /*var facts = [
'The first commercial Internet domain name, in the TLD .com, was registered on 15 March 1985 in the name symbolics.com by Symbolics Inc., a computer systems firm in Cambridge, Massachusetts.',
'Android versions are named alphabetically. Cupcake, Donut, Eclair, Froyo, Gingerbread, Honeycomb, Ice Cream Sandwich, JellyBean(??)',
'All the browsers use about:// protocol for its internal pages. Chrome uses chrome://'];*/
factSheet.getFacts(function(err, facts){
  if (!err)
    res.render('factsheet', { title: 'DESIS Hackathon 2012 - FactSheet', subTitle: 'FactSheet', page: 'factsheet', facts: facts });
});
}

exports.iuse = function(req, res) {
	var inputs = {OS:["Linux","Windows","Mac"],
	             Language:["Java","Python","Javascript"]};
   res.render('iuse', { title: 'DESIS Hackathon 2012 - IUse', subTitle: 'IUse', page: 'iuse',inputs:inputs});
}

exports.userdetails = function(req, res) {
   res.render('userdetails',{ title: 'DESIS Hackathon 2012 - User Details', subTitle: 'User Details', page: 'userdetails'});
}

exports.admin = function(req, res) {
  res.render('index', { title: 'DESIS Hackathon 2012', subTitle: '', page: 'index' });
}

exports.help = function(req, res) {
  res.render('help', { title: 'DESIS Hackathon 2012 - Help', subTitle: 'help', page: 'help' });
}

exports.logout = function(req, res){
  req.session.destroy(function(){
    res.redirect('/');
  });
}

exports.timer = function(req, res) {
  res.render('timer', { title: 'DESIS Hackathon 2012 - Timer', subTitle: '', page: 'timer' });
}